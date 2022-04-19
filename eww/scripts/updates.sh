#!/bin/bash

updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(paru -Qua 2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))

if [ $updates != 0 ] ; then
    icon=""
    text="${updates} updates"
    col="#F8BD96"

else
    icon=""
    text="No updates"
    col="#ABE9B3"
fi
#亂


if [[ "$1" == "--COL" ]]; then
    echo $col	
elif [[ "$1" == "--UPDATES" ]]; then
	echo $text
elif [[ "$1" == "--ICON" ]]; then
	echo $icon
fi
