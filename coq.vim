function! neomake#makers#ft#coq#EnabledMakers() abort
    return ['coqtop']
endfunction

function! neomake#makers#ft#coq#coqtop() abort
    " cwd: luacheck looks for .luacheckrc upwards from there.
    return {
        \ 'args': ['-noglob', '-batch', '-load-vernac-source'],
        \ 'cwd': '%:p:h',
        \ 'errorformat': '%AFile "%f"\, line %l\, characters %c-%.%#\:,'.  '%C%m'
        \ }
endfunction
