#!/bin/bash
set -e

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1" > /dev/null 2>&1
while [ $? -ne 0 ]
do
    echo "SQL Server is starting..."
    sleep 1
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1" > /dev/null 2>&1
done
echo "SQL Server started."

# Run initialization scripts
echo "Initializing database..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -i /docker-entrypoint-initdb.d/init.sql
echo "Database initialized successfully."

# Keep the container running
tail -f /dev/null