# !/bin/sh
# A simple menu for opening my frequent folders in ranger

INPUT=$(printf "notes\nschool\nbooks\nanime\ntv\nmovies" | dmenu)

case $INPUT in
	"notes")
		$TERMINAL -e ranger ~/Shared/notes
		;;
	"school")
		$TERMINAL -e ranger ~/Shared/school
		;;
	"books")
		$TERMINAL -e ranger ~/Shared/Books
		;;
	"anime")
		$TERMINAL -e ranger ~/Shared/Anime
		;;
	"tv")
		$TERMINAL -e ranger ~/Shared/TV
		;;
	"movies")
		$TERMINAL -e ranger ~/Shared/Movies
		;;
esac
