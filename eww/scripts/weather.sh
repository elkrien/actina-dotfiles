#!/bin/bash

tmp_weather="/tmp/weather"
tmp_weather_stat=$tmp_weather/weather-stat
tmp_weather_degree=$tmp_weather/weather-degree
tmp_weather_hex=$tmp_weather/weather-hex
tmp_weather_icon=$tmp_weather/weather-icon

if [ ! -d $tmp_weather ]; then
        mkdir -p $tmp_weather
fi

# Put in your api and stuff link here 
# If you dunno, head to openweathermap.org, and make and account 
#(completely free I swear, and then get your API Key and  your City ID)
# I wish I was smart enough to do it like Elena, but this is the top I could do lol
KEY=""
ID=""
UNIT="" #Options are 'metric' and 'imperial'
LANG=""
weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID="$KEY"&id="$ID"&units="$UNIT"&lang="$LANG"")
echo $weather
if [ ! -z "$weather" ]; then
        weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
        weather_icon_code=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
	weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g")

	#Big long if statement of doom
	if [ "$weather_icon_code" == "50d"  ]; then
			weather_icon=" "
      weather_hex="#89DCEB"
    elif [ "$weather_icon_code" == "50n"  ]; then
      weather_icon=" "
      weather_hex="#89DCEB"
	elif [ "$weather_icon_code" == "01d"  ]; then
      weather_icon=" "
      weather_hex="#FAE3B0"
    elif [ "$weather_icon_code" == "01n"  ]; then
      weather_icon=" "
      weather_hex="#F5C2E7"
    elif [ "$weather_icon_code" == "02d"  ]; then
      weather_icon=" "
      weather_hex="#96CDFB"
    elif [ "$weather_icon_code" == "02n"  ]; then
      weather_icon=" "
      weather_hex="#96CDFB"
    elif [ "$weather_icon_code" == "03d"  ]; then
      weather_icon=" "
      weather_hex="#96CDFB"
    elif [ "$weather_icon_code" == "03n"  ]; then
      weather_icon=" "
      weather_hex="#96CDFB"
    elif [ "$weather_icon_code" == "04d"  ]; then
      weather_icon=" "
      weather_hex="#96CDFB"
    elif [ "$weather_icon_code" == "04n"  ]; then
      weather_icon=" "
      weather_hex="#96CDFB"
    elif [ "$weather_icon_code" == "09d"  ]; then
      weather_icon=" "
      weather_hex="#DDB6F2"
    elif [ "$weather_icon_code" == "09n"  ]; then
      weather_icon=" "
      weather_hex="#DDB6F2"
    elif [ "$weather_icon_code" == "10d"  ]; then
      weather_icon=" "
      weather_hex="#DDB6F2"
    elif [ "$weather_icon_code" == "10n"  ]; then
      weather_icon=" "
      weather_hex="#DDB6F2"
    elif [ "$weather_icon_code" == "11d"  ]; then
      weather_icon=""
      weather_hex="#E8A2AF"
    elif [ "$weather_icon_code" == "11n"  ]; then
      weather_icon=""
      weather_hex="#E8A2AF"
    elif [ "$weather_icon_code" == "13d"  ]; then
      weather_icon=" "
      weather_hex="#D9E0EE"
    elif [ "$weather_icon_code" == "13n"  ]; then
      weather_icon=" "
      weather_hex="#D9E0EE"
    elif [ "$weather_icon_code" == "40d"  ]; then
      weather_icon=" "
      weather_hex="#89DCEB"
    elif [ "$weather_icon_code" == "40n"  ]; then
      weather_icon=" "
      weather_hex="#89DCEB"
    else 
      weather_icon=" "
      weather_hex="#96CDFB"
    fi
      echo "$weather_icon" >  $tmp_weather_icon
      echo "$weather_description" > $tmp_weather_stat
      
      desc=$(cat /tmp/weather/weather-stat)
      desc_count=$(cat /tmp/weather/weather-stat | wc -c)
      if [ "$desc_count" -lt 15 ]; then
        echo "$weather_description" > $tmp_weather_stat      
      else 
        echo "$(cat /tmp/weather/weather-stat | cut -c1-12)""..." > $tmp_weather_stat
      fi
      echo "$weather_temp""°C" > $tmp_weather_degree
      echo "$weather_hex" > $tmp_weather_hex
    else
      echo "Weather Unavailable" > $tmp_weather_stat
      echo " " > $tmp_weather_icon
      echo "-" > $tmp_weather_degree
      echo "#96CDFB" > $tmp_weather_hex
fi


