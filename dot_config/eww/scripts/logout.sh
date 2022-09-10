#!/bin/sh

wm=$(wmctrl -m | grep Name | awk '{ print $2 }')

if [[ "$wm" == 'Qtile' ]]; then
  pkill -f qtile
else
  pkill -f leftwm
fi

