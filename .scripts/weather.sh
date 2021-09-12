# !/bin/sh
# Shows the weather in your area.
# By default, locates you via IP, but you can pass an argument with your location's name.

# Sets the firt letter of the argument to uppercase
curl wttr.in/"${1^}"
