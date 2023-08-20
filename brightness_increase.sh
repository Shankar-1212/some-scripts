#!/bin/bash

# Get the current brightness percentage
current_brightness=$(brightnessctl | grep -oP '\d+(?=%)')

# Calculate the new brightness percentage (5% increase)
new_brightness=$((current_brightness + 5))

# Check if the new brightness exceeds 100% (maximum brightness)
if [ $new_brightness -gt 100 ]; then
    new_brightness=100
fi

# Set the new brightness using brightnessctl
# Set the new brightness using brightnessctl with sudo
sudo brightnessctl set "$new_brightness%"

