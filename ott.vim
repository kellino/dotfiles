function! neomake#makers#ft#ott#EnabledMakers() abort
    return ['ott']
endfunction

function! neomake#makers#ft#ott#ott() abort
    " return { 'errorformat' : '%*\f: %#%f:%l: %m' }
    return { 'errorformat': '%AFile "%f"\, line %l\, characters %c-%.%#\:,'.  '%C%m' }
endfunction
