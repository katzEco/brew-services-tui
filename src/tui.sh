#!/usr/bin/env bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

clear
echo "Services checking."
sleep 1 &
wait
clear

echo "Services checking.."
sleep 1 &
wait
clear

echo "Services checking..."

if brew ls --versions yabai > /dev/null; then
  yabaiStatus=1
else
  yabaiStatus=0
fi

if brew ls --versions sketchybar > /dev/null; then
  skbStatus=1
else
  skbStatus=0
fi

sleep 2 &
wait
clear

while [[ ! $option =~ ^[0]+$ ]]; do
  echo "==================================================="
  echo "          ${bold}${underline}Homebrew Services Configuration${normal}"
  echo ""

  echo '1. Yabai'

  if [[ $skbStatus =~ ^[1]+$ ]]; then
    echo '2. SketchyBar'
  else
    echo '2. SketchyBar (unavailable)'
  fi

  echo "3. Ubersicht"

  if [[ $yabaiStatus =~ ^[1]+$ && $skbStatus =~ ^[1]+$ ]]; then
    echo '4. Homebrew services status'
  else
    echo '4. Homebrew services status (unavailable)'
  fi

  echo "5. Mode Presets"

  echo ""
  
  echo '0. Exit'
  echo ""
  echo "==================================================="

  read -p "Enter your option : " option

  if [[ $option =~ ^[1]+$ ]]; then
    clear
    # source ./controller/yabaiControl.sh
    source ~/.config/.bst/controller/yabaiControl.sh
  elif [[ $option =~ ^[2]+$ ]]; then
    clear
    # source ./controller/sketchybarControl.sh
    source ~/.config/.bst/controller/sketchybarControl.sh
  elif [[ $option =~ ^[3]+$ ]]; then
    clear
    # source ./controller/ubersicht.sh
    source ~/.config/.bst/controller/ubersicht.sh
  elif [[ $option =~ ^[4]+$ ]]; then
    clear
    # source ./controller/homebrewList.sh
    source ~/.config/.bst/controller/homebrewList.sh
  elif [[ $option =~ ^[5]+$ ]]; then
    clear
    # source ./controller/mode.sh
    source ~/.config/.bst/controller/mode.sh
  elif [[ $option =~ ^[0]+$ ]]; then
    echo ''
    clear
  else
    echo 'Unknown option!'
    sleep 3 &
    wait
    clear
  fi
done

echo "Service shutting down."
sleep 1 &
wait
clear

echo "Service shutting down.."
sleep 1 &
wait
clear

echo "Service shutting down..."
sleep 2 &
wait
clear