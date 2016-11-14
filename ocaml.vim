function! neomake#makers#ft#ocaml#EnabledMakers() abort
    return ['ocamlc']
endfunction

function! neomake#makers#ft#ocaml#ocamlc() abort
    return { 'errorformat': '%m', }
endfunction
