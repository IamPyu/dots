#!/usr/bin/env bash
color(){
  #echo -e "\e[$1m$2\e[0m"
  echo -e "\[$(tput setaf $1)\]$2\[$(tput sgr0)\]"
}

# prompt customization :) (default bash on macOS looks like crap) now I also have a simple way to print colored text!

leftprompt="[$(color 2 "\u@\h"):$(color 4 "\w")]"
export PS1="$leftprompt $(color 2 "λ") "
export PS2="=> "

# alias

alias ed="emacs" # Ed == Emacs now!
alias tm="tmux" # tmux
# run elisp code quickly
alias elisp="emacs --script"

