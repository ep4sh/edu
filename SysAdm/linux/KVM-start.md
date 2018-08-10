![KVM](../../img/KVM.png)
# KVM

#### ПРоверим включена ли виртуализация:
```
grep -E '(vmx|svm)' /proc/cpuinfo
kvm-ok
```
СТавим утилиты:

```
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
```
```
/var/lib/libvirt/boot --> ISO образы
/var/lib/libvirt/images --> Образы VM
Назначить static IP адрес через DHCP гипервизора:
virsh net-update default add ip-dhcp-host \
"<host mac='52:54:00:00:00:01' \
name='bob' ip='192.168.122.45' />" \
--live --config
```

Список доступных вариантов ОС (sudo apt-get install libosinfo-bin):
```
osinfo-query os
```

Для установки понадобится (удобненько) ```virt-install``` (содержится в пакете ```virt-manager```).


#### Пример установки:
```
*******sudo virt-install --virt-type kvm \
--name MR \
--location http://ftp.at.debian.org/debian/dists/stable/main/installer-amd64/ \
--extra-args='console=tty0 console=ttyS0,115200n8 serial' -v --os-variant debiansqueeze \
--disk path=/var/lib/libvirt/images/MR.qcow2,size=15 \
--memory 1024
```

```
virt-install \
--name centos7 \
--ram 1024 \
--disk path=/var/lib/libvirt/images/MR1.qcow2,size=15 \
--vcpus 1 \
--os-type linux \
--os-variant rhel7 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--location http://ftp.iij.ad.jp/pub/linux/centos/7/os/x86_64/\
--extra-args 'console=ttyS0,115200n8 serial'
```
```
sudo virt-install \
--virt-type kvm \
--name MR \
--location http://ftp.at.debian.org/debian/dists/stable/main/installer-amd64/ \
--extra-args "console=ttyS0" \
--disk path=/var/lib/libvirt/images/MR.qcow2,size=10 \
--memory 1024
```

```
sudo virt-install \
--virt-type kvm \
--name test8 \
--memory 512 \
--disk path=/var/lib/libvirt/images/test8-1.qcow2,size=5 \
--disk path=/var/lib/libvirt/images/test8-2.qcow2,size=2 \
--location http://ftp.at.debian.org/debian/dists/stable/main/installer-amd64/ \
--graphics none \
--extra-args='console tty0 console=ttyS0,115200n8 serial'
```
```
******* Самый лютый вариант + нужен tightVNC: 10.50.133.98::5900 **********
sudo virt-install \
--name centos7 \
--ram 1024 \
--disk path=/var/lib/libvirt/images/MR1.qcow2,size=15 \
--vcpus 1 \
--os-type linux \
--os-variant rhel7 \
--network=bridge:br0 \
--graphics vnc,listen=0.0.0.0 \
--console pty,target_type=serial \
--cdrom /home/p4sh/centos.iso
```


#### Остановка VM:
```
virsh destroy <vm>
virsh shutdown <vm>
```

#### Удаление VM:
```
virsh undefine <vm>
```

Подключиться к консольке:
```
virsh console <vm>
```




