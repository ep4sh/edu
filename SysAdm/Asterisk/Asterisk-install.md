Основные требования к системе
    • Для инсталляции и запуска Asterisk не требуется никакого специального оборудованиия.
    • Перед установкой Asterisk должны быть установлены программные пакеты:
        ◦ Исходники ядра (kernel sources)
        ◦ Заголовочные .h файлы для Вашего ядра (kernel headers)
          sudo apt install -y build-essential linux-headers-`uname -r`
        ◦ bison (необходим для обработки выражений в файле extensions.conf)
          sudo apt install -y bison
        ◦ Пакеты: openssl и openssl-dev или libssl-dev
          sudo apt install -y libssl-dev
        ◦ apt-get install libncurses5-dev uuid uuid-dev unixodbc-dev uuid uuid-dev libasound2-dev libogg-dev libvorbis-dev libcurl4-openssl-dev libical-dev libneon27-dev libsrtp0-dev libspandsp-dev libopus-dev opus-tools libiksemel-dev libiksemel-utils libiksemel3 xmlstarlet libxml2-dev libjansson-dev sqlite3 libsqlite3-dev libpqxx-dev
        ◦  
        ◦ apt install -y doxygen
        ◦ apt-get install subversion
          
Исходники Asterisk
Asterisk - ядро основной программы 
Asterisk-addons - дополнительные файлы 
Libpri - PRI - библиотеки 
 (zaptel) - драйверы телефонии 
cd /usr/src/
wget http://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz
wget http://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-current.tar.gz
wget http://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-15-current.tar.gz
Lame
   tar zxvf lame-3.100.tar.gz
   cd lame-3.100
   ./configure
   make
   make install
   cd ..
Компиляция DAHDI
tar zxvf dahdi-linux-complete-current.tar.gz
cd /usr/src/dahdi-linux-complete-VERSION
make all
make install
make config
Компиляция Libpri
tar zxvf libpri-current.tar.gz
cd /usr/src/libpri- VERSION
make
make install
Компиляция Asterisk
tar zxvf asterisk-15-current.tar.gz
cd /usr/src/asterisk-VERSION
./configure
make menuselect*
make
make install
make samples
make progdocs
make config


* Добавить опции для menuselect:
Add-ons → format-mp3 [x]
Applications → app_fax [x]
Core_sound_pack → EN* [x], RU* [x]
Запуск и остановка Asterisk
/usr/sbin/asterisk: Файл запускающий Asterisk 
Если Вы установили Asterisk, можно запустить его командой:
 /usr/sbin/asterisk -vvvgc
Остановить Asterisk из  можно командой 'stop now'. 
Командой без аргументов, Asterisk запускается как демон.
 /usr/sbin/asterisk 
Подключится к командному интерфейсу () можно используя аргумент 'r'.
 /usr/sbin/asterisk -r
Запуск Asterisk из под не - root пользователя. По умолчанию Asterisk запускается из под root, что может быть небезопасно. Для изменения пользователя раскомментируйте строки в файле /etc/init.d/asterisk.
AST_USER="asterisk"
AST_GROUP="asterisk"
Создайте группу и пользователя asterisk.
/usr/sbin/groupadd asterisk 
/usr/sbin/useradd -d /var/lib/asterisk -g asterisk asterisk 
Измените права на использование следующих файлов:
chown --recursive asterisk:asterisk /var/lib/asterisk
chown --recursive asterisk:asterisk /var/log/asterisk
chown --recursive asterisk:asterisk /var/run/asterisk
chown --recursive asterisk:asterisk /var/spool/asterisk
chown --recursive asterisk:asterisk /usr/lib/asterisk
## Если Вы используете Zaptel
chown --recursive asterisk:asterisk /dev/zap
## Если Вы используете DAHDI
chown --recursive asterisk:asterisk /dev/dahdi
#----------------------------------------------------
chmod --recursive u=rwX,g=rX,o= /var/lib/asterisk
chmod --recursive u=rwX,g=rX,o= /var/log/asterisk
chmod --recursive u=rwX,g=rX,o= /var/run/asterisk
chmod --recursive u=rwX,g=rX,o= /var/spool/asterisk
chmod --recursive u=rwX,g=rX,o= /usr/lib/asterisk
## Если Вы используете Zaptel
chmod --recursive u=rwX,g=rX,o= /dev/zap
##  Если Вы используете DAHDI
chmod --recursive u=rwX,g=rX,o= /dev/dahdi
#----------------------------------------------------
chown --recursive root:asterisk /etc/asterisk
chmod --recursive u=rwX,g=rX,o= /etc/asterisk 
systemctl daemon-reload
/etc/init.d/asterisk restart 
Автозагрузка Asterisk
Различные операционные системы имеют разные способы запуска программ во время загрузки. В директории с исходниками /usr/src/asterisk-VERSION/contrib/init.d содержатся скрипты для запуска в archlinux, debian, gentoo, mandriva, redhat, slackware, suse.
Для систем, которые все еще используют inittab, просто добавьте следующую строку в /etc/inittab:
as:2:respawn:/usr/sbin/asterisk -f 
Для Redhat окружения выполните
cd /usr/src/asterisk-VERSION
make config
Это скопирует скрипт из contrib/init.d/rc.redhat.asterisk в /etc/rc.d/init.d/asterisk и выполните команду:
/sbin/chkconfig --add asterisk 
Директории Asterisk
    • /usr/lib/asterisk/modules: Содержит бинарные файлы (модули. кодеки)
    • /var/lib/asterisk: Содержит переменные данные(звуки. скрипты и т.д.).
    • /var/spool/asterisk: Файлы создаваемые в процессе работы (голосовые сообщения, исходящие вызовы и т.д.)
    • /var/log/asterisk: Логи. информация о вызовах.
    • /etc/asterisk; Конфигурационные файлы Asterisk.


Создаем базу для записи логов
