#!/usr/bin/env bash

# picom
picom --experimental-backends --config ~/.config/picom/picom.conf &

# start eww daemon
sed -i "/include/c\(include \"\.\/workspaces-qtile.yuck\")" ~/.config/eww/eww.yuck
eww daemon &

# get weather for eww widget
/home/mm/.config/eww/scripts/weather.sh

# Keyboard Layout
setxkbmap pl &

# set background
# nitrogen --restore
nitrogen --set-scaled --random ~/Obrazy/Illustrators/ &

# Notification deamon
dunst &

# Polkit agent
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Lockscreen
xidlehook \
	--not-when-fullscreen \
	--not-when-audio \
	--timer 600 \
		'$HOME/.config/eww/scripts/lock.sh' \
		'' \
	--timer 300 \
		'systemctl suspend' \
		'' &

#open eww 'bar' windows
eww open bar

# # set touchpad (for Lenovo laptop)
# xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1


