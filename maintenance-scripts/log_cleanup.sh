#!/bin/bash
# Deletes old log files and logs the action
# Usage: sudo bash log_cleanup.sh

LOG_FILE="/var/log/maintenance.log"
TARGET_DIR="/var/log"
DAYS=7

find "$TARGET_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \; 2>&1 | tee -a "$LOG_FILE"
echo "$(date): Log cleanup completed for files older than $DAYS days." | tee -a "$LOG_FILE"
