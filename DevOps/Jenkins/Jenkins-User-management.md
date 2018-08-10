![Jenkins](../../img/jenkins.png)
# Jenkins. User management

1. Создание юзеров
2. Конфигурация юзеров
3. Установка плагина *Roles Strategy Plugin* (не забыть ```restart```)
4. ```Manage Jenkins -> Configure Global Security -> Authorisation-> Role Based Strategy```
5. Создать роли (Manage and Assign Roles) и привзяать к юзерам.
```
--Global roles - авторизация и доступ на глобальном уровне
--Project roles - касательно конкртеонго проекта
```

ПРИМЕР:
```
роль DEV.* -- ко всем проектам названным DEV.
роль TST.* -- ко всем проектам названным TST. 
```
