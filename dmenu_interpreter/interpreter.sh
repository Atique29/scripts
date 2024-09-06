#!/bin/sh
sentence=$(echo.| dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16')
output=$(trans -b "$sentence")
ok=$(echo $output |dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16' -l 10)
