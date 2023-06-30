#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Error: No Command Found.."
  echo "Try Again Later.."
else
  if [[ $1 =~ ^(start|s)$ ]]; then
    yabai --start-service
    echo $1
    # clear
    sleep 1
    echo "Yabai Service started!"
    wait
  elif [[ $1 =~ ^(stop|e)$ ]]; then
    yabai --stop-service
    # clear
    sleep 1
    echo "Yabai Service stopped!"
    wait
  elif [[ $1 =~ ^(restart|r)$ ]]; then
    yabai --restart-service
    # clear
    sleep 1
    echo "Yabai Service restarted!"
    wait
  else
    # clear
    echo "Error: Argument Not Found.."
  fi
fi
