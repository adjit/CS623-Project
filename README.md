# CS623-Project
Project for CS623

Using MySQL this project creates a database for Conference_Review. This particular project utilizes Docker and a container running mysql in order to execute and run the database.

## MySQL Database Tables
+-----------------------------+
| Tables_in_Conference_Review |
+-----------------------------+
| ASSIGNED_PAPER              |
| AUTHORS                     |
| HAS_TOPIC                   |
| PAPERS                      |
| REVIEW                      |
| REVIEWER                    |
| SUBMITS_PAPER               |
| SUBMITS_REVIEW              |
| TOPIC                       |
+-----------------------------+

## Commands to create the docker container and enter the MySQL database


###### pull the MySQL container from docker
> `docker pull mysql`

###### While in the root of the project run the below commands in order in order to 
> `docker build -t [image-name] .`

> `docker run -it --name [container-name] -e MYSQL_ROOT_PASSWORD=pass -d [image-name]`

> `docker exec -it [container-name] bash`

> `mysql -u root -p`
[enter-password] = pass

> `use Conference_Review`

> `show tables;`

