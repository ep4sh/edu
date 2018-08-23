```
root@debian-console:~# dpkg --add-architecture i386
root@debian-console:~# dpkg-reconfigure locales
root@debian-console:~# apt-get update -y
```

```
root@debian-console:~# vim /etc/hosts:
192.168.1.100 debian-console
```

```
apt install samba  samba-common cifs-utls xfonts-utils cabextract imagemagick net-tools
```

```
root@debian-console:~# mkdir /files && chmod -R 2777 /files
root@debian-console:~# wget http://ftp.br.debian.org/debian/pool/main/i/icu/libicu48_4.8.1.1-12+deb7u3_amd64.deb
root@debian-console:~# dpkg -i libicu48_4.8.1.1-12+deb7u3_amd64.deb
root@debian-console:~# apt-get install -y wget gnupg2 || apt-get install -y gnupg
root@debian-console:~# echo deb http://repo.postgrespro.ru/pgpro-archive/pgpro-9.6.9.1/debian stretch main > /etc/apt/sources.list.d/postgrespro-std.list
root@debian-console:~# apt-get update -y
root@debian-console:~# apt-get install -y postgrespro-9.6
root@debian-console:~# su - postgres
postgres@debian-console:~$ psql
postgres=# \l
postgres=# \password 
postgres=# \q
postgres@debian-console:~$ logout
```

```
root@debian-console:~# vim /etc/samba/smb.conf 
[global]
        workgroup = WORKGROUP
        server string = Samba Server %v
        netbios name = centos
        security = user
        map to guest = bad user
        dns proxy = no
        passdb backend = tdbsam
        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw
[files]
        path = /files
        browsable =yes
        writable = yes
        guest ok = yes
        read only = no
```
```
root@debian-console:~# service smbd restart
root@debian-console:~# service nmbd restart
```
**************************************************

Так как хранилище конфигурации является **x32** приложением, а **x64** просто нет ~~охуетьтеперь~~ делаем следующее:  

 * ставим x32 сервер (проверяем установился ли пакет crs)
 * копируем директорию i386 в другое место
 * удаляем x32-пакеты
 * ставим x64-пакеты
 * копируем  i386 из другого места :)
 * запускаем сервер.


Собрать все *.deb в одну папку или закинуть архив (/mnt/test -- самба шара нашего 1с сервера):  

```root@EBASH-PC:~# cp -a deb_32.tar.gz /mnt/test```

```
root@debian-console:~# cd /files
root@debian-console:/files# tar xvzf deb_32.tar.gz
root@debian-console:/files# dpkgi -i 1c*


root@debian-console:/files/deb_32# cp -a /opt/1C/v8.3/i386/ /files/i386
root@debian-console:~# cd /files
root@debian-console:/files# apt remove 1c-enterprise83-* -y
root@debian-console:/files# ls /opt (ls: cannot access '/opt': No such file or directory)
```

Собрать все *.deb в одну папку или закинуть архив (/mnt/test -- самба шара нашего 1с сервера):
```
root@EBASH-PC:~# cp -a deb_64.tar.gz /mnt/test
root@debian-console:/files# tar xvzf deb_64.tar.gz
root@debian-console:/files# dpkgi -i 1c*



root@debian-console:/files/# cp -ar /files/i386/ /opt/1C/v8.3/
root@debian-console:/files/#apt-get -f install -y
root@debian-console:/files/#chown -R usr1cv8:grp1cv8 /opt/1C
root@debian-console:/files# service srv1cv83 start
```

Systemd unit для сервера хранилища конфигураций:
```
root@debian-console:/files# vim /etc/systemd/system/crserver.service

[Unit]
Description=crserver 1c storage server
[Service]
Type=oneshot
ExecStart=/opt/1C/v8.3/i386/crserver -daemon -port 1542 -d /files/storage
RemainAfterExit=yes
[Install]
WantedBy=multi-user.targetroot
```

```
root@debian-console:/files# systemctl daemon-reload
root@debian-console:/files# netstat -tulpn | grep :1542
```

Дальше подключаем **windoвую** оснастку, добавляем кластер 1с, в нём создаем инфобазу (связывая с postgres'овой).
```Конфигурация -> Хранилище конфигурации```
