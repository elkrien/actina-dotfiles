#!/usr/bin/env bash

BG='#302D41'  # bg 
BGD='#1E1E2E' # bgdark
FG='#D9E0EE'  # fg
OR='#F8BD96'  # orange 
GR='#ABE9B3'  # green
CY='#B5E8E0'  # cyan
YE='#FAE3B0'  # yellow
PI='#F5C2E7'  # pink
RE='#F28FAD'  # red 
PU='#96CDFB'  # blue
DPU='#96CDFB' # blue

i3lock \
-e                      \
-n \
--insidever-color=$BGD   \
--insidewrong-color=$BGD  \
--inside-color=$BGD       \
--ringver-color=$DPU     \
--ringwrong-color=$RE    \
--ring-color=$PU         \
--line-color=$BGD         \
--keyhl-color=$GR        \
--bshl-color=$YE         \
--separator-color=$PU    \
--verif-color=$FG       \
--wrong-color=$RE        \
--layout-color=$FG       \
--time-color=$FG         \
--date-color=$FG         \
--greeter-color=$PU      \
\
--time-str="%H:%M:%S"    \
--date-str="%d-%m-%Y"  \
--time-size=40 \
--date-size=15 \
--wrong-text="Złe hasło!"     \
--verif-text="Sprawdzam..."  \
--greeter-text="Wpisz hasło aby odblokować" \
--noinput-text="Wpisz coś..."  \
\
--wrong-font=JetBrainsMonoMedium Nerd Font     \
--verif-font=JetBrainsMonoMedium Nerd Font     \
--layout-font=JetBrainsMonoMedium Nerd Font    \
--time-font=JetBrainsMonoMedium Nerd Font      \
--greeter-font=JetBrainsMonoMedium Nerd Font   \
--date-font=JetBrainsMonoMedium Nerd Font      \
\
--radius 120            \
--ring-width 10.0 \
--blur 5                \
--clock                 \
--indicator             \
# --screen 1              \
#--keylayout 2         \
#\
# etc
