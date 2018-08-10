![Mikrotik](../../img/Mik.png)

# Mikrotik. MTCNA. QoS

### Queues  
используется для ограничения и приоритезации трафика  
1. Simpe queues (ограничить скоростЬ)
2. Queue tree

#### Simple:
 * target : host, met, interface\
 * 0..50% - green
 * 50..75% - orange
 * 75-100% - red

Target Upload / Target Download ----- ДЛЯ НАС, ХОМЯКОВ!(понимать с нашей стороны :) )  
packet Mark - маркирует траффик в firewall, назначает скорость    

#### Queue tree

CIR - commited info rate - гарантированная скорость => **limit at**  
MIR - MAX info RATE - максимальная скорость - **max limit**  

```
MAX = 10 (между потребителями)
|_____________________________child (at = 2M, max =5M, p=1)
|__________________child (at = 3M, max = 6M, p=2)
|_______child (at = 5M, max =10M, p=3)
```

```Priority: (high) 1...........8 (low)```
Можно делать метку трафика через conn. mark  


**Brusting** -- ускорение "взрывной" (web) нагрузки

```
----------100Mb--------> ( buffer size) -----> drop пакетов из-за неуспевания
\-----------------X------> (2Mb)
```

**Queu type, PCQ (per connections queue):**
Rate = 0 ----- скорости будут распределены **"честно"** между клиентами.
```
______________________________
| | | |
O O O O
```
