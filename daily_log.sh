#!/bin/bash

#############################################
# Daily Log Archiver
# Author: Nipun Singh
#############################################

# 1. Directories
LOG_DIR="$HOME/dailyLogs"
ARCHIVE_DIR="$LOG_DIR/archive"
mkdir -p "$LOG_DIR" "$ARCHIVE_DIR"

# 2. Create file with today's date
TODAY=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/log_${TODAY}.txt"

# 3. Write system information
{
    echo "Daily Log - $TODAY"
    echo "Author: Nipun Singh"
    echo "User: $(whoami)"
    echo ""
    echo "--- Uptime ---"
    uptime
    echo ""
    echo "--- Disk Usage ---"
    df -h
    echo ""
    echo "--- Top 5 CPU Processes ---"
    ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
} > "$LOG_FILE"

echo "Log saved: $LOG_FILE"

# 4. Move logs older than 7 days to archive
for file in "$LOG_DIR"/log_*.txt; do
    if [[ $(find "$file" -mtime +7 2>/dev/null) ]]; then
        mv "$file" "$ARCHIVE_DIR"
        echo "Archived: $(basename "$file")"
    fi
done

# 5. Create weekly archive (Sunday only)
if [ "$(date +%u)" -eq 7 ]; then
    ARCHIVE_NAME="$ARCHIVE_DIR/weekly_logs_$TODAY.tar.gz"
    tar -czf "$ARCHIVE_NAME" "$ARCHIVE_DIR"/*.txt 2>/dev/null
    echo "Weekly archive created: $ARCHIVE_NAME"
fi
