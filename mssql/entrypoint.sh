#!/bin/bash

# Run init-script with long timeout - and make it run in the background
/opt/mssql-tools/bin/sqlcmd -S localhost -l 60 -U sa -P 'anything123!' -i /docker-entrypoint-initdb.d/init.sql &
# Start SQL server
/opt/mssql/bin/sqlservr
