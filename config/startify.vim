let g:startify_bookmarks = [ { 'a': '~/dotfiles/init.vim' }, { 'b': '~/dotfiles/tmux.conf' } ]
let g:startify_custom_header =  map(split(system('startify'), '\n'), '"  ". v:val')
