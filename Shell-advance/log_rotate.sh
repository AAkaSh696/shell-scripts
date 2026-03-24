#!/bin/bash 

set -euo pipefail

log_dir="$1"

if [ ! -d "$log_dir" ] ; then 
	echo "Directory doesn't exist"
	exit 1
fi 

compressed=0
deleted=0

for file in $(find "$log_dir" -name "*.log" -mtime +7)
do 
	gzip "$file"
	((compressed++))
done

for file in $(find "$log_dir" -name "*.gz" -mtime +30)
do
	rm "$file"
	((deleted++))
done

echo "No of files compressed: $compressed"
echo "No of files deleted: $deleted"
       	
