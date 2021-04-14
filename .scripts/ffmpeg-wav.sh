# !/bin/sh
ffmpeg -i $1 -acodec pcm_s16le -ac 2 $2.wav
