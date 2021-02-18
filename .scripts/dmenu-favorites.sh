# !/bin/sh
# A simple menu for opening my frequent folders in ranger

INPUT=$(printf "notes\nschool\nbooks\nanime\ntv\nmovies\ndownloads" | dmenu)
data_dir=/run/media/cyphred/Shared

case $INPUT in
	"notes")
		$TERMINAL -e ranger $data_dir/notes
		;;
	"school")
		$TERMINAL -e ranger $data_dir/school
		;;
	"books")
		$TERMINAL -e ranger $data_dir/books
		;;
	"anime")
		$TERMINAL -e ranger $data_dir/anime
		;;
	"tv")
		$TERMINAL -e ranger $data_dir/tv
		;;
	"movies")
		$TERMINAL -e ranger $data_dir/movies
		;;
esac
