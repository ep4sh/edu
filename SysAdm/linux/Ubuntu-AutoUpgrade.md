# Автоматическое обновление систем

Пакет **unattended-upgrades** может использоваться для автоматической установки обновлённых пакетов и может быть сконфигурирован на обновление всех пакетов или установку только изменений для безопасности системы.

```
sudo apt-get install unattended-upgrades
```

#### Конфиг:
```
vim /etc/apt/apt.conf.d/50unattended-upgrades

Unattended-Upgrade::Allowed-Origins {
"Ubuntu precise-security";
// "Ubuntu precise-updates";
};
```


#### БлэкЛист:
```

Unattended-Upgrade::Package-Blacklist {
// "vim";
// "libc6";
// "libc6-dev";
// "libc6-i686";
};
```

#### Чтобы включить автоматические обновления, отредактируйте
```
/etc/apt/apt.conf.d/10periodic
```
и задайте соответствующие конфигурационные параметры apt:
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1"; ```
