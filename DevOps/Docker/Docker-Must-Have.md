# Must have info about Docker

#### Чтобы выйти из контейнера а он остался запущенным нужно в shell нажать комбинацию клавиш :

```
Ctrl+p, Ctrl+q
```

#### Чтобы войти в запущенный контейнер надо выполнить команду:
```
docker exec -it имя_контейнера /bin/bash
```

### Работа с контейнерами
  Запуск контейнера с образа на 80 порту:
  ```
docker run --name <container-id> -d -p 80:80 <image name>
```
  * Просмотр запущенных и остановленных контейнеров  
```docker ps -a ```

  * Для подсоединения к запущенному контейнеру  
```docker attach <container-id> ```

  * Запуск контейнера  
```docker start <container-id>```

  * Oстановка запущеного контейнера  
```docker stop <container-id>```

 * Перезагрузка запущеного контейнера  
```docker restart <container-id>```

  * Выключение запущеного контейнера  
```docker kill <container-id>```

  * Удаление остановленного контейнера  
```docker rm <container-id>```

  * Удалить все оставшиеся контейнеры  
```docker rm `docker ps -a -q` ```

  * Создание нового образа с контейнера  
```docker commit <container-id> <image name> ```

  * Копирование файла с контейнера на хост  
```docker cp <container-id>:/etc/passwd . ```

 * Просмотр информации о контейнере  
``` docker inspect <container-id> ```

 * Посмотреть ip адрес запущеного контейнера  
``` docker inspect --format="{{.NetworkSettings.IPAddress}}" <container-id>  ```

 * Посмотреть log контейнера  
``` docker logs <container-id> ```

 * Посмотреть список процессов контейнера  
``` docker top <container-id> ```

 * Переименовать контейнер  
``` docker rename <default name> <new name> ```

 * История команд для данного контейнера  
``` docker history <container-id> ```


### Работа с образами

* создание образа с помощью build файла.  
```docker build -t <image name> .  ```

* Поиск образа по ключевому слову  
``` docker search <WORD>```

* Список всех локальных образов  
``` docker images ```

* Запись измененого контейнера под другим именем в локальное хранилище  
``` docker commit <container-id> <new-image-name> ```

* Скачать последний образ в локальное хранилище  
``` docker pull <image name> ```

* Скачать образ версии NUMBER в локальное хранилище  
``` docker pull <image name><:number> ```

*  Удалить контейнер с локального хранилища  
 ```docker rmi <image-id>```

*  Удалить запущеный контейнер с локального хранилища  
``` docker rmi -f <image-id>```

*  Удалить ВСЕ образы  
``` docker rmi $(docker images -q) ```

*  Создание образа с tar архива с STDIN  
``` docker load < /tmp/myimage.tar ```

*  Запись образа в tar архив в STDOUT  
``` docker save <image name> > /tmp/myimage.tar ```

* Импорт образа с удаленного файла  
``` docker import http://example.com/exampleimage.tgz   ```

* Импорт с локального файла  
``` docker import - exampleimagelocal:new ```

* Импорт с локальной директории   
``` docker import - exampleimagedir  ```
