#!/bin/sh
expression=$(echo "                            e^it = cos(t) + isin(t)                                                 "| dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16' -p "    Expression    " )
output=$(eva $expression)
nxt=$(echo $output | dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16' -p "    Output    " -l 1)

if [ "$nxt" = "" ]; then
	exit 0
else
	~/atiqxe/scripts/dmenu_calc/calc.sh
fi


