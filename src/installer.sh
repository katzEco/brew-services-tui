#!/usr/bin/env bash

read -p "Do you want to install this package? [y/N] : " option

if [[ $option =~ ^[y]+$ || $option =~ ^[Y]+$ ]]; then
  mkdir ~/.config/.bst
  cd ~/.config/.bst
  rm -rf *
  git clone https://github.com/katzEco/brew-services-tui
  cd brew-services-tui/src
  mv * ~/.config/.bst
  cd ~/.config/.bst
  rm -rf brew-services-tui
  rm installer.sh

  # export alias bst="~/.config/.bst/tui.sh"
  cp ~/.zshrc ~/.zshrc-bst-bak
  echo -e '\nalias bst="~/.config/.bst/tui.sh"' >> ~/.zshrc
  sleep 1 &
  wait
  # clear
  
  echo "bst is installed to your console"
  echo "please run 'source ~/.zshrc' first"
  echo "and then try run 'bst' in your zsh"
fi