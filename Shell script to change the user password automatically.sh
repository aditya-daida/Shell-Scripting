#!/bin/bash

# Configuration
USERNAME="username"  # Replace with the username of the user whose password you want to change
NEW_PASSWORD="new_password"  # Replace with the new password you want to set

# Change the user's password
echo "$USERNAME:$NEW_PASSWORD" | chpasswd
