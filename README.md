## This is a bitnami/moodle example running on docker container.

## The purpose of the project was to deploy N schools from a datacenter into docker containers , to be able to manage them separately , instead of being all on the same server.

> This prevents that when a school is down , dont compromise all the other schools.

![docker_digram](https://github.com/RafaelPereira014/moodle-docker-bitnami/assets/83137321/93e38f80-0d91-4dbe-9c24-715446691a87)

# moodle-docker-bitnami
> [!TIP]
> I advise you to use portainer.io for containers management.

> [!NOTE]
> You must have docker and docker-compose installed on your machine.
### Default docker-compose.yml file: 

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
### Enable HTTPS 
```txt

inside moodle as administrator:
-> Site administration

-> HTTP security

-> HTTPS conversion tool

-> save changes

```
### Change file Upload limits (if needed)
```txt

inside container on portainer.io:
-> acess container console

-> nano /opt/bitnami/php/etc/php.ini

-> locate upload_max_filesize and post_max_size and increase to the desired values

-> apachectl restart
```
### Configure SMTP for emails:
```txt

inside moodle as administrator:
-> server > Outgoing mail configuration
    user: s0204moodleapp
    password:*
    Server: pegasus.azores.gov.pt
    Auth: SMTP + TLS
    Port: 587


```


