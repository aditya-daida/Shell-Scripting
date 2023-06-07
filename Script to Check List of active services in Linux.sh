#!/bin/bash

# Get the list of active services
active_services=$(systemctl list-units --type=service --state=active --no-pager --plain | awk '{print $1}')

# Display the active services
echo "Active services:"
echo "$active_services"
