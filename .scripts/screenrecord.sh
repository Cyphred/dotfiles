ffmpeg -f x11grab -r 30 -s 1920x1080 -i :0.0 -f alsa -i hw:1 out.mkv
