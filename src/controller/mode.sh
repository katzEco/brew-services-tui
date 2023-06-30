#!/usr/bin/env bash

while [[ ! $modeOption =~ $[0]+$ ]]; do
  echo "==================================================="
  echo "             ${bold}${underline}SketchyBar  Configuration${normal}"
  echo ""

  echo "1. Full Mode"
  echo "2. MinimalX Mode"
  echo "3. Need Performance Mode"
  echo ""
  echo "0. Return to Home"

  echo ""
  echo "==================================================="

  read -p "Enter your option : " modeOption

  if [[ $modeOption =~ ^[1]+$ ]]; then
    clear
    brew services start sketchybar
    open /Applications/Übersicht.app
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "                 Full Mode Started"
    echo ""
    echo "==================================================="
  elif [[ $modeOption =~ ^[2]+$ ]]; then
    clear
    brew services stop sketchybar
    open /Applications/Übersicht.app
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "               MinimalX Mode Started"
    echo ""
    echo "==================================================="
  elif [[ $modeOption =~ ^[3]+$ ]]; then
    clear
    brew services stop sketchybar
    kill $(ps aux | grep "/Applications/Übersicht.app/Contents/MacOS/Übersicht" | awk '{print $2}')
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "                Performance Mode On"
    echo ""
    echo "==================================================="
  elif [[ $modeOption =~ ^[0]+$ ]]; then
    clear
  else
    clear
    echo 'Unknown option!'
    sleep 3 &
    wait
    clear
  fi
done