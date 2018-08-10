# Bash
Всё начинается с шебанга:

``` #!/usr/bin/env bash ```
```
var="value" // назанчит переменную, обратить внимание на отсуствие пробелов
$1 // значение первого параметра переданного скрипту
```
Кавычки:
```
" " // слабые, раскрывают аругмент $var
' ' // сильные, не раскрывают агрумент
```
```bash -x script.sh // осуществляет отладку скрипта```

```read name // считать данные с STDIN в name```

```
echo // вывести строку
var="value"
echo " ${var}+3"
printf " Hello %s \n\n" // вывести строку с форматирование
```

```
alias python="/usr/bin/python3" // назначить alias
alias -p // получить список alias`ов
unalias python // снять алиас
```

```
cat >file
bla
blabla
<CTRL+D>
или
cat <<END >fiel
> ds
> d
> END // заполнить файл построчным вводов
```

  
#### Задачи:

```
sleep 10&
%1 // достать на исполнение в fg
sleep 10
<CTRL+Z>
jobs
bg 1 // // достать на исполнение в bg
sleep 10&
kill %1 // терминировать процесс
SIGHUP 1 HANGUP
SIGINT 2 прерывание с клаивиатуры
SIGKILL 9 Сигнал kill
SIGTERM 15 Сигнал terminate
```

```
lsof -i :8080 // проверяет чем занят конкретный порт

mkfifo myPipe
ls -l > myPipe & // в одном терминале скидываем, в другом читаем
grep "*.log" < myPipe // создание канала, слив и выбор инфы
piData=$(<mypipe) // выбор из канала в переменную
```

```
Параметры [ или команды TEST:
ФАЙЛЫ:
 -e "$file" // true если файл существует
-d "$file" // true если файл существует и он - директория
-f "$file" // true если файл существует и он - обычный файл
-h "$file" // true если файл существует и он символьная ссылка
-r $filename // true, если есть права на чтение
-w $filename // true, если есть права на запись
-e $filename // true, если есть права на выполнение
СТРОКИ:
-z "$str" // true если длина строки == 0
-n "$str" // true если длина строки != 0
"$str1" = "$str2" // true, если строки совпадают
"$str1" != "$str2" // true, если строки НЕ совпадают
ЧИСЛА:
"$int1" -eq "$int2" // true, если числа совпадают
"$int1" -ne "$int2" // true, если числа НЕ совпадают
"$int1" -gt "$int2" // true, если число int1 > int2
"$int1" -ge "$int2" // true, если число int1 >= int2
"$int1" -lt "$int2" // true, если число int1 < int2
"$int1" -le "$int2" // true, если число int1 <= int2
```

#### Арифметическая развёртка:
```
var=$((var+1))
((var=var+1))
((var+=1))
((var++))
```

#### Массивы:
```
arr=(a v b c d f e)
for i in "${arr[@]}"; do
echo $i
done // создать и вывести массив

unset arr // удалить массив

stringVar="Orange+apple+onion"
arr=(${stringVar//+/ })
for i in ${arr[@]}; do
echo ${i}
done // превращение строки в массив
```

#### ФУНКЦИИ:
```

function greet ()
{
echo "hello, world!"
}
// объявление функции
export -f greet // экспорт в shell
bash -c greet
```

#### МОДИФИКАЦИЯ ПАРАМЕТРОВ:
```
var="hello"
printf("%s \n" "${var^}") // Hello
printf("%s \n" "${var^^}") // HELLO

var="HELLO"
printf("%s \n" "${var,}") // hELLO
printf("%s \n" "${var,,}") // hello

Длина строки:
var="str"
echo "${#var}" // 3

Срезы:
var="0123456789ABC"
echo "${var:0:5}" // 01234
```

