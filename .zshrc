######################################################################
# Git branch in prompt.
######################################################################
function parse_git_branch() {
git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

######################################################################
# Color prompt
######################################################################
COLOR_DEF=$'\e[0m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

######################################################################
# Alias
######################################################################
alias bun="cd /Users/bunchhieng.soth/Documents/Bunchhieng"
alias gs="git status"
alias localterraup="cd /Users/bunchhieng.soth/Documents/Bunchhieng/LocalTerra && docker-compose up"
alias localterradown="cd /Users/bunchhieng.soth/Documents/Bunchhieng/LocalTerra && docker-compose down"
alias gm="git pull origin main || git pull origin master"
alias gpt="python3 /Users/bunchhieng.soth/Documents/Bunchhieng/shell_gpt/sgpt.py"
alias gpts="python3 /Users/bunchhieng.soth/Documents/Bunchhieng/shell_gpt/sgpt.py --shell"
alias gptc="python3 /Users/bunchhieng.soth/Documents/Bunchhieng/shell_gpt/sgpt.py --code"

######################################################################
# Exports
######################################################################
export PATH="$(yarn global bin):$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

######################################################################
# Git branch auto complete
######################################################################
if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
fi