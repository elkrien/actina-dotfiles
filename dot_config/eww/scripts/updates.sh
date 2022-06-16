#!/bin/bash

source ~/.config/eww/scripts/catppuccin-mocha.sh

updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(paru -Qua 2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))

if [ $updates != 0 ] ; then
    col="${peach}"
    if [ $updates == 1 ] ; then
        text="${updates} update"
    else
        text="${updates} updates"
    fi
else
    text="No updates"
    col="${green}"
fi

echo "{\"content\": \"$text\", \"color\": \"$col\"}"
