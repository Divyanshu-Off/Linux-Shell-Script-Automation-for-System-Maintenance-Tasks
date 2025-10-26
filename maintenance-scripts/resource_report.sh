#!/bin/bash
# System resource usage report

LOG_FILE="/var/log/maintenance.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2+$4}')
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK=$(df -h / | awk '/\// {print $5}')

echo "$TIMESTAMP: CPU: $CPU%, Memory: $MEM%, Disk: $DISK used." | tee -a "$LOG_FILE"
