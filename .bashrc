# Shortcuts 
alias myfind="grep -inr"
alias lost="echo 4 8 15 16 23 42"
alias ll="ls -laSh"
alias genpasswd="cat /dev/urandom | tr -cd '[:alnum:]' | head -c 32"
alias ms="ls"
alias kc="kubectl"
alias isodate="echo $(date -u '+%Y-%m-%dT%H:%M:%S')"
alias pruneLocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"

# Git 
alias g="git"
alias pullall="find . -name ".git" -type d | sed 's/\/.git//' |  xargs -P10 -I{} git -C {} pull --all"
alias gf="git flow"


export EDITOR="subl -n -w"

function p() { cd $(ls -d $PROJECTS_DIRECTORY/* | fzf) ;}
function choose-context() { kubectl config set-context $(kubectl config get-contexts | tr -s " " | cut -d$' ' -f2 | tail -n +2 | fzf); }


complete -Ef


if [[ "$OSTYPE" == "msys" ]]; then
    alias python='winpty python.exe'
    alias winpwd="pwd | xargs cygpath.exe -w"
    alias e="ii ."
    export PATH=$PATH:"/c/Program Files/KDiff3"
    export PATHEXT=$PATHEXT:".py"
fi



