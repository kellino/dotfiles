let g:startify_bookmarks = [ { 'a': '~/dotfiles/init.vim' }, { 'b': '~/dotfiles/zshrc'}, { 'c': '~/dotfiles/tmux.conf' } ]
let g:startify_custom_header =  map(split(system("echo \"On this day:\n\" $(shuf -n1  ~/.cache/onthisday-*) | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n"), '\n'), '"  ". v:val') + ['','']
