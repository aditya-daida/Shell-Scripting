#!/bin/bash

# Configuration
MONITORING_DIR="/path/to/monitoring"
MONITORING_INTERVAL="5"  # Interval in minutes

# Create monitoring directory if it doesn't exist
mkdir -p "$MONITORING_DIR"

# Install sysstat if not already installed
if ! dpkg -s sysstat >/dev/null 2>&1; then
  apt-get install -y sysstat
fi

# Configure sysstat
sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
sed -i "s/^\*.*\/10 \* \* \* \* root .*\/usr\/lib\/sysstat\/sa/sudo \/usr\/lib\/sysstat\/sa/g" /etc/cron.d/sysstat

# Set up cron job to collect system metrics
(crontab -l ; echo "*/$MONITORING_INTERVAL * * * * /usr/lib/sysstat/sadc -F -S ALL -O $MONITORING_DIR/sa$(date +\%Y\%m\%d\%H\%M)") | crontab -

# Restart sysstat service
systemctl restart sysstat

echo "System monitoring has been set up successfully."
