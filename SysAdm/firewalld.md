# Управление межсетевым экраном firewall-cmd на RHEL/Centos  

```# firewall-cmd --state```

показать состояние

```# systemctl [start | status | stop] firewalld```

запуск, состояние, стоп таргета

```# systemctl [enable | disable ] firewalld```

добавить, убрать из автозагрузки

```# firewall-cmd --reload```

Перезагрузить конфигурацию

```# firewall-cmd --panic-[on | off ]```

включить / выключить панику



## ЗОНЫ
   * drop -  все входящие пакеты отбрасываются без ответа. Разрешены только исходящие соединения.
   * block - входящие соединения отклоняются с ответом icmp-host-prohibited / icmp6-adm-prohibited. Разрешены только инициированные системой соединения.  
   * trusted - разрешены все подключения.
   * external - зона для внешнего интерфейса роутера (т.н. маскарадинг). Разрешены только определенные нами входящие соединения.
   * internal - внутренняя зона. Мы доверяем окружению, но разрешены только определенные входящие соединения
   * dmz - зона DMZ, разрешены только определенные входящие соединения.
   * work - зона рабочей сети. Мы не доверяем окружению. Разрешены только определенные входящие соединения.
   * home - домашняя зона. Мы доверяем окружению, но разрешены только определенные входящие соединения
   * public - **default**-зона. Мы не доверяем этой сети и разрешены только определенные входящие соединения.

## Управление зонами/сервисами зон:




```#firewall-cmd --get-zones```

Показать все зоны

```#firewall-cmd --get-zones --list-services --permanent```

Показать все постоянные сервисы всех зон

```#firewall-cmd --list-ports --permanent```

Показать все порты (постоянно открытые)

```#firewall-cmd --zone=public --permanent --add-service=https```

Открыть в public доступ к https-трафу

```#firewall-cmd --zone=public --add-port=12000/tcp```

Открыть в зоне public tcp порт 12000

```#firewall-cmd --zone=public --add-port=31337-31339/udp```

Открыть в public группу портов 31337-31339 по протоколу udp




