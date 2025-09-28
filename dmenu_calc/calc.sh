#!/bin/sh
expression=$(echo "                            e^it = cos(t) + isin(t)                                                 "| dmenu -i  -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:bold:pixelsize=16' -p "    Expression    " )
output=$(eva $expression)
nxt=$(echo $output | dmenu -i  -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021'  -fn 'JetBrainsMono:bold:pixelsize=16' -p "    Output    " -l 1)

if [ "$nxt" = "" ]; then
	exit 0
else
	~/atiqxe/scripts/dmenu_calc/calc.sh
fi


