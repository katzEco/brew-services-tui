#!/usr/bin/env bash

while [[ ! $skbOption =~ $[0]+$ ]]; do
  echo "==================================================="
  echo "             ${bold}${underline}SketchyBar  Configuration${normal}"
  echo ""
  echo "SketchyBar Status: $(brew services list | grep sketchybar | awk '{ print $2}')"
  echo ""

  echo "1. Service start"
  echo "2. Service stop"
  echo "3. Services Restart"
  echo "0. Return to Home"

  echo ""
  echo "==================================================="

  read -p "Enter your option : " skbOption

  if [[ $skbOption =~ ^[1]+$ ]]; then
    clear
    echo "==================================================="
    echo ""
    brew services start sketchybar
    echo ""
    echo "==================================================="
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "SketchyBar Services Started"
    echo ""
    echo "==================================================="
  elif [[ $skbOption =~ ^[2]+$ ]]; then
    clear
    echo "==================================================="
    echo ""
    brew services stop sketchybar
    echo ""
    echo "==================================================="
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "SketchyBar Services Stopped"
    echo ""
    echo "==================================================="
  elif [[ $skbOption =~ ^[3]+$ ]]; then
    clear
    echo "==================================================="
    echo ""
    brew services stop sketchybar
    brew services start sketchybar
    echo ""
    echo "==================================================="
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "SketchyBar Services Restarted"
    echo ""
    echo "==================================================="
  elif [[ $skbOption =~ ^[0]+$ ]]; then
    clear
  else
    clear
    echo 'Unknown option!'
    sleep 5 &
    wait
    clear
  fi
done