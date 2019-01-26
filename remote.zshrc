source '/home/vagrant/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

zstyle ':completion:*' rehash true

# history file
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS


#---------#
# ALIASES #
#---------#

alias vi="nvim"
alias ls="ls --color -1"
alias _="sudo"

#---------#
# ZPLUGIN # 
#---------#

zplugin ice atclone"gdircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin light trapd00r/LS_COLORS

zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

#--------#
# PROMPT # 
#--------#

zplugin light eendroroy/alien-minimal

## alien-minimal prompt
export AM_ENABLE_VI_PROMPT=1
export AM_UPDATE_L_PROMPT=1
export USE_NERD_FONT=1


#-------------#
# COMPLETIONS # 
#-------------#

zplugin snippet OMZ::lib/completion.zsh

zplugin ice wait"0" blockf lucid
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" blockf lucid
zplugin light esc/conda-zsh-completion

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting


#--------#
#   FZF  #
#--------#

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completions.zsh
export FZF_DEFAULT_COMMAND='fd --type f . $HOME'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

## Solarized colors
export FZF_DEFAULT_OPTS='
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07'

# we need to rebind alt c on the mac as it doesn't work
bindkey '^z' fzf-cd-widget
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
