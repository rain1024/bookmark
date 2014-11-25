# Bookmark Plugin
# Features:
# 	Autocomplete
# Requirements: 
# 	apparix
# sudo apt-get install apparix
# Usage:
# 	bl	list bookmarks
# 	bm	add a bookmark 
# 	bt	cd to a bookmark

# list bookmarks
function bl {
	echo "Bookmarks: "
	apparix | sed -n '4,$'p | uniq
}

# bookmark a folder
function bm {
	apparix --add-mark $1
}

## to bookmark
function bt {
	folder=$(apparix $1)
	cd $folder
}

_bt_complete() {
	A=$(apparix | sed -n '4,$'p  | awk '{ print $2 }')
	_arguments ":::($A)"
}

compdef _bt_complete bt
