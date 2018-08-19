# OpenVPN. Server

Ставим:
```
yum update && yum install easy-rsa 
```
****************


Генерируем TLS:
```
openvpn --genkey --secret /etc/openvpn/ta.key
```


Генерируем ключ с помощью easy-rsa:
Создаем директории
```
mdkir /etc/openvpn/easy-rsa/
```
Копируем содержимое в новое местечко:
```
cp -r /usr/share/easy-rsa/3.0.3/* /etc/openvpn/easy-rsa
```

Переходим-с в новое место:
```
cd /etc/openvpn/easy-rsa/
```

Редактируем файл:
vim vars:
```
export EASYRSA_REQ_COUNTRY="RU"
export EASYRSA_REQ_PROVINCE="MO"
export EASYRSA_REQ_CITY="Moscow"
export EASYRSA_REQ_ORG="rxlab.ru"
export EASYRSA_REQ_EMAIL="hq@rxlab.ru"
export EASYRSA_REQ_OU="HQ"
export EASYRSA_KEY_SIZE=2048
export EASYRSA_ALGO=rsa
export EASYRSA_CA_EXPIRE=3650
export EASYRSA_CERT_EXPIRE=3650
```
Затем подцепим переменные: ```. ./vars```

Создаем структур PKI:
```
./easyrsa init-pki
```

Создаем CA:
```
./easyrsa build-ca 
```
Генерируем ключ Диффи-Хельмана
```
./easyrsa gen-dh
```
Генерируем ключ сервера и называем его `vpn`, `nopass` отключает запрос пароля при запуске OPENVPN:
```
./easyrsa build-server-full vpn nopass
```
Добавляем ключ юзеру
```
./easyrsa build-client-full vpnuser nopass
```

Генерируем список отозванных сертов:
```
./easyrsa gen-crl
```

отозвать сертификат (кыш противный хомяк!):
```
./easyrsa revoke <user>
./easyrsa gen-crl
```


Правим фаервол через Firewall-cmd:
```
firewall-cmd --zone=public --permanent --add-port 1194/tcp
firewall-cmd --zone=public --permanent --add-service openvpn
firewall-cmd --reload
```

Если все сделано верно, то модули (```modulu``` - сущность OpenSSL которая связывает серт и ключ) сертификата и ключа будут the same:
```
openssl rsa -noout -modulus -in pki/private/ca.key | openssl md5
openssl x509 -noout -modulus -in pki/ca.crt | openssl md5
```
#### Генерация inline-ключей для клиента.  
Также написал тебе [скриптик](https://github.com/ep4sh/edu/blob/master/SysAdm/OpenVPN/crt2text.sh) - сваливаешь все файлы ключей и сертов в кучу и запускаешь:
```
chmod +x crt2text.sh
./crt2text.sh user ca ta
```
Ииии... собственно сам ```/etc/openvpn/server.conf```:
```
port 1194
proto tcp4
dev tun


ca /etc/openvpn/keys/ca.crt
cert /etc/openvpn/keys/vpn.crt
key /etc/openvpn/keys/vpn.key
dh /etc/openvpn/easy-rsa/pki/dh.pem
crl-verify /etc/openvpn/easy-rsa/pki/crl.pem
tls-auth /etc/openvpn/ta.key 0
cipher AES-256-CBC


#подсеть клиентов
server 10.50.10.0 255.255.255.0
# Учёт выдачи IP
ifconfig-pool-persist ipp.txt
# Маршруты клиентам
push "route 10.50.10.0 255.255.255.0"
# DNS клиентам
push "dhcp-option DNS 10.50.10.1"
#DNS-суффикс
push "dhcp-option DOMAIN rxlab.ru"
# Разрешаем клиентам  соединяться друг с другом
client-to-client
# Использование 1 ключа на всех (ВНИМАНИЕ - НЕ БЕЗОПАСНО!)
duplicate-cn
# Проверяем состояние клиента
keepalive 10 120
# Используем сжатие трафика 
comp-lzo

persist-key
persist-tun

# Записи о состоянии подключенных клиентов и т.п.
status /var/log/openvpn-status.log
# Уровень логирования 2
verb 2
# Количество записей после которых будет производиться запись в лог
mute 10
# нет тела ;)
user nobody
group nobody
```
