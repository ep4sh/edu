![AWS](../../img/aws.png)
# AWS. Сервисы


```Region``` - георгафическое месторасположение (дата-центров)
```Availability Zone``` - изолированный дата-центр, в каждом Регионе минимум 2

#### Region Availability Zone:
```
us-west-1 us-west-1a, us-west-1b, us-west-2c
us-east-2 us-east-2a, us-east-2b
ca-central-1 ca-central-1a, ca-cetnral-1b
```

Выбираем **близжайший** к нашим клиентам ДЦ.


*********************************************************************************
### Сервисы.

 * EC2 - VPS
 * Elastic Load balancing - балансировщик нагрузки
 * Elastic Beanstalk - автоматизация
 * Cloud Front - CDN, кэш-сервис
 * Cloud Watch - мониторинг серверов
 * S3 (Simple Storage Service) - а-ля дропбокс, храние файлов
 * Glacier - сервис хранения данных с долгим (3-5 часов) доступом по запросу.
 * EFS - elastic file system,
 * CloudFormation - Инфраструтура как Код
 * OpsWork - для загрузки данных chef’а
 * RDS - sql-база
 * DynamoDb - NoSql база
 * RedShift - анализ больших данных
 * EMR -(elastic map reduce) работа с big-data
 * IAM (access management)-аналог ldap
 * VPC (virtual private cloud) сеть
 * Route53 - днс-сервер, покупка доменов
 * SES (simple email service) - почта
 * Sns (simple notification services)- сервис уведомлений




