NC="\[\033[00m\]"
LGREEN="\[\033[00;92m\]"
YELLOW="\[\033[00;33m\]"
LBLUE="\[\033[00;94m\]"
RED="\[\033[00;31m\]"

parse_git_dirty() {
    [[ -d .git && $(git status --porcelain | grep '??') != "" ]] && echo " *"
    [[ -d .git && $(git status --porcelain | grep 'A') != "" ]] && echo " º"
}

get_dir() {
    [[ ${PWD} == $HOME ]] && echo '~' || echo ${PWD##*/}
}

export PS1="${LGREEN}\u@\h${NC} ${YELLOW}\$(get_dir)${NC}${LBLUE}\$(__git_ps1)${NC}${RED}\$(parse_git_dirty)${NC} $ "
