#!/bin/bash

SOURCE="$HOME/backup_project/source_folder"
BACKUP="$HOME/backup_project/backup_storage"
LOG="$HOME/backup_project/backup_log.txt"

while true
do

choice=$(zenity --list \
--title="Backup Automation System" \
--width=900 \
--height=700 \
--column="Menu" \
"Start Backup🟡" \
"Restore Backup♻️ " \
"View Logs🗐 " \
"Schedule Backup⏰" \
"Exit🟥")

case $choice in

"Start Backup🟡")

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
DEST="$BACKUP/backup_$DATE.tar.gz"

(
echo "10"
echo "# Preparing Backup..."

sleep 3

tar -czf "$DEST" "$SOURCE"

echo "50"
echo "# Compressing files older than 30 days..."

find "$SOURCE" -type f -mtime +30 -exec gzip {} \;

echo "70"
echo "# Removing old backups..."

cd "$BACKUP"
ls -dt backup_* 2>/dev/null | tail -n +6 | xargs rm -rf

echo "90"
echo "# Updating logs..."

echo "Backup created at $DATE" >> "$LOG"

tail -n 15 "$LOG" > temp_log.txt
mv temp_log.txt "$LOG"

echo "100"
echo "# Backup Completed"

) | zenity --progress \
--title="Backup Progress" \
--percentage=0 \
--auto-close

zenity --info --text="Backup Created Successfully!"

;;

"Restore Backup♻️ ")

FILE=$(zenity --file-selection --title="Select Backup File" --filename="$BACKUP/")

[ -z "$FILE" ] && continue

tar -xzf "$FILE" -C "$SOURCE"

zenity --info --text="Backup Restored Successfully!"

;;

"View Logs🗐 ")

zenity --text-info \
--title="Backup Logs" \
--filename="$LOG" \
--width=900 \
--height=700

;;

"Schedule Backup⏰")

(crontab -l 2>/dev/null; echo "* 2 * * * /home/king/backup_project/backup_gui.sh --auto") | crontab -

zenity --info --text="Backup Scheduled Daily at 2 A.M."

;;

"Exit🟥")

exit

;;

*)

exit

;;

esac

done
