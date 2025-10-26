#!/bin/bash
# Disk usage monitor

LOG_FILE="/var/log/maintenance.log"
THRESHOLD=80

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "$(date): WARNING - Disk usage is at $USAGE%!" | tee -a "$LOG_FILE"
else
    echo "$(date): Disk usage is normal at $USAGE%." | tee -a "$LOG_FILE"
fi
