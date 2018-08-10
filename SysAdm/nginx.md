![Nginx](../img/nginx.png)

# Nginx

Конфиг состоит из директив.  
Директива: __простая__ и __блочная__
 * Простая:
```
 listen 80;
 ```
 * Блочная:

```
main
|_______events
|
|_______http
|_______server
|___________location --- обслуживает запрос
|____ =/ --- точное совпадение
|____ ~* --- regexp, без учета регистра
|_____ ~ ---- regexp, с учетом регистра
|_____ ^~ --- не regexp
|_____ @ именованная location
```


************************
#### HTTP BALANCING:
```
upstream backend {
server 10.50.100.1:80 weight=5;
server 10.50.100.2:80 weight=1;
server 10.50.100.3:80 weight=1;

server backup1.exp.com backup;
server backup2.exp.com backup;
}

server {
location / {
proxy_pass http://backend;
}
```

**upstream** --- описывает группу серверов. Серверы могут слушать на разных портах.  
**weight** --- балансировка нагрузки: 5 запросов на 100.1, по одному на 100.2 и 100.3 соответственно.  
**backup** --- помечает сервер как запасной сервер. На него будут передаваться запросы в случае, если не работают основные серверы.  


****************************************

#### TCP STREAM BALANCING

```
stream {
upstream mysql {
server 10.50.100.1:3306 weight=5;
server 10.50.100.2:3306 weight=3;
}

server {
listen 3306;
proxy_pass mysql;
}
```
********************************************

~~Тестовый примерчик для Upd0wn~~

```
upstream _app {
server 127.0.0.1:3031;
}
server {
listen 80;

index index.wsgi index.html index.htm index.py index.php;
server_name upd0wn.ru www.updown.ru;
root /var/www/upd0wn/html;

location / {
try_files $uri @app;
}


location ^~ /img/. {
root /var/www/upd0wn;
}

location ~ .\.(jpg|png|gif)$ {
root /var/www/upd0wn/img/;
}

location ^~ /admin/ {
try_files $uri $uri/ @admin;
}
```


#### HTTP AUTH BASIC
```
location @admin {
auth_basic "PwNz ZONE. F*CK OFF!";
auth_basic_user_file conf.d/passwd;
}

location @app {

uwsgi_pass 127.0.0.1:3031;
include uwsgi_params;
}

############## ERRORS PAGES ###########
error_page 404 /404.html;
location = /40x.html {
}

error_page 500 502 503 504 /50x.html;
location = /50x.html {
}
```


