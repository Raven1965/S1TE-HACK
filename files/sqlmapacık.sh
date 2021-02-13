#!/bin/bash
kontrol=$(ls |grep -w sqlmap |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m SQLMAP İNDİRİLİYOR.."
	echo
	echo
	echo
	git clone https://github.com/sqlmapproject/sqlmap.git
fi
kontrol=$(which python |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m PYTHON PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install python -y
fi
clear
bash banner.sh
echo
echo
echo -e "\e[92m ÖRNEK DORK 1───────inurl:base.php?id="
echo -e "\e[34m ÖRNEK DORK 2───────inurl:index.php?id="
echo -e "\e[93m ÖRNEK DORK 3───────inurl:pageid="
echo
echo
echo -e "\e[92m/y/n/q sorarsa devam etmek için 'n' çıkmak için 'q' seçin.Asla 'y' seçmeyin" 
echo
echo
echo
cd sqlmap
history -r link.txt
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mDORKU GİRİNİZ\e[31m ]───────►  \e[0m' dork
echo
echo
echo
python sqlmap.py -g "$dork"
