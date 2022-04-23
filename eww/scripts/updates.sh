#!/bin/bash

updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(paru -Qua 2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))

if [ $updates != 0 ] ; then
    col="#F8BD96"
    if [ $updates == 1 ] ; then
        text="${updates} update"
    else
        text="${updates} updates"
    fi
else
    text="No updates"
    col="#ABE9B3"
fi

echo "{\"content\": \"$text\", \"color\": \"$col\"}"
