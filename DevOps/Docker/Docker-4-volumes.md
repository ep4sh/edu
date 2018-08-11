![Docker](../../img/docker.png)
# Docker. Volumes


**Волюмы** - отдельные каталоги, являющие каталогами хоста.  
Такие каталоги могут быть примонтированы в ФС контейнера (как *отдельные* ФС)  
 
 Способы создания:  
 1. При запуске, с синхронизацией файлов (на хосте ```/data``` будет расположен в бездне ```/var/lib/..```)  
  ```
  docker run -v /data ubuntu
  ```
 2. В Dockerfile:  
 ```
 VOLUME /data
 ```
 3. Docker-compose:  
```
  volumes: 
    - /path/to/db:/var/lib/pgsql/data
