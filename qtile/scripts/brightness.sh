#!/usr/bin/env bash

# Arbitrary but unique message id
msgId="991048"

# Change brightness
brightnessctl set "$@"

# Get brightness value
# brightness=$(xbacklight -get | sed 's/[.].*//g')
getbright=$(brightnessctl get)
brightness=$((getbright / 60))

# Send notification
dunstify -a "changeBrightness" -u low -i "/home/mm/.config/qtile/icons/notification-display-brightness.svg" -r "$msgId" -t 800 \
-h int:value:"$brightness" "  Jasność: ${brightness}% "

