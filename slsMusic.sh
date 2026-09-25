#!/usr/bin/env bash
while :
do
    prevCurrent=$(cat ~/atiqxe/scripts/currenTrack.txt)
    metadata=$(playerctl metadata)
    #artist=$(echo "$metadata" | grep artist | awk '{print$3}')
    artist=$(echo "$metadata" | grep artist | awk '{$1=""; $2=""}1')
    current=$(echo "$metadata" | grep title | awk '{$1=""; $2=""}1')
    if [ "$current" != "$prevCurrent" ]; then
        echo ♯ $artist — $current > ~/atiqxe/scripts/currenTrack.txt
    fi
    sleep 5s
done
