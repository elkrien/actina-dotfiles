#!/bin/bash

status=$(nmcli g | grep -oE "disconnected")
essid=$(nmcli c | grep wlp5s0 | awk '{print ($1)}')

if [ $status ] ; then
    icon="睊"
    text=""
    col="#302D41"

else
    icon="直"
    text="${essid}"
    col="#DDB6F2"
fi



if [[ "$1" == "--COL" ]]; then
    echo $col	
elif [[ "$1" == "--ESSID" ]]; then
	echo $text
elif [[ "$1" == "--ICON" ]]; then
	echo $icon
fi

