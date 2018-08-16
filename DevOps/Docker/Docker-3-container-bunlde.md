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

