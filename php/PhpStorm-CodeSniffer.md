# Установка CodeSniffer PHPStorm

### Захотелось PSR2

Следуя   https://www.jetbrains.com/help/phpstorm/using-php-code-sniffer-tool.html   можно прийти прямиком в ~~ад~~ тупик.  

Собственно скачали Вы обе утилиты и при "тыкании" (а утилиты работают в PhpStorm "на лету"), ничего не происходит, а еще и в добавок валятся сообщения типа:  


```
phpcs: PHP Fatal error:  Uncaught Error: Call to undefined function PHP_CodeSniffer\Util\simplexml_load_string() in phar

```

Решение могучее и ужасное (на моей Ubuntu 18.04) работает:  
`
sudo apt-get install php-xml
`
