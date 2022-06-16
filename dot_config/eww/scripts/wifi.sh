#!/bin/bash

source ~/.config/eww/scripts/catppuccin-mocha.sh

status=$(nmcli g | grep -oE "rozłączono")
essid=$(nmcli c | grep wlp5s0 | awk '{print ($1)}')

if [ $status ] ; then
    icon="睊"
    text=""
    col="${black3}"
else
    icon="直"
    text="${essid}"
    col="${mauve}"
fi

echo "{\"content\": \"$text\", \"icon\": \"$icon\", \"color\": \"$col\"}"

# if [[ "$1" == "--COL" ]]; then
#     echo $col	
# elif [[ "$1" == "--ESSID" ]]; then
# 	echo $text
# elif [[ "$1" == "--ICON" ]]; then
# 	echo $icon
# fi


