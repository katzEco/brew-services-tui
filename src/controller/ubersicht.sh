#!/usr/bin/env bash

while [[ ! $uberOption =~ $[0]+$ ]]; do
  echo "==================================================="
  echo "              ${bold}${underline}Ubersicht Configuration${normal}"
  echo ""

  echo "1. Service start"
  echo "2. Service stop"
  echo "3. Services Restart"
  echo ""
  echo "0. Return to Home"

  echo ""
  echo "==================================================="

  read -p "Enter your option : " uberOption

  if [[ $uberOption =~ ^[1]+$ ]]; then
    clear
    open /Applications/Übersicht.app
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "                 Ubersicht Started"
    echo ""
    echo "==================================================="
  elif [[ $uberOption =~ ^[2]+$ ]]; then
    clear
    kill $(ps aux | grep "/Applications/Übersicht.app/Contents/MacOS/Übersicht" | awk '{print $2}')
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "                 Ubersicht Stopped"
    echo ""
    echo "==================================================="
  elif [[ $uberOption =~ ^[3]+$ ]]; then
    clear
    kill $(ps aux | grep "/Applications/Übersicht.app/Contents/MacOS/Übersicht" | awk '{print $2}')
    open /Applications/Übersicht.app
    sleep 3 &
    wait
    clear
    echo "==================================================="
    echo ""
    echo "                Ubersicht Restarted"
    echo ""
    echo "==================================================="
  elif [[ $uberOption =~ ^[0]+$ ]]; then
    clear
  else
    clear
    echo 'Unknown option!'
    sleep 2 &
    wait
    clear
  fi
done