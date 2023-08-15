#!/bin/bash

export PATH="/usr/lib/go-1.18/bin:/home/shankar/.local/go/bin:/home/shankar/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/sn"

# Function to send a notification
send_notification() {
    message="$1"
    notify-send "$message"
}

# Prompt the user to enter the Pinterest URL using dmenu
url=$(echo "" | dmenu -p "Enter the Pinterest URL:")

# Check if the user provided a URL
if [ -z "$url" ]; then
    send_notification "No URL provided!"
    exit 1
fi

# Enforce the use of the www.pinterest.com domain
url_with_www=$(echo "$url" | sed 's|https://in.pinterest.com|https://www.pinterest.com|')

# Get the image URLs using pup and filter
img_urls=$(curl -s "$url_with_www" | pup 'img.hCL.kVc.L4E.L4E.MIw attr{src}' | grep 'originals')

# Check if img_urls is empty
if [ -z "$img_urls" ]; then
    send_notification "No images found on the provided URL!"
    exit 1
fi

# Specify the directory to save images
save_directory="/home/shankar/pix"

# Download all images
for img in $img_urls; do
    image_filename=$(basename "$img") # Extract the filename from the URL
    downloaded_image="$save_directory/$image_filename"
    wget_output=$(wget -O "$downloaded_image" "$img" 2>&1)
done

send_notification "Downloaded images to $save_directory"

