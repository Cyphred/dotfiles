# !/bin/sh
# dmenu implementation for executing scripts from $SCRIPTS
scripts=$(ls | sed 's/.sh//g')
target=$(echo "$scripts" | dmenu -l 20)
