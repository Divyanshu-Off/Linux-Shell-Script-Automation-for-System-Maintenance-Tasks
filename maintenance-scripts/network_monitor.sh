#!/bin/bash
# Network connectivity monitor with logging

LOG_FILE="/var/log/maintenance.log"
TEST_HOST="8.8.8.8"  # Google DNS
MAX_RETRIES=3
RETRY_DELAY=5

# Function to log messages
log_message() {
    echo "$(date): $1" | tee -a "$LOG_FILE"
}

# Function to check network connectivity
check_connectivity() {
    ping -c 1 -W 2 "$TEST_HOST" > /dev/null 2>&1
    return $?
}

# Function to check DNS resolution
check_dns() {
    nslookup google.com > /dev/null 2>&1
    return $?
}

# Function to get active network interfaces
get_active_interfaces() {
    ip -br link show up | grep -v "lo" | awk '{print $1}'
}

# Main monitoring logic
log_message "Starting network connectivity check"

# Check if network interfaces are up
active_interfaces=$(get_active_interfaces)
if [ -z "$active_interfaces" ]; then
    log_message "ERROR: No active network interfaces found"
    exit 1
else
    log_message "Active network interfaces: $active_interfaces"
fi

# Check internet connectivity with retries
retry_count=0
while [ $retry_count -lt $MAX_RETRIES ]; do
    if check_connectivity; then
        log_message "SUCCESS: Internet connectivity is working (ping to $TEST_HOST)"
        
        # Check DNS resolution
        if check_dns; then
            log_message "SUCCESS: DNS resolution is working"
        else
            log_message "WARNING: DNS resolution failed"
        fi
        
        # Display current network statistics
        log_message "Network statistics:"
        netstat -i 2>&1 | tee -a "$LOG_FILE"
        
        exit 0
    else
        retry_count=$((retry_count + 1))
        if [ $retry_count -lt $MAX_RETRIES ]; then
            log_message "WARNING: Connectivity check failed, retrying ($retry_count/$MAX_RETRIES)..."
            sleep $RETRY_DELAY
        fi
    fi
done

log_message "ERROR: Network connectivity check failed after $MAX_RETRIES attempts"
exit 1