# #!/bin/bash
#
# ## Collect data
# cache_dir="$HOME/.cache/eww/weather"
# cache_weather_stat=${cache_dir}/weather-stat
# cache_weather_degree=${cache_dir}/weather-degree
# cache_weather_hex=${cache_dir}/weather-hex
# cache_weather_icon=${cache_dir}/weather-icon
# cache_weather_city=${cache_dir}/weather-city
# cache_weather_country=${cache_dir}/weather-country
#
# ## Weather data
# KEY="2b19a7c68543a30e31f14cbdb52555d6"
# ID="759734"
# UNIT="metric"	# Available options : 'metric' or 'imperial'
# LANG="pl"
#
# ## Make cache dir
# if [[ ! -d "$cache_dir" ]]; then
# 	mkdir -p ${cache_dir}
# fi
#
# ## Get data
# get_weather_data() {
# 	weather=`curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=$KEY&id=$ID&units=$UNIT&lang=$LANG"`
# 	echo ${weather}
#
# 	if [ ! -z "$weather" ]; then
# 		weather_temp=`echo "$weather" | jq ".main.temp" | cut -d "." -f 1`
# 		weather_city=`echo "$weather" | jq -r ".name" | head -1`
# 		weather_country=`echo "$weather" | jq -r ".sys.country" | head -1`
# 		weather_icon_code=`echo "$weather" | jq -r ".weather[].icon" | head -1`
# 		weather_description=`echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g"`
#
# 		#Big long if statement of doom
# 		if [ "$weather_icon_code" == "50d"  ]; then
# 			weather_icon=""
# 			weather_hex="#96CDFB"
# 		elif [ "$weather_icon_code" == "50n"  ]; then
# 			weather_icon=""
# 			weather_hex="#96CDFB"
# 		elif [ "$weather_icon_code" == "01d"  ]; then
# 			weather_icon=""
# 			weather_hex="#FAE3B0"
# 		elif [ "$weather_icon_code" == "01n"  ]; then
# 			weather_icon=""
# 			weather_hex="#DDB6F2"
# 		elif [ "$weather_icon_code" == "02d"  ]; then
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		elif [ "$weather_icon_code" == "02n"  ]; then
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		elif [ "$weather_icon_code" == "03d"  ]; then
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		elif [ "$weather_icon_code" == "03n"  ]; then
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		elif [ "$weather_icon_code" == "04d"  ]; then
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		elif [ "$weather_icon_code" == "04n"  ]; then
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		elif [ "$weather_icon_code" == "09d"  ]; then
# 			weather_icon=""
# 			weather_hex="#96CDFB"
# 		elif [ "$weather_icon_code" == "09n"  ]; then
# 			weather_icon=""
# 			weather_hex="#96CDFB"
# 		elif [ "$weather_icon_code" == "10d"  ]; then
# 			weather_icon=""
# 			weather_hex="#96CDFB"
# 		elif [ "$weather_icon_code" == "10n"  ]; then
# 			weather_icon=""
# 			weather_hex="#96CDFB"
# 		elif [ "$weather_icon_code" == "11d"  ]; then
# 			weather_icon=""
# 			weather_hex="#FAE3B0"
# 		elif [ "$weather_icon_code" == "11n"  ]; then
# 			weather_icon=""
# 			weather_hex="#FAE3B0"
# 		elif [ "$weather_icon_code" == "13d"  ]; then
# 			weather_icon=""
# 			weather_hex="#D9E0EE"
# 		elif [ "$weather_icon_code" == "13n"  ]; then
# 			weather_icon=""
# 			weather_hex="#D9E0EE"
# 		elif [ "$weather_icon_code" == "40d"  ]; then
# 			weather_icon=""
# 			weather_hex="#7DCFFF"
# 		elif [ "$weather_icon_code" == "40n"  ]; then
# 			weather_icon=""
# 			weather_hex="#7DCFFF"
# 		else
# 			weather_icon=""
# 			weather_hex="#89DCEB"
# 		fi
# 		echo "$weather_icon" >  ${cache_weather_icon}
# 		echo "$weather_city" >  ${cache_weather_city}
# 		echo "$weather_country" >  ${cache_weather_country}
# 		echo "$weather_description" > ${cache_weather_stat}
# 		echo "$weather_temp""°C" > ${cache_weather_degree}
# 		echo "$weather_hex" > ${cache_weather_hex}
# 	else
# 		echo "Weather Unavailable" > ${cache_weather_stat}
# 		echo "" > ${cache_weather_icon}
# 		echo "-" > ${cache_weather_degree}
# 		echo "#89DCEB" > ${tcache_weather_hex}
# 	fi
# }
#
# ## Execute
# if [[ "$1" == "--getdata" ]]; then
# 	get_weather_data
# elif [[ "$1" == "--icon" ]]; then
# 	cat ${cache_weather_icon}
# elif [[ "$1" == "--city" ]]; then
# 	cat ${cache_weather_city}
# elif [[ "$1" == "--country" ]]; then
# 	cat ${cache_weather_country}
# elif [[ "$1" == "--temp" ]]; then
# 	cat ${cache_weather_degree}
# elif [[ "$1" == "--hex" ]]; then
# 	cat ${cache_weather_hex}
# elif [[ "$1" == "--stat" ]]; then
# 	cat ${cache_weather_stat}
# fi
