#!/bin/bash
# Backup critical directories

BACKUP_DIR="/home/overtrq/backups"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
LOG_FILE="/var/log/maintenance.log"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz" /home 2>&1 | tee -a "$LOG_FILE"
tar -czf "$BACKUP_DIR/etc_backup_$TIMESTAMP.tar.gz" /etc 2>&1 | tee -a "$LOG_FILE"
echo "$(date): Backups completed." | tee -a "$LOG_FILE"
