shopt -s expand_aliases
shopt -s histappend

export HISTSIZE=20000
export HISTFILESIZE=20000

# Prevent MSYS2 from translating paths (breaks many commands. Generally not a good idea but can be useful in some situations)
# export MSYS_NO_PATHCONV=1

export PROJECTS_DIRECTORY=/c/Projects
export DESKTOP_DIR=$HOME/Desktop
export EDITOR="subl -n -w"
export KUBE_EDITOR="code -nw"
export TERM="xterm-256color"
# export TERM=screen
# export TERM="screen-256color"
export ANSICON=true
# export FZF_DEFAULT_OPTS='--no-height --reverse'
export PS1='\n\[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\] `kube_ps1` `aws_profile` \n$ '

function browse() {
    directory=`ls -d $1/* | FZF_DEFAULT_OPTS='--no-height --reverse' fzf`
    if [ -z "$directory" ]
    then
     directory=$1
    fi
    cd "$directory";
}

function include() {
    [[ -f "$1" ]] && source "$1"
}

function amogus() {
    export IMPOSTOR="ඞ"
    iconv -f UTF-8 -t UTF-16LE <(echo $IMPOSTOR) | clip
    echo "$IMPOSTOR copied to the clipboard. Kinda sus."
}

function aws_profile() {
    if [[ -n $AWS_PROFILE ]]; then
      echo -n "(aws:$AWS_PROFILE)"
    elif [[ -n $AWS_DEFAULT_PROFILE ]]; then
      echo -n "(aws:$AWS_DEFAULT_PROFILE)"
    else
      echo -n "(aws:default)"
    fi
}

function klogs() { kubectl logs -f --since $1 $(kubectl get pods --no-headers -o custom-columns=":metadata.name" | fzf); }
function ts2date() { date -d @"$1"; }
function mts2date() { divided=$(($1 / 1000)); ts2date $divided; }

# Dyslexia
alias ms="ls"
alias gti="git"

# Memes
alias lost="echo 4 8 15 16 23 42"
alias sus="amogus"
alias le_meilleur_moment_de_la_journee='echo le moment du skribbl.io'

# Shortcuts
alias myfind="grep -inr"
alias grep="grep --color"
alias l="less"
alias ll="ls -laSh"
alias genpasswd="cat /dev/urandom | tr -cd '[:alnum:]' | head -c 32"
alias sbt="sbt -no-colors"
alias kc="kubectl"
alias isodate="date -u '+%Y-%m-%dT%H:%M:%S'"
alias datecompact="date -u +"%Y%m%d%H%M%S""
alias now="isodate"
alias nowts="date +%s"
alias nowshort='date "+%Y-%m-%d"'
alias today="nowshort"
alias tzoffset="date +%z"
alias pruneLocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
alias watch="watch "
alias awsprof="aws configure list-profiles"
alias lspython='tasklist | grep --text python | tr -s " "  | cut -d" " -f2'
alias uuid="od -x /dev/urandom | head -1 | awk '{OFS=\"-\"; print \$2\$3,\$4,\$5,\$6,\$7\$8\$9}'"
alias ts2date="ts2date" # Just so that it appears when looking for aliases
alias mts2date="mts2date" # Just so that it appears when looking for aliases
alias searchcmd="ls ~/bin/ | fzf"
alias reload="source ~/.bashrc"
alias ebrc="$EDITOR -nw ~/.bashrc && source ~/.bashrc && echo '.bashrc edited and reloaded'"
alias vbrc="less -nw ~/.bashrc"
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias glab="FORCE_HYPERLINKS=1 EDITOR=vim glab"
alias scalagrep="grep -nri --include='*.scala'"
alias pygrep="grep -nri --include='*.py'"
alias sqlgrep="grep -nri --include='*.sql'"

# aws-azure-login
alias aal="export AWS_DEFAULT_PROFILE=default; export AWS_PROFILE=default; aws-azure-login -p default --no-prompt;"
alias aalp="export AWS_DEFAULT_PROFILE=prod; export AWS_PROFILE=prod; aws-azure-login -p prod --no-prompt;"
alias aala="aws-azure-login -p azure --no-prompt"

# Git
alias g="git"
alias pullall="find . -name ".git" -type d | sed 's/\/.git//' |  xargs -P10 -I{} git -C {} pull --all"
alias gf="git flow"
alias dev="git co develop"
alias mas="git co master"

# Quick browsing to important directories
alias p="browse $PROJECTS_DIRECTORY"
alias d="browse $DESKTOP_DIR"

complete -Ef

if [[ "$OSTYPE" == "msys" ]]; then
  alias winpwd="pwd | xargs cygpath.exe -w"
  alias ranger="wsl ranger"
  alias cal="wsl cal"
  alias e="ii ."
  alias ln='MSYS="winsymlinks:nativestrict" ln' # Create "real" windows symlinks
  alias stow='MSYS="winsymlinks:nativestrict" stow' # Create "real" windows symlinks
  alias ssh='MSYS="enable_pcon" ssh' # Fix CTRL+C in ssh sessions (https://github.com/git-for-windows/git/issues/3657#issuecomment-1028037890)
  export PATH=$PATH:"/c/Program Files/KDiff3"
  export PATHEXT=$PATHEXT:".py"

  function wealpath(){ realpath $1 | xargs cygpath.exe -w; }
  function meme() {
    chosen=$(cd "$HOME/OneDrive - AT INTERNET/Images/"; wealpath "$(fzf)")
    echo $chosen
    echo nircmd clipboard copyimage "$chosen"
    nircmd clipboard copyimage "$chosen"
    echo $?
  }
  # Cowfile utils
  export COWFILE_LOCATION="\/mnt\/c\/Users\/$USERNAME\/.cowfiles\/cowfiles\/"
  function jordisay() { wsl -- cowsay -f $COWFILE_LOCATION'\/jordi.cow' $1; }
  function squirtsay() { wsl -- cowsay -f $COWFILE_LOCATION'\/squirtle.cow' $1; }
  function locusay() { wsl -- cowsay -f $COWFILE_LOCATION'\/locust.cow' $1; }

  alias cdbeaver="cd /c/Users/yel-jarrari/AppData/Roaming/DBeaverData/workspace6/General"
elif [[ -n "$IS_WSL" || -n "$WSL_DISTRO_NAME" ]]; then
  alias cdbeaver="cd /mnt/c/Users/yel-jarrari/AppData/Roaming/DBeaverData/workspace6/General"
fi

include ~/.config/fzf/key-bindings.bash
include ~/.config/fzf/completion.bash
include /c/bin/gum/completions/gum.bash
include ~/.config/aliasrc
include ~/.kube-ps1/kube-ps1.sh
kubeoff

# kubectx and kubens
export PATH=~/.kubectx:$PATH
