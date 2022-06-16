#!/usr/bin/env bash

STAT=$(acpi)
#STATUS=$(cat /sys/class/power_supply/BAT1/status)
#BATT=$(cat /sys/class/power_supply/BAT1/capacity)
#echo "$STATUS:" "$BATT%"
#notify-send "$STATUS: $BATT%"
notify-send -i "/home/mm/.config/qtile/icons/battery.svg" "$STAT"

