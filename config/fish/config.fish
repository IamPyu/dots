if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ed="emacs"
alias tm="tmux"
alias elisp="emacs --script"
direnv hook fish | source

function color
    set color $argv[1]
    set text $argv[2]
    set_color $color;printf $text;set_color normal
end

function fish_prompt
    printf "%s" 
    printf "\n"
    printf "[%s@%s:%s] λ> " $(color blue $(whoami)) $(color blue $(hostname -s))\
	$(color magenta $(pwd))
end
