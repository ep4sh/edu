```ect/openvpn/cleint.conf``` :
```
client
dev tun
proto tcp
remote vpn.rxlab.ru 1194
cipher AES-256-CBC
tls-client
comp-lzo

persist-key
persist-tun

# nobind - использовать динамический порт для подключения
nobind
script-security 2

status /var/log/openvpn-status.log
log /var/log/openvpn.log
verb 3
mute 20

# TLS
key-direction 1
# Блок сертификатов / ключей
<ca>
-----BEGIN CERTIFICATE-----
MIIDITCCAgmgAwIBAgIJAKXbFkp0Z2+MMA0GCSqGSIb3DQEBCwUAMBAxDjAMBgNV
BAMMBVJYTEFCMB4XDTE4MDgxOTEwNTYyM1oXDTI4MDgxNjEwNTYyM1owEDEOMAwG
A1UEAwwFUlhMQUIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCoZys2
QPqWvQdq887bcHMlYSsPoJP06G+gPAZYXLc8OJh0YN+tKn2icuHdj+fp7cn4fRhG
+TcmD5WbTlUUxrrxUpoFo/iFd8JgHgFhj/eY0qUpJ9l7RXxameKyqk26llwaQP0T
qPAh3NJ58XrRBE0sO1x8/46ygqkC6TQfvJLBcgTzvKPn/eFffvgrMz3dlL+B6heL
C2GMOzlKiuq7Mfg3XI4HvwiGnHLuVOXnwys/i3Pwqi8zqvuty3/n76pTjjEY/IvS
xrvrC9IEPVM8hIQnp+twpgle434TPkTrKAEChSQgRSDGviivSQKbfmX9hWykwkAL
fbmwpjFHRjIXr8snAgMBAAGjfjB8MB0GA1UdDgQWBBSm0FP3VSveC90txe/VmRSW
kw9YSTBABgNVHSMEOTA3gBSm0FP3VSveC90txe/VmRSWkw9YSaEUpBIwEDEOMAwG
A1UEAwwFUlhMQUKCCQCl2xZKdGdvjDAMBgNVHRMEBTADAQH/MAsGA1UdDwQEAwIB
BjANBgkqhkiG9w0BAQsFAAOCAQEAZL7+nbNC4cWjjwphzCfnWVYTtFwsU+diynim
u2ePWzZpGE1gqj6o+/C5HSggGFtHUAKONS0Ph0oAPShDo8i57eVGb1vrh+yh3Vry
Dz7eePNas6rMVmnN1WL0mmaZfdAXFOkhUAs+D/NxSLXwb/NfINmnJr3uYIcpqogG
qXa9Nat2qRXIKa0yfGMrlqx1HWqBg+yyz3yQ/SFP+lHDJuNn+EwdcYjqfzt4MuNI
EKGMclzl5D6qWoqLhKlpAv7gp34jgUfbR/8vBX63+hg+PTWiPpnpFKbExno4Gthm
ceVbs35705PqLCTvphQmIuoQ804poQc1nNBnf1IC5T4lfWomhQ==
-----END CERTIFICATE-----
</ca>
<key>
-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDKxh4E+39sSCR7
EuNhY3A8J3Byh7RA2w0OHr/pZUpoO/xgkDBftqzIx8n0FfZjTkDbaOIoHdcF+yfE
RmwtW7UyBI4Q8sGa4MT3QT3KM++97XoaYwVAL7AsFifZXBF6pDkGomG96emKhg7b
AK+d1idXfLgcZyihWp7I58UwKNMNyMWlqeervOwtWSP1MPxsgXF8Eb1va894Fcja
TDvC4/CmV9OsVyw36t5+prF4Y0Vmwa5phzAbFHwIlFVAk+CzQrte0xOCPatiIh0w
0+md/3DZfgnolhRyqdjrPJ+3HZtib3PyRk9JxluBvRh7ym/5R7bv+r6kvjA6IAXP
qwActQhbAgMBAAECggEACZtjVrcXrWipmc8mSLnuWls//50gVCZMswuP6h3rbY7S
AT0znYVJIGYe0lqsBr5xYjPQ6zemtVjV5H21qFx89Da1CGaH96+IhXJo3Aij5iq3
K0Lfv8/CmAQgtTKgfWAEd6T/3oCTmQWK9KNOrrqzuHhnPKlCioqBlWEtvX9hqHhy
DHGSk7Y/x82OvwLfr7xATogt1fk3RSGpdjIlE66B+ch0IMMyxCi5ODC/Jj2IzIT
Jtjpp5jl7otZ4tszvUIea/dui4nZYuwxUmBaFqGmPGzCPW8vbmt1tpFYHpX3gJ5g
QPcCJ+fH5LFpty33dI+vHRjBrYPTasrKgBelI1OOmQKBgQDxmPgUKr4KXqRpygLJ
PL6ML7fg0Y88FBGkgxDT2WIY+tgNlBt1YCme5vS5dcqaIGnLcG3SzYK1yCYKHRbc
J/N5ZQAOPzMhRJBHds2er5HOnETKeLjI1vUCL7uBiXQBi3qVzYKajaQj9bbMWhnK
Tf4ULUs4MyTv6qrKiVP7q5h7FQKBgQDW3KisPD+lNEDs6NdoUKm+5UBqv3CrPaVZ
fR9WrE5I5q7f7h0Z2luYBDmGHsw4fqM3E3od29QZ5krONpvi8zSSML8bxcVKJ6m5
e45gHy0rrF0OxuTkWF0FZUJmp9fDrMDakfxrh0o1f01qgYU6Mj4zzdOn5SYT0fSW
zSE+EzqRrwKBgEZymnQW+o8/haWrWCCh69Yo2+9ca+3S1EoqRa/ghXBPRMzA0Tjq
r3g8VEP4CvniVbcSs5NyhZjIIf90+AN+SsqtHtUIrLoYqhGMnOyWuWeLvatkhE1V
EVBv5rchA4inyTkBUgILJz+tGH6CD18kWuA7TOG4WB71SJQCc1DBepb5AoGARqoX
x12hSQIggEor3iD5UtEvGGyR75+8q+vczLKqpItJ5Ff5tjD8gsiQ6q1iWQo9P7Xm
Kb/MyB/XZm7LYh6+oX3qvIWU10ioJ1qdfruCLaTojh2X1gnBvi6JYh29dptwafIt
ZGgAXwhvO6IRYQx5LKx6+fMBTO92U8pvLm1Ai/0CgYBJ5km+pRnis2OkwSbtlaJy
QW43ysL5rn8V5+7EOchxUlMyOl+j4ikUJEO1tGiZhtXh25+OfGLJ4DajoiHJz2mZ
JZwcjrE2H/w16fbUCqzAoCHap1JjpFFnbJ0m9xG3r/i2g71odhke8lzYmbI3ut1O
HtN3BNn29S58IS11Woqs2g==
-----END PRIVATE KEY-----
</key>
<tls-auth>
#
# 2048 bit OpenVPN static key
#
-----BEGIN OpenVPN Static key V1-----
433a3759dd715ad5ac97439d6473a990
02ff889feb3d3bac11ce80ad5f6f6de9
5fc5019f7a94951d9f7c6bacbdcb1259
ec195776ac147963ce57b784538e6329
0619cd46398eb7611c1a8aaf43baecab
bca79cc6727188764dfe690d7a0d0b08
fe865038999d0fef9dc22541fc3b2ae9
a8495dedc0c20d9fe1f32893e72fb3e0
e95be1bae2ef62bddc698a5b7f98632e
4fb9d749722d903281b6ac508bbfeb94
306ed44ac89dd28b921d8e751b0479a6
b36aed84fcfe254353f7c202da9e9e4e
8bdf8839b0d67a22ad2552699a1bfcd0
c1c42d4de7515d506fb75a2849146cb5
0d73c78fd488163ddac0d3e3f1ecb17e
12d26db71a35318a349e06673eec35b5
-----END OpenVPN Static key V1-----
</tls-auth>
<cert>
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            80:f8:33:b9:4f:e9:5d:09:1d:4c:50:48:79:a8:ad:6a
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN=RXLAB
        Validity
            Not Before: Aug 19 11:16:59 2018 GMT
            Not After : Aug 16 11:16:59 2028 GMT
        Subject: CN=vpnuser
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:ca:c6:1e:04:fb:7f:6c:48:24:7b:12:e3:61:63:
                    70:3c:27:70:72:87:b4:40:db:0d:0e:1e:bf:e9:65:
                    4a:68:3b:fc:60:90:30:5f:b6:ac:c8:c7:c9:f4:15:
                    f6:63:4e:40:db:68:e2:28:1d:d7:05:fb:27:c4:46:
                    6c:2d:5b:b5:32:04:8e:10:f2:c1:9a:e0:c4:f7:41:
                    3d:ca:33:ef:bd:ed:7a:1a:63:05:40:2f:b0:2c:16:
                    27:d9:5c:11:7a:a4:39:06:a2:61:bd:e9:e9:8a:86:
                    0e:db:00:af:9d:d6:27:57:7c:b8:1c:67:28:a1:5a:
                    9e:c8:e7:c5:30:28:d3:0d:c8:c5:a5:a9:e7:ab:bc:
                    ec:2d:59:23:f5:30:fc:6c:81:71:7c:11:bd:6f:6b:
                    cf:78:15:c8:da:4c:3b:c2:e3:f0:a6:57:d3:ac:57:
                    2c:37:ea:de:7e:a6:b1:78:63:45:66:c1:ae:69:87:
                    30:1b:14:7c:08:94:51:40:93:e0:b3:42:bb:5e:d3:
                    13:82:3d:ab:62:22:1d:30:d3:e9:9d:ff:70:d9:7e:
                    09:e8:96:14:72:a9:d8:eb:3c:9f:b7:1d:9b:62:6f:
                    73:f2:46:4f:49:c6:5b:81:bd:18:7b:ca:6f:f9:47:
                    b6:ef:fa:be:a4:be:30:3a:20:05:cf:ab:00:1c:b5:
                    08:5b
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: 
                CA:FALSE
            X509v3 Subject Key Identifier: 
                ED:56:A5:62:F4:F3:03:77:D5:60:EB:4D:74:04:7E:C6:2E:3E:A1:31
            X509v3 Authority Key Identifier: 
                keyid:A6:D0:53:F7:55:2B:DE:0B:DD:2D:C5:EF:D5:99:14:96:93:0F:58:49
                DirName:/CN=RXLAB
                serial:A5:DB:16:4A:74:67:6F:8C

            X509v3 Extended Key Usage: 
                TLS Web Client Authentication
            X509v3 Key Usage: 
                Digital Signature
    Signature Algorithm: sha256WithRSAEncryption
         15:60:3d:33:2f:65:4c:52:18:20:ba:80:88:2c:31:e8:41:3d:
         b2:68:20:db:bf:a8:0f:eb:d8:fa:9a:3a:1e:3c:b8:e9:d0:78:
         e9:fb:14:1f:60:3c:90:8b:a9:03:ba:d8:66:a3:61:6c:ed:41:
         09:bf:9f:f0:fa:1f:3a:08:00:8b:4e:bf:ed:0d:4d:ba:d1:51:
         e8:54:85:29:da:dc:9f:92:12:49:af:7e:3b:86:db:45:9e:e6:
         b5:90:85:f4:a5:63:4d:1b:a8:f1:a6:4a:b1:53:3b:3d:6f:19:
         4d:82:1e:8c:f0:2d:af:20:ae:c0:c2:7d:6b:4f:2f:99:e8:c0:
         5c:7c:6d:6f:b3:f9:6c:e8:74:ca:b6:d3:aa:12:fe:02:8c:db:
         5a:0d:0c:ae:a8:cd:c2:5d:09:73:22:c2:87:c0:e6:69:56:a2:
         76:72:0a:cb:e0:f9:08:fd:24:5a:d3:97:a5:95:8f:5f:f3:91:
         30:7f:18:f0:b4:1c:f1:20:82:2b:30:86:bf:b6:11:07:76:8a:
         7d:a2:48:84:f3:47:8d:73:e4:4c:ab:a9:13:bd:9d:49:0f:1b:
         76:3a:b6:5f:f1:72:e4:7f:dd:de:4e:32:bd:76:03:66:6e:5b:
         81:55:c2:e7:ce:da:27:9f:a4:3f:d7:11:52:93:bf:fa:9b:f2:
         f3:79:8d:37
-----BEGIN CERTIFICATE-----
MIIDPzCCAiegAwIBAgIRAID4M7lP6V0JHUxQSHmorWowDQYJKoZIhvcNAQELBQAw
EDEOMAwGA1UEAwwFUlhMQUIwHhcNMTgwODE5MTExNjU5WhcNMjgwODE2MTExNjU5
WjASMRAwDgYDVQQ2Ad2cG51c2VyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAysYeBPt/bEgkexLjYWNwPCdwcoe0QNsNDh6/6WVKaDv8YJAwX7asyMfJ
9BX2Y05A22jiKB3XBfsnxEZsLVu1MgSOEPLBmuDE90E9yjPvve16GmMFQC+wLBYn
2VwReqQ5BqJhvenpioYO2wCvndY113y4HGcooVqeyOfFMCjTDcjFpannq7zsLVkj
9TD8bIFxfBG9b2vPeBXI2kw7wuPwplfTrFcsN+refqaxeGNFZsGuaYcwGxR8CJRV
QJPgs0K7XtMTgj2rYiIdMNPpnf9w2X4J6JYUcqnY6zyftx2bYm9z8kZPScZbgb0Y
e8pv+Ue27/q+pL4wOiAFz6sAHLUIWwIDAQABo4GRMIGOMAkGA1UdEwQCMAAwHQYD
VR0OBBYEFO1WpWL08wN31WDrTXQEfsYuPqExMEAGA1UdIwQ5MDeAFKbQU/dVK94L
3S3F79WZFJaTD1hJoRSkEjAQMQ4wDAYDVQQDDAVSWExBQoIJAKXbFkp0Z2+MMBMG
A1UdJQQMMAoGCCsGAQUFBwMCMAsGA1UdDwQEAwIHgDANBgkqhkiG9w0BAQsFAAOC
AQEAFWA9My9lTFIYILqAiCwx6EE9smgg27+oD+vY+po6Hjy46dB46fsUH2A8kIup
A7rYZqNhbO1BCb+f8PofOggAi06/7Q1NutFR6FSFKdrcn5ISSa9+O4bbRZ7mtZCF
9KVjTRuo8aZKsVM7PW8ZTYIejP32ryCuwMJ9a08vmejAXHxtb7P5bOh0yrbTqhL+
AozbWg0MrqjNwl0JcyLCh8DmaVaidnIKy+D5CP0kWtOXpZWPX/ORMH8Y8LQc8SCC
KzCGv7YRB3aKfaJIhPNHjXPkTKupE72dSQ8bdjq2X/Fy5H/d3k4yvXYDZm5bgVXC
587aJ5+kP9cRUpO/+pvy83mNNw==
-----END CERTIFICATE-----
</cert>
```
