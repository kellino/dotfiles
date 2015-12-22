let g:startify_custom_header = 
            \ map(split(system('fortune -a | cowsay'), '\n'), '"  ". v:val') + ['','']

