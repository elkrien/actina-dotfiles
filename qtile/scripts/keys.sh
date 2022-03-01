#!/usr/bin/env bash

cat ~/.config/qtile/settings/keys.py | \
  rg '\# ' | \
  rg -v '\# Qtile keybindings' | \
  sd -s 'Key("' '' | \
  sd 'M-' 'Mod + ' | \
  sd 'S-' 'Shift + ' | \
  sd 'C-' 'Control + ' | \
  sd 'A-' 'Alt + ' | \
  sd -s '<' '' | \
  sd -s '>' '' | \
  sd 'XF86MonBrightnessUp' '  +' | \
  sd 'XF86MonBrightnessDown' '  -' | \
  sd 'Left' '' | \
  sd 'Right' '' | \
  sd 'Up' '' | \
  sd 'Down' '' | \
  sd 'space' 'Space' | \
  sd 'XF86AudioLowerVolume' '-' | \
  sd 'XF86AudioRaiseVolume' '+' | \
  sd 'XF86AudioMute' '' | \
  sed -e 's/^[ \t]*//' | \
  sed 's/\".*\#/  --- /g' | \
  sd '\# ' '\n' | \
  awk NR\>1 | \
  rofi -dmenu -i -theme "~/.config/rofi/keybindings.rasi" -p "Qtile keybindings:"
