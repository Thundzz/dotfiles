# chargement de l'environnement par la commande bash

# definition  des alias

alias ll='ls -la'
alias mv='mv -i'
alias cl='clear'
alias ls='ls --color'
alias subl="/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias timestamp="date --rfc-3339=seconds"


#prompt (git-bash prompt)
export PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "
