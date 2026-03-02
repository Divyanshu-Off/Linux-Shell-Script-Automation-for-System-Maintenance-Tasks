#!/bin/bash
# user_audit.sh - Audit system user accounts and report anomalies
# Usage: ./user_audit.sh

LOG_FILE="/var/log/user_audit.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
REPORT_FILE="/tmp/user_audit_report_$(date +%Y%m%d).txt"

log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

log "=== User Audit Report ==="
echo "User Audit Report - $DATE" > "$REPORT_FILE"
echo "======================================" >> "$REPORT_FILE"

# List all users with UID >= 1000 (non-system users)
echo -e "\n[Regular Users (UID >= 1000)]" >> "$REPORT_FILE"
awk -F: '$3 >= 1000 && $3 != 65534 { print $1, "UID:"$3, "Home:"$6, "Shell:"$7 }' /etc/passwd >> "$REPORT_FILE"

# List users with empty passwords
echo -e "\n[Users with Empty Passwords]" >> "$REPORT_FILE"
awk -F: '($2 == "" || $2 == "!") { print $1 }' /etc/shadow 2>/dev/null >> "$REPORT_FILE" || echo "  (requires root)" >> "$REPORT_FILE"

# List users with UID 0 (root privileges)
echo -e "\n[Users with UID 0 (root-level)]" >> "$REPORT_FILE"
awk -F: '$3 == 0 { print $1 }' /etc/passwd >> "$REPORT_FILE"

# List currently logged-in users
echo -e "\n[Currently Logged-In Users]" >> "$REPORT_FILE"
who >> "$REPORT_FILE"

# List users who have sudo access
echo -e "\n[Users in sudo/wheel Group]" >> "$REPORT_FILE"
getent group sudo wheel 2>/dev/null | awk -F: '{ print $1": "$4 }' >> "$REPORT_FILE"

# Last login info
echo -e "\n[Last Login Info]" >> "$REPORT_FILE"
lastlog 2>/dev/null | grep -v "Never logged in" | head -20 >> "$REPORT_FILE"

cat "$REPORT_FILE"
log "Audit report saved to $REPORT_FILE"
log "=== Audit Complete ==="
