![Docker](../../img/docker.png)
# Docker. Создание собственного образа

#### Заводим контейнер:
```
docker run -it --name eNginx --hostname eNginx ubuntu bash
  apt update
  apt install nginx
 ```
 
#### Превратить контейнер в образ:
```
docker commit eNginx  ep4sh/eNginx
```

#### Запуск
```
docker run ep4sh/eNginx
```

#### Пушим в Hub:
```
docker push ep4sh/eNginx
```
