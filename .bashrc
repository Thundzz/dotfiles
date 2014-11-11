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
alias gg='~/scripts/gg.sh'
alias git='hub'
alias ms='ls'
alias prcdlog='ssh -Y -X -p 10000 prcd2014-eljarrari@devel05-06.math.u-bordeaux1.fr'
#variable
#prompt
export PS1="[\H][\W]" # produit un prompt" [Login][Currentdir]"
#[\u]




export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
