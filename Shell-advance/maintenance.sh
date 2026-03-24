#!/bin/bash   

set -euo pipefail

logFile="/var/log/maintenance.log"

log(){
	echo "$(date '+%Y-%m-%d-%H-%M-%S'): $1" >> $logFile
}

/home/king/bash_practice/log_rotate.sh app_logs >> $logFile 2>&1

/home/king/bash_practice/backup.sh /home/king/myscripts /home/king/bash_practice/folder >> $logFile 2>&1


