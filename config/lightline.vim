set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], 
      \             [ 'fugitive', 'readonly', 'filename' ] ],
      \   'right': [ ['trailing', 'indentation', 'lineinfo'], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'component_expand': {
      \  'trailing': 'TrailingSpaceWarning',
      \  'indentation': 'MixedIndentSpaceWarning',
      \ },
      \ 'component_type': {
      \ 'trailing': 'warning',
      \ 'indendation': 'warning',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': ''}
      \ }


function! MyModified()
    return &filetype =~# 'help\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction


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


function! MyReadonly()
  return &filetype !~? 'help\|vimfiler\|' && &readonly ? '' : ''
endfunction


function! MyFilename()
  return ('' !=# MyReadonly() ? MyReadonly() . ' ' : '') .
       \ (&ft == 'unite' ? unite#get_status_string() :
       \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction


function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction


function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction


function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding: &encoding) : ''
endfunction


function! MyMode()
  let l:fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ &ft == 'unite' ? 'Unite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction 

function! TrailingSpaceWarning()
      if winwidth(0) < 80
        return ''
      endif
      let l:trailing = search('\s$', 'nw')
      if l:trailing != 0
        return '… trailing[' . l:trailing . ']'
      else
        return ''
      endif
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
        call TrailingSpaceWarning()
        call MixedIndentSpaceWarning()
        call lightline#update()
      endif
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
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
