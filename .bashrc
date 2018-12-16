# Misc functions
function lsbinaries() {
	if [[ $# != 1  ]]; then
		echo "Please provide environment."
		return
	fi
	aws dynamodb scan --table-name datav3-project-binary-latest-version-$1 | jq -r '.Items[] | .artifactName.S + "\t" + .version.S' | sed 's/\t/,|,/g' | column -s ',' -t
}

function lsclusters() {
	aws emr list-clusters --active | jq -r '.Clusters[] | .Id + "\t" + .Status.State + "\t" + .Name' | sed 's/\t/,|,/g' | column -s ',' -t
}


# Shortcuts 
alias myfind="grep -inr"
alias lost="echo 4 8 15 16 23 42"
alias subl="/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias ll="ls -laSh"
alias cl='clear'
alias ls='ls --color'
alias genpasswd="cat /dev/urandom | tr -cd '[:alnum:]' | head -c 32"
alias ms="ls"
alias projects="cd /c/Projects/"
alias ii="start "
alias python='winpty python.exe'
alias g="git"
alias describequeue='aws sqs get-queue-attributes --attribute-names All --queue-url'
alias pullall="find . -name ".git" -type d | sed 's/\/.git//' |  xargs -P10 -I{} git -C {} pull"
alias timestamp="date --rfc-3339=seconds"
alias mv='mv -i'

# AWS 
alias randomusic="shuf -n 1 ~/Documents/Perso/play.google.com-1479562807628.log"
alias winpwd="pwd | xargs cygpath.exe -w"

export PATH=$PATH:"/c/Program Files/KDiff3":"$HOME/Downloads":"C:\Program Files (x86)\CodeBlocks\MinGW\bin":"/c/Projects/python-toolbox/calcul-historique"
export PATHEXT=$PATHEXT:".py"
export EDITOR=vim
export PATH=:$USERPROFILE/AppData/Roaming/Python/Scripts:$PATH
export PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "

