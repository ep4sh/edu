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

Также написал тебе [скриптик](https://github.com/ep4sh/edu/blob/master/SysAdm/OpenVPN/crt2text.sh) - сваливаешь все файлы ключей и сертов в кучу и запускаешь:
```
chmod +x crt2text.sh
./crt2text.sh user ca ta
```

