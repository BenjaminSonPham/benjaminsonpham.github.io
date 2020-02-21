autoload -Uz compinit promptinit
compinit
promptinit
# This will set the default prompt to the walters theme
#prompt walter

if [ -e ~/.zshrc.aliases ] ; then 
	source ~/.zshrc.aliases
fi

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist

setopt COMPLETE_ALIASES

powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

SAVEHIST=10000 # Number of entries
HISTSIZE=10000
#HISTFILE=~/.zsh/history # File
HISTFILE=~/.zsh_history # File
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals


bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[3~" delete-char

#enable shift + tab reverse menu complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^H' backward-kill-word

#enable home/end functionalities
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
