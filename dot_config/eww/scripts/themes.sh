#!/bin/bash

# change Eww theme
sed -i "/@import/c@import \"catppuccin-$1.scss\"\;" ~/.config/eww/eww.scss
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/updates.sh
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/weather.sh
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/wifi.sh
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/lock.sh

# change dunst colors
rm ~/.config/dunst/dunstrc.d/cat*
cp ~/.scripts/themes/dunst/catppuccin-$1.conf ~/.config/dunst/dunstrc.d
if [[ $1 == "mocha" ]] 
then
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.scripts/icons/notification-display-brightness.svg
elif [[ $1 == "latte" ]] 
then
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.scripts/icons/notification-display-brightness.svg
elif [[ $1 == "frappe" ]]
then
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.scripts/icons/notification-display-brightness.svg
elif [[ $1 == "macchiato" ]]
then
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.scripts/icons/notification-display-brightness.svg
fi
killall dunst

# change LunarVim theme
sed -i "/catppuccin_flavour/cvim.g.catppuccin_flavour= \"$1\"" ~/.config/lvim/config.lua

# change Alacritty theme
sed -i "/colors: \*/ccolors: *Catppuccin-$1" ~/.config/alacritty/alacritty.yml

# change Kitty theme
sed -i "/include/cinclude\t\t\t\t\t\t\t\tcatppuccin-$1.conf" ~/.config/kitty/kitty.conf

# change rofi colors
sed -i "/@import/c@import \"colors-catppuccin-$1.rasi\"" ~/.config/rofi/*

# change micro colors
sed -i "/colorscheme/c\"colorscheme\"\: \"catppuccin-$1\"\," ~/.config/micro/settings.json

# change spotify-player theme
sed -i "/theme/ctheme \= \"Catppuccin-$1\"" ~/.config/spotify-player/app.toml

# change LeftWM borders colors
if [[ $1 == "mocha" ]] 
then
  sed -i "/focused/cfocused_border_color \= \"\#B4BEFE\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/floating/cfloating_border_color \= \"\#B4BEFE\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/default/cdefault_border_color \= \"\#313244\"" ~/.config/leftwm/themes/current/theme.toml
elif [[ $1 == "latte" ]] 
then
  sed -i "/focused/cfocused_border_color \= \"\#7287FD\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/floating/cfloating_border_color \= \"\#7287FD\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/default/cdefault_border_color \= \"\#CCD0DA\"" ~/.config/leftwm/themes/current/theme.toml
elif [[ $1 == "frappe" ]]
then
  sed -i "/focused/cfocused_border_color \= \"\#BABBF1\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/floating/cfloating_border_color \= \"\#BABBF1\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/default/cdefault_border_color \= \"\#414559\"" ~/.config/leftwm/themes/current/theme.toml
elif [[ $1 == "macchiato" ]]
then
sed -i "/focused/cfocused_border_color \= \"\#B7BDF8\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/floating/cfloating_border_color \= \"\#B7BDF8\"" ~/.config/leftwm/themes/current/theme.toml
  sed -i "/default/cdefault_border_color \= \"\#363A4F\"" ~/.config/leftwm/themes/current/theme.toml
fi
leftwm-command SoftReload

# change VSCode theme
if [[ $1 == "mocha" ]] 
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Mocha\"\," ~/.config/Code/User/settings.jsoned -i "/focused/cfocused_border_color \= \"\#B4BEFE\"" ~/.config/leftwm/themes/current/theme.toml
elif [[ $1 == "latte" ]] 
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Latte\"\," ~/.config/Code/User/settings.jsoned -i "/focused/cfocused_border_color \= \"\#B4BEFE\"" ~/.config/leftwm/themes/current/theme.toml
elif [[ $1 == "frappe" ]]
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Frappe\"\," ~/.config/Code/User/settings.jsoned -i "/focused/cfocused_border_color \= \"\#B4BEFE\"" ~/.config/leftwm/themes/current/theme.toml
elif [[ $1 == "macchiato" ]]
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Macchiato\"\," ~/.config/Code/User/settings.jsoned -i "/focused/cfocused_border_color \= \"\#B4BEFE\"" ~/.config/leftwm/themes/current/theme.toml
fi

# change zathura theme
sed -i "/catppuccin/cinclude catppuccin-$1" ~/.config/zathura/zathurarc

# change Fish theme
rm ~/.config/fish/conf.d/cat*
cp ~/.scripts/themes/fish/catppuccin-$1.fish ~/.config/fish/conf.d/
exec fish
