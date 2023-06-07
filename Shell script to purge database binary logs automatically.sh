#!/bin/bash

# Configuration
DB_USER="username"  # Replace with the database username
DB_PASSWORD="password"  # Replace with the database password
DB_HOST="localhost"  # Replace with the database host
MAX_BINLOG_SIZE="100M"  # Maximum size of binary logs to retain

# Purge binary logs in MySQL
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "PURGE BINARY LOGS BEFORE NOW() - INTERVAL 1 DAY;"

# Optional: Check binary log size and purge if it exceeds the maximum size
BINLOG_SIZE=$(mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "SHOW BINARY LOGS;" | awk '{ sum+=$2 } END { print sum }')
if [[ "$BINLOG_SIZE" > "$MAX_BINLOG_SIZE" ]]; then
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "PURGE BINARY LOGS BEFORE NOW() - INTERVAL 1 DAY;"
fi
