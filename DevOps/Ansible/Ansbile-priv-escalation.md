![Ansbile](../../img/ansible.png)
# Ansible. Privileges escalation (Повышение привелегий)


Имеем тысячуиодин сервер и на все необходимо....мм..установить nginx, но ключа SSH на них нет - и что делать?

Имеем следующий playbook ```main.yml```:
```
---
- name: Roles run
  hosts: test
  roles:
    - ssh
```

Готовим роль с таском:
```
---
- name: Set authorized key took from file
  authorized_key:
    user: suser
    key: "{{ lookup('file', id_rsa ) }}"

- apt:
    name: nginx
    state: present
```
Можно сделать так:

```
ansible-playbook main_role.yaml -i hosts -u bilbo -kK
```
 * -k - пароль для входа SSH
 * -K - пароль для SUDO
 * -u - имя удаленного пользователя
 * -i - имя [inventory](https://docs.ansible.com/ansible/2.6/user_guide/intro_inventory.html)-файла

******************************************

А можно вариант другой:

Модифицируем playbook ```main.yml```:
```
---
- name: Roles run
  hosts: test
  become: yes
  become_method: sudo
  become_user: root
  roles:
    - ssh
```
Модифицируем inventory ```hosts```: 
```
[test]
192.168.1.100 ansible_host=192.168.1.100 ansible_port=22 ansible_user="bilbo" ansible_become_pass="myCoolPass"
```

Пишем таск на создание юзера, добавления ему полномочий, закидываем этому юзеру ключи, юзаем его.  
???  
PROFIT
