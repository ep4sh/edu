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
```#  mdadm /dev/md0 --add /dev/sdc1```