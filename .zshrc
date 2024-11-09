# Path to your oh-my-zsh installation.


export PATH=/home/sortraev/.local/bin:~/google-cloud-sdk:$PATH

## CUDA PATH STUFF
export CPATH=$CPATH:/opt/cuda/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/cuda/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib64/
export PATH=$PATH:/opt/cuda/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sortraev/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sortraev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sortraev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sortraev/google-cloud-sdk/completion.zsh.inc'; fi

export ZSH="$HOME/.oh-my-zsh"
setopt globdots

ZSH_THEME="sortraev"

export UPDATE_ZSH_DAYS=3

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

alias ggwp='pkill -u sortraev'
alias sov="systemctl suspend"

alias ny="urxvt &>/dev/null & disown"
alias svim="sudo -E nvim"
alias sv=svim

alias ll2='ls -pghG --group-directories-first --time-style="+%d-%m %H:%M"'
alias l2='ll2  -A'

# same as above, but using exa.
alias ll='eza -l --no-user --group-directories-first'
alias l='ll -a' # same as above, but also show hidden files.
alias ls=l
alias llt="ll -T -L2"
alias llt3="ll -T -L3"
alias lt="l -T -L2"
alias lt3="l -T -L3"

alias v="nvim"
alias c='tput reset; tput cup $LINES 0'
# alias c='tput reset'

alias j="jobs"
alias f="fg"
alias f1="fg %1"
alias f2="fg %2"
alias f3="fg %3"
alias f4="fg %4"

# wrappers.
alias du="du -h --max-depth=1"
alias feh="feh --scale-down -g 1268x720"
alias diff="diff --color=always"
alias fd="fd -H"

alias cmatrix="cmatrix -C red -u 10 -b"

alias fut="futhark repl"
alias py="python"
alias ipy="ipython"

alias gcc="gcc -Wall -pedantic"

alias hist='tail -n64 ~/.zsh_history | sort -rn | rg -j 1 "^.*?;" -r "" | fzf'

alias gs='git status'

alias mylayout="~/.config/i3/set_kb.sh"
alias dklayout="setxkbmap -layout dk"

alias objdump='objdump -M intel'

alias gpl="git pull"
alias gl="git log"
alias gc="git commit"
alias gca="git commit --amend"
alias gcane="git commit --amend --no-edit"

alias readelf='readelf -W'

alias sshhendrix='sshpass -f  ~/.ssh/ku_pass ssh hendrix'
alias sshhendrix1='sshpass -f ~/.ssh/ku_pass ssh hendrix1'
alias sshhendrix3='sshpass -f ~/.ssh/ku_pass ssh hendrix3'
alias sshfut1='sshpass -f ~/.ssh/ku_pass ssh futhark01'
alias sshfut2='sshpass -f ~/.ssh/ku_pass ssh futhark02'
alias sshfut3='sshpass -f ~/.ssh/ku_pass ssh futhark03'
alias scppass='sshpass -f ~/.ssh/ku_pass scp'

alias woman=man

# alias futbuild='make -C $HOME/repos/futhark build && make -C $HOME/repos/futhark install && scp /home/sortraev/.local/bin/futhark sortraev@powervan:/home/sortraev/.local/bin'
# alias futbuild='make -C $HOME/repos/futhark build && make -C $HOME/repos/futhark install'
# alias futm=futbuild

alias faceon='xrandr --output HDMI-A-0 --auto --primary --output eDP --off'
alias faceoff='xrandr --output eDP --auto --primary --output HDMI-A-0 --off'

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
if [[ ! "$PATH" == */home/sortraev/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/sortraev/.fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "/home/sortraev/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "/home/sortraev/.fzf/shell/key-bindings.zsh"

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
export FZF_ALT_C_COMMAND=" fd -t d . $HOME"
export FZF_CTRL_R_OPTS='--ansi'
export FZF_CTRL_R_COMMAND="$FZF_CTRL_R_OPTS"

# Change directory widget
function dirfind() {
  TARGET_DIR=$(fzf_dirfind $1)
  if [ $? -eq 0 ]; then
    cd "$TARGET_DIR"
  fi
  zle reset-prompt
}
zle -N dirfind
bindkey '^g' dirfind

function dirfind_no_ignore() {
  dirfind DUMMY
}
zle -N dirfind_no_ignore
bindkey '^G' dirfind_no_ignore

bindkey -s '^f' " fzf_fif\n"

function openfiles() {
  TARGET_FILES=$(fd --hidden --exclude ".git" --no-ignore --type f | fzf -m)
  if [ $TARGET_FILES != "" ]; then
    echo $TARGET_FILES | xargs o
    # /home/sortraev/.local/bin/o $TARGET_FILES
  fi
  zle reset-prompt
}
zle -N openfiles
bindkey '^o' openfiles

# better formatting for the time built-in.
TIMEFMT=$'\n%J\n%U user\n%S system\n%P cpu\n%*E total'



function futm() {
  # Build Futhark
  # if [[ $(make -C $HOME/repos/futhark build) -ne 0 ]]; then

  BINNAME="futhark"
  if [[ $# -ne 0 ]]; then
    # If arg is 0, don't install.
    BINNAME="$1"
  fi
  INSTALLBIN="~/.local/bin/$BINNAME"
  taskset -c 0-16 make -C $HOME/repos/futhark INSTALLBIN=$INSTALLBIN install
}

tput reset
tput cup $LINES 0

[ -f "/home/sortraev/.ghcup/env" ] && source "/home/sortraev/.ghcup/env" # ghcup-env


function sshfut() {
  sshpass -f $HOME/.ssh/ku_pass ssh "futhark0$1"
}
zle -N sshfut
