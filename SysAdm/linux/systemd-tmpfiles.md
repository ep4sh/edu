# Systemd-tmpfiles.

Однажды так случилось, что я запилил tmpfs (ramdisk) для логов - суть таких логов была смотреть их, но не хранить.
Логов было достаточно много и писались они уж очень интенсивно.
Естестенно при выключении включении файлы логов стирались, создавались демонами, но при переключение демонов на рабочего юзера (а стартовали они от root), происходила беда - процессы не могли писать в лог-файл - **Permission denied**.

Как же создавать файлы при загрузке системы?
Нам помогу **systemd-tmpfiles**!

Создаем руками конфиг: `[root@X]# cat /etc/tmpfiles.d/mail.conf`:
```
f /var/log/ramdisk/log1.log  755 root root - -
f /var/log/ramdisk/log2.log  755 root root - -
f /var/log/ramdisk/log3.log  755 root root - -
```
  `f` - создаст файл, если его нет
  `/var/log/ramdisk/log3.log` - путь, гле ему лежать
  `755` - права на файл
  `root root` - User Group
  `- -` - Возраст / Аргумент (подробнее см. в TMPFILES.D(5) )

Конфиг есть теперь создадим systemd-сервис `[root@X~]# vim /etc/systemd/system/tmpfiles.service` :
```
[Unit]
Description=Creates log files on RAM disk (tmpfs)
Requires=syslog.socket
After=syslog.service
Wants=syslog.service


[Service]
Type=oneshot
ExecStart=/bin/systemd-tmpfiles
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Перезагружаем конфиги, старуем, добавляем в автозагрузку при старте:
```
[root@X~]# systemctl daemon-reload
[root@X~]# systemctl start tmpfiles
[root@X~]# systemctl enable tmpfiles
```
