![PostgreSQL](../../img/postgresql.png)

## Базы данных и схемы

### Кластер БД
 Инициализация кластера создаётся три базы данных.  
 Новая база **ВСЕГДА** клонируется из существующей  
 База для подключения по умолчанию `postgres`.  
Чаще всего - база клонируется из базы `template1`  

Эталонная путсая БД создаётся из `template0`.  
База `template0` - НИКОГДА не изменяется

### Схема
* Схема - пространство имён для объектов внутри БД.  
* каждый объект принадлежит какой-либо схеме.

#### Задачи
* разделение объектов на логические группы   
* предотвращение конфликта имен между прилоениями

```
СХЕМА И ПОЛЬЗОВАТЕЛЬ - разные сущности.
```

#### Базы и схемы кластера  
В каждой БД есть схема `pg_catalog` (системный каталог) и `public` (общая схема) и схема называющаяся именем базы данных (например, `app`)  

#### Определение схемы объекта:   

* квалифицированное имя (**схема.имя_объекта**) явно определяет схему  
* имя без квалификатора проверяется в схемах, указанных в пути поиска  

#### Путь поиска
* задаётся параметрром **search_path**    
* исключается несуществующие схемы и схемы без доступа;  
* подставляются неявно подразумеваемые схемыреальное значение показывает функция current_schemas  
* первая явно указанная в пути схема используется для создания объектов  

### Специальные схемы


#### Схема public
``` 
по умолчанию входит в путь поиска  
если ничего не менять, все объекты попадают сюда  
```

#### Схема, совпадающая по имени с пользователем
```
входит в путь поиска, **но не существует**  
если создать, все объекты попадают сюда  
```

#### Схема pg_catalog
```
схема для объектов системного каталога  
если `pg_catalog` нет в пути, она **НЕЯВНО** подразумевается первой
```

#### Временные таблицы
```
Существую на время сенса / транзакции  
не журналируются  
не попадают в общий буферный кэш
```

#### Схема pg_temp_N

Автоматически создаётся для временных таблицы  
`pg_temp` - ссылка на конкретную временную схему данного сеанса  
если `pg_temp` нет в пути, она неявно подразумевается САМОЙ первой, 
сама схема остаётся и повторно используется для других сеансов


### PSQL >

`CREATE DATABASE db;` // создать БД  
`ALTER DATABASE db RENAME TO appdb;` // изменить имя  
`ALTER DATABASE appdb CONNECTION LIMIT 10;` // изменить кол-во возможных подключений  
`SELECT pg_database_size('appdb');` // размер в байтах  
`SELECT pg_size_pretty(pg_database_size('appdb'));` // размер для людей  
`\dn` // список схем  


Подключимся к БД, создадим СХЕМУ и проверим путь поиска:
```
\c appdb
CREATE SCHEMA app;
\dn

SHOW search_path;
SELECT current_schemas(true);
```


Изменить принадлежность объекта: 
```
ALTER TABLE t SET SCHEMA app;
```


Теперь к таблице можно обращаться:  

```
SELECT * FROM app.t;
```


Новый путь поиска: 
```
SET search_path = public, app; // на 1 сеанс
ALTER DATABASE appdb SET search_path = public, app; // на базу
```


Временные таблицы:
```
CREATE TEMP TABLE t(s text);
```

Удаление схемы:
```
DROP SCHEMA app; // + CASCADE
```

Удаление БД - убедиться что никто не подключен к этой БД:
```
\c postgres
DROP DATABASE appdb;
```































