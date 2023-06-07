#!/bin/bash

# Configuration
DB_HOST="localhost"
DB_USER="username"
DB_PASSWORD="password"
DB_NAME="database_name"

# Create the database
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "CREATE DATABASE $DB_NAME;"
