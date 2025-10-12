#!/usr/bin/env bash
set -euo pipefail

#get the list of windows and their ids
#set the two useless columns in wmctrl output to empty spaces
workspaces=$(wmctrl -l | awk '{$2=""; $3=""}1' )
choice=$(echo "$workspaces" |   dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:pixelsize=16' -p "󰦾 workspaces:" -l 10)

#check if the operation is cancelled
[ -z "$choice" ] && exit 0

#otherwise execute change in workspace
#get window id in hex
id=$(awk '{print $1}' <<< "$choice")

wmctrl -i -a "$choice"
