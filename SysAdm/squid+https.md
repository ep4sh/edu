Преднастройка:
```
apt-get install openssl
apt-get install devscripts build-essential -y
apt-get install dpkg-dev libssl-dev -y
```

Создаем директорию с исходниками и скачиваем их:
```
cd ~
mkdir makes
cd makes

wget http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.28-20180910-r6cfeb30-RELEASENOTES.html
```

Устанавливаем  
`--prefix=/usr/local/squid ` - директория для установки  
`--with-openssl` - с опцией SSL (для работы с HTTPS)  
`--enable-ssl-crtd` - динамическая генерация сертификатов  


```
./configure --prefix=/usr/local/squid --with-openssl --enable-ssl-crtd
make all
make install
```

Возможные ошибки при сборке:
### Раз (ошибка v2 cipher)
```
=== modified file 'src/ssl/bio.cc'
--- src/ssl/bio.cc	2015-09-01 09:25:57 +0000
+++ src/ssl/bio.cc	2015-09-22 15:27:36 +0000
@@ -1099,9 +1099,7 @@
 
     if (ciphersLen) {
         const SSL_METHOD *method = SSLv23_method();
-        int cs = method->put_cipher_by_char(NULL, NULL);
-        assert(cs > 0);
-        for (unsigned int i = 0; i < ciphersLen; i += cs) {
+        for (unsigned int i = 0; i < ciphersLen; i += 3) {
             // The v2 hello messages cipher has 3 bytes.
             // The v2 cipher has the first byte not null
             // Because we are going to sent only v3 message we
```
### Два (error: 'SSLv3_method' was not declared in this scope)
```
//#if (OPENSSL_VERSION_NUMBER >= 0x10100000L)
// const SSL_METHOD *method = TLS_method();
//#else
const SSL_METHOD *method = SSLv23_method();
//#endif
```

Конфиг Squid: /usr/local/squid/etc/squid.conf

```
#
# Recommended minimum configuration:
#

# Example rule allowing access from your local networks.
# Adapt to list your (internal) IP networks from where browsing
# should be allowed
#acl localnet src 10.0.0.0/8	# RFC1918 possible internal network
#acl localnet src 172.16.0.0/12	# RFC1918 possible internal network
acl localnet src 192.168.1.0/24	# RFC1918 possible internal network
#acl localnet src fc00::/7       # RFC 4193 local private network range
#acl localnet src fe80::/10      # RFC 4291 link-local (directly plugged) machines

acl SSL_ports port 443
acl Safe_ports port 80		# http
acl Safe_ports port 21		# ftp
acl Safe_ports port 443		# https
acl Safe_ports port 70		# gopher
acl Safe_ports port 210		# wais
acl Safe_ports port 1025-65535	# unregistered ports
acl Safe_ports port 280		# http-mgmt
acl Safe_ports port 488		# gss-http
acl Safe_ports port 591		# filemaker
acl Safe_ports port 777		# multiling http
acl CONNECT method CONNECT

#
# Recommended minimum Access Permission configuration:
#
# Deny requests to certain unsafe ports
http_access deny !Safe_ports

# Deny CONNECT to other than secure SSL ports
http_access deny CONNECT !SSL_ports

# Only allow cachemgr access from localhost
#http_access allow localhost manager
#http_access deny manager

# We strongly recommend the following be uncommented to protect innocent
# web applications running on the proxy server who think the only
# one who can access services on "localhost" is a local user
#http_access deny to_localhost

#
# INSERT YOUR OWN RULE(S) HERE TO ALLOW ACCESS FROM YOUR CLIENTS
#

# Example rule allowing access from your local networks.
# Adapt localnet in the ACL section to list your (internal) IP networks
# from where browsing should be allowed
http_access allow localnet
#http_access allow localhost

# And finally deny all other access to this proxy
http_access deny all

# Squid normally listens to port 3128
# важный параметр, нужен помимо intercept`a
http_port 3128


http_port 192.168.1.178:3127 intercept
https_port 192.168.1.178:3129 intercept ssl-bump cert=/usr/local/squid/etc/squidCA.pem

ssl_bump peek all
ssl_bump splice all
 
sslcrtd_program /usr/lib/squid/ssl_crtd -s /var/lib/ssl_db -M 4MB
sslcrtd_children 5


# Uncomment and adjust the following to add a disk cache directory.
#cache_dir ufs /usr/local/squid/var/cache/squid 100 16 256

# Leave coredumps in the first cache dir
coredump_dir /usr/local/squid/var/cache/squid

#
# Add any of your own refresh_pattern entries above these.
#
refresh_pattern ^ftp:		1440	20%	10080
refresh_pattern ^gopher:	1440	0%	1440
refresh_pattern -i (/cgi-bin/|\?) 0	0%	0
refresh_pattern .		0	20%	4320

```

### Важно!
##### Создать 2 файла логов и выставить максимальные права (
```
root@mail:/usr/local/squid/etc# touch /usr/local/squid/var/logs/{access,cache}.log
root@mail:/usr/local/squid/etc# chmod 777 /usr/local/squid/var/logs/{access,cache}.log
```

Заворачиваем на свкид HTTP и HTTPS трафан (192.168.1.178 -- наша машина со сквидом) :
```
iptables -t nat -A PREROUTING -i enp2s0 -p tcp --dport 80 -j DNAT --to 192.168.1.178:3127
iptables -t nat -A PREROUTING -i enp2s0 -p tcp --dport 443 -j DNAT --to 192.168.1.178:3129
```

Помечаем на микротике (наш defult gw) весь проксёвый трафф:
```
/ip firewall mangle add chain=prerouting action=mark-routing new-routing-mark=SQUID passthrough=yes protocol=tcp 
      src-address=!192.168.1.178 dst-port=80 log=no log-prefix=""

/ip firewall mangle add chain=prerouting action=mark-routing new-routing-mark=SQUIDS passthrough=yes protocol=tcp 
      src-address=!192.168.1.178 dst-port=443 log=no log-prefix=""
```

Роутим на микротике весь помеченный трафф:
```
/ip route add comment=FOR_SQUID gateway=192.168.1.178 routing-mark=SQUID
/ip route add comment=FOR_SQUIDS gateway=192.168.1.178 routing-mark=SQUID
+ сделать список во вкладке Advanced -  если хотим прицелить кого-то 1 для тестов.
```



Полезная ссыль: https://wiki.squid-cache.org/Features/DynamicSslCert


### Важно!
ПОчему-то в боевых (на работке) условиях мне удалось завести этих зверей. HTTPS-траффик проксировался отлично (прозрачно), а вот при роутинге HTTPS-трафика рассыпались все сервисы - SSH / VNC / VPN / RDP.
Возможно, это магия с ~~хуевой тучей~~ правил в рабочем Микротике.

Сделал проще - поставил в браузеры extension: MM3 Web Assistant и заблочил на хомячьих ПК доступ через 80 и 433 порты. 
Вуаля!

