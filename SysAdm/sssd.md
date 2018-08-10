![SSSD](../img/sssd.png)

# SSSD (System Security Services Daemon) позволяет обращаться к удаленным механизмам аутентификации.

Настраивался на Ubuntu, думаю на центоси тоже все будет ок)

1. Проверим или настроим DNS-резолвинг:
```
vim /etc/resolv.conf
search <domain>
nameserver 10.50.1.1
nameserver 10.50.1.2
```

2. apt install ntp
```
vim /etc/ntp.conf
server 10.1.0.9 iburst
server 10.6.1.8 iburst
systemctl restart ntp
```

3. Для автоматизации создания конфы SSSD есть такая штука RealmD - почитай тут:  
[https://freedesktop.org/software/realmd/docs/realm.html](https://freedesktop.org/software/realmd/docs/realm.html)

```
apt install realmd
realm discover <domain> --verbose
vim /etc/realmd.conf
os-name = Ubuntu GNU/Linux
os-version = 16.04.3 LTS

realm join --verbose --user=<USER> DC01.DOMAIN.RU
```

4. apt install krb5-user
```
КОНФИГ /etc/krb5.conf
************************
[libdefaults]
default_realm = IF-CAPITAL.RU
ticket_lifetime = 24d
renew_lifetime = 7d
dns_lookup_realm = false
dns_lookup_kdc = true
```

5. apt install sssd
```
КОНФИГ /etc/sssd/sssd.conf
*********************************
[sssd]
domains = <DOMAIN>
services = nss, pam
config_file_version = 2
default_domain_suffix = DOMAIN.RU

[domain/if-capital.ru]
ad_server = S800DC01.DOMAIN.RU
ad_domain = DOMAIN.RU
krb5_realm = DOMAIN.RU
realmd_tags = manages-system joined-with-adcli
cache_credentials = True
id_provider = ad
krb5_store_password_if_offline = True
default_shell = /bin/bash
ldap_id_mapping = True
use_fully_qualified_names = True
fallback_homedir = /home/%d/%u
access_provider = ad
```

6. klist -- проверяем **TGT**
7. ```login user@domain.ru```

