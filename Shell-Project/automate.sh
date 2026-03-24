#!/bin/bash

# -----------------------------
# Backup Configuration
# -----------------------------

SOURCE="$HOME/backup_project/source_folder"
BACKUP="$HOME/backup_project/backup_storage"
LOG="$HOME/backup_project/backup_log.txt"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
DEST="$BACKUP/backup_$DATE.tar.gz"

echo "--------------------------------------" >> "$LOG"
echo "Backup Started: $DATE" >> "$LOG"

# -----------------------------
# Check if source exists
# -----------------------------

if [ ! -d "$SOURCE" ]; then
    echo "ERROR: Source folder not found!" >> "$LOG"
    exit 1
fi

# -----------------------------
# Create Backup
# -----------------------------

tar -czf "$DEST" "$SOURCE" >> "$LOG" 2>&1

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $DEST" >> "$LOG"
else
    echo "Backup FAILED!" >> "$LOG"
    exit 1
fi

# -----------------------------
# Delete old backups (keep last 5)
# -----------------------------

cd "$BACKUP"

ls -dt backup_* 2>/dev/null | tail -n +6 | xargs rm -f

echo "Old backups cleaned (keeping last 5)" >> "$LOG"

# -----------------------------
# Compress files older than 30 days
# -----------------------------

find "$SOURCE" -type f -mtime +30 -exec gzip {} \; >> "$LOG" 2>&1

echo "Compressed files older than 30 days" >> "$LOG"

echo "Backup Completed: $(date)" >> "$LOG"
echo "" >> "$LOG"
