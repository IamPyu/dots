#!/bin/sh

# Files
cp -r ~/.bashrc ./.bashrc
cp -r ~/.zshenv ./.zshenv

# Directorys
cp -r ~/.zsh.d ./
sudo cp -r ~/.emacs.d ./
cp -r ~/.hammerspoon ./

cp -r ~/.config/alacritty ./config/
cp -r ~/.config/fish/ ./config/
cp -r ~/.config/nvim ./config/
