# PPTP VPN Centos 7
![PPTP-VPN](../img/vpn.jpg)
```yum update && yum upgrade
yum install pptpd
vim /etc/sysctl.conf:
net.ipv4.ip_forward = 1
sysctl -p
```

#### файл /etc/pptpd.conf:
```
localip 10.8.6.1
remoteip 10.8.6.10-200 #диапазон адресов для клиентов
```

#### файл /etc/ppp/options.pptpd:
```
ms-dns 8.8.8.8
ms-dns 8.8.4.4
```


#### файл /etc/ppp/chap-secrets
```
# client server secret IP addresses
user * password *
```

### GRE tunnel:
```
firewall-cmd --permanent --zone=dmz --add-port 1723/tcp
firewall-cmd --permanent --zone=dmz --add-port 47/tcp
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p gre -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv6 filter INPUT 0 -p gre -j ACCEPT
firewall-cmd --reload
```

**ВАЖНО:**  
__ВЫСТАВИТЬ на КЛИЕНТЕ ШИФРОВАНИЕ (MMPE)__
