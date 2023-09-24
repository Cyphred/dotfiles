# !/bin/sh

# Get the list of sinks, store it as an array
readarray -t SINKS < <(pactl list short sinks)

ACTIVE_SINK_INDEX=0
SINKS_LENGTH=${#SINKS[@]}

# Get the index of the active sink
for ((i=0; i<$SINKS_LENGTH; i++));do
	if echo ${SINKS[i]} | grep -qi "RUNNING";then
		ACTIVE_SINK_INDEX=$i
	fi
done

# Determine what the next sink's index should be
NEXT_SINK_INDEX=0

# If the last element is the current sink, loop back to the first sink
if [ "$ACTIVE_SINK_INDEX" -ne "$(($SINKS_LENGTH - 1))" ]; then
	NEXT_SINK_INDEX="$((ACTIVE_SINK_INDEX + 1))"
fi

# Prepare sink data for printing
read -r -a SINK_DATA <<< "${SINKS[$NEXT_SINK_INDEX]}"

# Set the new sink
pacmd set-default-sink ${SINK_DATA[0]}

# Separate the sink name by dots
IFS="." read -r -a SINK_NAME_PARTS <<< "${SINK_DATA[1]}"

# Notify of the change in the sink
notify-send "Audio Output Changed" "${SINK_NAME_PARTS[3]}" --expire-time=1000
