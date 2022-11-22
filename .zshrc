# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mytheme"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# terminal
autoload -U compinit
compinit -u
alias ls='ls -G'
alias ll='ls -l'

