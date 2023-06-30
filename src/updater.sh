#!/usr/bin/env bash

read -p "Do you want to install this package? [y/N] : " option

if [[ $option =~ ^[y]+$ || $option =~ ^[Y]+$ ]]; then
  cd ~/.config/.bst
  rm -rf *
  git clone https://github.com/katzEco/brew-services-tui
  cd brew-services-tui/src
  mv * ~/.config/.bst
  cd ~/.config/.bst
  rm -rf brew-services-tui
  rm installer.sh
  rm README.md
  
  echo "bst is up to dated"
  echo "having fun :)"
fi