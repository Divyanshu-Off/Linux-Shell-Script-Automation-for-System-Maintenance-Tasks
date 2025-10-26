#!/bin/bash
# Automated system update

LOG_FILE="/var/log/maintenance.log"

sudo apt update 2>&1 | tee -a "$LOG_FILE"
sudo apt upgrade -y 2>&1 | tee -a "$LOG_FILE"
sudo apt autoremove -y 2>&1 | tee -a "$LOG_FILE"
echo "$(date): System updates and upgrades completed." | tee -a "$LOG_FILE"
