#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Error: No Command Found.."
  echo "Try Again Later.."
else
  if [[ $1 =~ ^(full|f)$ ]]; then
    brew services start sketchybar
    open -a "Übersicht"
    # clear
    sleep 1
    echo "Full Mode ON!"
  elif [[ $1 =~ ^(minimalx|m)$ ]]; then
    brew services stop sketchybar
    open -a "Übersicht"
    # clear
    sleep 1
    echo "MinimalX Mode ON!"
  elif [[ $1 =~ ^(performance|p)$ ]]; then
    brew services stop sketchybar
    pids=$(pgrep -f "/Applications/Übersicht.app/Contents/MacOS/Übersicht")
    kill $pids
    # clear
    sleep 1
    echo "Performance Mode ON!"
  else
    # clear
    echo "Error: Argument Not Found.."
  fi
fi
