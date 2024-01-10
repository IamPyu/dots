# znap
# Download Znap, if it's not there yet.
[[ -r ~/.znap/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh  # Start znap

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting


color(){
  #echo -e "\e[$1m$2\e[0m"
  echo -e "\[$(tput setaf $1)\]$2\[$(tput sgr0)\]"
}

export PS1="[%n@%m] λ> "

# alias
ed="nvim" # Ed == Neovim now!
tm="tmux" # tmux

eval "$(direnv hook zsh)"
