# !/bin/sh
# Take snapshots with your webcam

cd $HOME/pictures/Camera/
mpv av://v4l2:/dev/video0 --profile=low-latency --untimed
