#!/bin/bash
# Backup critical directories with error handling and validation

BACKUP_DIR="/home/overtruq/backups"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
LOG_FILE="/var/log/maintenance.log"

# Function to log messages
log_message() {
    echo "$(date): $1" | tee -a "$LOG_FILE"
}

# Check if backup directory exists, create if it doesn't
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    if [ $? -eq 0 ]; then
        log_message "Created backup directory: $BACKUP_DIR"
    else
        log_message "ERROR: Failed to create backup directory: $BACKUP_DIR"
        exit 1
    fi
fi

# Check if source directories exist before backup
if [ ! -d "/home" ] || [ ! -d "/etc" ]; then
    log_message "ERROR: Source directories /home or /etc do not exist"
    exit 1
fi

# Perform backup for /home with error checking
tar -czf "$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz" /home 2>&1 | tee -a "$LOG_FILE"
if [ ${PIPESTATUS[0]} -eq 0 ]; then
    log_message "SUCCESS: Home directory backup completed"
else
    log_message "ERROR: Home directory backup failed"
fi

# Perform backup for /etc with error checking
tar -czf "$BACKUP_DIR/etc_backup_$TIMESTAMP.tar.gz" /etc 2>&1 | tee -a "$LOG_FILE"
if [ ${PIPESTATUS[0]} -eq 0 ]; then
    log_message "SUCCESS: /etc directory backup completed"
else
    log_message "ERROR: /etc directory backup failed"
fi

# Clean up old backups (keep only last 7 days)
find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete 2>&1 | tee -a "$LOG_FILE"
log_message "Old backups cleanup completed"

log_message "Backup process finished"
