#!/bin/bash

# Configuration
SERVICE_NAME="service_name"  # Replace with the actual service name

# Check if the service is running
if systemctl is-active --quiet "$SERVICE_NAME"; then
  echo "Service is already running: $SERVICE_NAME"
  exit 0
fi

# Start the service
systemctl start "$SERVICE_NAME"

# Check if the service started successfully
if systemctl is-active --quiet "$SERVICE_NAME"; then
  echo "Service started successfully: $SERVICE_NAME"
else
  echo "Error starting service: $SERVICE_NAME"
  exit 1
fi
