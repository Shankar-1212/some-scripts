#!/bin/bash

# Get the current brightness percentage
current_brightness=$(brightnessctl | grep -oP '\d+(?=%)')

# Calculate the new brightness percentage (5% decrease)
new_brightness=$((current_brightness - 5))

# Check if the new brightness is less than 0 (minimum brightness)
if [ $new_brightness -lt 0 ]; then
    new_brightness=0
fi

# Set the new brightness using brightnessctl
sudo brightnessctl set "$new_brightness%"
