#!/bin/bash
# cpu_temp_monitor.sh - Monitor CPU temperature and alert if threshold exceeded
# Usage: ./cpu_temp_monitor.sh [threshold_celsius]

THRESHOLD=${1:-80}
LOG_FILE="/var/log/cpu_temp_monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

# Check if sensors command is available
if ! command -v sensors &> /dev/null; then
    log "ERROR: 'sensors' command not found. Install lm-sensors: sudo apt install lm-sensors"
    exit 1
fi

log "=== CPU Temperature Check (Threshold: ${THRESHOLD}°C) ==="

ALERT=0
while IFS= read -r line; do
    if [[ "$line" =~ Core\ ([0-9]+).*\+([0-9]+\.[0-9]+)°C ]]; then
        CORE="${BASH_REMATCH[1]}"
        TEMP="${BASH_REMATCH[2]}"
        TEMP_INT=${TEMP%.*}
        if (( TEMP_INT >= THRESHOLD )); then
            log "WARNING: Core $CORE temperature ${TEMP}°C exceeds threshold ${THRESHOLD}°C!"
            ALERT=1
        else
            log "OK: Core $CORE temperature ${TEMP}°C"
        fi
    fi
done < <(sensors)

if (( ALERT == 0 )); then
    log "All CPU cores within safe temperature range."
else
    log "ALERT: One or more CPU cores exceeded the temperature threshold!"
    # Optionally send an email alert
    # echo "CPU temperature alert on $(hostname)" | mail -s "CPU Temp Alert" root
fi

log "=== Check Complete ==="
exit $ALERT
