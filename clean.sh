#!/bin/bash

#excluded=(8ecf5a48c789 ecd67fe340f9 0901fa9da894 38a4d911880c e0373ff33a19)

for cont in $(docker ps -a --format '{{.ID}}')
do 
	sudo docker rm "$cont"
done 

for img in $(docker images --format '{{.ID}}')
do
	fl=0
	for ex in $(cat 'excluded.txt')#${excluded[*]}
	do
		if [ "$ex" = "$img" ]; then 
			fl=1
		fi
	done	
	if [ "$fl" -ne 1 ]; then
		sudo docker rmi "$img"
	fi
done 


