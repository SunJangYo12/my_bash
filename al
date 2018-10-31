#!/bin/bash

#
# editor Nano
# developer sunjangyo12@gamil.com
#
# ERROR vclass ( cari cfr.jar)
# ERROR adb (cari adb size lebih 1MB)

comand="$@"
IP=10.42.0.1
RANG_IP=$(echo $IP | cut -d "." -f 1,2,3);
DUMP_PATH="/var/www/shunpc.com"
allib="/usr/bin/allib"
echo ".... $comand"
echo ""

function android_build()
{
	ls
	read -p "[+] Nama folder project: " nabuild
	export PROJ=/home/sunjangyo12/oprek/android/$nabuild
	export PATHPROJ=/usr/bin/allib/build-tools
	cd $PATHPROJ

	echo  "Buat file R.java ..."
	./aapt package -f -m -J $PROJ/src -M $PROJ/AndroidManifest.xml -S $PROJ/res -I /usr/bin/allib/android.jar
	cd $PROJ
	read -p "[+] Nama paket ex:com/oke/pesawat : " pabuild

	echo ""
	echo -n "  Compiling -->> "
	erjavac=`javac -d obj -classpath src -bootclasspath /usr/bin/allib/android.jar src/$pabuild/*.java`
	if [ "$erjavac" = "" ]; then
		cd $PATHPROJ
		echo -n "Dexing -->> "
		./dx --dex --output=$PROJ/bin/classes.dex $PROJ/obj
		echo " Build apk -->> "
		./aapt package -f -m -F $PROJ/bin/out_mentah.apk -M $PROJ/AndroidManifest.xml -S $PROJ/res -I /usr/bin/allib/android.jar
		cp $PROJ/bin/classes.dex .
		./aapt add $PROJ/bin/out_mentah.apk classes.dex
		./aapt list $PROJ/bin/out_mentah.apk
		echo " Signing apk -->> "
		#java -jar $allib/sign/signapk.jar $allib/sign/certificate.pem  $allib/sign/key.pk8 out_mentah.apk "out.apk"
		#echo -n " SUKSES"
	else
		echo "$erjavac"
	fi
}

function android_pull_apk()
{
	if [ -z "$1" ]; then
		echo "Anda harus lulus paket untuk fungsi ini"
		echo "Ex: android_pull_apk \"com.android.contacts\""
		return 1
	fi
	if [ -z "$(adb shell pm list packages | grep $1)" ]; then
		echo "invalid packet list!"
		return 1
	fi
	apk_path="`adb shell pm path $1 | sed -e 's/package://g' | tr '\n' ' ' | tr -d '[:space:]'`"
	apk_name="`basename ${apk_path} | tr '\n' ' ' | tr -d '[:space:]'`"
	destination="/home/sunjangyo12/Dokumen/android/apk/"
	adb pull ${apk_path} ${destination}
	echo -e "\nAPK simpan di $destination/$paket"
	cd "$destination/"
	mv $apk_name $paket".apk"
	chmod 777 $paket".apk"
}
function data_apk(){
	if [ -z "$1" ]; then
		echo "Anda harus lulus paket untuk fungsi ini"
		echo "Ex: android_pull_apk \"com.android.contacts\""
		return 1
	fi
	if [ -z "$(adb shell pm list packages | grep $1)" ]; then
		echo "invalid packet list!"
		return 1
	fi
	apk_path="`adb shell pm path $1 | sed -e 's/package://g' | tr '\n' ' ' | tr -d '[:space:]'`"
	apk_name="`basename ${apk_path} | tr '\n' ' ' | tr -d '[:space:]'`"
	destination="/home/sunjangyo12/Dokumen/android/cache/"

	read -p "backup atau kembalikan cache:  b/k : " rest
	if [ "$rest" = "b" ]; then
		cd $destination
		adb backup -f $paket".ab" $paket
		echo -e "\nCache APK tersimpan "
	fi
	if [ "$rest" = "k" ]; then
		read -p "Yakin mau KEMBALIKAN? y/t: " alert
		if [ "$alert" = "y" ]; then
			ls -l $destination
			read -p "Masukan ab file: " abf
			adb restore $destination$abf
		fi
	fi
}

