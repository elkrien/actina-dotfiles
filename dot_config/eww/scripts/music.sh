#!/bin/bash

get_icon() {
	if [[ "$(playerctl status)" == "Playing" ]]; then
		echo ""
	else
		if [[ "$(playerctl status)" == "Paused" ]]; then
      echo "奈"
    else
      echo ""
	  fi
  fi
}

get_title() {
  if [[ "$(playerctl status)" == "Playing" ]]; then
    echo "$(playerctl metadata title)"
	else
		if [[ "$(playerctl status)" == "Paused" ]]; then
      echo "$(playerctl metadata title)"
    else
      echo ""
	  fi
  fi
}

toggle_music() {
	if [[ "$(playerctl status)" == "Playing" ]]; then
		playerctl play-pause 2>&1
	else
		if [[ "$(playerctl status)" == "Paused" ]]; then
      playerctl play-pause 2>&1
    else
      wm=$(wmctrl -m | grep Name | awk '{ print $2 }')
      if [[ "$wm" == 'Qtile' ]]; then
        qtile cmd-obj -o group scratchpad -f dropdown_toggle -a 'spotify'
      else
        leftwm-command "ToggleScratchPad spotify"
      fi
	  fi
  fi
}

if [[ $1 == "get-audio" ]]; then
  playerctl metadata --format "{{ artist }}: {{ title }}" 2>&1
elif [[ $1 == "get-icon" ]]; then
  get_icon
elif [[ $1 == "toggle-widget" ]]; then
  eww open --toggle music-window 2>&1
elif [[ $1 == "get-title" ]]; then
  get_title
elif [[ $1 == "toggle-music" ]]; then
  toggle_music
fi
