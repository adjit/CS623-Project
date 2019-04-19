# CS623-Project
Project for CS623


docker build -t [image-name] .

docker run -it --name [container-name] -e MYSQL_ROOT_PASSWORD=pass -d [image-name]

docker exec -it [container-name] bash

mysql -u root -p
[enter-password]