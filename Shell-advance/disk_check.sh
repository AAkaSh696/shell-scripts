#!/bin/bash

check_disk(){
	echo "Disk Check :"
	echo " "
	df -h /
}

check_memory(){
	echo " " 
	echo "Memory Check :"
	free -h 
}

check_disk
check_memory 
