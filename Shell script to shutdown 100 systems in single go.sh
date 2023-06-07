#!/bin/bash

# Configuration
USERNAME="your_username"  # Replace with your username
PASSWORD="your_password"  # Replace with your password (consider using SSH key-based authentication instead)
SYSTEMS=("system1" "system2" "system3" ...)  # Replace with the list of systems you want to shutdown

# Iterate through the systems and initiate the shutdown command
for system in "${SYSTEMS[@]}"; do
  sshpass -p "$PASSWORD" ssh "$USERNAME@$system" "sudo shutdown -h now"
done
