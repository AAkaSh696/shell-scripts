#!/bin/bash

set -euo pipefail

source="$1"
destination="$2"

if [ ! -d "$source" ];then
	echo "Source doesn't exists"
	exit 1
fi 

timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
Archieve="backup_${timestamp}.tar.gz"

tar -czf "$destination/$Archieve" "$source"

if [ -f $destination/$Archieve ];then 
	echo " Backup Created Successfully"
	echo "File: $Archieve"
	du -h "$destination/$Archieve"
else
	echo "Backup failed"
	exit 1
fi 

find "$destination" -name "backup_*.tar.gz" -mtime +14 -delete
