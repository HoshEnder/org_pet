docker-compose mysql-compose.yml up -d


docker exec -it local_mysql_db mysql -uroot -p

SHOW GRANTS FOR 'admin'@'%';

GRANT ALL PRIVILEGES ON petclinic.* TO 'admin'@'%';
FLUSH PRIVILEGES;



