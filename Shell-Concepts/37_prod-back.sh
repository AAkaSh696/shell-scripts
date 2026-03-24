#!/bin/bash

<< readme
 This is a script for backup with 5 day rotation 
Useage:
./37_prod-back.sh <path to your source> <path to backup folder>
readme

function displayUseage {
	echo " Useage ./37_prod-back.sh <source> <destination>"
}

if [ $# -eq 0 ]; then
	displayUseage 
fi

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

function create_backup {
	zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" >/dev/null

	if [ $? -eq 0 ];then 
		echo "backup generated successfully for ${timestamp}"
	fi
}

function programRotation {
	backup=($(ls -t ${backup_dir}/backup_*.zip 2>/dev/null))

	if [ ${#backup[@]} -gt 5 ];then
		echo "Performing Rotation for 5 days"
		backup_to_remove=("${backup[@]:5}")

		for b_up in "${backup_to_remove[@]}";
		do 
			rm -f "$b_up"
		done
	fi
}

create_backup
programRotation
