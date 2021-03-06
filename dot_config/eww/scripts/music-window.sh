#!/bin/bash

title=$(playerctl metadata title)
album=$(playerctl metadata album)
artist=$(playerctl metadata artist)
albumart=$(playerctl metadata | grep artUrl | awk '{print $3}')
status=$(playerctl status)
if [[ $status == "Playing" ]] 
then
    toggleplay=""
elif [[ $status == "Paused" ]] 
then
    toggleplay="契"
fi
artimg="(box :class \"artimg\" :style \"background-image: url(\\\"$albumart\\\")\")"
musicinfobox="(box :class \"musicinfo\" :orientation \"v\" :halign \"center\" (label :style \"font-size: large; font-weight: 500;\" :text \"$title\")(label :style \"font-size: normal\" :text \"$artist\")(label :style \"font-size: small\" :text \"\'$album\'\"))"
buttons="(eventbox :cursor \"hand\" (box :class \"buttons\" :space-evenly false :spacing 20 :halign \"center\" (button :halign \"center\" :onclick \"playerctl previous\" \"玲\")(button :halign \"center\" :onclick \"playerctl play-pause\" \"$toggleplay\")(button :halign \"center\" :onclick \"playerctl next\" \"怜\")))"
echo "(box :space-evenly false :orientation \"h\" :spacing 20 $artimg (box :space-evenly false :spacing 20 :orientation \"v\" $musicinfobox $buttons))"
