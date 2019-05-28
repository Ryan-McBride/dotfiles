# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export EDITOR=vim

BOLD=$(tput bold)
RESET=$(tput sgr0)

#export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS1="🍕 \[$(tput setaf 7)\]at \[${BOLD}$(tput setaf 4)\]\t \[$(tput setaf 7)\]in \[$(tput setaf 2)\]\w\[$(tput setaf 7)\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$(tput setaf 5)\]\$(parse_git_branch)\[$(tput setaf 6)\]\n➤➤ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
