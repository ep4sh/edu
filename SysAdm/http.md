# HTTP 1.1 proto

Для хттп1.1 необходимо указывать заголовок HOST, так как веб-сервер должен понять с какого вирт хоста забрать документ:

```
Get / HTTP/1.1
Host: www.ep4sh.io
```


Двойной перевод строки `\r\n\r\n` отделяет тело запроса от заголовка!

Ответы сервера:
   * 1хх - информация
   * 2хх - успех
   * 301 - перманентный редирект, 307 - временный
   * 4хх - фэйл ю, нот фаунд, ю даун
   * 5хх - косяки сервера

Не закрывать тсп соединение с веб-сервером, в хттп1.1 значение по-умолчанию:

``` Connection: keep-alive ```

Чтобы закрывать соединение, надо использовать:

``` Connection: close ```
