Устанавливал себе на VPS(**centos 7** на борту) nginx и столкнулся со следующей проблемой:  
захотелось мне иметь "нормальную" (понятную мне и на случай импользования "виртуальных хостов", читай - других юзеров с ихъ сайтами) структуру файлов сайта (/var/www/<wwwuser>/html).  

По умолчанию nginx хранит файлы в ```/usr/share/nginx/html/*```

Я создал структуру:  
```
cd /var; sudo mkdir -p /var/www/wwwuser/html; sudo mkdir -p /var/www/wwwuser/cgi-bin
cp /usr/share/nginx/html/* /var/www/wwwuser/html/
sudo chown -R nginx.nginx /var/www
sudo chmod -R 755 /var/www
```

Довольный, запустил браузер и получил своё наказание 3а безграмотность - ```Err 403```.

__Для доступа gninx`у нужно:__  
 * иметь юзера ( /etc/nginx/nginx.conf ) в директиве user (! как сказал то).
 * Иметь описанную директиву index
 * Этот user должен быть владельцем файлов и родительских директорий, чтобы прочесть файлы(тонкий момент, могу ошибиться, не пинать!).
 * Иметь права (755 dirs/ 644 files).

Всё это было у меня в изобилии, но злобная 403 не уходила - я еще пару раз нажал F5 в браузере, думая что что-то изменится (наивный раб).

Если ничего не помогает - посмотрите наконец ~~этиваши~~ логи.
Истина ```/var/log/nginx/error.log`` а внем и ```Permission Denied```. Тут вспомнилось про любимый **SELinux**. Быстрая проверка (отключить и потом включить) - дала положительный результат без SELinux всё работало успешно.

Ставим semanage:

``` 
sudo yum install policycoreutils-python
```

Выполняем контекстную магию:  
```
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www(/.*)?"
sudo semanage fcontext -a -t httpd_sys_script_exec_t "/var/www/wwwuser/cgi-bin(/.*)?"
sudo restorecon -r -v /var/www/wwwuser
```
???  
**PROFIT**
