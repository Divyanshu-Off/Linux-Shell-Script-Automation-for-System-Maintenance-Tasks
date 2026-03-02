#!/bin/bash
# port_scanner.sh - Scan open ports on localhost or a specified host
# Usage: ./port_scanner.sh [host] [start_port] [end_port]
# Example: ./port_scanner.sh localhost 1 1024

HOST=${1:-localhost}
START_PORT=${2:-1}
END_PORT=${3:-1024}
LOG_FILE="/var/log/port_scanner.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
OPEN_PORTS=()

log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

log "=== Port Scan: $HOST (Ports $START_PORT-$END_PORT) ==="
echo "Scanning $HOST from port $START_PORT to $END_PORT..."

for ((port=START_PORT; port<=END_PORT; port++)); do
    (echo >/dev/tcp/$HOST/$port) 2>/dev/null && OPEN_PORTS+=("$port")
done

if [ ${#OPEN_PORTS[@]} -eq 0 ]; then
    log "No open ports found on $HOST in range $START_PORT-$END_PORT"
else
    log "Open ports on $HOST: ${OPEN_PORTS[*]}"
    echo ""
    echo "Open ports:"
    for p in "${OPEN_PORTS[@]}"; do
        SERVICE=$(getent services "$p/tcp" 2>/dev/null | awk '{print $1}' || echo "unknown")
        echo "  Port $p/tcp - ${SERVICE:-unknown}"
    done
fi

log "=== Scan Complete ==="
