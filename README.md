# moodle-docker-bitnami

- Default docker-compose.yml file: 

```ruby
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
      - PUID=998
      - PGID=100
    volumes:
      - /root/moodle/<school name>/:/bitnami/moodle
      - /root/moodle_data/<school name>/:/bitnami/moodledata
    depends_on:
      - mariadb
    links:
      - mariadb:mariadb
````
- Configs:
  
| Ebslp  | Second Header |
| ------------- | ------------- |
| 172.22.130.131:8081  | Content Cell  |
| 8443:8443  | Content Cell  |
| 3306:3306  | Content Cell  |
