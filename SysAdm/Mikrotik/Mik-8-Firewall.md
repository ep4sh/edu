![Mikrotik](../../img/Mik.png)

# Mikrotik. MTCNA. Firewall

Тема брандмауэра всегда связана с запретами.

### Chains (цепочка, она содержит правила):
INPUT - для самого роутера  
OUTPUT - всё что исходит из M  
FORWARD - когда трафик ходит между интерфейсами  

### RULES: если данные в пакете не попадают ХОТЯ бы под одно условие - проверяется следующее правило.  
Если интерфейс не указан - значит действует на ВСЕ.  

### Actions:

#### PASSTHROUGH
1. log (логирование)
2. add dst
3. add src
4. jump
5. return
6. passthrough (для счётчиков)

#### NOT PASSTHROUGH:
1. accept (разрешить)
2. drop (отброс)
3. reject (отброс+icmp)
4. tarpit (применяется для регулирования DoS-атак)
5. fasttrack connection

Addr List - можно заполнять руками, можно динамически
Чтобы сделать статическую запись в адресный лист - поле timeout [none static]

```

0---1---2---3---4----------------...--------------31-----------....---50
|____jump(на свою цепочку)---0--1--2--3--return--\
```

Чтобы создать custom-цепочку в после chain надо написать любое **NAME**
```Action -> jump -> NAME```

### Fasttrack connection.

Fastpath - ускоритель (частиц :) )  
Fast path + conn. tracker = fast track  
Работает только для TCP, UDP, IPv4  

### Таблицы

#### FILTER:  

Chain:  
- input  
- output  
- forward  

Action:  
- drop  
- reject  
- tarpit  


#### MANGLE:  

Chain:  
- prerouting
- input
- output
- forward
- postrouting

Action:  
- change TTL
- change MSS
- mark

#### NAT:  

Chain:  
- src-nat (POSTROUTING -- для выхода в Интернеты)
- dst-nat (PREROUTING -- для проброса портов)

Action:  
- netmap
- src-nat
- masquerade


### MANGLE   

mark:
1. Connection "окрашивание" в трубе
2. routing (ploicy based routing)
цепочки:
- prerouting
- output
3. QoS (очереди, /queues)


### NAT 
1. new
2. established
3. related
4. invalid


##### DST-NAT - проброс портов   
Action:
  * dst-nat -- заворачивает трафик куда захочешь
  * redirect -- заворачивает трафик на М
  * netmap
  * same
##### SRC-NAT - выход в ИНЕТ
Action:  
  * masquerade -- всегда (блять!) указывай OUT-interface, public ip НЕизвестен
  * src-nat -- public ip известен
  * netmap
  * same

