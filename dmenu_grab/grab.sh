#!/bin/sh
path=$(cat ~/atiqxe/scripts/dmenu_grab/config_path |dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:pixelsize=16' -p "      grab 🔥     " -l 15)
#echo $path

if [ $(echo $path | awk -F. '{print$NF}') = "pdf" ];then
	zathura "$path" ; exit 0
fi

#elegent way of saying if path = "" then do nothin
[ -z $path ] || alacritty -e vim ~/"$path"
