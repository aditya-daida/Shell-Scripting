#!/bin/bash

# Configuration
SOFTWARE_NAME="software_name"  # Replace with the name of the software you want to check

# Check if the software is installed
if dpkg -s "$SOFTWARE_NAME" >/dev/null 2>&1; then
    echo "$SOFTWARE_NAME is installed."
else
    echo "$SOFTWARE_NAME is not installed."
fi



#!/bin/bash

# Configuration
SOFTWARE_NAME="software_name"  # Replace with the name of the software you want to check

# Check if the software is installed
if rpm -q "$SOFTWARE_NAME" >/dev/null 2>&1; then
    echo "$SOFTWARE_NAME is installed."
else
    echo "$SOFTWARE_NAME is not installed."
fi
