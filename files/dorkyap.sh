#!/bin/bash
clear
bash banner.sh
printf "
\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mWORDPRESS\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mSQL\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 2 ]];then
	read -e -p $'\e[31m───────[ \e[97mTXT LİNKİ GİRİNİZ\e[31m ]───────►  \e[0m' secim2
	soz=$(curl -s "$secim2")
	dork1=.php?id=
	printf "\e[32m[*] \e[0mDORKLAR HAZIRLANIYOR"
	echo
	sleep 2
	echo
	echo
	for word in $soz; do
		echo
		echo -e  "\e[36minurl:$word$dork1"
	done

elif [[ $secim == 1 ]];then
	read -e -p $'\e[31m───────[ \e[97mTXT LİNKİ GİRİNİZ\e[31m ]───────►  \e[0m' secim3
	#dork2=$("Comment on Hello world!") ("author/admin") ("uncategorized/hello-world"),("non-classé") ("Proudly powered by WordPress"),("Welcome to WordPress. This is your first post.") ("Just another WordPress site") ("Mr WordPress on Hello world!") ("/wp/hello-world/") ("category/sin-categoria")
	#dork3=("Comment on Hello world!")&&("author/admin")&&("uncategorized/hello-world")&&("non-classé")&&("Proudly powered by WordPress")&&("Welcome to WordPress. This is your first post."&&("Just another WordPress site")&&("Mr WordPress on Hello world!")&&("/wp/hello-world/")&&("category/sin-categoria")
	soz2=$(curl -s "$secim3")
	dork1=("Comment on Hello world!")	
        dork2=("author/admin")
	dork3=("uncategorized/hello-world")
	dork4=("non-classé")
	dork5=("Proudly powered by WordPress")
	dork6=("Welcome to WordPress. This is your first post.")
	dork7=("Just another WordPress site")
	dork8=("Mr WordPress on Hello world!")
	dork9=("/wp/hello-world/")
	dork10=("category/sin-categoria")	
	for i in $soz2; do
		echo
		echo
		printf "\e[36m ($dork1)$i"
		echo
		echo
		echo
		printf "\e[36m ($dork2)$i"
		echo
		echo
		echo
		printf "\e[36m($dork3)$i"
		echo
		echo
		echo
		printf "\e[36m($dork4)$i"
		echo
		echo
		echo
		printf "\e[36m($dork5)$i"
		echo
		echo
		echo
		printf "\e[36m($dork6)$i"
		echo
		echo
		echo
		printf "\e[36m($dork7)$i"
		echo
		echo
		echo
		printf "\e[36m($dork8)$i"
		echo
		echo
		echo
		printf "\e[36m($dork9)$i"
		echo
		echo
		echo
		printf "\e[36m($dork10)$i"
		echo
		echo
		echo
	done	
        


else 
	exit
fi


