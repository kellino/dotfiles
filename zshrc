# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# environmental exports
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
export LANG=en_GB.UTF-8
export EDITOR='nvim'
export BROWSER='firefox'
export TERM='screen-256color-italic'
export TERMINAL='alacritty'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

GPG_TTY=`tty` 
export GPG_TTY 

bindkey ' ' magic-space

## ls colours
autoload -Uz colors && colors
eval `dircolors -b $HOME/.ls_colours`

## stack completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit


HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000


setopt login
setopt prompt_subst
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt hist_verify               # Don't execute immediately upon history expansion.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="cypher"
ZSH_THEME="agnoster"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

## plugins
plugins=(git archlinux history vi-mode ghc stack zsh-syntax-highlighting)
## syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# User configuration
export PATH="/home/david/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/david/.local/bin:/home/david/.cabal/bin:"

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

## custom aliases
# system aliases
alias down='shutdown -P now'
alias restart='shutdown -r now'
alias usb='sudo mount /dev/sdb1 /mnt'
alias umusb='sudo umount /mnt'
alias modstat="stat --format '%a'" # returns the octal number of a file / directory
alias k9="kill -9"
alias owner="pacman -Qo"
alias yalst="yaourt -Qe --color | sed '/[^haskel-]core/d'"

# colours output in less
alias tree="tree -C"
alias less="less -R"

# terminal transparency
alias black='transset-df -a 1'
alias normal='transset-df -a 0.8'
alias forpdf='transset-df -a 0.7'

# openvpn
alias vpn='openvpn --dev-type tun --dev tun0-unrooted --user openvpn --group network'
# alias vpn='sudo openvpn --config /etc/openvpn/AirVPN_Europe_UDP-443.ovpn --daemon'

# directories
alias pf='cd $HOME/Programming/Haskell'
alias pp='cd $HOME/Programming/Python'
alias pi='cd $HOME/Programming/Idris'
alias ppl='cd $HOME/Programming/Prolog'

# intero
alias intero='stack exec intero'

# images
alias metadata='identify -verbose' 

# alsi
alias alsi='alsi -t -u'

# vim as pager
alias vless='/usr/share/nvim/runtime/macros/less.sh'

# i3lock-fancy
alias lock='i3lock-fancy'

# tmux sessions
alias home='tmuxp load ~/.tmuxp/home.yaml'
alias ucl='tmuxp load ~/.tmuxp/ucl.yaml'

[ -f $HOME/dotfiles/zsh_funcs ] && source $HOME/dotfiles/zsh_funcs
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OPAM configuration
. /home/david/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
