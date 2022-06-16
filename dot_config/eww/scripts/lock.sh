#!/usr/bin/env bash

source ~/.config/eww/scripts/catppuccin-mocha.sh

i3lock \
-e                      \
-n \
--insidever-color=$base   \
--insidewrong-color=$base  \
--inside-color=$base       \
--ringver-color=$lavender     \
--ringwrong-color=$red    \
--ring-color=$lavender         \
--line-color=$base         \
--keyhl-color=$green        \
--bshl-color=$yellow         \
--separator-color=$lavender    \
--verif-color=$white       \
--wrong-color=$red        \
--layout-color=$white       \
--time-color=$white         \
--date-color=$white         \
--greeter-color=$lavender      \
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
