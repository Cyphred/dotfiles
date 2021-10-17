# !/bin/sh
# Take snapshots with your webcam

cd $HOME/photos/camera/
mpv av://v4l2:/dev/video0 --profile=low-latency --untimed
