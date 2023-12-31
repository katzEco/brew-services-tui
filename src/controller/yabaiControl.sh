#!/usr/bin/env bash

while [[ ! $yabaiOption =~ ^[0]+$ ]]; do
  echo "==================================================="
  echo "                ${bold}${underline}Yabai Configuration${normal}"
  echo ""
  echo "Yabai Status: $(brew services list | grep yabai | awk '{ print $2}')"
  echo ""

  echo "1. Service start"  
  echo "2. Service stop"
  echo "3. Services Restart"
  echo ""
  echo "0. Return to Home"

  echo ""
  echo "==================================================="

  read -p "Enter your option : " yabaiOption

  if [[ $yabaiOption =~ ^[1]+$ ]]; then
    clear
    echo "==================================================="
    echo ""
    yabai --start-service
    echo ""
    echo "==================================================="
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "Yabai Services Started"
    echo ""
    echo "==================================================="
  elif [[ $yabaiOption =~ ^[2]+$ ]]; then
    clear
    echo "==================================================="
    echo ""
    yabai --stop-service
    echo ""
    echo "==================================================="
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "Yabai Services Stopped"
    echo ""
    echo "==================================================="
  elif [[ $yabaiOption =~ ^[3]+$ ]]; then
    clear
    echo "==================================================="
    echo ""
    yabai --restart-service
    echo ""
    echo "==================================================="
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "Yabai Services Restarted"
    echo ""
    echo "==================================================="
  elif [[ $yabaiOption =~ ^[0]+$ ]]; then
    clear
  else
    clear
    echo 'Unknown option!'
    sleep 5 &
    wait
    clear
  fi
done