#!/usr/bin/env bash
set -euo pipefail

procs=$(ps -u "$USER" -o pid= -o comm=)

choice=$(echo "$procs" |   dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:pixelsize=16' -p "⚔ Kill process:" -l 15)
[ -z "$choice" ] && exit 0
pid=$(awk '{print $1}' <<< "$choice")

confirm=$(printf "Sure??\nCancel" |  dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:pixelsize=16' -p "Kill $choice ?" -l 2)
[ "$confirm" != "Sure??" ] && exit 0

kill -9 "$pid"

