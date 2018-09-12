# Основано на [nginx+uwsgi](https://github.com/ep4sh/edu/blob/master/SysAdm/nginx-uwsgi.md)
В качестве frontend-сервера крутится Nginx.  
А хотим многого - PYTHON приложений, например Flask`овых, запущенных на одном сервере:

```
root@server:~# ls /srv/flask-uwsgi*

/srv/flask-uwsgi:
app.py  __pycache__  static  uwsgi.ini  venv

/srv/flask-uwsgi2:
app.py  __pycache__  static  uwsgi.ini  venv
```

У `uwsgi` есть такой режим **Император** - [Emperor](https://uwsgi-docs.readthedocs.io/en/latest/Emperor.html) для удовлетворения наших хотелок.  
У Императора есть **вассалы** (vassals) - наши инстансы приложений.  
Логика простая: умер вассал - император поднял его из могил, умер император - умерли все :)

При прочих равных, лучше настроить данный режим сразу - сэкономит временя, ибо **DRY** и приличная структура.

Создаёем папку для конфигов:
```
sudo mkdir -p /etc/uwsgi/vassals/
```
Кладём в неё конфиги приложух:
```
ln -s /srv/flask-uwsgi/uwsgi.ini /etc/uwsgi/vassals/flask1.ini
ln -s /srv/flask-uwsgi/uwsgi.ini /etc/uwsgi/vassals/flask2.ini
```
Каждый конфиг примерно такого содержания:
```
[uwsgi]
socket=127.0.0.1:5588
uid=1002
gid=1003
module = app
callable = app
wsgi_file = /srv/flask-uwsgi/app.py
chdir=/srv/flask-uwsgi 
master = true
virtualenv = /srv/flask-uwsgi/venv/
processes = 2
```

Топаем в `/etc/nginx/sites-available`

Например, первый VH (`cat /etc/nginx/sites-available/flaskapp1.conf), слушает запросы на порту 80 (стагдартный):
```
server {
    listen 80;
    server_tokens off;
    server_name localhost;

     location / {
	try_files $uri @app;
	}
     
     location @app {
 	uwsgi_pass 127.0.0.1:5588;
        include uwsgi_params;
	}


     location /static {
         root /srv/flask-uwsgi;
     }
}
```


Второй VH (`cat /etc/nginx/sites-available/flaskapp2.conf), слушает запросы на порту 8080 (и так далее):

```
server {
    listen 8080;
    server_tokens off;
    server_name localhost8080;

     location / {
	try_files $uri @app;
	}
     
     location @app {
 	uwsgi_pass 127.0.0.1:5589;
        include uwsgi_params;
	}


     location /static {
         root /srv/flask-uwsgi2;
     }
}
```


Добавим ссылок в /etc/nginx/sites-enabled:  
```
ln -s /etc/nginx/sites-available/flaskapp1.conf /etc/nginx/sites-enabled/flaskapp1.conf 
ln -s /etc/nginx/sites-available/flaskapp2.conf /etc/nginx/sites-enabled/flaskapp2.conf 
```
Запускаем:
```
uwsgi --emperor /etc/uwsgi/vassals
```
********************************************************

Осталось дописать systemd-скрипт)  

Добавляем сам systemd-сервис, например, `/etc/systemd/system/uwsgi-emperor.service` :
```
[Unit]
Description=uWSGI in Emperor mode
After=syslog.target

[Service]
ExecStart= /usr/local/bin/uwsgi --emperor /etc/uwsgi/vassals
ExecStop= /bin/killall uwsgi

[Install]
WantedBy=multi-user.target

```

Обратите внимание на `/usr/local/bin/uwsgi --emperor /etc/uwsgi/vassals` - использовать именно его а не `/usr/bin/uwsgi` - получил головную боль при отладке.
