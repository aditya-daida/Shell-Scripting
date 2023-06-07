#!/bin/bash

# Configuration
EMAIL_RECIPIENT="your_email@example.com"  # Email address to receive the alert
THRESHOLD_PERCENTAGE=80  # Maximum CPU load percentage to trigger the alert

# Get the CPU load average
load_average=$(uptime | awk -F'load average:' '{print $2}' | awk -F, '{print $1}' | awk '{print $1}')

# Remove leading whitespaces
load_average=$(echo "$load_average" | awk '{$1=$1};1')

# Convert the load average to integer
load_average_int=${load_average/.*}

# Check if the CPU load exceeds the threshold
if [ "$load_average_int" -gt "$THRESHOLD_PERCENTAGE" ]; then
  # Send an email alert
  subject="High CPU Load Alert"
  message="CPU load is above ${THRESHOLD_PERCENTAGE}%. Current load average: ${load_average}"
  echo "$message" | mail -s "$subject" "$EMAIL_RECIPIENT"
  echo "High CPU load alert email sent."
else
  echo "CPU load is below ${THRESHOLD_PERCENTAGE}%. No action required."
fi
