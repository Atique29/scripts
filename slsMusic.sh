#!/usr/bin/env bash
while :
do
    prevCurrent=$(cat currenTrack.txt)
    current=$(mpc current)
    if [ "$curren" != "$prevCurrent" ]; then
        echo $current > ~/atiqxe/scripts/currenTrack.txt
    fi
    sleep 1s
done
