Переменная приветствия (пишем в /etc/profile):
```
PS1='\[\e[1;31m\][\u@$(ip addr show dev enp1s5 | grep "inet " | cut -d" " -f6) \W]\$\[\e[0m\] '
```
