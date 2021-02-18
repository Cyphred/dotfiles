# !/bin/sh
# Take snapshots with your webcam

cd /run/media/cyphred/Shared/pictures/Camera/
mpv av://v4l2:/dev/video0 --profile=low-latency --untimed
