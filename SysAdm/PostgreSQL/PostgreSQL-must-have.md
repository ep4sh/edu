![PostgreSQL](../../img/postgresql.png)
# PostgreSQL. Полезные функции

Измерить лаг репликации в секундах (на слейве):
```
select EXTRACT(EPOCH FROM now()) - EXTRACT(EPOCH FROM pg_last_xact_replay_timestamp());
```
Максимальное количество соединений:
```
SHOW max_connections;
```

Количество подключенных к серверу соединений:
```
SELECT COUNT(*) FROM pg_stat_activity;
```
