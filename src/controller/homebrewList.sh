# !/usr/bin/bash

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