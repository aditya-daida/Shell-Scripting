#!/bin/bash

# Configuration
SOURCE_FILE="path/to/source/file"  # Replace with the path to the source file on the local machine
DESTINATION_HOST="user@destination_host"  # Replace with the username and hostname/IP address of the destination machine
DESTINATION_DIR="path/to/destination/directory"  # Replace with the path to the destination directory on the remote machine

# Transfer the file to the destination machine
scp "$SOURCE_FILE" "$DESTINATION_HOST:$DESTINATION_DIR"
