Переменная приветствия (пишем в .bashrc):
```
PS1='\[\e[1;31m\][\u@$(ip addr show dev enp1s5 | grep "inet " | cut -d" " -f6) \W]\$\[\e[0m\] '
```


Отладка с помощью NetConsole  `/etc/modprobe.d/netconsole.conf` :
```
 options netconsole netconsole=SRCPORT@SRCHOST/eth0,DSTPORT@DSTHOST/DSTMAC
```
