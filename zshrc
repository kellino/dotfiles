# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# environmental exports
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
export LANG=en_GB.UTF-8
export EDITOR='nvim'
export BROWSER='chromium'

autoload zmv
bindkey ' ' magic-space

## ls colours
autoload -Uz colors && colors
eval `dircolors -b $HOME/.ls_colours`

## stack completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"


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
ZSH_THEME="cypher"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

## plugins
plugins=(git archlinux history vi-mode ag ghc zsh-syntax-highlighting)
## syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# User configuration

export PATH="/home/david/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/david/.cabal/bin:/home/david/.local/bin:"

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
alias usb='sudo mount /dev/sdb1 /mnt'
alias umusb='sudo umount /mnt'
alias modstat="stat --format '%a'" # returns the octal number of a file / directory
alias k9="kill -9"
alias mmv='noglob zmv -W'

# monitor
alias mon='xrandr --output HDMI1 --auto --left-of eDP1'
alias ut='transset-df -a 1'

# aliases for java
alias javacp='java -cp src/'
alias jj="java -jar"
alias jclim="/usr/lib/eclipse/eclimd -Dosgi.instance.area.default=@user.home/Programming/Java"

# openvpn
alias vpn='sudo openvpn /etc/openvpn/AirVPN_Europe_UDP-443.ovpn'

# python
alias pyrepl='ptipython'

# directories
alias pf='cd $HOME/Programming/Haskell'
alias pp='cd $HOME/Programming/Python'

# alsi
alias alsi='alsi -t -u'

# coloured cat
alias ccat='pygmentize -g'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/dotfiles/zsh_funcs ] && source $HOME/dotfiles/zsh_funcs
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
