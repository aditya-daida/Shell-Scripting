#!/bin/bash

# Configuration
MYSQL_HOST="localhost"
MYSQL_USER="username"
MYSQL_PASSWORD="password"
POSTGRES_HOST="localhost"
POSTGRES_USER="username"
POSTGRES_PASSWORD="password"
MONGODB_HOST="localhost"
MONGODB_USER="username"
MONGODB_PASSWORD="password"

# Connect to MySQL and retrieve running processes
mysql_running_processes=$(mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW FULL PROCESSLIST;")

echo "MySQL Running Processes:"
echo "$mysql_running_processes"
echo

# Connect to PostgreSQL and retrieve running processes
export PGPASSWORD="$POSTGRES_PASSWORD"
postgres_running_processes=$(psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c "SELECT * FROM pg_stat_activity;")

echo "PostgreSQL Running Processes:"
echo "$postgres_running_processes"
echo

# Connect to MongoDB and retrieve running processes
mongodb_running_processes=$(mongo "$MONGODB_HOST" --username "$MONGODB_USER" --password "$MONGODB_PASSWORD" --quiet --eval "db.currentOp();")

echo "MongoDB Running Processes:"
echo "$mongodb_running_processes"
echo
