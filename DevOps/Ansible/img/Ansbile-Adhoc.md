![Ansbile](../../img/ansible.png)
# Ansible. Adhoc

-> Выполнить на группе **atlanta** перезагрузку используя 10 параллельных процессов (дефолт 5 - выставляется в файле настроек).

```
$ansible atlanta -a "/sbin/reboot" -f 10
```

->Выполнить от пользователя user:
```
$ ansible atlanta -a "/usr/bin/foo" -u username
```

->То же с SUDO:
```
$ansible atlanta -a "/usr/bin/foo" -u username --sudo [--ask-sudo-pass]
```

->Можно добавить запуск специальных модулей опцией -m:

```
$ ansible raleigh -m shell -a '/bin/cat /etc/passwd | grep www-data'
```

->СПИСОК CORE-модулей:  
```https://github.com/ansible/ansible-modules-core```


**********************************************
#### СБОРКА ИНФОРМАЦИИ
```
$ ansible all -m setup
```
************************************************************************************
ФАЙЛЫ И ДИРЕКТОРИИ:
->ТРАНСФЕР ФАЙЛА:
```
$ ansible atlanta -m copy -a "src=/etc/hosts dest=/tmp/hosts"
```

->Модуль "file" может менять владельца файла и права:
```
$ ansible webservers -m file -a "dest=/srv/foo/a.txt mode=600"
$ ansible webservers -m file -a "dest=/srv/foo/b.txt mode=600 owner=mdehaan group=mdehaan"
```

->Модуль "file", аналог mkdir -p :
```
$ ansible webservers -m file -a "dest=/path/to/c mode=755 owner=mdehaan group=mdehaan state=directory"
```
->Модуль "file", рекурсивное удаление директории:
```
$ ansible webservers -m file -a "dest=/path/to/c state=absent"
```

************************************************************************************
#### МЕНЕДЖЕР ПАКЕТОВ  

->Убедиться, что пакет установлен, но не обновлять его:
```
$ ansible webservers -m yum -a "name=acme state=present"
```

->Убедиться, что пакет конкретной версии:
```
$ ansible webservers -m yum -a "name=acme-1.5 state=present"
```

->Убедиться, что пакет последней доступной версии:
```
$ ansible webservers -m yum -a "name=acme state=latest"
```

->Убедиться, что пакет не установлен:
```
$ ansible webservers -m yum -a "name=acme state=absent"
```

************************************************************************************
#### Пользователи и группы
```
$ ansible all -m user -a "name=foo password=<crypted password here>"
```
```
$ ansible all -m user -a "name=foo state=absent"
```

************************************************************************************
#### УПРАВЛЕНИЕ СЕРВИСАМИ:

->Запуск сервиса
```
$ ansible webservers -m service -a "name=httpd state=started"
```

->Рестарт сервиса
```
$ ansible webservers -m service -a "name=httpd state=restarted"
```

->Останов сервиса
```
$ ansible webservers -m service -a "name=httpd state=stopped"
```
************************************************************************************
#### ОТ РУТА:
```
$ ansible webservers -m ssh -a "/bin/cat /etc/shadow" --su --ask-become-pass
```
**********************************************************************************


