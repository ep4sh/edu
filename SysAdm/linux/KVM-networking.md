![KVM](../../img/KVM.png)
# KVM


### NAT forwarding (aka "virtual networks")


#### Каждая инсталяция libvirt предлагает соединение с ВМ "из коробки" посредством NAT. Это также называется 'default virtual network'
```
# virsh net-list --all
Name State Autostart
-----------------------------------------
default active yes
```


#### Второй вариант -- сетевой мост (**shared NET**).

#### !!!!!!!!!!!! В мост нельзя добавлять интерфейсы с назначенным IP адресом, вместо этого сетевой адрес назначается на интерфейс моста.  

А потом удалить дефолтную сеть + настроить роутинг через бридж:
```
virsh net-destroy default
virsh net-undefine default
service libvirtd restart
```

Также из-за **магии**(~~неведанной хуйни~~) необходимо отключить **STP**



***********************************

#### Конфигурация /etc/network/interfaces:
```
0 # The primary network interface
11 auto enp3s0
12 iface enp3s0 inet manual
13
14 auto br0
15 iface br0 inet static
16 address 10.50.133.98
17 netmask 255.255.255.0
18 network 10.50.133.0
19 broadcast 10.50.133.255
20 gateway 10.50.133.254
21 #dns-search if-capital.ru
22 dns-nameservers 10.50.1.1
23 dns-nameservers 10.50.1.2
24 bridge_ports enp3s0
25 bridge_stp off
```
