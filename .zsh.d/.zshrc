# znap
# Download Znap, if it's not there yet.
[[ -r ~/.znap/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh  # Start znap

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# a simple function to print colored text
color(){
  #echo -e "\e[$1m$2\e[0m"
  echo -e "$(tput setaf $1)$2$(tput sgr0)"
}

# autoloads
autoload -U colors && colors
autoload -U promptinit && promptinit

# the prompt
name="%{$fg[green]%}%n%{$reset_color%}"
host="%{$fg[blue]%}%m%{$reset_color%}"

export PROMPT="[$name@$host] λ> "
export RPROMPT="%{$fg[green]%}%~%{$reset_color%}"

# paths and cflags
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.roswell/bin"

export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib"
export CPATH="$CPATH:/opt/homebrew/include"

# alias
alias ed="nvim" # Ed == Neovim now!
alias tm="tmux" # tmux
