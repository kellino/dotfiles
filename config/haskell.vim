let g:haskell_enable_quantification=1
let g:haskell_enable_recursivedo=1
let g:haskell_enable_arrowsyntax=1
let g:haskell_enable_pattern_synonyms=1
let g:haskell_enable_typeroles=1
let g:haskell_enable_static_pointers=1

let g:haskell_indent_if=3
let g:haskell_indent_case=2
let g:haskell_indent_let=4
let g:haskell_indent_do=3
let g:haskell_indent_in=1

let g:ghcmod_hlint_options=['--ignore=Redundant $']
let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'

function! GhcModQuickFix()
  " for unite.vim and unite-quickfix
  :Unite -no-empty quickfix
endfunction

let g:ycm_semantic_triggers={'haskell' : ['.']}
let g:necoghc_enable_detailed_browse=1

let hscoptions = "*EfchCIT"

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F1>c :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F1>i :HdevtoolsInfo<CR>
