# Path to your oh-my-zsh installation.


export PATH=$PATH:/home/sortraev/.local/bin
export ZSH="$HOME/.oh-my-zsh"
setopt globdots

ZSH_THEME="sortraev"

export UPDATE_ZSH_DAYS=1

# plugins=(git, z)
plugins=(
  git
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# ignore . and .. in completions
zstyle ':completion:*' special-dirs false

export PYTHONDONTWRITEBYTECODE=1

export EDITOR=nvim
export VISUAL=nvim

#### ALIASES
alias zshrc='nvim $HOME/.zshrc'
alias nvimrc='nvim $HOME/.config/nvim/.nvimrc'

alias ggwp='pkill -u sortraev'
alias sov="systemctl suspend"
alias genstart="shutdown -r +0"

alias ny="urxvt &>/dev/null & disown"
alias svim="sudo -E nvim"


alias ll2='ls -pghG --group-directories-first --time-style="+%d-%m %H:%M"'
alias l2='ll2  -A'

# same as above, but using exa.
alias ll='exa -l --no-user --group-directories-first'
alias l='ll -a' # same as above, but also show hidden files.
alias llt="ll -T -L2"
alias llt3="ll -T -L3"
alias lt="l -T -L2"
alias lt3="l -T -L3"




alias v="nvim"
alias c='tput reset && tput cup $LINES 0'

alias j="jobs"
alias f="fg"
alias f1="fg %1"
alias f2="fg %2"
alias f3="fg %3"
alias f4="fg %4"

# wrappers.
alias du="du -h --max-depth=1"
alias feh="feh --scale-down"
alias diff="diff --color=always"

alias whichgpu="optimus-manager --print-mode"

alias cmatrix="cmatrix -C red -u 10 -b"

alias fut="futhark repl"
alias py="python"
alias ipy="ipython"

alias gcc="gcc -Wall -pedantic"
alias grep='rg'

alias brighthi="xrandr --output eDP-1 --brightness 0.8"
alias brightlo="xrandr --output eDP-1 --brightness 0.4"

alias hist='tail -n64 ~/.zsh_history | sort -rn | rg -j 1 "^.*?;" -r "" | fzf'


# Make ^Z toggle between ^Z and fg
function to_foreground() {
if [[ $#BUFFER == 0 ]]; then
    fg > /dev/null 2>&1 && zle redisplay
else
    zle push-input
fi
}
zle -N to_foreground
bindkey '^Z' to_foreground


### fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_OPTS='+c'
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_OPTS='--ansi --reverse --height=60% --border=bottom'
export FZF_DEFAULT_COMMAND=' fd --hidden --exclude ".git" --no-ignore --type f . '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_CTRL_R_OPTS='--ansi'
export FZF_CTRL_R_COMMAND="$FZF_CTRL_R_OPTS"

# Change directory widget
function changedir() {
  TARGET_DIR=$(fzf_changedir)
  if [ $? -eq 0 ]; then
    cd "$TARGET_DIR"
  fi
  zle reset-prompt
}
zle -N changedir
bindkey '^g' changedir

# Change directory widget (with (more) hidden files)
function changedir_no_ignore() {
  TARGET_DIR=$(fzf_changedir_no_ignore)
  if [ $? -eq 0 ]; then
    cd "$TARGET_DIR"
  fi
  zle reset-prompt
}
zle -N changedir_no_ignore
bindkey '^h' changedir_no_ignore

bindkey -s '^f' 'fzf_fif\n'

tput cup $LINES 0
