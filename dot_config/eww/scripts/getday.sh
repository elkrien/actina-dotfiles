#!/bin/bash
day_num=$(date "+%u")

if [ $day_num == 1 ]; then
	day="Poniedziałek"
elif [ $day_num == 2 ]; then
	day="Wtorek"
elif [ $day_num == 3 ]; then
	day="Środa"
elif [ $day_num == 4 ]; then
	day="Czwartek"
elif [ $day_num == 5 ]; then
	day="Piątek"
elif [ $day_num == 6 ]; then
	day="Sobota"
else
	day="Niedziela"
fi
echo $day;
