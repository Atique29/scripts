winInfo=$(xwininfo) 
winName=$(echo "$winInfo" | grep "id:" |  cut -d " " -f 5-)
winId=$(echo "$winInfo" | grep "id:" | cut -d " " -f 4)
#winId=$(xdotool getactivewindow)
echo $winId
bufferPath="/home/phaetan/atiqxe/scripts/shadowRealm/shadows.txt"
xdo hide "$winId" && echo "$winName ♮ $winId" >> "$bufferPath"

