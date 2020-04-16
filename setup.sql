CREATE DATABASE db_vetClinic;

USE db_vetClinic;

CREATE USER 'server'@'%' IDENTIFIED BY 'serverpassword';

GRANT ALL ON db_vetClinic.* TO 'server'@'%';

FLUSH PRIVILEGES;
