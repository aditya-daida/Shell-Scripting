#!/bin/bash

# Configuration
SLACK_WEBHOOK_URL="your_slack_webhook_url"
PAGERDUTY_API_KEY="your_pagerduty_api_key"

# Function to send a Slack alert
send_slack_alert() {
  local message=$1
  curl -s -X POST --data-urlencode "payload={\"text\": \"$message\"}" "$SLACK_WEBHOOK_URL" >/dev/null
}

# Function to send a PagerDuty alert
send_pagerduty_alert() {
  local message=$1
  curl -s -H "Content-Type: application/json" -H "Authorization: Token token=$PAGERDUTY_API_KEY" -X POST -d "{\"incident\":{\"title\":\"Service Down\",\"type\":\"incident\",\"service\":{\"id\":\"YOUR_SERVICE_ID\",\"type\":\"service_reference\"},\"body\":{\"type\":\"incident_body\",\"details\":\"$message\"}}}" "https://api.pagerduty.com/incidents" >/dev/null
}

# Check if a service is running
check_service() {
  local service_name=$1
  local service_status=$(systemctl is-active "$service_name")
  if [ "$service_status" != "active" ]; then
    local message="Service $service_name is down!"
    send_slack_alert "$message"
    send_pagerduty_alert "$message"
  fi
}

# Check services
check_service "service1"
check_service "service2"
# Add more services as needed

