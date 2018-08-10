![Ansbile](../../img/ansible.png)
# Ansible. Lifehacks

```
#Скопировать файл на все узлы
---
- hosts: all
remote_user: suser
become: yes
become_method: sudo
tasks:
- name: copy test file to machines
copy: src=/home/ep4sh/Documents/ansible/testfile.tst dest=/home/suser/tst.tst mode=651
```


```
#Вывести в stdout все файлы /etc/fstab где монтируется папка ARC
---
- hosts: all
become: yes
become_method: sudo
tasks:
- name: dope
shell: /bin/cat /etc/fstab | grep "arc"
register: res
- debug:
msg: " HN: {{ res.stdout_lines }} "
```










