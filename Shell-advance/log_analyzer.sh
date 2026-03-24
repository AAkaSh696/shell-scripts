#!/bin/bash

set -euo pipefail
#_________________________________TASK 1_________________________________________
if [ $# -lt 1 ]; then
	echo "Usage: ./log_analyzer.sh <log_file_path>"
fi

log_path="$1"

if [ ! -f "$log_path" ]; then 
	echo "File does not exist"
	exit 1
fi 
#________________________________________________________________________________

#_________________________________TASK 2_________________________________________
noErrFail=$(grep -Ei "ERROR|FAILED" "$log_path" | wc -l)
echo "Total errors : $noErrFail"
#________________________________________________________________________________

#_________________________________TASK 3_________________________________________
lineCritical=$(grep -n "CRITICAL" "$log_path")
echo "--------Critical Events--------"

if [ -z "$lineCritical" ]; then
	echo "No critical events found"
else
	echo "$lineCritical"
fi 
#________________________________________________________________________________

#_________________________________TASK 4_________________________________________

topErrors=$(grep "ERROR" "$log_path" | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5 )
echo "$topErrors"
#________________________________________________________________________________

#_________________________________TASK 5_________________________________________

DATE=$(date +%Y-%m-%d)
REPORT="log_report_$DATE.txt"
 
TOTAL_LINES=$(wc -l < "$log_path")
# if wc -l "$log_path then it will print 15 files.log now it prints only 15

{
echo "Log Analysis Report" 
echo "Date: $DATE"
echo "Log File: $log_path"
echo "Total Lines Processes: $TOTAL_LINES"
echo "Total Error : $noErrFail"
echo 
echo "---Top Error messages---"
echo "$topErrors"
echo 
echo "--Critical Events--"
echo "$lineCritical"
} > "$REPORT"

echo 
echo "Report Generated: $REPORT"

#--------------------------------Task 6---------------------------------------------

ARCHIVE_DIR="archive"
mkdir -p "$ARCHIVE_DIR"
mv "$log_path" "$ARCHIVE_DIR/"
echo "Log file moved to archive/"
#____________________________________________________________________________________
