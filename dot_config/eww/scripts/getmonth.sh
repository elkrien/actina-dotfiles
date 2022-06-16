#!/bin/bash
month_num=$(date "+%m")

if [ $month_num == "01" ]; then
	month="Styczeń"
elif [ $month_num == "02" ]; then
	month="Luty"
elif [ $month_num == "03" ]; then
	month="Marzec"
elif [ $month_num == "04" ]; then
	month="Kwiecień"
elif [ $month_num == "05" ]; then
	month="Maj"
elif [ $month_num == "06" ]; then
	month="Czerwiec"
elif [ $month_num == "07" ]; then
	month="Lipiec"
elif [ $month_num == "08" ]; then
	month="Sierpień"
elif [ $month_num == "09" ]; then
	month="Wrzesień"
elif [ $month_num == "10" ]; then
	month="Październik"
elif [ $month_num == "11" ]; then
	month="Listopad"
else
	month="Grudzień"
fi
echo $month;
