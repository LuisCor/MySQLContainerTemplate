FROM mysql:latest as db_vet

#Define the password for Mysql root user
ENV MYSQL_ROOT_PASSWORD=mysqldb

#Copy the script that setsup the database for server connection
#   It's executed after mysql is fully initiated
COPY setup.sql /docker-entrypoint-initdb.d/

#Expose the network port for mysql
EXPOSE 3306

### Commands to directly run the containter with no docker-compose
#FOR WINDOWS
# Get-Content Dockerfile | docker build -t mysqlcustom .

#docker run --name db_vet -d mysqlcustom