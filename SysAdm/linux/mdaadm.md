![Linux](../../img/linux.png)

# mdadm -интерфейс для управления RAID в linux

#### Смотреть статистику по RAID:

```/proc/mdstat ```

#### Создать массим RAID5 на линупсе проще некуда:

```# mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1```

#### Настоятельно рекомендуется использовать файл конфигурации: _/etc/mdaadm.conf_

```
#sh -c 'echo DEVICE /dev/sdb1 /dev/sdc1 /dev/sdd1 > /etc/mdadm.conf'
#sh -c 'mdadm --detail --scan >> /etc/mdadm.conf'
```
#### Активировать RAID с помощью конфига:

```# mdadm -As /dev/md0 ```

#### Остановить массив вручную:
```# mdadm -S /dev/md0```

#### Имитация сбойного диска:
```# mdadm /dev/md0 -f /dev/sdc1 ```

#### Удаление сбойного диска, как только диск будет логически удалён, систему можно остановить и заменить накопитель
```# mdadm /dev/md0 --remove /dev/sdc1 ```

#### Перестроить массив
```  mdadm /dev/md0 --add /dev/sdc1```

#### Посмотреть подробную инфу о массиве:
``` 
mdadm --detail /dev/md0

0       8       16        0      active sync   /dev/sdb
1       0        0        1      removed
2       8       48        2      active sync   /dev/sdd
```

#### Если физически с диском всё ок - вернём его обратно в массив:
``` # mdadm --manage --re-add /dev/md0 /dev/sdc
mdadm: re-added /dev/sdc
```

#### Если произошел ~~неизвестный~~ казус, и произошла замена устройства то добавляем с другой опцией:
``` # mdadm --manage --add /dev/md0 /dev/sdc
mdadm: added /dev/sdc
/dev/md0:
        Version : 1.2
  Creation Time : Thu Jan 12 12:24:16 2012
     Raid Level : raid1
     Array Size : 8387572 (8.00 GiB 8.59 GB)
  Used Dev Size : 8387572 (8.00 GiB 8.59 GB)
   Raid Devices : 3
  Total Devices : 3
    Persistence : Superblock is persistent

    Update Time : Fri Jan 20 04:57:37 2012
          State : clean, degraded, recovering
 Active Devices : 2
Working Devices : 3
 Failed Devices : 0
  Spare Devices : 1

 Rebuild Status : 3% complete

           Name : debian-test0:0  (local to host debian-test0)
           UUID : a51bea1f:59677b56:1a4a2cbe:8a258729
         Events : 206

    Number   Major   Minor   RaidDevice State
       0       8       16        0      active sync   /dev/sdb
       1       8       32        1      spare rebuilding   /dev/sdc
```
