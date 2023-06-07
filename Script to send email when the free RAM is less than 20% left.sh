#!/bin/bash

# Configuration
EMAIL_RECIPIENT="your_email@example.com"  # Email address to receive the alert
THRESHOLD_PERCENTAGE=20  # Minimum free RAM percentage to trigger the alert

# Get the free RAM percentage
free_output=$(free -m)
total_ram=$(echo "$free_output" | awk 'NR==2{print $2}')
free_ram=$(echo "$free_output" | awk 'NR==2{print $4}')
used_ram=$(echo "$free_output" | awk 'NR==2{print $3}')
used_percentage=$((used_ram * 100 / total_ram))
free_percentage=$((100 - used_percentage))

# Check if the free RAM is below the threshold
if [ "$free_percentage" -lt "$THRESHOLD_PERCENTAGE" ]; then
  # Send an email alert
  subject="Low Free RAM Alert"
  message="Free RAM is below ${THRESHOLD_PERCENTAGE}%. Current free RAM: ${free_ram}MB (${free_percentage}%)."
  echo "$message" | mail -s "$subject" "$EMAIL_RECIPIENT"
  echo "Low free RAM alert email sent."
else
  echo "Free RAM is above ${THRESHOLD_PERCENTAGE}%. No action required."
fi
