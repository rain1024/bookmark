# Bookmark Plugin

# Author: Brother Rain
# Date	: Nov 25, 2014

# show help
function bookmark_help {
	echo "Usage: bt [NAME]" 
	echo "Change directory to a bookmark\n"

	bookmark_list
}

# list bookmarks
function bookmark_list {
	echo "Available bookmarks: \n"
	apparix | sed -n '4,$'p | uniq
	echo ""
}

# bookmark a folder
function bookmark_add {
	apparix --add-mark $1
}

# to bookmark
function bookmark_to {
	if [[ $# -gt 0 ]]; then
		folder=$(apparix $1)
		cd $folder
	else
		bookmark_help
	fi	
}

# delete bookmark
function bookmark_delete {
	if [[ $# -gt 0 ]]; then
		apparix -purge-mark $1
		bookmark_list
	else
		bookmark_help
	fi	
}

# auto complete
_bookmark_complete() {
	A=$(apparix | sed -n '4,$'p  | awk '{ print $2 }')
	_arguments ":::($A)"
}

compdef _bookmark_complete bookmark_to
compdef _bookmark_complete bookmark_delete

alias bt=bookmark_to
alias bl=bookmark_list
alias ba=bookmark_add
alias bd=bookmark_delete
