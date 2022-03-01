#!/usr/bin/env bash

info=$(nmcli -f NAME connection show --active | tail -1)

if [ -z "$info" ]; then 
    notify-send -i "/home/mm/.config/qtile/icons/wifi-off.svg" " Brak połączenia! "
else
    notify-send -i "/home/mm/.config/qtile/icons/wifi.svg" "  $info"
fi
