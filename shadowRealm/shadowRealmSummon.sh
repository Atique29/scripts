bufferPath="/home/phaetan/atiqxe/scripts/shadowRealm/shadows.txt"

choice=$(dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:pixelsize=16' -p " Summon ▨ >" -l 5 < "$bufferPath")
[[ -z "$choice" ]] && exit 0

winId=$(echo "$choice" | cut -d "♮" -f 2)
xdo show "$winId" && grep -Fxv "$choice" "$bufferPath" > tmp 
mv tmp "$bufferPath"
