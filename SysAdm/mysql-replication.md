
![mysql](../img/mysql.png)
# MySQL

#### Будем настраиваться MASTER-SLAVE - репликацию

1. На мастере в config`е:
```
server-id = 1 - указываем id сервера
log_bin = /var/log/mysql/mysql-bin.log - наименое лога и его путь
```
2. На мастере:
```
CREATE USER 'repl'@'localhost' IDENTIFIED BY 'mysqlroot';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'localhost';
```

3. На мастере:
```
>sudo systemctl restart mysqld
```

4. На мастере:
```
mysql> show master status \G;
```

5. На слейве в config`е:
```
server-id = 2 - id slave-сервера должен отличаться от id master.
relay-log = /var/lib/mysql/mysql-relay-bin - как и binlog содержитсобытия, которые описывают изменения в базе данных.
relay-log-index = /var/lib/mysql/mysql-relay-bin.index - индексный файл, который содержит имена всех используемых файлов журналов relay.
replicate-do-db = БД, которая будет реплицироваться.
```
6. На слейве:
```
>sudo systemctl restart mysqld
```

7. На мастере:
```
mysql> USE <db>;
mysql> FLUSH TABLES WITH READ LOCK;
mysql> SHOW MASTER STATUS; ------ Запоминаем FILE и POSITION
```

8. На мастере делаем backup (важно чтобы POSITION не изменился) и отправляем на удаленный сервер:
```
mysqldump -u root -p <db> > dump.db
scp dump.db p4sh@10.50.133.102:/home/p4sh
```
9. На мастере разблокируем таблицы:
```
mysql>UNLOCK TABLES;
```

10. На слейве загружаем базу:
```
>cd /home/p4sh/
>mysql -uroot -p <db> < dump.db
```
11. На слейве:
```
mysql> CHANGE MASTER TO MASTER_HOST = “ip-мастера”, MASTER_USER = "имя_пользователя ", MASTER_PASSWORD = "password ", MASTER_LOG_FILE = "название лога", MASTER_LOG_POS = позиция;
mysql> start slave;
```
12. На слейве:
```
mysql> show slave status \G; 
```
