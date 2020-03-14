#---------#
# ALIASES #
#---------#

alias vi="onThisDay && nvim"
alias skim="open -a Skim"
alias ls="gls --color -1"
alias lsblk="diskutil list"
alias remote="ssh -J dakelly@jet.cs.ucl.ac.uk david@128.16.11.133"
alias _="sudo"

#---------#
# ZPLUGIN # 
#---------#

zplugin ice atclone"gdircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin light trapd00r/LS_COLORS

zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
#zplugin snippet OMZ::plugins/fasd/fasd.plugin.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/gnu-utils/gnu-utils.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# weirdness going on sourcing over svn, so just copying osx plugin into local bin
source $HOME/bin/osx.plugin.zsh

#--------#
# PROMPT # 
#--------#

zplugin light bhilburn/powerlevel9k


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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f . $HOME'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

## Solarized colors
export FZF_DEFAULT_OPTS='
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07'

# we need to rebind alt c on the mac as it doesn't work
bindkey '^p' fzf-cd-widget
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# opam configuration
test -r /Users/davidkelly/.opam/opam-init/init.zsh && . /Users/davidkelly/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
