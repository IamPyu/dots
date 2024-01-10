#!/bin/sh

echo "WARNING! THIS SCRIPT REPLACES CURRENT DOTFILES WITH NO RECOVERY!!! ARE YOU SURE YOU WANT TO CONTINUE?"
echo "Press CTRL-C to cancel! This is your last warning!"
read

mkdir -p ~/.config/
cp -r ./config/* ~/.config/

cp -r ./.emacs.d/ ~/.emacs.d/
cp -r ./.nix.d/ ~/.nix.d/
cp -r ./.hammerspoon/ ~/.hammerspoon/


cp -r ./.bashrc ~/.bashrc
cp -r ./.zshrc ~/.zshrc
