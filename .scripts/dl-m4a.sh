# !/bin/sh
# Downloads a youtube video and converts it to m4a for quick music grabs

[ -z "$1" ] && echo Please provide a link && exit 1
youtube-dl -x --audio-format m4a --audio-quality 0 "$1"
