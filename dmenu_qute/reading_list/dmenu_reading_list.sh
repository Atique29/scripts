#!/bin/bash

DMENU="dmenu -i -l 7 -nb #1c1c1c -nf #fbf1c7 -sb #fbf1c7 -sf #1c1c1c -fn 'JetBrainsMono:pixelsize=18' -p"
LIST="/home/phaetan/atiqxe/scripts/dmenu_qute/reading_list/list.txt"

query=$(cat $LIST | awk -F "   " '{print $2}' | $DMENU "Reading List:")
url=$(rg " $query$" $LIST | awk -F "   " '{print $1}')

if [ -n "$url" ]; then
    qutebrowser ":open -t $url"
fi
