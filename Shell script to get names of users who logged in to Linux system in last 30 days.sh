#!/bin/bash

# Get the current date
current_date=$(date +"%Y-%m-%d")

# Calculate the date 30 days ago
thirty_days_ago=$(date -d "$current_date -30 days" +"%Y-%m-%d")

# Get the list of users who logged in the last 30 days
users=$(last --since "$thirty_days_ago" --until "$current_date" --format=csv | awk -F',' '{print $1}' | sort -u)

# Output the list of users
echo "Users who logged in the last 30 days:"
echo "$users"
