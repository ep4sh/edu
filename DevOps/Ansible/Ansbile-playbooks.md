![Ansbile](../../img/ansible.png)
# Ansible playbooks

*Плейбуки* - текстовые YAML-файлы понятные человеку и машине.  
*Переменные* - сущности, которые помогают плейбукам исполнятся.  

#### Есть несколько методов назначить переменные:
- Плейбуки (playbooks)
- Файлы (files)
- Инвентарь (inventories: groups vars, host vars)
- Командная строка (command prompt)
- discovered vars: facts
- Ansible Tower

#### Inventory  
список целей (таргетов), которые необходимо автоматизировать:
- Статический список серверов (static host files)
- Диапазоны
- Другие штуки
- Динамический список серверов (AWS, Azure etc)

#### Структура:
```
Playbook
|_________ plays
|_________ tasks-------(call)-------->module
| \_____(call)_____> module
| \_____(call)_____> module
|
|__(run)____handler
| (приводятся в действие ТАСКОМ,
| выполняются один раз в конце Play)
|
|____(run)_____sequentially
```
***************************************************************************
#### Пример:
```
--- #---показывает что это YAML-файл
- name: install and start apache #название
hosts: web #показывает какой инвентарь используется
remote_user: p4sh
become_method: sudo
become_user: root
vars:
http_port: 80
max_clients: 200

tasks:
- name: install httpd
yum: name=httpd state=latest
- name: write apache config file
template: src=srv/httpd.j2 dst=/etc/httpd.conf
notify:
- restart apache
- name: start httpd
service: name=httpd state=running

handlers:
- name: restart apache
service: name=httpd state=restarted
```
***************************************************************************

#### Модули(modules):
Структура автоматизирующая необходимое окружение:  
```module: directive1=value directive2=value```

********************************************************************

#### Как запустить:  
 * Ad-hoc: ansible <inventory> <options>
 * Playbooks: ansible-playbook <file.yaml>
 * Automation framework: Ansible Tower


#### Подробнее Ad-hoc:
 * ansible web -a /bin/date
 * ansible web -m ping
 * ansible web -m yum -a "name=openssl state=latest"

#### CHECK-MODE:
 * ansible web -C -m yum -a "name=openssl state=latest"
 * ansible-playbook -C file.yaml
