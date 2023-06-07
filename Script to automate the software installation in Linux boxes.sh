#!/bin/bash

# Configuration
SOFTWARE_PACKAGE="software_package_name"  # Replace with the actual software package name
INSTALLATION_COMMAND="apt-get install -y"  # Replace with the appropriate package manager command

# Check if the software is already installed
if command -v "$SOFTWARE_PACKAGE" >/dev/null 2>&1; then
  echo "Software is already installed: $SOFTWARE_PACKAGE"
  exit 0
fi

# Update package lists (optional)
# Uncomment the appropriate command for your package manager

# apt
# $INSTALLATION_COMMAND update

# yum
# $INSTALLATION_COMMAND update

# Install the software
$INSTALLATION_COMMAND "$SOFTWARE_PACKAGE"

# Check if the installation was successful
if [ $? -eq 0 ]; then
  echo "Software installed successfully: $SOFTWARE_PACKAGE"
else
  echo "Error installing software: $SOFTWARE_PACKAGE"
  exit 1
fi
