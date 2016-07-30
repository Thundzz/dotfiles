# chargement de l'environnement par la commande bash

# definition  des alias

alias firefox='~/firefox/firefox'
alias ds='~/diskspace.sh | sort -h'
alias ll='ls -la'
alias mv='mv -i'
alias tests='cd ~/TESTS'
alias cl='clear'
alias seven='svn'
alias evince='evince 2>/dev/null'
alias ls='ls --color'
alias git='hub'
alias ms='ls'
#variable
#prompt
export PS1="[\H][\W]" # produit un prompt" [Login][Currentdir]"
#[\u]




export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
