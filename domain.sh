#!/bin/bash

echo -e "================[ Start ]================\n";
echo -e "=============[ A：Sugarguo ]=============\n";
echo -e "===========[ T：2017年03月14日 ]===========\n";
echo -e "==========[ W：www.sugarguo.com ]=========\n";
echo -e "================[ Start ]================\n";


CARRAY=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
VARRAY=(0 1 2 3 4 5 6 7 8 9)
MARRAY=()
JARRAY=()

DOMAIN=".com"

i=0
for char in ${CARRAY[@]}
do
	for var in ${VARRAY[@]}
	do
		data=$char$var
		let "i+=1" 
		MARRAY[$i]=$data$DOMAIN
		data=$var$char
		let "i+=1" 
		MARRAY[$i]=$data$DOMAIN
		echo "[${i}]"$data
	done
done

j=0
for i in "${!MARRAY[@]}"; do 
	printf "%s\t%s\n" "$i" "${MARRAY[$i]}"
	judge=`whois ${MARRAY[$i]}`
	echo "$judge" |grep -q "registered"
	if [ $? -eq 0 ]
	then
		echo "registered"
	else
		JARRAY[j]=${MARRAY[$i]}
		let "j+=1" 
		echo "available"
	fi
    sleep 3s
done


for data in ${JARRAY[@]}  
do  
    echo -e ${data}'\n'  
done 

