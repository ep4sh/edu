![postfix](../img/postfix.png)
# Postfix.

При создании почтового сервера нужно ответить на вопросы:

 * какое доменное имя использовать при отправке почты; 
 * для каких доменов принимать почту; 
 * кто может переправлять почту через данный сервер; 
 * куда переправлять полученную почту; 
 * метод доставки : прямой/опосредованный

Процессы Postfix:  
 * 

## Если конфиг Postfix изменен - нужен reload.  

#### Смотреть параметры, отличающиеся от *default*: 

```postconf -n``` 

Таблицы Postfix:  
* berkley db
* ldap
* sql

#### Пример хэш таблицы
```
virtual_alias_maps = hash:/etc/postfix/virtual 
```

## Myorigin

myorigin устанавливает доменное имя адресов источников писем, отправляемых сервером.
по умолчанию myorigin равен myhostname (а myhostname - содержит имя машины).

```
myhostname = host.domain.tld 
myorigin = $myhostname 
```

Я ни разу не видел почту типа user@pc1.domain.tld - так как имя машины часто скрывают - параметр
myorigin нужно установить $mydomain.


mydestination указывает для каких доменов принимается почта.  
По умолчанию - только для данной машины.  
Чаще всего ставят приём для всего домена:
```
mydestination = $myhostname localhost.$mydomain localhost $mydomain
```

## Relay.
Настройки почты по умолчанию заставляют Postfix отправлят почту **любым клиентам**, которые входят в состав доверенных сетей
``` mynetworks ```.
По умолчанию отправка разрешается для авторизованных направлений (равно mydestination+поддомены):
```
relay_domains = 
```
Для отправки через почтовый шлюз, конкретный пример:
```
relayhost = smtp.timeweb.ru 
```


## Виртуальный хостинг

Сущность ВХ - обслуживание почты доменов НЕ СВЯЗАННЫХ с именем данного хоста. Основан на виртуализации псевдонимов или виртуализации почтовых ящиков.

Простейшая форма - включить имя домена (для приёма почты) в параметр mydestination.

mydestination = $myhostname localhost.$mydomain mx.$mydomain mail.$mydomain www.$mydomain



При использовании *виртуальных псевдонимов* имена пользователей **виртуальных** доменов отображаются на **реальных** локальных
пользователей системы:

```
virtual_alias_domains = www.rxlab.ru
virtual_alias_maps = hash:/etc/postfix/virtual 
```

В таблице ```virtual```  - отображение витуальных хомяков на реальных (*системных*).
```
postmaster@www.rxlab.ru postmaster 
info@www.rxlab.ru       ep4sh 
sales@www.rxlab.ru      ep4sh 
root@www.rxlab.ru       ep4sh 
```

