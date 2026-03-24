#!/bin/bash

SOURCE="$HOME/backup_project/source_folder"
BACKUP="$HOME/backup_project/backup_storage"
LOG="$HOME/backup_project/backup_log.txt"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
DEST="$BACKUP/backup_$DATE.tar.gz"

# Create backup
tar -czf "$DEST" "$SOURCE"

# Compress files older than 30 days
find "$SOURCE" -type f -mtime +30 -exec gzip {} \;

# Remove old backups (keep latest 5)
cd "$BACKUP"
ls -dt backup_* 2>/dev/null | tail -n +6 | xargs rm -rf

# Write only this log line
echo "Backup created at $DATE" >> "$LOG"

# Keep only last 5 log entries
tail -n 5 "$LOG" > temp_log.txt
mv temp_log.txt "$LOG"
