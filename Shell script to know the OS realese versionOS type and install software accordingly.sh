#!/bin/bash

# Get the list of open ports and their corresponding names
open_ports=$(lsof -i -P -n | grep LISTEN | awk '{print $9}')

# Output the open ports and their names
echo "Open Ports:"
echo "$open_ports"
