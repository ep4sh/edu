![Docker](../../img/docker.png)
# Docker. Связка контейнеров

#### Установка PostgreSQL:
```
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
```

Скачиваем образ adminer и линкуем его с  *some-postgres*
Через двоеточие указывается имя(*pg*), которое будет просано в /etc/hosts контейнера adminer для обращений в СУБД.  

*6666* - локальный порт  
*8080* - порт в контейнере  

```
docker run --link some_database:db -p 6666:8080 adminer
```

![Docker-compose](https://raw.githubusercontent.com/docker/compose/master/logo.png)
### Используем Docker Stack / Docker compose

#### Используем язык разметки YAML
```
# Use postgres/example user/password credentials
version: '3.1'

services:

  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 6666:8080
```

Каждый инстанс может быть создан  не только из ```image```, но можно подсунуть целый ```Dockerfile```  
Для этого нужно указать вместо ```image``` переменную ```build```:  
```
  adminer:
    build: dir/Docker
    restart: always
    ports:
      - 6666:8080
```
