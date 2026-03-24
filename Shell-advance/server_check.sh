#!/bin/bash

service=nginx

read -p "Do you want to check the status?(y/n)" choice

case $choice in 
	y)
		Status=$(systemctl is-active $service)
		echo "Status of $service is $Status"
		;;
	n)
		echo "Prints skipped"
		;;
	*)
		echo "Enter valid option";;
esac
	

