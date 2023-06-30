#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Error: No Command Found.."
  echo "Try Again Later.."
else
  if [[ $1 =~ ^[start]+$ || $1 =~ ^[s]+$ ]]; then
    yabai --start-service
    clear
    sleep 1 &
    echo "Yabai Service started!"
    wait
  elif [[ $1 =~ ^[stop]+$ || $1 =~ ^[e]+$ ]]; then
    yabai --stop-service
    clear
    sleep 1 &
    echo "Yabai Service stopped!"
    wait
  elif [[ $1 =~ ^[restart]+$ || $1 =~ ^[r]+$ ]]; then
    yabai --restart-service
    clear
    sleep 1 &
    echo "Yabai Service restarted!"
    wait
  else
    clear
    echo "Error: Argument Not Found.."
  fi
fi