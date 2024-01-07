#!/bin/sh

# Files
cp -r ~/.bashrc ./.bashrc

# Directorys
cp -r ~/.nix.d ./
sudo cp -r ~/.emacs.d ./
cp -r ~/.hammerspoon ./

cp -r ~/.config/alacritty ./config/

# GIT TIME!

git add .
git commit -m $1
git push origin master
