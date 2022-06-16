#!/usr/bin/env bash

# exec xautolock -detectsleep -time 10 -locker "$HOME/.config/qtile/scripts/lock.sh" -notify 30 -notifier "dunstify -u critical -t 5000 -- 'Ekran zostanie zablokowany za 30 sekund...'" &
# exec xidlehook --not-when-fullscreen --timer 1200 "systemclt suspend" -

xidlehook \
	--not-when-fullscreen \
	--not-when-audio \
	--timer 600 \
		'$HOME/.config/qtile/scripts/lock.sh' \
		'' \
	--timer 300 \
		'systemctl suspend' \
		''
