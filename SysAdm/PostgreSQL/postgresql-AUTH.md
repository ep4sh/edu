![PostgreSQL](../../img/postgresql.png)

## Аутентификация

### Задачи
```
Идентификация -> Аутентификация -> Авторизация
```

### pg_hba.conf

```
SHOW hba_file;

# TYPE      DATABASE      USER   ADDRESS    METHOD
```

#### TYPE:
* host - tcp/ip 
* local - unix socket
* hostssl  - tcp/ip over SSL
* hostnossl  - tcp/ip нешифрованное 

#### DATABASE:
* all
* sameuser // бд совпадает по имени с ролью
* samerole // бд совпадает по имени с ролью, группой в которую входит
* replication // для репликации
* БД
* имя, имя, имя

#### ADDRESS
* all
* ip/mask 
* samehost // ip-сервера
* samenet // любой ip из подсети сервера
* DNS-name

#### USER
* all
* роль
* +роль // роль входящая в указанную
* имя, имя, имя

#### METHOD:

* trust - разрешить без проверки
* reject - запретить без проверки

* md5 - 
* scram-sha-256
* radius
* pam

* peer [map=] - только для локальных, имя пользователя у ОС
* cert [map=] - Аутентификация с использованием SSL-серта
* gss [map=] - Аутентификация Kerberos GSSAPI
* sspi [map=] - Аутентификация Kerberos/NTLM для Windows


### Пароль:
```
[CREATE | ALTER] ROLE роль PASSWORD 'пароль' [VALID UNTIL дата_время];
```
* Хранится в системном каталоге `pg_authid`
* метод шифрования `password_encryption`
* метод auth должен совпадать с методом шифрования (md5 а

На клиенте установить `$PGPASSWORD`:
* не безопасно
* неудобно с разными базами

На клиенте `~/.pgpass` с правами 600:
* узел:порт:база:юзер:пароль



### pg_ident.conf - содержит три поля
* Название соответствия
* внешнее имя (регулярное вырадение, если начато с косой черты)
* внутреннее имя пользователя БД


