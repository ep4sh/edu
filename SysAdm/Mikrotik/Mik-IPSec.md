![Mikrotik](../../img/Mik.png)

# Mikrotik. IPSec

Алгоритм:  
1.
```
NAT ( SRCNAT: SRC, DST addr) --- правила д.б. выше правила MASQUERADE
|
|----> IP Sec Ploicy (SRC, DST) + Action(Tunnel, SA SRC, SA DST)
|
|---> Peer (Address WAN remote, Secret, на втором маршрутизаторе убрать Initial key, послать трафик)
```
2. ???  
3. PROFIT
