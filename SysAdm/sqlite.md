![SQLite](../img/sqlite.png)

# sqlite3 - компактная встриваемая СУБД

```sqlite3 ## попасть в терминал, но затем необходимо открыть БД, .open <DB>
sqlite3 new_DB ## открыть new_DB или создать если нет файла
.tables ## показать список таблиц
.schema ## показать структуру таблиц
.show ## показать текущие настройки
.save ## сохранить БД (созданную в памяти) на диск
.mode ## тип вывода для таблицы
```

```
.mode MODE ?TABLE? Set output mode where MODE is one of:
ascii Columns/rows delimited by 0x1F and 0x1E
csv Comma-separated values
column Left-aligned columns. (See .width)
html HTML <table> code
insert SQL insert statements for TABLE
line One value per line
list Values delimited by "|"
quote Escape answers as for SQL
tabs Tab-separated values
tcl TCL list elements
```

#### Экспорт в csv:
```
sqlite> .header on
sqlite> .mode csv
sqlite> .once c:/work/dataout.csv
sqlite> SELECT * FROM tab1;
sqlite> .system c:/work/dataout.csv
```
