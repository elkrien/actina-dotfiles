#!/bin/bash
 
updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(paru -Qua 2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))
echo  "$updates"
