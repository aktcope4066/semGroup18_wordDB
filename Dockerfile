# Use the MySQL image version 8.3 (allows native password plugin)
FROM mysql:8.3
# Set the working directory
WORKDIR /tmp
# Copy all the files to the working directory of the container
COPY worldDB/*.sql /tmp/
COPY worldDB/*.dump /tmp/
# Copy the main SQL file to docker-entrypoint-initdb.d.
# Scripts and SQL files in this folder are executed on container startup.
# This is specific to MySQL.
COPY test_db/employees.sql /docker-entrypoint-initdb.d
# Set the root password
ENV MYSQL_ROOT_PASSWORD example