wifi_stat=$(nmcli device status | awk '{print $3}' | sed -n '2,2p')
if [ $wifi_stat == "connected" ]
then
	echo 
else
	echo 
fi
