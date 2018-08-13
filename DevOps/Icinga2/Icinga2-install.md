
![Icinga](../../img/icinga.jpg)

# Icinga. Установка

Откладываем грузный ~~Zabbix~~ на дальнюю полку и достаём вкусный **Icinga2**..


Убиваем старый кластер:


```postgres# pg_dropcluster --stop 9.6 zabbix```

Смотрим список текущих кластеров:

```
postgres# pg_lsclusters
```

Создаем директорию:
```
# mkdir -p /postgresql/data/icinga2/
```
Создаем кластер:
```
postgres# pg_createcluster --locale ru_RU.UTF-8 -d /postgresql/data/icinga2/ --start 9.6 icinga2
```

Перегружаем systemd:
```
systemctl daemon-reload
```

vim /etc/postgresql/9.6/icinga2/pg_hba.conf
```
local icinga icinga md5
host icinga icinga 127.0.0.1/32 md5
host icinga icinga ::1/128 md5


local icingaweb2 icingaweb2 md5
host icingaweb2 icingaweb2 127.0.0.1/32 md5
host icingaweb2 icingaweb2 ::1/128 md5
```


#### Качаем ключи по полной и добавляем репы:

```
wget -O - https://packages.icinga.com/icinga.key | apt-key add -
echo 'deb https://packages.icinga.com/debian icinga-stretch main' >/etc/apt/sources.list.d/icinga.list
apt-get update
apt install apt-transport-https -y
apt-get install icinga2 -y
```

Фичи для любимого vim:
```
apt-get install vim-icinga2 vim-addon-manager -y
vim-addon-manager -w install icinga2
vim ~/.vimrc
syntax on
```
Ставим плагины для мониторинга:
```
apt-get install monitoring-plugins -y
```

#### Далее (предпочтительнее):
```
su postgres
psql -p 5438
//и проверить базы
postgres=#CREATE ROLE icinga WITH LOGIN PASSWORD 'icinga';
postgres=# create database icinga with owner icinga;
postgres# createlang plpgsql icinga
```

ЛИБО
```
# apt-get install icinga2-ido-pgsql -y
// и тут отвечая на вопросы настраиваем
# icinga2 feature enable ido-pgsql
```

Перезагружаем кластер
```
postgres# /usr/bin/pg_ctlcluster 9.6 icinga2 restart
```
*************************************

#### ЗАпиливаем api, command, setup- фичи
```
icinga2 api setup
```

 >Внимание!
 >изменить юзера и сохранить пароль: "/etc/icinga2/conf.d/api-users.conf"

```
icinga2 feature enable command
icinga2 feature enable setup
```

Рестартуем icinga2:
```
systemctl restart icinga2
```

Заливаем структуру БД мониторинга:
```
psql -U icinga -d icinga -p 5438 < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql
```

Создаем юзера для WEB:
```
postgres=# CREATE ROLE icingaweb2 WITH LOGIN PASSWORD 'icingaweb2';
postgres=# create database icingaweb2 with owner icingaweb2;
```

Ставим apache2, библиотеки пыхи и icingaWEB2:
```
apt-get install apache2 -y
apt-get install php-pgsql php-gd -y
apt-get install icingaweb2 icingacli -y
```

Заходим:
```
192.168.0.173/icingaweb2/setup


```
 Следуем за белым кроликом...  
 ???   
 PROFIT
