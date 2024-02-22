#!/bin/bash

# Extract database credentials from docker-compose.yml
DB_USER=$(grep MYSQL_USER docker-compose.yml | cut -d ':' -f 2 | tr -d ' ')
DB_PASSWORD=$(grep MYSQL_PASSWORD docker-compose.yml | cut -d ':' -f 2 | tr -d ' ')
DB_NAME=$(grep MYSQL_DATABASE docker-compose.yml | cut -d ':' -f 2 | tr -d ' ')

# Test database connection
echo "Testing database connection..."
mysql -h db -P 3306 -u$DB_USER -p$DB_PASSWORD -e "USE $DB_NAME; SELECT DATABASE();" && echo "Database connection successful." || echo "Database connection failed."
