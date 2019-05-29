for file in ~/.{aliases}; do
  [ -r "$file" ] && source "$file"
done

unset file
export EDITOR=vim

BOLD=$(tput bold)
RESET=$(tput sgr0)

#export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS1="🍕 \[$(tput setaf 7)\]at \[${BOLD}$(tput setaf 4)\]\t \[$(tput setaf 7)\]in \[$(tput setaf 2)\]\w\[$(tput setaf 7)\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$(tput setaf 5)\]\$(parse_git_branch)\[$(tput setaf 6)\]\n➤➤ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"
