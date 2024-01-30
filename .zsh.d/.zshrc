# znap
# Download Znap, if it's not there yet.
[[ -r ~/.znap/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh  # Start znap

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# autoloads
autoload -U colors && colors
autoload -U promptinit && promptinit

# prompt
name="%{$fg[green]%}%n%{$reset_color%}"
host="%{$fg[blue]%}%m%{$reset_color%}"
lambda="λ> " # just the end of my prompt

export PROMPT="[$name@$host] $lambda"
export RPROMPT="%{$fg[green]%}%~%{$reset_color%}"
export PS2="$lambda"

# exports
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.roswell/bin"

export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib"
export CPATH="$CPATH:/opt/homebrew/include"

# alias
alias ed="emacs" # Ed == Emacs now!
alias tm="tmux" # tmux

alias ls="ls -la"
alias rm="rm -ri"
alias cls="clear"
alias cwd="pwd"
alias reload="zsh -l"