function apk_to_class() {
	read -p "-->> Nama apk [tanpa tanda petik biarkan spasi] : " dnapk
	diratc="/home/sunjangyo12/oprek/smali/"
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
					echo "$jsplit".java
					vclass "${at[i+1]}" > $jsplit".java"
				elif [ ${at[i]} = "creating" ]; then
					folder="${at[i+1]}"
					echo ""
					echo "------>>>> proses di folder: $folder"
				fi
			fi
		done
		echo "<<< tersimpan di  $diratc$dnapk >>"
	fi
}
function main {
	if [ ! -d $DUMP_PATH ]; then
		mkdir -p $DUMP_PATH &
	fi

	fuser -n tcp -k 53 67 80 &
	fuser -n udp -k 53 67 80 &

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

	sleep 5 &
	openssl req -subj '/CN=SEGURO/O=SEGURA/OU=SEGURA/C=US' -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout $DUMP_PATH/server.pem -out $DUMP_PATH/server.pem
	sleep 3 &
	python $DUMP_PATH/fakedns.py
}

function onDestroy {
	sysctl -w net.ipv4.ip_forward=0
	iptables --flush
	iptables --table nat --flush
	iptables --delete-chain
	iptables --table nat --delete-chain
	#nmcli connection down ai_otak
	echo "destroy sukses"
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
elif [ "$comand" = "apkkey" ]; then
	echo "sign      : biasanya setelah edit smali Sign diperlukan"
	echo "backup    : pastikan usb tersambung > wizard"
	echo "decompile : Masukan nama apk dan otomatis tersimpan di ~/hack/smali/nama_apk"
	echo "compile   : pastikan ada di folder yang ada file apktool.yml > wizard"
	echo "build     : build project android > wizard"
	read -p "-->> Perintah: " napk

	if [ "$napk" = "decompile" ]; then
		read -p "[+] semua atau jar s/j? : " dapk
		if [ $dapk = "s" ]; then
			apk_to_class
		else
			read -p "[+] Nama jar/apk: " njdapk
			bash $allib/dex2jar/d2j-dex2jar.sh "$njdapk"
		fi
	elif [ "$napk" = "build" ]; then
		android_build
	elif [ "$napk" = "sign" ]; then
		read -p "--->> Masukan nama apk: " snapk
		echo "[+] sign apk ...."
		java -jar $allib/sign/signapk.jar $allib/sign/certificate.pem  $allib/sign/key.pk8 $ncapk "out.apk"
                ls
	elif [ "$napk" = "compile" ]; then
		apktool b
		cd dist
		rm out.apk
		ncapk=`ls | grep "apk"`
		echo "[+] sign apk ...."
		java -jar $allib/sign/signapk.jar $allib/sign/certificate.pem  $allib/sign/key.pk8 $ncapk "out.apk"
		ls
	elif [ "$napk" = "backup" ]; then
		lagi="y"
		while [ $lagi = "y" ]; do
			read -p "-->> Masukan nama/ENTER semua: " npaket
			nrpaket=""
			if [ "$npaket" = "" ]; then
				nrpaket=`adb shell pm list packages`
			else
				nrpaket=`adb shell pm list packages | grep "$npaket"`
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

elif [ "$comand" = "antri" ]; then
	main="main"
	while [ $main = "main" ]; do
		read -p "in : " in
		if [ $in = "b" ]; then
			cd ..
			ls
		fi
	done
elif [ "$comand" = "error" ]; then
	dmesg
elif [ "$comand" = "edit" ]; then
	cd $allib/sublime
	read -p "[+] masukan nama code ENTER jika tidak ada : " ed
	if [ "$ed" != "" ]; then
		edir=`pwd`
		./sublime_text "$edir/$ed" &
	else
		./sublime_text &
	fi
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
	echo "command salah"
	echo " ......... .... ........"
	echo "--> al web"
	echo "--> al file_gui"
	echo "--> al file_zip"
	echo "--> al git_upload"
	echo "--> al cerah"
	echo "--> al wifi"
	echo "--> al apkkey"
	echo "--> al error"
	echo "--> al edit"
fi
