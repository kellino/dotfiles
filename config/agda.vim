function! AgdaSet()
    let l:num = matchstr(getline('.'), '\%' .col('.') . 'c.')
    if l:num !=# '/[0-9]/'
        normal! x
        let l:c = 0
        let l:types = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
        let l:levels = ['ℓ', 'ℓ′', 'ℓ″', 'ℓ‴', 'α', 'β', 'γ']
        " dump all the levels as implicit args
        call setline(line('.'), getline(line('.')) . '{')
        while l:c < l:num
            let l:level = l:levels[l:c]
            call setline(line('.'), getline(line('.')) . l:level . ' ')
            let l:c += 1
        endwhile
        call setline(line('.'), getline(line('.')) . '}')
        " delete the unnecessary space between last level and '}'
        normal! $
        normal! h
        normal! x
        " reset counter and now do Sets
        let l:c = 0
        while l:c < l:num
            let l:type = l:types[l:c]
            let l:level = l:levels[l:c]
            call setline(line('.'), getline(line('.')) . '{' . l:type . ' : Set ' . l:level . '}') 
            let l:c += 1
        endwhile
    else 
        echo 'not a number under the cursor ' . l:num
    endif
endfunction

command! -nargs=0 AgdaSet call AgdaSet()

nnoremap <buffer> <LocalLeader>ss :call AgdaSet()<CR>
