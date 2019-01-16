let g:startify_bookmarks = [ { 'a': '~/Documents/dotfiles/init.vim' }, { 'b': '~/Documents/dotfiles/tmux.conf' }, { 'c' : '~/.zshrc' } ]
let g:startify_custom_header =  map(split(system('startify'), '\n'), '"  ". v:val')
