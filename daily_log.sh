#!/bin/bash

# Define log directory
LOG_DIR="$HOME/daily_logs"
mkdir -p "$LOG_DIR"

# Define log file name
LOG_FILE="$LOG_DIR/log_$(date +"%Y-%m-%d").txt"

# Log system info
{
    echo "=========================="
    echo "User Log - $(date)"
    echo "=========================="
    echo "Current User: $(whoami)"
    echo ""
    echo "Running Processes:"
    ps aux
    echo ""
    echo "Disk Usage:"
    df -h
} > "$LOG_FILE"

# Log rotation - delete logs older than 7 days
find "$LOG_DIR" -type f -name 'log_*.txt' -mtime +7 -exec rm {} \;

echo "Log archived to $LOG_FILE"
