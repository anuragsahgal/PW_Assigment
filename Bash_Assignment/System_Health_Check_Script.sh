#!/bin/bash

LOG_FILE="system_health.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d "." -f1)
CPU_USAGE=$((100 - CPU_IDLE))

MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_AVAILABLE=$(free -m | awk '/Mem:/ {print $7}')
MEM_AVAILABLE_PERCENT=$((100 * MEM_AVAILABLE / MEM_TOTAL))

echo "[$TIMESTAMP] CPU Usage: ${CPU_USAGE}% | Available Memory: ${MEM_AVAILABLE_PERCENT}%" >> $LOG_FILE

if [ "$CPU_USAGE" -gt 80 ]; then
    echo "[$TIMESTAMP] WARNING: High CPU usage - ${CPU_USAGE}%" >> $LOG_FILE
fi

if [ "$MEM_AVAILABLE_PERCENT" -lt 20 ]; then
    echo "[$TIMESTAMP] WARNING: Low available memory - ${MEM_AVAILABLE_PERCENT}%" >> $LOG_FILE
fi
