![KVM](../../img/KVM.png)
# KVM

#### Проверить есть ли консоль:

``` 
virsh ttyconsole my_vm
```

Вывод д.б.:
```
/dev/pts/2
```

#### Если нет - топаем:


```
virsh edit <VM>
```

Вспомнить ~~йобынь~~ неудачи с консолью -- фризы при **"Loading initial ramdisk"**
успеть нажать "E" при загрузке
пойти до ядра (строчка linux) и добавить:
```
 console=ttyS0
```

Потом от рута + reboot:
```
systemctl enable getty@ttyS0
```

Короч совсем немного **магии** :)
