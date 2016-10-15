"///////////"
" Neomake "
"///////////"
"
if isdirectory(expand(b:plugin_directory . '/neomake'))
  " Only enable my makeshift neomake ide if neomake has
  " asynchronous job support which makes the lint
  " as you type approach work without constant pauses.
  let g:enable_neomake_ide = neomake#has_async_support()

  " The number of milliseconds to wait before running
  " another neomake lint over the file. If you set
  " this too low it will end up having a lot of flicker
  " which can be distracting.
  let g:neomake_ide_updatetime = 3000

  " Automatic location list management (use location list for file mode)
  " 0: No automatic management
  " 1: 'Smart' management (open/close single location list below current window)
  " 2: 'Smart' management (open/close all location lists below corresponding window)
  " 3: 'Smart' management + always open location list
  let g:neomake_ide_loclist_management = 0

  " Automatic quickfix list management (use location list for file mode)
  " 0: No automatic management
  " 1: Open/close quickfix list
  " 2: Always open quickfix list
  let g:neomake_ide_quickfix_management = 2

  " neomake defaults for quickfix/location list management
  let g:neomake_open_list = 0
  let g:neomake_list_height = 5

  " For debugging
  "let g:neomake_verbose = 3

  " Constants
  let s:neomake_msg_noerr = 'No errors'
  lockvar s:neomake_msg_noerr

  let s:neomake_msg_linting = 'Linting...'
  lockvar s:neomake_msg_linting

  let s:neomake_msgs = [s:neomake_msg_noerr, s:neomake_msg_linting]
  lockvar s:neomake_msgs

  let s:neomake_buffers = {}
  function! s:neomake_buffer_name(basename)
    let l:fname = expand(a:basename.':p:t')
    let l:tmpdir = fnamemodify(tempname(), ':p:h')
    return fnameescape(join([l:tmpdir, l:fname], '/'))
  endfunction

  let s:neomake_makers_by_buffer = {}
  function! s:neomake_get_makers(bufnr)
    if !has_key(s:neomake_makers_by_buffer, a:bufnr)
      let s:neomake_makers_by_buffer[a:bufnr] = {}
    endif
    let l:makers_for_buffer = s:neomake_makers_by_buffer[a:bufnr]

    let l:ft = &filetype
    let l:makers = []
    let l:maker_names = neomake#GetEnabledMakers(l:ft)
    for l:maker_name in l:maker_names
      let l:maker = neomake#GetMaker(l:maker_name, l:ft)
      let l:full_maker_name = string(a:bufnr).'_'.l:ft.'_'.l:maker_name

      " Some makers (like the default go makers) operate on an entire
      " directory which breaks for this file based linting approach.
      " If 'append_file' exists and is 0 then this is a maker which
      " operates on the directory rather than the file so skip it.
      if exists('l:maker') && get(l:maker, 'append_file', 1)
        if !exists('l:makers_for_buffer[l:full_maker_name]')
          " Store off the original values
          let l:maker.obufnr = a:bufnr
          if exists('l:maker.postprocess')
            let l:maker.original = s:funcref(l:maker.postprocess)
          endif

          " Wrap the existing post process to do extra processing
          " after it completes
          function! l:maker.postprocess(entry)
            " If call the original postprocess if it exists
            if exists('self.original')
              call l:self.original(a:entry)
            endif

            " The neomake job was executed on the temp buffer, so fix up
            " the location list entry to point to the real buffer.
            let a:entry.bufnr = l:self.obufnr

            " If no error type is provided default to error
            if !exists('a:entry.type') || empty(a:entry.type)
              let a:entry.type = 'E'
            endif
          endfunction

          let l:maker.name = l:full_maker_name
          let l:makers_for_buffer[l:full_maker_name] = l:maker
        endif

        call add(l:makers, l:maker)
      endif
    endfor

    return l:makers
  endfunction

  function! s:neomake_quickfix_clear(bufnr)
    if !get(g:, 'neomake_ide_quickfix_management')
      return
    endif

    let l:updated = [{'bufnr': 1, 'text': s:neomake_msg_linting}]
    let l:qflist = getqflist()
    for l:entry in l:qflist
      if l:entry.bufnr != a:bufnr && index(s:neomake_msgs, l:entry.text) < 0
        call add(l:updated, l:entry)
      endif
    endfor
    call setqflist(l:updated, 'r')

    call s:neomake_manage_quickfix(a:bufnr)
  endfunction

  function! s:neomake_manage_quickfix(bufnr, ...)
    if !get(g:, 'neomake_ide_quickfix_management')
      return
    endif

    let l:bufinfo = get(s:neomake_buffers, a:bufnr, {})
    if empty(l:bufinfo)
      return
    endif

    let l:updated = []
    let l:qflist = getqflist()
    let l:buflist = tabpagebuflist()
    for l:entry in l:qflist
      if l:entry.bufnr != a:bufnr
            \ && index(l:buflist, l:entry.bufnr) >= 0
            \ && index(s:neomake_msgs, l:entry.text) < 0
        call add(l:updated, l:entry)
      endif
    endfor

    let l:leave = get(a:, '1')
    if !l:leave
      let l:updated = extend(l:updated, l:bufinfo.qflist)
    endif

    if empty(l:updated)
      let l:updated = [{'bufnr': 1, 'text': s:neomake_msg_noerr}]
    endif
    call setqflist(l:updated, 'r')

    let l:winnr = winnr()
    if get(g:, 'neomake_ide_quickfix_management') < 2
      execute 'botright cwindow' get(g:, 'neomake_list_height', 10)
    else
      execute 'botright copen' get(g:, 'neomake_list_height', 10)
    endif

    if l:winnr != winnr()
      wincmd p
    endif
  endfunction

  " The reason the location list management is setup the way it is has to do
  " with the difficulty of window management with (neo)vim. Once that issue is
  " addressed this can be revisited:
  " https://github.com/neovim/neovim/issues/3933
  " http://tarruda.github.io/articles/neovim-smart-ui-protocol/
  function! s:neomake_manage_loclists(bufnr, ...)
    if !get(g:, 'neomake_ide_loclist_management')
      return
    endif

    let l:bufinfo = get(s:neomake_buffers, a:bufnr, {})
    if empty(l:bufinfo)
      return
    endif

    if exists('s:neomake_managing_loclists')
      call neomake#utils#ErrorMessage('IDE: already managing location lists')
      return
    endif

    let w:neomake_loclist_winnr = 1
    let s:neomake_managing_loclists = 1
    call s:neomake_windo('s:neomake_loclist_set', a:bufnr, l:bufinfo.qflist)
    call s:repeat_while_true('s:neomake_windo', 's:neomake_loclist_close')
    call s:repeat_while_true('s:neomake_windo', 's:neomake_loclist_open')
    let l:winnr =  s:neomake_windo('s:find_window', 'w:neomake_loclist_winnr')
    call s:neomake_windo('s:unlet', 'w:neomake_loclist_', ['opened', 'closed', 'winnr'])
    unlet s:neomake_managing_loclists

    if l:winnr != v:null
      call neomake#utils#DebugMessage('IDE: switching to window: '.l:winnr)
      execute string(l:winnr).'wincmd w'
    endif
  endfunction

  function! s:neomake_windo(...)
    let l:ignorelist = &eventignore
    let &eventignore = 'WinEnter,WinLeave,BufEnter,BufLeave'

    " Move to top-right window
    wincmd t

    " Loop over all windows
    let l:w = 1
    let l:wcount = winnr('$')
    let l:Func = s:funcref(a:1)
    while v:true
      let l:retval = call(l:Func, a:000[1:])
      if l:retval != v:null
        break
      endif

      let l:w = l:w + 1
      if l:w > winnr('$')
        break
      endif

      " Move to next window
      wincmd w
    endwhile

    let &eventignore = l:ignorelist
    return l:retval
  endfunction

  function! s:neomake_loclist_set(...)
    let l:bufnr = get(a:, '1')
    let l:loclist = get(a:, '2', [])
    if l:bufnr == bufnr('%')
      call setloclist(0, l:loclist, 'r')
    endif
  endfunction

  function! s:neomake_loclist_close(...)
    let l:empty_only = get(a:, '1')
    if !exists('w:neomake_loclist_closed')
          \ && (!l:empty_only || len(getloclist(0)) == 0)
      let w:neomake_loclist_closed = 1

      lclose
      return 1
    endif
  endfunction

  function! s:neomake_loclist_open(...)
    let l:length = len(getloclist(0))
    let l:manage = get(g:, 'neomake_ide_loclist_management')

    " If only the current loclist should be opened
    let l:open_current = (l:manage == 1)
          \ && exists('w:neomake_loclist_winnr')
          \ && l:length > 0

    " If any non-empty loclist should be opened
    let l:open_nonempty = (l:manage == 2)
          \ && l:length > 0

    " If loclist should always be opened
    let l:open_always = (l:manage == 3)

    if (l:open_current || l:open_nonempty || l:open_always) && !exists('w:neomake_loclist_opened')
      let w:neomake_loclist_opened = 1

      if l:length == 0
        call setloclist(0, [{'bufnr': bufnr('%'), 'text': s:neomake_msg_noerr}], 'r')
        silent! execute 'lwindow' get(g:, 'neomake_list_height', 10)
      endif

      lopen
      return 1
    endif
  endfunction

  function! s:neomake_loclist_setup(bufnr)
    if exists('w:neomake_loclist_setup') || !has_key(s:neomake_buffers, a:bufnr)
      return
    endif

    " Not entirely certain why, but airline makes my neomake ide extremely
    " slow; disable it in any neomake ide windows. I profiled it and noticed
    " that the palette dict in the airline#highlighter#highlight function
    " seemed to be larger for some reason (at least the for loop had more
    " calls with it enabled vs. disabled). I believe it has something to do
    " with the creation/deletion of location list windows that neomake ide is
    " constantly managing.
    let w:airline_disabled = 1
    let w:neomake_loclist_setup = 1
    call s:neomake_manage_loclists(a:bufnr)
  endfunction

  function! <sid>neomake_window_moved()
    call s:neomake_manage_loclists(bufnr('%'))
  endfunction

  function! s:neomake_setup_ide()
    let l:bufnr = bufnr('%')
    if has_key(s:neomake_buffers, l:bufnr)
      " Make sure the location list is opened or closed as necessary
      call s:neomake_manage_quickfix(l:bufnr)
      call s:neomake_manage_loclists(l:bufnr)
      return
    endif

    let l:makers =  s:neomake_get_makers(l:bufnr)
    if len(l:makers) > 0
      " This is a filetype with makers
      let s:neomake_buffers[l:bufnr] = {
            \ 'bufnr': l:bufnr,
            \ 'file': s:neomake_buffer_name('%'),
            \ 'force': 0,
            \ 'job_ids': [],
            \ 'makers': l:makers,
            \ 'qflist': []
            \ }

      " Make sure the sign column is always showing
      execute 'sign place 999999 line=1 name=neomake_invisible buffer='.l:bufnr

      if get(g:, 'neomake_ide_loclist_management') == 3
        " Make sure the location list is always showing
        call setloclist(0, [{'bufnr': l:bufnr, 'text': s:neomake_msg_noerr}], 'r')
        silent! execute 'lwindow' get(g:, 'neomake_list_height', 10)
              \ | lopen
              \ | wincmd p
      endif

      " Disable airline in the window, see s:neomake_loclist_setup for more
      " details.
      let w:airline_disabled = 1

      " Run neomake on the initial load of the buffer to check for errors
      let b:lastchangedtick = -1
      call s:neomake_onchange(l:bufnr)

      if get(g:, 'neomake_ide_loclist_management')
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Window Creation Handling
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""
        autocmd s:neomake WinEnter <buffer>
              \ call s:neomake_loclist_setup(expand('<abuf>'))

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Window Close Handling
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Closing a neomake buffer
        autocmd s:neomake WinLeave <buffer>
              \ if get(g:, 'neomake_ide_loclist_management') > 1
              \ | let s:neomake_ide_wincount = winnr('$')
              \ | endif

        " Closing a location list buffer
        autocmd s:neomake WinLeave *
              \ if &buftype == 'quickfix'
              \ | let s:neomake_ide_wincount = winnr('$')
              \ | endif

        autocmd s:neomake WinEnter *
              \ if get(g:, 'neomake_ide_loclist_management') == 1
              \ || get(s:, 'neomake_ide_wincount', winnr('$')) != winnr('$')
              \ | call s:neomake_manage_loclists(expand('<abuf>'))
              \ | endif
            \ | unlet! s:neomake_ide_wincount
      endif

      if get(g:, 'neomake_ide_loclist_management')
            \ || get(g:, 'neomake_ide_quickfix_management')
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Buffer Close Handling
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""
        autocmd s:neomake BufWinLeave <buffer>
              \ call s:neomake_manage_quickfix(expand('<abuf>'), 1)
              \ | call s:neomake_manage_loclists(expand('<abuf>'))
      endif

      """"""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Text Changed Handling
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""
      autocmd s:neomake TextChangedI,CursorHoldI <buffer>
            \ call s:neomake_onchange(bufnr('%'))

      autocmd s:neomake TextChanged,InsertLeave,CursorHold <buffer>
            \ call s:neomake_onchange(bufnr('%'), 1)
    endif
  endfunction

  function! s:neomake_running(bufinfo)
    " Check for manually initiated jobs
    let l:jobs = neomake#GetJobs()
    for l:jobinfo in values(l:jobs)
      if l:jobinfo.bufnr == a:bufinfo.bufnr
        return 1
      endif
    endfor

    return 0
  endfunction

  function! s:neomake_onchange(bufnr, ...)
    " Only run if the buffer has been modified
    if b:changedtick == b:lastchangedtick
      return
    endif

    " Get the appropriate buffer info by filename
    let l:bufinfo = s:neomake_buffers[a:bufnr]

    " See if a force update is specified. If there is an external
    " (not initiated by the IDE) job pending it will run after the
    " current job completes.
    let l:bufinfo.force = l:bufinfo.force || get(a:, '1')

    " Only run neomake if there isn't already a job running for this buffer.
    if s:neomake_running(l:bufinfo)
      return
    endif

    " Get current time and elasped time since last update
    let l:time = reltime()
    if has_key(l:bufinfo, 'updated')
      let l:updated = l:bufinfo.updated
      let l:elapsed = 1000 * str2float(reltimestr(reltime(l:updated, l:time)))
    else
      let l:elapsed = g:neomake_ide_updatetime
    endif

    " If enough time has passed since the last update or forcing an update.
    if !l:bufinfo.force && l:elapsed < g:neomake_ide_updatetime
      return
    endif
    let l:bufinfo.force = 0

    " Cancel any in progress jobs
    for l:job_id in l:bufinfo.job_ids
      try
        " TODO: Cancel job does not appear to be working. I'll submit
        " a patch, but in the meantime manually cancel the job.
        " call neomake#CancelJob(job_id)
        call l:jobstop(l:job_id)
      catch /^Vim\%((\a\+)\)\=:E900/
        " Ignore invalid job id errors. Happens when the job is done,
        " but on_exit hasn't been called yet.
      endtry
    endfor

    " Update the time
    let b:lastchangedtick = b:changedtick
    let l:bufinfo.updated = l:time

    " Need the original filetype in order to set the new buffer to the
    " correct filetype (it might not be automatically detected)
    let l:ft = &filetype

    " Store off current state
    let l:winstate = winsaveview()

    " Clear previous state
    call s:neomake_quickfix_clear(a:bufnr)
    call neomake#signs#ResetFile(a:bufnr)
    call neomake#statusline#ResetCountsForBuf(a:bufnr)

    " Write the temporary file and open it
    let l:tmpfile = l:bufinfo.file
    silent! call writefile(getline(1, '$'), l:tmpfile)
    silent! execute 'edit' l:tmpfile

    " Make sure it is unlisted and has the proper filetype
    silent! execute 'setlocal bufhidden=hide noswapfile nobuflisted filetype='.l:ft

    " Run neomake in file mode with the updated makers
    " Do not run silent incase of verbose output (g:neomake_verbose)
    let l:bufinfo.job_ids = neomake#Make(1,
          \ l:bufinfo.makers, function('s:neomake_job_completed'))

    " Edit the previous buffer (the original file)
    silent! execute 'edit' fnameescape(expand('#'))

    " Restore winstate and redraw
    silent! call winrestview(l:winstate)
  endfunction

  function! s:neomake_job_completed(info)
    " There are more jobs for this maker so wait for them to complete.
    if a:info.has_next
      return
    endif

   " The maker name includes the bufnr, so coerce the string into
   " a number ("1_string" + 0 == 1)
   let s:neomake_completed_bufnr = a:info.name + 0
  endfunction

  function! s:neomake_complete()
    " This completion is not from the IDE
    if !exists('s:neomake_completed_bufnr')
      return
    endif

    " Get the original bufinfo
    let l:bufnr = s:neomake_completed_bufnr
    let l:bufinfo = s:neomake_buffers[l:bufnr]
    unlet s:neomake_completed_bufnr

    " Set the quickfix/location list
    let l:bufinfo.qflist = getloclist(0)

    " Clear out the list of job ids since they have all finished
    let l:bufinfo.job_ids = []
    call neomake#CleanOldFileSignsAndErrors(l:bufnr)

    " Make sure the location list is opened or closed as necessary
    call s:neomake_manage_loclists(l:bufnr)

    " Make sure the quickfix list is opened or closed as necessary
    call s:neomake_manage_quickfix(l:bufnr)

    if l:bufinfo.force
      " If there is a force update pending then go ahead and trigger it
      call s:neomake_onchange(l:bufnr, l:bufinfo.force)
    endif
  endfunction

  function! s:neomake_remove(file)
    " Since this is called for every BufWipeout ensure it is a tracked buffer
    let l:bufnr = bufnr(a:file)
    let l:bufinfo = get(s:neomake_buffers, l:bufnr, {})

    if len(l:bufinfo) > 0
      call delete(l:bufinfo.file)
      call remove(s:neomake_buffers, l:bufnr)
    endif
  endfunction

  function! s:neomake_remove_all()
    for l:bufinfo in keys(s:neomake_buffers)
      call delete(l:bufinfo.file)
    endfor
    let s:neomake_buffers = {}
  endfunction

  " Create neomake autocmd group and remove any existing neomake autocmds,
  " in case .vimrc is re-sourced.
  augroup s:neomake
    autocmd!
  augroup END

  if get(g:, 'enable_neomake_ide')
    " Map all the window moving commands to also call window moved
    nnoremap <silent> <C-W>r :wincmd r<CR> :call <sid>neomake_window_moved()<CR>
    nnoremap <silent> <C-W>R :wincmd R<CR> :call <sid>neomake_window_moved()<CR>
    nnoremap <silent> <C-W><C-R> :wincmd R<CR> :call <sid>neomake_window_moved()<CR>

    nnoremap <silent> <C-W>x :wincmd x<CR> :call <sid>neomake_window_moved()<CR>
    nnoremap <silent> <C-W><C-X> :wincmd X<CR> :call <sid>neomake_window_moved()<CR>

    nnoremap <silent> <C-W>J :wincmd J<CR> :call <sid>neomake_window_moved()<CR>
    nnoremap <silent> <C-W>K :wincmd K<CR> :call <sid>neomake_window_moved()<CR>
    nnoremap <silent> <C-W>L :wincmd L<CR> :call <sid>neomake_window_moved()<CR>
    nnoremap <silent> <C-W>H :wincmd H<CR> :call <sid>neomake_window_moved()<CR>

    " Auto commands for managing the IDE
    autocmd s:neomake BufWinEnter * call s:neomake_setup_ide()
    autocmd s:neomake User NeomakeFinished nested call s:neomake_complete()
    autocmd s:neomake VimLeavePre * call s:neomake_remove_all()
    autocmd s:neomake BufWipeout * call s:neomake_remove('<afile>')

    " If the quickfix list should be shown
    if get(g:, 'neomake_ide_quickfix_management') == 2
      " Make sure the quickfix window is always showing
      call setqflist([{'bufnr': 1, 'text': s:neomake_msg_noerr}], 'r')
      silent! execute 'botright cwindow' get(g:, 'neomake_list_height', 10)
            \ | execute 'botright copen' get(g:, 'neomake_list_height', 10)
            \ | wincmd p
    endif
  endif
endif
