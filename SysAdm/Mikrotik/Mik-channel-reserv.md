![Mikrotik](../../img/Mik.png)

# Mikrotik. Резервирование каналов

#### Увеличение distance (ROUTE->DISTANSE):
 * самый простой сопсоб
 * происходит только при физ. потере соединения
 * переводит трафик на другого провайдера при загрузке канала


#### Sсheduler:
требует знания написнаия скриптов

#### NetWatch:
* IMCP мониторинг
* Гибкость

**UP:**
```
/ip route set [find comment="ISP1"] disabled=no
/ip route set [find comment="ISP2"] disabled=yes
```

**DOWN:**
```
/ip route set [find comment="ISP1"] disabled=yes
/ip route set [find comment="ISP2"] disabled=no
```
