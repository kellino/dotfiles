let g:haskell_enable_quantification=1
let g:haskell_enable_recursivedo=1
let g:haskell_enable_arrowsyntax=1
let g:haskell_enable_pattern_synonyms=1
let g:haskell_enable_typeroles=1
let g:haskell_enable_static_pointers=1
let g:hs_highlight_boolean=1

let g:ghcmod_hlint_options=['--ignore=Redundant $']
let g:ghcmod_open_quickfix_function='GhcModQuickFix'

let g:haskellmode_completion_ghc=0

let g:haskell_tabular=1
vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /::<CR>
vmap a> :Tabularize /-><CR>
vmap a< :Tabularize /<-<CR>


let g:ycm_semantic_triggers={'haskell' : ['.']}
let g:necoghc_enable_detailed_browse=1


function! REPLSendHaskell()
    save! %
    let l:line = [join([':load', expand('%.t')], ' ')]
    call jobsend(g:last_terminal_job_id, add(l:line, ''))
endfunction

function! HaskellRepl()
    silent! 20 split
    e ghci.hs
    call termopen('ghci -XOverloadedStrings')
    wincmd p
endfunction

augroup haskellgroup
    au BufNewFile,BufRead *.hs map <buffer> <F2>   : Hoogle<CR>
    au BufNewFile,BufRead *.hs map <buffer> <C-F2> : HoogleClose<CR>
    au BufNewFile,BufRead *.hs map <buffer> <S-F2> : HoogleLine<CR>
augroup END

nnoremap <silent> <C-x><C-x> :REPLSendHaskell<CR>

map <leader>ti :GhcModTypeInsert<CR>

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

command! REPLSendHaskell call REPLSendHaskell()
command! Haskell call HaskellRepl()
