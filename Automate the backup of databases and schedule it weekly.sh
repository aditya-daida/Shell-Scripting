#!/bin/bash

# Configuration
DB_USER="your_database_username"
DB_PASSWORD="your_database_password"
DB_HOST="your_database_host"
DB_NAME="your_database_name"
BACKUP_DIR="/path/to/backup/directory"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Generate a unique filename for the backup
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_$(date +%Y%m%d%H%M%S).sql"

# Dump the database to a SQL file
mysqldump -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Database backup created successfully: $BACKUP_FILE"
else
  echo "Error creating database backup"
  exit 1
fi
