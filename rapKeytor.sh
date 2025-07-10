#!/bin/bash

if [ $# -eq 0 -o $# -eq 1 -a "$1" = "-h" ]
then
echo "                             The API Key Predator                           "
echo "                           .                     .                "
echo "       .___    ___  \,___, /   /   ___  ,    .  _/_     __.  .___ "
echo "       /   \  /   \` |    \ |_-'  .'   \` |    \`   |    .'   \ /   \\"
echo "       |   ' |    | |    | |  \  |----' |    |   |    |    | |   '"
echo "       /     \`.__/| |\`---' /   \ \`.___,  \`---|.  \__/  \`._.' /    "
echo "                    \                    \___/                    "
echo
echo "[ by: foorw1nner | x.com/foorw1nner | hackerone.com/foorw1nner | github.com/foorw1nner ]"

	echo
	echo "[buffers] | rapKeytor.sh -start [flags]"
	echo "+================================================+"
	echo
	echo "-h		Show This Help Message              "
	echo
	echo "-start		Start the tool					" 
	echo "-nocolor	Disable colors in cli output"
	echo
	echo "+================================================+"

elif [ $# -eq 1 -a "$1" = "-start" -o $# -eq 2 -a "$1" = "-start" -a "$2" = "-nocolor" ]
then
	list=()	
	while IFS= read -r line
	do
		list+=("$line")
	done

	for url in "${list[@]}"
	do
		regex_extract=$(curl -Lsk "$url" | grep -Po "(=|\"|'|\x60)eyJ[A-Za-z0-9+/=_-]{10,}\.|(?i)basic\s[A-Za-z0-9+/=_-]{15,}|bearer\s[A-Za-z0-9.~:/+=_-]{16,}|api[_-]?key\s?=\s?(\"[A-Za-z0-9_][A-Za-z0-9+/=_-]{15,}|'[A-Za-z0-9_][A-Za-z0-9+/=_-]{15,}|\x60[A-Za-z0-9_][A-Za-z0-9+/=_-]{15,})|api[_-]?key(:|\"\s?:)\s?\"[A-Za-z0-9_][A-Za-z0-9+/=_-]{15,}|api[_-]?key(:|'\s?:)\s?'[A-Za-z0-9_][A-Za-z0-9+/=_-]{15,}|api[_-]?key=[A-Za-z0-9_][A-Za-z0-9+/_-]{15,}" | sort -u | sed s'/^/\[/; s/$/\]/' | tr -s '\n' ' ') 	

		if echo "$regex_extract" | grep -q "\["
		then
			if echo "$*" | tr -s ' ' '\n' | grep -q "^\-nocolor"
			then
				echo "$url $regex_extract"
			else
				echo -e "$url \033[32m$regex_extract\033[0m"
			fi
		fi

	done

else
	$0
fi
