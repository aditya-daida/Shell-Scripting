#!/bin/bash

# Check the list of users with root permissions
root_users=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
sudo_users=$(grep -Po '^sudo.+:\K.*$' /etc/group | tr ',' '\n')

# Output the list of users with root permissions
echo "Root Users:"
echo "$root_users"

echo "Sudo Users:"
echo "$sudo_users"
