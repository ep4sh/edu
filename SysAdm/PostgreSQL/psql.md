### Подключение:  
` psql -d <база> -U <роль> -h <узел> -p <порт>`

```
\c[connect] база роль узел порт  
\conninfo - о текущем подключении  
```

### Файл с настройками .psqlrc:
```
\set top5 'select from pg_settings limit 5;'  
\set PROMPT1 '%R#'  
```

### Режимы:

Расширенный вывод для 1 запроса (начиная с версии 10):  
`select from pg_settings limit 5 \gx`  


`\a` - режим выравнивание  
`\t` - режим строки заголовка  
`\x` - режим расширенного вывода  
`\pset fieldsep ' '` - установка разделителя вывода  


### Выполнение скриптов:  

#### Запись в файл:
```
\o db_log
select from pg_settings limit 5;
```

#### Выполнение unix-комманды:
```
\! uname
\! cat db_log
```

#### Чтение из файла
```
\i db_dump
  

psql < db_dump
psql -f db_dump
```


#### Установка переменных:
```  
SELECT now() AS curr_time \gset
\echo :curr_time
```
  
```
\set TEST 'Hi'
\unset TEST
```
