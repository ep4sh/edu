![LXD](../../img/LXD.png)
# LXD

**LXD** представляет собой надстройку над **LXC**, которая упрощает работу с контейнерами и добавляет широкий спектр новых возможностей.  

Если [Docker](https://github.com/ep4sh/edu/tree/master/DevOps/Docker) предназначен для запуска в контейнерах приложений, то **LXD** — для запуска полноценных операционных систем.  

**LXC** - инструмент для управления lxd.(дада такая ~~йобынь~~)  

### Если в статьях ты видишь "lxc-" (со знаком "-" - то это LXC в чистом виде!)


### Инициализация LXD  

Инициализацию LXD нужно делать **до того как** вы начнете пользоваться контейнерами.
```
sudo lxd init
dpkg-reconfigure -p medium lxd -- повторить запуск
sudo chown :lxd /var/lib/lxd/unix.socket -- ошибка с доступом к сокету.
```

*********************************************
#### Создание контейнера c1 (на образе Ubuntu 16.04):
```
lxc launch ubuntu:16.04 c1
lxc launch ubuntu-daily:devel c3 -- вариант
lxc launch ubuntu-daily:xenial c4 -- вариант
lxc launch images:alpine/3.3/amd64 c5 -- вариант с Альпин линуксом
lxc init ubuntu: -- создание без запуска
```

#### Просмотреть все имиджи:
```
lxc image list ubuntu:
lxc image list ubuntu-daily:
lxc image list images: -- неоффициальные имиджи
lxc image list --fast
lxc info <container> -- подробная инфа о контейнере
```

#### Старт/стоп:
```
lxc start <container>
lxc stop <container>
lxc restart <container>
lxc pause <container> -- не потреблять CPU-time, процессы видны.
lxc delete <container>
```

#### Профили:
```
lxc profile list
lxc profile show <profile>
lxc profile edit <profile>
lxc profile apply <container> <profile1>,<profile2>,<profile3>
lxc config device add my-container kvm unix-char path=/dev/kvm
```
*********************************************

#### Конфигурация:
```
lxc config show <container>
lxc config edit <container>
```

#### Попасть внутрь контейнера:
```
lxc exec <container> bash
lxc exec <cont> -- ls -la -- для сложных комманд надо юзать "--",чтобы отделить
```

*********************************************

### Работа с файлами:


#### PULL (тянуть) файлов:
```
lxc file pull <container>/<path> <dest> -- стянуть с контейнера файлы
lxc file pull <cont>/etc/hosts - -- вывести в STDIN
```

#### PUSH(толкать):
```
lxc file push <source> <container>/<path>
```

#### EDIT (прямое изменение):
```
lxc file edit <container>/<path>
```

*********************************************
### SNAPSHOTы

#### Создание:
```
lxc snapshot <container>
lxc snapshot <container> <snapshot name>
```

#### Восстановление из снэпшота:  
```
lxc restore <container> <snapshot name>
```

#### Переименование снэпшота:
```
lxc move <container>/<snapshot name> <container>/<new snapshot name>
```

#### Удаление:
```
lxc delete <container>/<snapshot name>
```

*********************************************
### Манипуляции с контейнерами:

#### Копирование (снэпшоты удаляются, MAC-адреса резетятся):
```
lxc copy <source container> <destination container>
```

#### Перемещение:
```
lxc move <old name> <new name>
```
