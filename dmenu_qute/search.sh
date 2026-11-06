#!/bin/bash

DMENU="dmenu -i -l 1 -nb #1c1c1c -nf #fbf1c7 -sb #fbf1c7 -sf #1c1c1c -fn 'JetBrainsMono:pixelsize=18' -p"

query=$(cat "/home/phaetan/.config/qutebrowser/bookmarks/urls" | $DMENU "search 🔍")
command=":open -t $query"

if [ -n "$query" ]; then
    qutebrowser "$command"
fi
