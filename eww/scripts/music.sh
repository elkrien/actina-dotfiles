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
      leftwm-command "ToggleScratchPad spotify"
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


# #!/bin/bash
# # scripts by adi1090x

# ## Get data
# COVER="/tmp/music_cover.png"
# MUSIC_DIR="$HOME/Muzyka"

# ## Get status
# get_status() {
# 	if [[ "$(playerctl status)" == *"Playing"* ]]; then
# 		echo ""
# 	else
# 		echo "奈"
# 	fi
# }

# ## Get song
# get_song() {
# 	song=`playerctl metadata title`
# 	if [[ -z "$song" ]]; then
# 		echo "Offline"
# 	else
# 		echo "$song" | awk '{gsub("[(][^)]*[)]","")}1' | cut -c-30
# 	fi	
# }

# ## Get artist
# get_artist() {
# 	artist=`playerctl metadata artist`
# 	if [[ -z "$artist" ]]; then
# 		echo ""
# 	else
# 		echo "$artist"
# 	fi	
# }

# ## Get time
# get_time() {
# 	time=`mpc status | grep "%)" | awk '{print $4}' | tr -d '(%)'`
# 	if [[ -z "$time" ]]; then
# 		echo "0"
# 	else
# 		echo "$time"
# 	fi
# }
# get_ctime() {
# 	ctime=`mpc status | grep "#" | awk '{print $3}' | sed 's|/.*||g'`
# 	if [[ -z "$ctime" ]]; then
# 		echo "0:00"
# 	else
# 		echo "$ctime"
# 	fi	
# }
# get_ttime() {
# 	ttime=`mpc -f %time% current`
# 	if [[ -z "$ttime" ]]; then
# 		echo "0:00"
# 	else
# 		echo "$ttime"
# 	fi	
# }

# ## Get cover
# get_cover() {
# 	ffmpeg -i "$(playerctl metadata | grep 'image' | awk '{print $3}')" "${COVER}" -y &> /dev/null
# 	STATUS=$?

# 	# Check if the file has a embbeded album art
# 	if [ "$STATUS" -eq 0 ];then
# 		echo "$COVER"
# 	else
# 		echo "images/music.png"
# 	fi
# }

# ## Execute accordingly
# if [[ "$1" == "--song" ]]; then
#     get_song
#     # mpc idleloop | while read -r _; do
#     	# get_song
#     # done
# elif [[ "$1" == "--artist" ]]; then
# 	  get_artist
# elif [[ "$1" == "--status" ]]; then
#     get_status
#     # playerctl idleloop | while read -r _; do
#     	# get_status
#     # done
# elif [[ "$1" == "--time" ]]; then
# 	get_time
# elif [[ "$1" == "--ctime" ]]; then
# 	get_ctime
# elif [[ "$1" == "--ttime" ]]; then
# 	get_ttime
# elif [[ "$1" == "--cover" ]]; then
# 	get_cover
#     # mpc idleloop | while read -r _; do
# 	   #  get_cover
#     # done
# elif [[ "$1" == "--toggle" ]]; then
# 	playerctl play-pause
# elif [[ "$1" == "--next" ]]; then
# 	{ playerctl next; get_cover; }
# elif [[ "$1" == "--prev" ]]; then
# 	{ playerctl previous; get_cover; }
# fi
