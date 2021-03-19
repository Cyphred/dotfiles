# !/bin/sh
# Shows a menu for browsing through the school folder

data_dir="$HOME"
if [ ! -d "$data_dir/school/" ]; then
	notify-send -u critical "school folder not found" "Could not locate $data_dir/school/."
	exit 1
fi

# Fetch the list of subdirectories in the school directory
school_dirs=( $(ls -d $data_dir/school/*/) )

# Remove the full file path and leave only the subdirectory names
school_dirs=( "${school_dirs[@]#"$data_dir"/school/}" )

# Remove the slash at the end of the subdirectory names
school_dirs=( "${school_dirs[@]%/}" )

# Show a menu with the list of subdirectories
option=$(printf '%s\n' "${school_dirs[@]}" | dmenu -l 20)

# Exit if canceled, or if nothing is entered
[ -z "$option" ] && exit 1

# Exit if input is not a valid subdirectory
[ -d "$data_dir/school/$option" ] || exit 1

# Open the subdirectory
$TERMINAL -e ranger $data_dir/school/$option 
