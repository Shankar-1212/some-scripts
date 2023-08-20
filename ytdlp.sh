#!/bin/bash

# Use dmenu to get the YouTube link
link=$(echo -n | dmenu -p "Enter YouTube link:")
save_dir="/home/shankar/Videos"
# Check if the link is not empty
if [ -n "$link" ]; then
    # Download the video using yt-dlp
    echo "yo."
    yt-dlp -i "$link" -o "$save_dir/%(title)s.%(ext)s" -f "bv+ba/b"
    notify-send "Video downloaded"
else
    # If the link is empty, display an error notification
    notify-send "Error: Empty link"
fi
