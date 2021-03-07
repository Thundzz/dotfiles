[[ $- != *i* ]] && return                # If shell is not interactive, stop here

complete -cf sudo


shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

source $HOME/.config/env
source $HOME/.config/aliasrc
source $HOME/.config/bash/bash_color
source $HOME/.config/bash/bash_title
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion


xhost +local:root > /dev/null 2>&1


function p() { cd $(ls -d $PROJECTS_DIRECTORY/* | fzf) ;}

