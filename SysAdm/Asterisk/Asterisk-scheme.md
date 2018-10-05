![Asterisk](../../img/asterisk.png)

# Asterisk. Схема


DAHDI (Zaptel) -- its the driver layer to support PC telephony cards
LibPRI - for PRI digital circuits

### Схема:

```Софтфон (настройки) -> sip.conf , поиск контекста -> extensions.conf```

### sip.conf
***********************************************************
```
[1001]
type=friend
regexten=1001
secret=1234
context=outcoling
host=dynamic
callerid="1001" <1001>
disallow=all
allow=alaw
allow=ulaw
language=ru
callgroup=1
pickupgroup=1
qualify=yes
canreinvite=yes
call-limit=4
nat=no

[1002]
type=friend
host=dynamic
insecure=invite
username=1002
secret=45678
context=outcoling
disallow=all
allow=alaw
```


### extensions.conf
***********************************************************
```
[incoming]
exten => _X.,1,Goto(menu,s,1) ;если нам кто-то звонит, то входящий звонок из файла sip.conf поступает
на этот контекст. После чего звонок переадресовывается с помощью функции Goto на котекст menu

[outcoling]
exten => _XXXXXXXXXXX,1,Dial(SIP/zadarma/${EXTEN})
exten => _XXXX,1,Dial(SIP/${EXTEN},,m)
exten => 7777,1,Goto(menu,s,1) ;если мы изнутри позвоним на этот номер, то мы сможем проверить
работу нашего голосового меню. Благодаря этой строчки нет необходимости для проверки звонить
постоянно с внешки
```
