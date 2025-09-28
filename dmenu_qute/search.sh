#!/bin/bash

# Define the dmenu prompt
DMENU="dmenu -i -l 1 -nb #1c1c1c -nf #fbf1c7 -sb #fbf1c7 -sf #1c1c1c -fn 'JetBrainsMono:pixelsize=18' -p"

# Ask the user for input using dmenu
query=$(cat "/home/phaetan/.config/qutebrowser/bookmarks/urls" | $DMENU "search 🔍")


# If input was provided, send it to qutebrowser using :open
if [ -n "$query" ]; then
    qutebrowser ":open -t $query"
fi
