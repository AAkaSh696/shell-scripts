#!/bin/bash

read -p "Which site do you wanna check?" site 
ping -c 1 $site &> /dev/null

if [ $? -eq 0 ] 
then 
	echo "Successfully"
else
	echo "Failed"
fi
