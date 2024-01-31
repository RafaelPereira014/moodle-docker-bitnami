# moodle-docker-bitnami
> [!TIP]
> I advise you to use portainer.io for containers management.

###Default docker-compose.yml file: 

```Dockerfile
version: '3'
services:
  mariadb:
    image: mariadb
    container_name: mariadb
    ports:
      - 330x:330x
    volumes:
      - /root/mariadb_data/<school_name>/:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=<school db passwdord>
      - MYSQL_ROOT_USER=root
      - MYSQL_DATABASE=Mod31_<school name>
      - ALLOW_EMPTY_PASSWORD=yes
  moodle:
    image: bitnami/moodle:latest
    container_name: moodle
    ports:
      - 808x:8080
      - 844x:844x
    environment:
      - MOODLE_DATABASE_HOST=mariadb
      - MOODLE_DATABASE_USER=root
      - MOODLE_DATABASE_PASSWORD=<school db passwdord>
      - MOODLE_DATABASE_NAME= Mod31_<school name>
      - ALLOW_EMPTY_PASSWORD=yes
    volumes:
      - /root/moodle/<school name>/:/bitnami/moodle
      - /root/moodle_data/<school name>/:/bitnami/moodledata
    depends_on:
      - mariadb
    links:
      - mariadb:mariadb
````
###Change file Upload limits (if needed)
```txt

inside container on portainer.io:
-> acess container console

-> nano /opt/bitnami/php/etc/php.ini

-> locate upload_max_filesize and post_max_size and increase to the desired values

-> apachectl restart


```
