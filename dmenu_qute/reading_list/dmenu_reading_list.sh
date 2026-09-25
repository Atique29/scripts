#!/bin/bash
DIR_PATH="/home/phaetan/atiqxe/scripts/dmenu_qute/reading_list/data"
DMENU="dmenu -i -l 7 -nb #1c1c1c -nf #fbf1c7 -sb #fbf1c7 -sf #1c1c1c -fn 'JetBrainsMono:pixelsize=16' -p"

LIST=$(ls "$DIR_PATH" | awk -F. '{ print $1 }')

file=$(echo "$LIST" | $DMENU " Select File:")
file_path="$DIR_PATH/$file.txt"

query=$(cat "$file_path" | awk -F "   " '{print $2}' | $DMENU "Reading List:")
url=$(cat "$file_path" | rg " $query$" | awk -F "   " '{print $1}')

if [ -n "$url" ]; then
    qutebrowser ":open -t $url"
fi
