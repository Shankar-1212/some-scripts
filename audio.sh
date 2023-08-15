#! /bin/bash
echo "yo"
mkdir -p "$HOME/Downloads/Audio"   # Creates the "Video" folder in the "Downloads" directory if it doesn't exist
yt-dlp -f 'ba' -x --audio-format mp3 "$1" -o "$HOME/Downloads/Audio/%(title)s.%(ext)s"
notify-send "audio saved"
