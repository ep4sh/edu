![AWS](../../img/aws.png)
# AWS. CLI

#### Установка:
```
sudo apt install awscli
```

Завести *user`a*  
Записать (*выслать на почту ему Access и Secret KEYS*):

В консоли:  
```
aws configure
ввести Access key
ввести Secret key
Дефолтный регион (eu-central-1)
Output format: (json | text | table)
```

Создается файлы в директории *.aws* с внесённой информацией.

Можно выполнять команды:

```
aws ec2 describe-instances
```
