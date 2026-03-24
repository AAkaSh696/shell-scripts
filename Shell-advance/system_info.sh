#!/bin/bash

print_header(){
	echo "________________________________"
	echo "$1"
	echo "________________________________"
}

host_Os(){
	print_header "Hostname and OS info"
	hostname 
	uname -a
}

up_time(){
	print_header "System Uptime"
	uptime 
}

disk_usage(){
	print_header "Disk Usage"
	df -h | sort -hrk 2 |  head -n 5
}

memory_usage(){
	print_header "Memory Usage"
	free -h
}

cpu_process(){
	print_header "Top 5 CPU-consuming processes"
	ps -aux --sort=-%cpu | head -n 6
}

main(){
	host_Os
	up_time
	disk_usage
	memory_usage
	cpu_process
}
main
