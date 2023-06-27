#!/usr/bin/env bash

read -p "Do you want to install this package? [y/N] : " option

if [[ $option =~ ^[y]+$ || $option =~ ^[Y]+$ ]]; then
  mkdir ~/.config/.bst
  cd ~/.config/.bst
  git clone https://github.com/katzEco/brew-services-tui
  cd brew-services-tui/src
  mv * ~/.config/.bst
  cd ~/.config/.bst
  rm -rf brew-services-tui
  rm installer.sh

  echo alias bst="~/.config/.bst/tui.sh" > ~/.zshrc
  source ~/.zshrc
  clear
  
  echo "bst is installed to your console"
  echo "try run 'bst' in your zsh"
fi