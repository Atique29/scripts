#!/usr/bin/env bash
while :
do
    prevCurrent=$(cat currenTrack.txt)
    current=$(mpc current)
    if [ "$current" != "$prevCurrent" ]; then
        echo ♭ $current ♯ > ~/atiqxe/scripts/currenTrack.txt
    fi
    sleep 5s
done
