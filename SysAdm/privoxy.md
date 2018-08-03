# PRIVOXY. helps users to protect their privacy

```
sudo apt install privoxy
sudo apt install tor
sudo reboot 
```
__(видимо обязательно - словил злоебучий глюк, когда браузер под тором соединялся с Тор-сетью успешно, но ругался что прокси недоступен =.)__
```
sudo vim /etc/privoxy/config
/9050 && uncomment (sock5 proxy for TOR)
/8118 && uncomment (listen addr)
:wq
```

**OWASP ZAP**

```
Tools->Options-> Connections->Use outgoing proxy
127.0.0.1 : 8118 (to privoxy)
```

**Browser**

```
Pref -> Advanced -> Network -> settings -> manual proxy
127.0.0.1 : 8080 (to ZAP)
```
