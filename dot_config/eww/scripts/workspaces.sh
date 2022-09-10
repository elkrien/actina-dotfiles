#!/bin/bash

nicknames=(        )
start=0

workspaces () {
	wmctrl -d | awk '{ print $1 " " $2 " " $9 }' | grep -v NSP | grep -v scratchpad | while read -r id active name; do
    	
		name="${name#*_}"
    	
		if [ "$active" == '*' ]; then
      		button_status="active"
          if wmctrl -l | grep --regexp '.*\s\+'"$id"'\s\+.*' >/dev/null; then
      		  button_fill="occupied"
      		  button_name="${nicknames[$start]}"
    	    else
      		  button_fill="empty"
      		  button_name="${nicknames[$start]}"
    	    fi
  	else
      		button_status="inactive"
    	    if wmctrl -l | grep --regexp '.*\s\+'"$id"'\s\+.*' | grep -v "Eww - bar" >/dev/null; then
      		  button_fill="occupied"
      		  button_name="${nicknames[$start]}"
    	    else
      		  button_fill="empty"
      		  button_name="·"
    	    fi
    fi
    	load+="(button :class '$button_status-$button_fill'  :onclick 'wmctrl -s $id' '$button_name')"
    
      	echo -n $load
      	load=""
		((start=start+1))
  	done
}

xprop -spy -root _NET_CURRENT_DESKTOP | while read -r; do
  	echo '(box :orientation "h" :class "workspaces" :space-evenly true :halign "start" :valign "center" :spacing 8 '"$(workspaces)"')'
done

# スパゲッティはもうありませんが、出力は長くなります :(
