#!/usr/bin/env bash

BG='#282a36'  # bg 
BGD='#22212c' # bgdark
FG='#f8f8f2'  # fg
OR='#FFCA80'  # orange 
GR='#8aFF80'  # green
CY='#80ffea'  # cyan
YE='#ffff80'  # yellow
PI='#ff80bf'  # pink
RE='#ff5555'  # red 
PU='#bd93f9'  # purple
DPU='#bd93f9' # dark purple

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
