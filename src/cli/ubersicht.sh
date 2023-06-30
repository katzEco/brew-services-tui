#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Error: No Command Found.."
  echo "Try Again Later.."
else
  if [[ $1 =~ ^[start]+$ || $1 =~ ^[s]+$ ]]; then
    open /Applications/Übersicht.app
    clear
    sleep 1 &
    echo "Übersicht Service started!"
    wait
  elif [[ $1 =~ ^[stop]+$ || $1 =~ ^[e]+$ ]]; then
    kill $(ps aux | grep "/Applications/Übersicht.app/Contents/MacOS/Übersicht" | awk '{print $2}')
    clear
    sleep 1 &
    echo "Übersicht Service stopped!"
    wait
  elif [[ $1 =~ ^[restart]+$ || $1 =~ ^[r]+$ ]]; then
    kill $(ps aux | grep "/Applications/Übersicht.app/Contents/MacOS/Übersicht" | awk '{print $2}')
    open /Applications/Übersicht.app
    clear
    sleep 1 &
    echo "Übersicht Service restarted!"
    wait
  else
    clear
    echo "Error: Argument Not Found.."
  fi
fi