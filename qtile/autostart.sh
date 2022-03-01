#!/usr/bin/env bash

# systray battery icon
# cbatticon -u 5 &

# systray volume
# volumeicon &

# picom
picom --experimental-backends --config ~/.config/picom/picom.conf &

# Network
# nm-applet &

# Keyboard Layout
setxkbmap pl &

# Wallpaper
nitrogen --restore &

# Notification deamon
dunst &

# Polkit agent
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Lockscreen
xidlehook \
	--not-when-fullscreen \
	--not-when-audio \
	--timer 600 \
		'$HOME/.config/qtile/scripts/lock.sh' \
		'' \
	--timer 300 \
		'systemctl suspend' \
		'' &
# /$HOME/.config/qtile/scripts/locker.sh &

# Touchpad tapping
# xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
