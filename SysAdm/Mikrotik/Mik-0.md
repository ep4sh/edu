![Mikrotik](../../img/Mik.png)

# Mikrotik. RouterBoard, CloudCore, маркировка и тп

Mikrotik - работает от **-30** до **+70** уверенно.  

Много моделей с **PoE**, можно создавать цепочки:
```
__________________________________________
|___M __|--------------------- |____M ___ |
```
PoE in 48V PoE Out
Куча девайсов (**MFM - Made For Mikrotik**) - разработки сторонних компаний.

**RB** - аппаратная платформа с установленной routerOS, одна на всех девайсах
**CCR** - Cloud Core Router - очень мощный RB.

_**Маркировка ROUTERBoard**_
***********************************************************************************
**RB911-2Hn:**
RB - routerboard
  * 9 серия
  * 1 проводной интерфейс
  * 1 беспроводной, возможный
  * 2 - 2.4 Ghz Wifi
  * H - high, высокая мощность
  * n - карта с поддержкой 802.11n

**RB750-r2**
  * RB - routerboard
  * 7 серия
  * 5 проводных и-сов
  * 0 беспроводных
  * r2 - второй релиз

**Rb2011UiAS-2HnD-IN**
  * RB - routerboard
  * 2011 серия
  * U - usb-порт
  * i - PoE порт
  * A - advanced, больше RAM
  * S - наличие SFP
  * 2 - 2.4 GHz
  * H - высокая мощность
  * n - 802.11n
  * D - dual channel
  * IN - напольный вариант

**WAP AC (RB wAPG-5HacT2HnD)**
  * RB - routerboard
  * wAP - имя платформы
  * G - гигабитный порт
  * 5 - 5 GHz
  * H - высокая мощность
  * ac - 802.11ac
  * T - triple, три канала
  * 2 - 2.4 Ghz
  * H - высокой мощности
  * n - 802.11n
  * D - dual channel

***********************************************************************************

** Маркировка Cloud Core **
```
<4x> - <список портов> - <исполнение>
|       |       |
|_______|_____________________<серия> <ID> <кол-во ядер и ЦП>
        |       | 
        <nG>(gigabit) <nS> (sfp) <nS+> (sfp+)
                |
                |_____вариант исполнения (PASSIVE COOLING) 
```