![Docker](../../img/docker.png)
# Docker. Docker-compose


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
