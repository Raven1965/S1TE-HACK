#!/bin/bash

if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
cd files
#bash güncelleme.sh
kontrol=$(which nmap |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m NMAP KURULUYOR"
	echo
	echo
	echo
	pkg install nmap -y
fi
if [[ -a sqlmap/sqlmap.py ]];then
	echo

else
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m SQLMAP İNDİRİLİYOR"
	echo
	echo
	echo
	git clone https://github.com/sqlmapproject/sqlmap
fi
kontrol=$(which termux-tts-speak termux-vibrate |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m TERMUX-APİ PAKETİ KURLUYOR"
	echo
	echo
	echo
	pkg install termux-api -y
fi
clear
bash banner.sh
echo
echo
echo
termux-tts-speak -e com.google.android.tts -l en -p 0.1 -r 0.7 -s MUSIC welcome termux toolss
printf "
\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mSQL AÇIĞI BUL\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mSQL AÇIKLI SİTE BUL\e[97m

\e[31m[\e[97m3\e[31m]\e[97m ────────── \e[32mSQL AÇIĞI İSTİSMARI\e[97m

\e[31m[\e[97mX\e[31m]\e[97m ────────── \e[31mÇIKIŞ\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 1 ]];then
	echo
	echo
	echo
	read -e -p $'\e[31m───────[ \e[97mSİTE LİNKİ GİRİNİZ\e[31m ]───────►  \e[0m' url
	echo
	echo
	echo
	link=$(echo -e "$url" |awk -F "://" {'print $2'})
	nmap -sV --script=http-sql-injection $link
	echo
	echo
	echo
	exit
elif [[ $secim == 2 ]];then
	bash sqlmapacık.sh
	exit	
elif [[ $secim == 3 ]];then
	bash sqlmap.sh
	exit
elif [[ $secim == x || $secim == X ]];then
	echo
	echo
	termux-vibrate -d 55
	echo
	printf "\e[31m[!]\e[97m ÇIKIŞ YAPILDI"
	echo
	echo
	echo
	exit
else
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m HATALI SEÇİM"
	echo
	echo
	echo
	sleep 2
	bash s1te-hack.sh
	exit
fi
