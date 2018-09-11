Ставим софта и создаем папку проектов:
```
sudo apt-get install nginx python3 virtualenv
sudo mkdir /srv/flask-uwsgi/
```

Создаём пользователя, ставим его владельцем, даруем права
```
sudo useradd -s /bin/false -d /srv/flask-uwsgi flask-uwsgi
sudo chown -Rc flask-uwsgi:www-data /srv/flask-uwsgi
sudo chmod -R 0755 /srv/flask-uwsgi
```

логинимся, создаем venv, ставим Flask
```
sudo su - flask-uwsgi -s /bin/bash
virtualenv -p python3 venv
. venv/bin/activate
pip install Flask
pip install uwsgi
```

Сохраняем как app.py
```
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello world!ZZ"

if __name__ == "__main__":
    app.run()

```

Создаём папку для статики:
```
mkdir static
```

vim uwsgi.ini (на одном уровне с app.py)
```
[uwsgi]
# Имя модуля и приложения, которое запустит uWSGI
module = app
callable = app

pidfile=/tmp/uwsgi
virtualenv=/srv/flask-uwsgi/venv/
pythonpath = /srv/flask-uwsgi/venv/bin/
chdir=/srv/flask-uwsgi/

master = true
# Количество процессов uWSGI
processes = 5

# Указываем где создавать файл-сокет
socket=127.0.0.1:5588

# Указываем пользователя и группу под которыми выполнять приложение
uid = flask-uwsgi
gid = www-data

# Удаляем временные файлы uWSGI при выключении
vacuum = true

no-site=True

log-syslog = uwsgi-logs
```




Уходим
```
CTRL+D
```
****************************************

sudo vim /etc/nginx/sites-available/flask-uwsgi.conf

```
server {
    listen 80;
    server_tokens off;
    server_name rxlab.ru;

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


```
sudo ln -s /etc/nginx/sites-available/flask-uwsgi.conf /etc/nginx/sites-enabled/
sudo systemctl reload nginx
```


vim /etc/systemd/system/flask-uwsgi.service

```
[Unit]
Description=uWSGI instance to serve flask-uwsgi project
After=network.target

[Service]
User=flask-uwsgi
Group=www-data
WorkingDirectory=/srv/flask-uwsgi
Environment="PATH=/srv/flask-uwsgi/venv/bin"
ExecStart=/srv/flask-uwsgi/venv/bin/uwsgi --ini uwsgi.ini

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl start flask-uwsgi
sudo systemctl status flask-uwsgi
sudo systemctl enable flask-uwsgi
```

