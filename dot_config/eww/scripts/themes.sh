#!/bin/bash

# change Eww theme
sed -i "/@import/c@import \"catppuccin-$1.scss\"\;" ~/.config/eww/eww.scss
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/updates.sh
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/weather.sh
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/wifi.sh
sed -i "/source/csource ~\/.config\/eww\/scripts\/catppuccin-$1.sh" ~/.config/eww/scripts/lock.sh

# change dunst colors
rm ~/.config/dunst/dunstrc.d/cat*
cp ~/.config/eww/scripts/themes/dunst/catppuccin-$1.conf ~/.config/dunst/dunstrc.d
if [[ $1 == "mocha" ]] 
then
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.config/eww/scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.config/eww/scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.config/eww/scripts/icons/notification-display-brightness.svg
  sed -i "/stroke=/cstroke\=\"\#CDD6F4\"" ~/.config/eww/scripts/icons/updates.svg
elif [[ $1 == "latte" ]] 
then
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.config/eww/scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.config/eww/scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.config/eww/scripts/icons/notification-display-brightness.svg
  sed -i "/stroke=/cstroke\=\"\#4C4F69\"" ~/.config/eww/scripts/icons/updates.svg
elif [[ $1 == "frappe" ]]
then
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.config/eww/scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.config/eww/scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.config/eww/scripts/icons/notification-display-brightness.svg
  sed -i "/stroke=/cstroke\=\"\#C6D0F5\"" ~/.config/eww/scripts/icons/updates.svg
elif [[ $1 == "macchiato" ]]
then
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.config/eww/scripts/icons/notification-audio-volume-high.svg
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.config/eww/scripts/icons/notification-audio-volume-muted.svg
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.config/eww/scripts/icons/notification-display-brightness.svg
  sed -i "/stroke=/cstroke\=\"\#CAD3F5\"" ~/.config/eww/scripts/icons/updates.svg
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

# change Window Manager colors
wm=$(wmctrl -m | grep Name | awk '{ print $2 }')
if [[ "$wm" == 'Qtile' ]]; then
  sed -i "/theme/c\  \"theme\": \"catppuccin-$1\"" ~/.config/qtile/config.json
else
  if [[ $1 == "mocha" ]] 
  then
    sed -i "/focused/c\  focused_border_color: \"\#B4BEFE\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/floating/c\  floating_border_color: \"\#B4BEFE\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/default/c\  default_border_color: \"\#313244\"\," ~/.config/leftwm/themes/current/theme.ron
  elif [[ $1 == "latte" ]] 
  then
    sed -i "/focused/c\  focused_border_color: \"\#7287FD\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/floating/c\  floating_border_color: \"\#7287FD\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/default/c\  default_border_color: \"\#CCD0DA\"\," ~/.config/leftwm/themes/current/theme.ron
  elif [[ $1 == "frappe" ]]
  then
    sed -i "/focused/c\  focused_border_color: \"\#BABBF1\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/floating/c\  floating_border_color: \"\#BABBF1\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/default/c\  default_border_color: \"\#414559\"\," ~/.config/leftwm/themes/current/theme.ron
  elif [[ $1 == "macchiato" ]]
  then
    sed -i "/focused/c\  focused_border_color: \"\#B7BDF8\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/floating/c\  floating_border_color: \"\#B7BDF8\"\," ~/.config/leftwm/themes/current/theme.ron
    sed -i "/default/c\  default_border_color: \"\#363A4F\"\," ~/.config/leftwm/themes/current/theme.ron
  fi
fi

# change VSCode theme
if [[ $1 == "mocha" ]] 
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Mocha\"\," ~/.config/Code/User/settings.json
elif [[ $1 == "latte" ]] 
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Latte\"\," ~/.config/Code/User/settings.json
elif [[ $1 == "frappe" ]]
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Frappe\"\," ~/.config/Code/User/settings.json
elif [[ $1 == "macchiato" ]]
then
  sed -i "/colorTheme/c\  \"workbench.colorTheme\"\: \"Catppuccin Macchiato\"\," ~/.config/Code/User/settings.json
fi

# change zathura theme
sed -i "/catppuccin/cinclude catppuccin-$1" ~/.config/zathura/zathurarc

# change pyradio theme
sed -i "/theme =/ctheme = catppuccin-$1" ~/.config/pyradio/config

# change keys window theme
sed -i "/path=/cpath=~\/.config\/eww\/scripts\/themes\/keys\/keys-$1.png" ~/.config/eww/scripts/keys.sh

#change gtk theme and cursors
if [[ $1 == "mocha" ]] 
then
  sed -i "/gtk-theme-name/cgtk-theme-name=Catppuccin-Mocha-Lavender" ~/.config/gtk-3.0/settings.ini
  sed -i "/gtk-cursor-theme-name/cgtk-cursor-theme-name=Catppuccin-Mocha-Lavender-Cursors" ~/.config/gtk-3.0/settings.ini
elif [[ $1 == "latte" ]] 
then
  sed -i "/gtk-theme-name/cgtk-theme-name=Catppuccin-Latte-Lavender" ~/.config/gtk-3.0/settings.ini
  sed -i "/gtk-cursor-theme-name/cgtk-cursor-theme-name=Catppuccin-Latte-Lavender-Cursors" ~/.config/gtk-3.0/settings.ini
elif [[ $1 == "frappe" ]]
then
  sed -i "/gtk-theme-name/cgtk-theme-name=Catppuccin-Frappe" ~/.config/gtk-3.0/settings.ini
  sed -i "/gtk-cursor-theme-name/cgtk-cursor-theme-name=Catppuccin-Frappe-Lavender-Cursors" ~/.config/gtk-3.0/settings.ini
elif [[ $1 == "macchiato" ]]
then
  sed -i "/gtk-theme-name/cgtk-theme-name=Catppuccin-Macchiato" ~/.config/gtk-3.0/settings.ini
  sed -i "/gtk-cursor-theme-name/cgtk-cursor-theme-name=Catppuccin-Macchiato-Lavender-Cursors" ~/.config/gtk-3.0/settings.ini
fi


# change Fish theme
rm ~/.config/fish/conf.d/cat*
cp ~/.config/eww/scripts/themes/fish/catppuccin-$1.fish ~/.config/fish/conf.d/

# restart window manager and fish
eww close themes-window
if [[ "$wm" == 'Qtile' ]]; then
  qtile cmd-obj -o cmd -f restart && exec fish
else
  leftwm-command SoftReload && exec fish
fi
