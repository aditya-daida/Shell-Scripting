#!/bin/bash

# Configuration
LOG_DIR="/path/to/logs"

# Calculate the timestamp for 1 week ago
one_week_ago=$(date -d "1 week ago" +%s)

# Find and delete logs older than 1 week
find "$LOG_DIR" -type f -mtime +7 -name "*.log" -exec rm {} \;
