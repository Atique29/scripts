#!/bin/sh

key = "a7716a05f3574d5a8f413c35354b5fd5"
declare output=(
		"Team                                  Points"
		"+++++++++++++++++++++++++++++++++++++++++++++++++++")
declare leagues=(
"BL1.                   Bundesliga "
"PL.                    Premierie League "
"SA.                    Seriie A "
"PD.                    La Liga "
"FL1.                   Ligue 1 "
"DED.                   Eredivisiie "
"PPL.                   Primeiria Liga "
"CL.                    Championis-League"
"WC.                    World-Cup")

choice=$(printf '%s\n' "${leagues[@]}" |dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16' -p "Choose" -l 11|awk -F. '{print$1}')

table=$(curl -H 'X-Auth-Token':"a7716a05f3574d5a8f413c35354b5fd5" "http://api.football-data.org/v3/competitions/$choice/standings?standingType=TOTAL" |jq '.standings[0].table')

len=$(echo $table|jq 'length')

for ((i=0;i<$len;i++))
do
team=$(echo "$table" | jq --argjson index $i '.[$index].team.name'|
		tr -d '\n\"')
points=$(echo "$table" | jq --argjson index $i '.[$index].points'|tr -d '\n')

#len=${#team}
#let tru_len=30-$len
output+=("$team................................$points")
#echo $team |tr -d '\n' &&  printf '\n.%.0s' {1..{$tru_len}}|tr -d '\n'~ && done
done
printf '%80s\n' "${output[@]}"|dmenu -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'JetBrainsMono:bold:pixelsize=16' -p "uhh" -l 25
