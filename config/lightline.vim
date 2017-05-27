scriptencoding utf-8

set laststatus=2

"" bufferline
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0
let g:bufferline_fname_mod = ':~:.'
let g:bufferline_pathshorten = 1


let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left'  : [ 
      \         [ 'mode', 'paste' ], 
      \         [ 'fugitive', 'readonly', 'filename' ], 
      \         ['neomake'] ],
      \   'right' : [ 
      \         ['trailing', 'indentation', 'lineinfo'], 
      \         ['percent'], 
      \         [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \   'tabline': {
      \     'left': [ ['bufferline'] ],
      \   },
      \   'component': {
      \     'bufferline': '%{MyBufferlineRefresh()}' . bufferline#get_status_string('TabLineSel', 'LightLineLeft_tabline_tabsel_1'),
      \ },
      \ 'component_function': {
      \   'readonly'     : 'MyReadonly',
      \   'modified'     : 'MyModified',
      \   'fugitive'     : 'MyFugitive',
      \   'filename'     : 'MyFilename',
      \   'fileformat'   : 'MyFileformat',
      \   'filetype'     : 'MyFiletype',
      \   'fileencoding' : 'MyFileencoding',
      \   'mode'         : 'MyMode',
      \ },
      \ 'component_expand': {
          \ 'indentation': 'MixedIndentSpaceWarning',
          \ 'neomake':     'MyNeomake',
      \ },
      \ 'component_type': {
          \ 'trailing': 'warning',
          \ 'indendation': 'warning',
          \ 'neomake': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': ''}
      \ }

function! MyModified()
  if &filetype ==# 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! MyFugitive()
  if exists('*fugitive#head')
    let l:branch = fugitive#head()
    return l:branch !=# '' ? ' ' . l:branch : ''
  endif
  return ''
endfunction

function! MyReadonly()
  if &filetype ==# 'help'
    return ''
  elseif &readonly
    return ''
  else
    return ''
  endif
endfunction

function! MyFilename()
  return ('' !=# MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' !=# MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFileformat()
    if &filetype ==# 'startify' | return '' | endif
    return winwidth(0) > 70 ? &fileformat : ''
endfunction


function! MyFiletype()
    if &filetype ==# 'startify' | return '' | endif
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    if &filetype ==# 'startify' | return '' | endif
    return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding: &encoding) : ''
endfunction

function! MyMode()
  let l:fname = expand('%:t')
  return l:fname ==# '__Tagbar__' ? 'Tagbar' :
        \ &filetype ==# 'unite' ? 'Unite' :
         \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MixedIndentSpaceWarning()
      if winwidth(0) < 80
        return ''
      endif
      let l:tabs = search('^\t', 'nw')
      let l:spaces = search('^ ', 'nw')
      if (l:tabs != 0) && (l:spaces != 0)
        return '» mixed-indent[' . l:tabs . ']'
      else
        return ''
      endif
endfunction

augroup ComponentExpand
    autocmd!
    autocmd CursorHold,BufWritePost,InsertLeave * call s:flags()
augroup END

function! s:flags()
      if exists('#LightLine')
        call MixedIndentSpaceWarning()
        call lightline#update()
      endif
endfunction

function! MyNeomake()
    if !exists('*neomake#statusline#LoclistCounts')
        return ''
    endif
    " Count all the errors, warnings
    let l:total = 0
    for l:v in values(neomake#statusline#LoclistCounts())
        let l:total += l:v
    endfor
    for l:v in items(neomake#statusline#QflistCounts())
        let l:total += l:v
    endfor
    if l:total == 0
        return ''
    endif
    return 'line '.getloclist(0)[0].lnum. ', 1 of '.l:total
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! MyBufferlineRefresh()
  call bufferline#refresh_status()
  let rlen = 4*tabpagenr('$') + len(&fenc) + 8
  call bufferline#trim_status_info(&columns - rlen)
  return ''
endfunction

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

augroup fzf
    autocmd! User FzfStatusLine call <SID>fzf_statusline()
augroup END
