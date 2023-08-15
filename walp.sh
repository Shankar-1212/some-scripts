#!/bin/bash

morning_image="/home/shankar/walls/abstract/1634162439688.png"
night_image="/home/shankar/walls/abstract/1637336939551.jpg"

while true; do
    current_hour=$(date +%k)

    if (( current_hour >= 6 && current_hour < 18 )); then
        # It's morning (6 AM to 5:59 PM)
        sudo -u shankar DISPLAY=:0 feh --bg-fill "$morning_image"
    else
        # It's night (6 PM to 5:59 AM)
        sudo -u shankar DISPLAY=:0 feh --bg-fill "$night_image"
    fi

    # Sleep for a minute to avoid continuous checking
    sleep 60
done
