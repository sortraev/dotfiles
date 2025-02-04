
# Append the current git branch, if in a git repository

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} <%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}"

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%}>"

# Add a yellow D if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}> %{$fg[yellow]%}D"


# PWD in cyan, but truncate at 40 characters.
ZSH_PWD="%{$fg_bold[cyan]%}%40<...<%~%<<%{$reset_color%}"
ZSH_PWD="%{$fg_bold[cyan]%}%~%{$reset_color%}"

# git branch name etc.
ZSH_GIT_STUFF="%{$fg_bold[white]%}\$(git_prompt_info)%{$reset_color%}"

PROMPT='%{$fg_bold[white]%}%(!.#.$) $ZSH_PWD '
RPROMPT="$ZSH_GIT_STUFF"
