#!/bin/bash
# Service health check - verifies critical system services are running

LOG_FILE="/var/log/maintenance.log"
SERVICES=("sshd" "cron" "rsyslog")
FAILED=0

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$(date): [OK] $SERVICE is running." | tee -a "$LOG_FILE"
    else
        echo "$(date): [WARN] $SERVICE is NOT running!" | tee -a "$LOG_FILE"
        FAILED=$((FAILED + 1))
    fi
done

if [ "$FAILED" -gt 0 ]; then
    echo "$(date): $FAILED service(s) require attention." | tee -a "$LOG_FILE"
else
    echo "$(date): All services are healthy." | tee -a "$LOG_FILE"
fi
