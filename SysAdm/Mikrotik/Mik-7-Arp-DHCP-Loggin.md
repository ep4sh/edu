![Mikrotik](../../img/Mik.png)

# Mikrotik. MTCNA. Logging. DHCP. ARP

#### System -> Logging  

Action:
  * disk - скидывает логи на флешку, плохо, флешка маленькая и портится
  * echo - пишет в оперативку, средне.
  * remote - отправка на удаённый сервер, хорошо


#### IP->DHCP  

**Add default reoute:**
 * -> yes, опция 3
 * -> no, ничего
 * -> special classes, опция 121 и опция 3

#### ARP  

 * enabled - отвечает на запросы
 * disbled - не отвечает
 * reply-only - отвечать, только если уже есть в таблице
 * proxy-arp - посредничать и передавать запросы.
