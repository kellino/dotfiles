function! neomake#makers#ft#ml#EnabledMakers()
    return ['merlin']
endfunction

function! neomake#makers#ft#ml#merlin()
    return {
        \ 'exe': 'merlin',
        \ 'errorformat':
            \ '%E%f:%l%\%.%c %trror: %m,' .
            \ '%E%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %trror: %m,' .
            \ '%W%f:%l%\%.%c %tarning: %m,' .
            \ '%W%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %tarning: %m,' .
            \ '%C%\s%\+%m,' .
            \ '%-G%.%#'
        \ }
endfunction
