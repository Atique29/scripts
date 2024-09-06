#!/bin/sh

printf "\n\n" > ~/wcMatches.txt

data=$(curl -XGET 'https://api.football-data.org/v3/competitions/EC/matches?status=SCHEDULED' -H "X-Auth-Token:a7716a05f3574d5a8f413c35354b5fd5" )

for (( i = 0; i < 3; i++ )); do
hteam=$(echo $data | jq --argjson index $i .'matches[$index].homeTeam.name'|tr -d ' \n"')
ateam=$(echo $data | jq --argjson index $i .'matches[$index].awayTeam.name'|tr -d ' \n"')
printf "\t\t\e[36m %15s %15s\e\n\n" $hteam $ateam >> ~/wcMatches.txt
done

