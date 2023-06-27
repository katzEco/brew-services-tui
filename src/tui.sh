# !/usr/bin/zsh

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

while [[ ! $options =~ ^[4]+$ ]]; do
  echo "==================================================="
  echo "          ${bold}${underline}Homebrew Services Configuration${normal}"

  if [[ $yabaiStatus =~ ^[1]+$ ]]; then
    echo '1. Yabai'
  else
    echo '1. Yabai (unavailable)'
  fi

  if [[ $skbStatus =~ ^[1]+$ ]]; then
    echo '2. SketchyBar'
  else
    echo '2. SketchyBar (unavailable)'
  fi

  echo '3. Brew services status'

  echo '4. Exit'

  echo "==================================================="

  read -p "Enter Your Config : " options
  echo "${options}"

  if [[ $options =~ ^[1]+$ ]]; then
    echo '1'
  elif [[ $options =~ ^[2]+$ ]]; then
    echo '2'
  elif [[ $options =~ ^[3]+$ ]]; then
    echo '3'
  elif [[ $options =~ ^[4]+$ ]]; then
    echo ''
    clear
  else
    # clear
    echo 'Unknown option!'
    sleep 5 &
    wait
    # clear
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

# brew services list | grep yabai | awk '{ print $2}'