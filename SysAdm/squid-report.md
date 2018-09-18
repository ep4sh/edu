Для создания аккуратных репортов в Squid нам нужен:
- `lightsquid`
- `squid`, рабочий 1шт.
- apache2, 1шт.
- знание, где лежит `access.log` (у меня `/usr/local/squid/var/log/access.log`, у тебя скорее - `/var/log/access.log`)


я воспользовался симлинком для создания `/var/log/access.log`
```
ln -s /usr/local/squid/var/log/access.log /var/log/access.log
```
Ставим lightsquid - наш создатель отчетов:

```
root@squid:~# apt -y install lightsquid libcgi-pm-perl
```
Изменяем путь к log-файлу:
```
root@squid:~# vim /etc/lightsquid/lightsquid.cfg
$logpath ="/var/log/squid";
```
Редактируем конфиг Apache2:
```
root@squid:~# vi /etc/apache2/conf-available/lightsquid.conf
<Location "/lightsquid/">
    Options +ExecCGI
    AddHandler cgi-script .cgi .pl
```

Вставляем:

```
root@squid:~# a2enmod cgi

Your MPM seems to be threaded. Selecting cgid instead of cgi.
Enabling module cgid.
To activate the new configuration, you need to run:
  service apache2 restart
```

Энаблим:
```
root@squid:~# a2enconf lightsquid

Enabling conf lightsquid.
To activate the new configuration, you need to run:
  service apache2 reload
```
Рестартуем Apache2:
```
root@squid:~# systemctl restart apache2
# generate reports manually
```
Запускаем сборщик 
```
root@squid:~# /usr/share/lightsquid/lightparser.pl
# * reports are generated daily by /etc/cron.d/lightsquid
```
Переходим в браузере:
```
http://<адрес_squid>/lightsquid/
```
