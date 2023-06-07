#!/bin/bash

# Configuration
THRESHOLD=80  # Set the threshold for disk usage percentage
EMAIL_ADDRESS="your_email@example.com"  # Set the email address to receive alerts

# Get disk usage information
disk_usage=$(df -h --output=pcent,target | sed 1d)

# Loop through each line of disk usage information
while IFS= read -r line; do
  # Extract the usage percentage and mount point
  usage=$(echo "$line" | awk '{print $1}' | tr -d '%')
  mount_point=$(echo "$line" | awk '{print $2}')
  
  # Check if disk usage exceeds the threshold
  if [ "$usage" -gt "$THRESHOLD" ]; then
    # Generate alert message
    message="Disk usage on $mount_point is above $THRESHOLD% threshold. Current usage: $usage%"
    
    # Print alert message to console
    echo "$message"
    
    # Send alert via email (requires mail command)
    echo "$message" | mail -s "Disk Usage Alert" "$EMAIL_ADDRESS"
  fi
done <<< "$disk_usage"
