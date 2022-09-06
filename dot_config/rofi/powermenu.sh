#!/usr/bin/env bash

THEME="$HOME/.config/rofi/powermenu.rasi"

rofi_command="rofi -no-config -theme $THEME"

# Options
shutdown=" ⏻   Wyłącz"
reboot="    Uruchom ponownie"
lock="    Zablokuj"
suspend="    Wstrzymaj"
logout="    Wyloguj"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
		  systemctl reboot
        ;;
    $lock)
		  exec $HOME/.config/qtile/scripts/lock.sh
        ;;
    $suspend)
		  systemctl suspend
        ;;
    $logout)
      pkill -f qtile
        ;;
esac
