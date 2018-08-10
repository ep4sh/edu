![Ansbile](../../img/ansible.png)
# Ansible

#### Ansible — система управления конфигурациями, написанная на Python, с использованием **YAML**.

#### Ansible требует **python2** на контрольной ноде, **ssh** на slave-ноде.

Установка в Centos 7: нужен пакет EXTRAS, ```yum install ansible```  
Установка в Centos 6: нужен пакет EPEL, ```yum install ansible```

Установка в ubutnu:
```
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

Установка в Debian:
```
vim /etc/apt/sources.list
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt-get update
$ sudo apt-get install ansible
```

Установка в Arch: нужен **python2**, ```pacman -S ansible.```  

Также нужно установить: ``` ansible_python_interpreter = /usr/bin/python2```  
в групповых или инвентарных переменных.


