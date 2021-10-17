# !/bin/sh
# Downloads a youtube video and converts it to mp3 for quick music grabs

[ -z "$1" ] && echo Please provide a link && exit 1
youtube-dl -x --audio-format mp3 --audio-quality 0 "$1"
