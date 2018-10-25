Переменная приветствия (пишем в .bashrc):
```
PS1='\[\e[1;31m\][\u@$(ip addr show dev enp1s5 | grep "inet " | cut -d" " -f6) \W]\$\[\e[0m\] '
```


Отладка с помощью NetConsole  `/etc/modprobe.d/netconsole.conf` :

```
 options netconsole netconsole=SRCPORT@SRCHOST/eth0,DSTPORT@DSTHOST/DSTMAC
sudo sh -c 'echo options netconsole netconsole=6666@192.168.2.72/eno1,6666@192.168.1.179/ > /etc/modprobe.d/netconsole.conf'
```

С принимающе стороны открываем tmux, коннектимся к ssh:
```
netcat -l -p 6666 -u | tee ~/netconsole.log

```
