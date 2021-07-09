# findomain -t testphp.vulnweb.com -q | httpx -silent | anew | waybackurls | gf sqli >> sqli ; 
# sqlmap -m sqli --batch --random-agent --level 1

#!/bin/bash
	# I built this tool because bored with the LockDown
	# Ratnadip Gajbhiye

	clear
	bash banner.sh
	[ "$1" ] || check;


	while getopts w: OPT ; 
	do
		#statements
		case "$OPT" in
			"w") masstarget="${OPTARG}" ;;
		esac
	done


	[ $masstarget ] || check;

	printf "\e[34m[*] TARAMA BAŞLATILDI "

	for vuln in `cat $masstarget`
	 do
	 	echo -e "\033[1;34m[*]\033[0m TARANIYOR => $vuln"
	 	page=$(curl -s $vuln"'")

		if [[ $page =~ "sql" ]]; then
			echo -e "\e[31m[+] $vuln => SQL AÇIĞI TESPİT EDİLDİ\n"
			echo $vuln >> vuln.txt
		else
			echo -e "\e[32m[-] $vuln => SQL AÇIĞI YOK"
			echo -e "\033[0m"
		fi
	done
	echo
	echo
	printf "\e[36m[*] \e[34mSQL AÇIĞI BULUNAN SİTELER "
	echo
	echo
	printf " \e[36m/////////////////////////////////////////////////"
	echo
	echo -e "\e[96m"
	cat vuln.txt
	echo
	echo
	printf " \e[36m/////////////////////////////////////////////////"

	echo
	rm vuln.txt
