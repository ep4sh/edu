# RSYNC

![Rsync](../../img/rsync.jpg)

``` rsync [src] [dst] ```

   * -a, --archive архивный режим, эквивалент для -rlptgoD
   * -r рекурсивно входить в подкаталоги
   * -l копировать символьные ссылки как символьные ссылки
   * -p сохранять разрешения
   * -t сохранять время
   * -g сохранять группу
   * -o сохранять владельца (только root)
   * -D сохранять файлы устройств (только root)

   * -z сжимать поток
   * **-u** только обновление (не переписывает более новые файлы)
   * -b создавать резервную копию (см. --suffix и --backup-dir)


**get:**

``` rsync -avuzb --exclude '*~' samba:samba/ . ```

**put:**

``` rsync -Cavuzb . samba:samba/ ```

**sync:** 

``` get put ```
