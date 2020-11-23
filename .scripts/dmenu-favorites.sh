# !/bin/sh
# A simple menu for opening my frequent folders in ranger

INPUT=$(printf "notes\nschool\nbooks\nanime\ntv\nmovies" | dmenu)

case $INPUT in
	"notes")
		$TERMINAL -e ranger ~/Data/notes
		;;
	"school")
		$TERMINAL -e ranger ~/Data/school
		;;
	"books")
		$TERMINAL -e ranger ~/Data/Documents/Books
		;;
	"anime")
		$TERMINAL -e ranger ~/Data/Downloads/Anime
		;;
	"tv")
		$TERMINAL -e ranger ~/Data/Downloads/TV
		;;
	"movies")
		$TERMINAL -e ranger ~/Data/Downloads/Movies
		;;
esac
