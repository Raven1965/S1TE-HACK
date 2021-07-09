#!/bin/bash
clear
bash banner.sh
page=0
#domains=(ac ad ae af ag ai al am an ao aq ar as at au aw ax az ba bb bd be bf bg bh bi bj bm bn bo br bs bt bv bw by bz ca cc cd cf cg ch ci ck cl cm cn co cr cu cv cx cv cz de dj dk dm do dz ec ee eg eh er es et eu fi fj fk fm fo fr ga gb gd ge gf gg gh )
echo
echo
read -e -p $'\e[31m───────[ \e[97mDORK  GİRİNİZ\e[31m ]───────►  \e[0m' dork
echo
echo
read -e -p $'\e[31m───────[ \e[97mKAÇ SAYFA TARANSIN\e[31m ]───────►  \e[0m' sayfa
echo
echo
printf "\e[1;92m[*] ARAMA BAŞLATILDI...\e[0m\n"

pages=$sayfa
while [[ $page -lt $pages ]]; do
#for domain in ${domains[@]}; do
curl -s 'http://www.bing.com/search?q='$dork'&filt=all&first='$page'&FORM=PERE' >> file1
let page+=10
#done
done
grep -o 'href="http[^"]*"' file1 > file2
sed -i '/microsoft/d' ./file2
sed -i '/wordpress/d' ./file2
sed -i '/bing/d' ./file2
cat file2 | sort | uniq | cut -d "\"" -f2 | tr -d '\"' > siteler.txt
echo
echo
printf "\e[1;92m[*]SİTELER BULUNDU\e[0m\n"
sleep 2
bash sqli.sh -w siteler.txt


