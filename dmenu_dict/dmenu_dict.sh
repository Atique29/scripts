#!/bin/sh
word=$(cat ~/atiqxe/scripts/dmenu_dict/wordnetWords.txt |dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16' -p "    Enter Word :   " -l 7)
def=$(dict -d wn "$word" | sed -e '1,5d' -e 's/[0-9]:/\n ★ /' -e '0,/^/ s/^/<back>\n/')
nxt=$(echo "$def" | dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=14' -l 14 -p "    Definition  ")
if [ "$nxt" = "<back>" ]; then
	~/atiqxe/scripts/dmenu_dict/dmenu_dict.sh
elif [ "$nxt" = "b" ]; then
	~/atiqxe/scripts/dmenu_dict/dmenu_dict.sh
fi

