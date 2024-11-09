#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# . "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


function sshfut() {
  sshpass -f $HOME/.ssh/ku_pass ssh "futhark0$1"
}
export -f sshfut # bash only! for zsh, use `zle -N sshfut`.
