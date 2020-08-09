#!/bin/bash

#removing docker containers
for cont in $(docker ps -a --format '{{.ID}}')
do 
	sudo docker rm "$cont"
done 

#removing docker images
for img in $(docker images --format '{{.ID}}')
do
	isExcluded=0
	for ex in $(cat 'excluded.txt')#check whether image is excluded
	do
		if [ "$ex" = "$img" ]; then 
			isExcluded=1
		fi
	done	
	if [ "$isExcluded" -ne 1 ]; then
		sudo docker rmi "$img" #removing the image
	fi
done 


