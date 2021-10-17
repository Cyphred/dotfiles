# !/bin/sh

[ "$EUID" -ne 0 ] && echo "This script must be run as root." && exit 1

sv stop ntpd
ntpd -qg
hwclock -w
sv start ntpd
