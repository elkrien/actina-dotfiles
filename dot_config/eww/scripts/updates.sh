#!/bin/bash

source ~/.config/eww/scripts/catppuccin-mocha.sh

updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(paru -Qua 2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))

if [ $updates != 0 ] ; then
  col="${peach}"
  if [ $updates == 1 ] ; then
    text="${updates} aktualizacja"
  elif (($updates > 1)) && (($updates < 5)) ; then
    text="${updates} aktualizacje"
  else
    text="${updates} aktualizacji"
  fi
else
  text="System aktualny"
  col="${green}"
fi

echo "{\"content\": \"$text\", \"color\": \"$col\"}"
