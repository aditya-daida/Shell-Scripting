#!/bin/bash

# Configuration
SYSTEMS_FILE="systems.txt"  # File containing the list of system IP addresses or hostnames
ALERT_EMAIL="your_email@example.com"  # Email address to receive alerts

# Function to send an alert via email
send_email_alert() {
  local message=$1
  echo "$message" | mail -s "System Connectivity Alert" "$ALERT_EMAIL"
}

# Read the systems file and loop through each system
while IFS= read -r system; do
  # Ping the system to check connectivity
  if ! ping -c 1 "$system" >/dev/null; then
    # System is not reachable, generate an alert
    alert_message="System $system is not reachable!"
    send_email_alert "$alert_message"
  fi
done < "$SYSTEMS_FILE"
