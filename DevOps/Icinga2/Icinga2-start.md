![Icinga](../../img/icinga.jpg)

# Icinga. Начало
Супер-крутой форк **nagios** с отличной документацией и человечными конфигами.

### Виды мониторинга:
 * Simple (простой) -- это регулярные проверки Icinga внешний сервисов. Например, посылка ICMP-запросов, заход на web-страницу и так далее.
 * Agent -- регулярные проверки с помощью специального агента



#### SIMPLE
***************************
Для создания простых проверок есть файл хостов:

```vim /etc/icinga2/conf.d/hosts.conf```


И файл шаблонов:

``` vim /etc/icinga2/conf.d/templates.conf```

```
Object Host "my-server1" {
address = "10.0.0.1"
check_command = "hostalive"
}

object Service "ping4" {
host_name = "my-server1"
check_command = "ping4"
}

object Service "http" {
host_name = "my-server1"
check_command = "http"
}
```

#### ОБОЗНАЧЕНИЯ:
* числа: 23
* временные отметки: 23m, 12s
* строки: "hello baby"
* массивы: [ "drakonvPalto", 666 ]
* словари:

```{
kushat = "yes"
mozgi= 80
}
```


#### Нода
***************************
Установка сервера в мастер-ноду:
```
sudo icinga2 node wizard
```

Клиентская часть Icinga может работать в двух режимах:
```
- Top Down (Icinga Director) -- инициирует проверки сам сервер
- Top Down Command Endpoint -- инициирует проверки сам сервер, но запросы принудительно выполняются на конточке
- Top Down Config Sync -- локальная конфигурация, рассылаемыемая на ноды.
```
