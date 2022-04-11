# Git branch in prompt.
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'\e[0m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# Alias
alias bun="cd /Users/ninanongsoth/Documents/Bunchhieng"
alias gs="git status"
alias localterraup="cd /Users/ninanongsoth/Documents/Bunchhieng/LocalTerra && docker-compose up"
alias localterradown="cd /Users/ninanongsoth/Documents/Bunchhieng/LocalTerra && docker-compose down"

export PATH="$(yarn global bin):$PATH"

# Git branch auto complete
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi