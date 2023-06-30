#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Error: No Command Found.."
  echo "Try Again Later.."
else
  if [[ $1 =~ ^[start]+$ || $1 =~ ^[s]+$ ]]; then
    brew services start sketchybar
    clear
    sleep 1 &
    echo "SketchyBar Service started!"
    wait
  elif [[ $1 =~ ^[stop]+$ || $1 =~ ^[e]+$ ]]; then
    brew services stop sketchybar
    clear
    sleep 1 &
    echo "SketchyBar Service stopped!"
    wait
  elif [[ $1 =~ ^[restart]+$ || $1 =~ ^[r]+$ ]]; then
    brew services stop sketchybar
    brew services start sketchybar
    clear
    sleep 1 &
    echo "SketchyBar Service restarted!"
    wait
  else
    clear
    echo "Error: Argument Not Found.."
  fi
fi