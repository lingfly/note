
docker run --name mysql8.0 -e MYSQL_ROOT_PASSWORD=a12345 -d -p 3306:3306 mysql

docker exec -it  mysql8.0 /bin/bash

mysql -uroot -p

alter user 'root'@'%' identified with mysql_native_password by 'a12345';

flush privileges;