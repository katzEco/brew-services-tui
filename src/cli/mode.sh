#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Error: No Command Found.."
  echo "Try Again Later.."
else
  if [[ $1 =~ ^[full]+$ || $1 =~ ^[f]+$ ]]; then
    brew services start sketchybar
    open /Applications/Übersicht.app
    clear
    sleep 1 &
    echo "Full Mode ON!"
    wait
  elif [[ $1 =~ ^[minimalx]+$ || $1 =~ ^[m]+$ ]]; then
    brew services stop sketchybar
    open /Applications/Übersicht.app
    clear
    sleep 1 &
    echo "MinimalX Mode ON!"
    wait
  elif [[ $1 =~ ^[performance]+$ || $1 =~ ^[p]+$ ]]; then
    brew services stop sketchybar
    kill $(ps aux | grep "/Applications/Übersicht.app/Contents/MacOS/Übersicht" | awk '{print $2}')
    clear
    sleep 1 &
    echo "Performance Mode ON!"
    wait
  else
    clear
    echo "Error: Argument Not Found.."
  fi
fi