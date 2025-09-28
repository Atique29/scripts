#!/bin/sh
sentence=$(echo.| dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:bold:pixelsize=16')
output=$(trans -b "$sentence")
ok=$(echo $output |dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021'  -fn 'JetBrainsMono:bold:pixelsize=16' -l 10)
