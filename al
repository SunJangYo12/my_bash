#!/bin/bash

comand="$@"
echo ".... $comand"
echo ""

function hotspot {

   nmcli connection add type wifi ifname '*' con-name ai_otak autoconnect no ssid "shun"
   nmcli connection modify ai_otak 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
   nmcli connection up ai_otak
   echo "sukses klon hotspot"
}

if [ "$comand" = "hotspot" ]; then
	read -p "On/Off?: " sw
	if [ "$sw" = "Off" ]; then
		nmcli connection down ai_otak
	else
		hotspot
	fi
elif [ "$comand" = "file_gui" ]; then
	nautilus &
elif [ "$comand" = "hex" ]; then
	hexeditor
elif [ "$comand" = "otak" ]; then
	touch /root/AL/konstanta.txt
	touch /root/AL/variable.txt
	chmod 777 /root/AL/konstanta.txt
	chmod 777 /root/AL/variable.txt
	xterm -title "ping fbssh" -e python /root/AL/remote/ping.py &
	sleep 2 &
	xterm -title "Main" -e python /root/AL/remote/index.py &
	sleep 2 &
	xterm -title "mata" -e python /root/AL/remote/mata.py &
	sleep 2 &
	hotspot
elif [ "$comand" = "edit" ]; then
	echo "oke"
	#ls /root/sublime_text_3/
elif [ "$comand" = "file" ]; then
	main="main"
	while [ $main = "main" ]; do
		read -p "in : " in
		if [ $in = "b" ]; then
			cd ..
			ls
		fi
	done
elif [ "$comand" = "jam" ]; then
	xterm -title "Jam" -e python /root/AL/jam.py -l -c "oke" &

elif [ "$comand" = "web" ]; then
	echo "ENTER pencarian langsung bing.com"
	echo "wiki pencarian"
        echo "gambar pencarian"
        echo "wikihow pencarian"
        echo "medis pencarian"
	read -p "--->> Masukan pencarian: " cari
	if [ "$cari" = "wiki" ]; then
		read -p "--->> Wiki pencarian: " cwiki
		firefox "https://https-en-m-wikipedia-org.0.freebasics.com/wiki/Special:Search?search=$cwiki&go=Go&iorgbsid=AZx5Rz7gY5XA32Wfsp47kpFSZmT-pyijfo0_s4uLGTHKQgG9FfcExqWb7seS-XC_OctWe6UhWzqUWNdpeLw4_dlv&iorg_service_id_internal=803478443041409%3BAfrEX0ng8fF-69Ni" &
	elif [ "$cari" = "gambar" ]; then
		read -p "--->> Gambar pencarian: " cgambar
		firefox "https://http-www-bing-com.0.freebasics.com/images/search?q=$cgambar&FORM=HDRSC2&PC=FBIO&iorg_service_id_internal=803478443041409%3BAfrEX0ng8fF-69Ni" &
	elif [ "$cari" = "wikihow" ]; then
		read -p "--->> wikihow pencarian: " cwikihow
		firefox "https://https-id-m-wikihow-com.0.freebasics.com/wikiHowTo?iorg_service_id_internal=1565619690390248%3BAfqgmp3C64SPmOJI&iorgbsid=AZxWu1SQo_HsH_Om7z5nQ4jGv1esaLuYiQgBQPocrWWngKqH4i6HOQbwAvTzhE8gAKDx8sLdSM_SvZ_5fJtm_Mtv&search=$cwikihow" &
	elif [ "$cari" = "medis" ]; then
		read -p "--->> medis pencarian: " cmedis
		firefox "https://https-doktersehat-com.0.freebasics.com/?iorg_service_id_internal=948157001926414%3BAfrzo2s9gv42b-07&search=$cmedis" &
	else
		firefox "https://http-www-bing-com.0.freebasics.com/search?iorg_service_id_internal=803478443041409%3BAfrEX0ng8fF-69Ni&iorgbsid=AZwOf5p9ZGHdo4ma-_4xLROJiPP57wR4JxMMMfZYMk2RHTXt0k_suZhZX4ELlv0Xo8d0A99ibKz2Zk2OYsINpLd4&q=$cari&go=Search&qs=ds&form=QBRE&pc=FBIO" &
	fi
else
	echo "command salah"
	echo "--> al fbssh"
	echo "--> al web"
	echo "--> al hex"
	echo "--> al file_gui"
	echo "--> al file"
	echo "--> al jam"
	echo "--> al otak"
fi
