
![Docker](../../img/docker.png)
# Docker. Dockerfile

#### Указываем базовый образ(обязательно!):
```
FROM ubuntu
```

#### Команды 
```
RUN apt-get update && apt-get install -y wget scrot lsb-release && wget https://github.com/downloads/djmelik/archey/archey-0.2.8.deb && dpkg -i archey-0.2.8.deb && archey
```

#### Точка входа - запуск приложения **по умолчанию** при обращении к контейнеру.
```
ENTRYPOINT ["archey"]
```

#### Создаем имидж:
```
docker built -t ep4sh/archey .
```

### Другие опции Dockerfile:

#### Связь с создателем(?ха!) образа:  
```
MAINTAINER ep4sh <ep4sh2k@gmail.com>
```
