#!/usr/bin/env bash
# changeVolume

# Arbitrary but unique message id
msgId="991049"

# Check passed argument
vol="$(pamixer --get-volume)"
volume="$(($vol-1))"
#mute="$(pamixer --get-mute)"

## Change the volume using alsa(might differ if you use pulseaudio)
#        pactl set-sink-mute @DEFAULT_SINK@ toggle
case "$@" in
    "toggle") pactl set-sink-mute @DEFAULT_SINK@ toggle
            mute="$(pamixer --get-mute)"
            if [ $mute == "true" ]; then 
                dunstify -a "changeVolume" -u low -i "/home/mm/.config/qtile/icons/notification-audio-volume-muted.svg" -r "$msgId" -t 800 "  Dźwięk wyciszony  "
            else
                dunstify -a "changeVolume" -u low -i "/home/mm/.config/qtile/icons/notification-audio-volume-high.svg" -r "$msgId" -t 800 \
                -h int:value:"$volume" "  Głośność: ${volume}%  "
            fi
            ;;                        
    *)  pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ "$@"
        vol="$(pamixer --get-volume)"
        volume="$(($vol-1))"
        dunstify -a "changeVolume" -u low -i "/home/mm/.config/qtile/icons/notification-audio-volume-high.svg" -r "$msgId" -t 800 \
        -h int:value:"$volume" "  Głośność: ${volume}%   "
        ;;        
esac
