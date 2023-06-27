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

brewServices() {
  # brew services list | grep yabai | awk '{ print $2}'
  echo "==================================================="
  echo "           ${bold}${underline}Homebrew Services Status List${normal}"
  echo ""
  
  if [[ $yabaiStatus =~ ^[1]+$ ]]; then 
    echo "Yabai : $(brew services list | grep yabai | awk '{ print $2}')"
  fi

  if [[ $skbStatus =~ ^[1]+$ ]]; then
    echo "SketchyBar : $(brew services list | grep sketchybar | awk '{ print $2}')"
  fi

  if [[ $yabaiStatus =~ ^[0]+$ && $skbStatus =~ ^[0]+$ ]]; then
    echo "No Services installed.."
  fi

  echo ""
  echo "==================================================="
}

yabaiServices() {
  while [[ ! $yabaiOption =~ ^[0]+$ ]]; do
    echo "==================================================="
    echo "                ${bold}${underline}Yabai Configuration${normal}"
    echo "Yabai Status: $(brew services list | grep yabai | awk '{ print $2}')"

    if [[brew services list | grep yabai | awk '{ print $2}' == 'started']]; then
      echo "1. Service start"
      echo "${bold}2. Service stop"
    else
      echo "${bold}1. Service start"
      echo "2. Service stop"
    fi

    echo "3. Services Restart"
    echo "0. Return to Home"

    echo ""
    echo "==================================================="

    read -p "Enter your option : " yabaiOption

    if [[ $yabaiOption =~ ^[1]+$ ]]; then
      clear
      echo "==================================================="
      echo ""
      brew services start yabai
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
      brew services stop yabai
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
      brew services stop yabai
      brew services start yabai
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
}

skbServices() {
  while [[ ! $skbOption =~ ^[0]+$ ]]; do
    echo "==================================================="
    echo "             ${bold}${underline}SketchyBar  Configuration${normal}"
    echo "Yabai Status: $(brew services list | grep yabai | awk '{ print $2}')"

    if [[brew services list | grep sketchybar | awk '{ print $2}' == 'started']]; then
      echo "1. Service start"
      echo "${bold}2. Service stop"
    else
      echo "${bold}1. Service start"
      echo "2. Service stop"
    fi

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
}

while [[ ! $options =~ ^[4]+$ ]]; do
  echo "==================================================="
  echo "          ${bold}${underline}Homebrew Services Configuration${normal}"
  echo ""

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

  if [[ $yabaiStatus =~ ^[1]+$ && $skbStatus =~ ^[1]+$ ]]; then
    echo '3. Homebrew services status'
  else
    echo '3. Homebrew services status (unavailable)'
  fi
  
  echo '4. Exit'
  echo ""
  echo "==================================================="

  read -p "Enter your option : " options

  if [[ $options =~ ^[1]+$ ]]; then
    clear
    echo "$(yabaiServices)"
  elif [[ $options =~ ^[2]+$ ]]; then
    clear
    echo "$(skbServices)"
  elif [[ $options =~ ^[3]+$ ]]; then
    clear
    echo "$(brewServices)"
  elif [[ $options =~ ^[4]+$ ]]; then
    echo ''
    clear
  else
    clear
    echo 'Unknown option!'
    sleep 5 &
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