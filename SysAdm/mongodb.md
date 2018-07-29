![MongoDb](../img/mongodb.png)
# MongoDb start

   1. Установить:    
   
   ```apt install mongodb```
   
   2. 
   
   ```vim /etc/mongodb.conf (правим ip)```
   
   3. **Или**  
   
 ```sudo chown -R mongodb:mongodb /var/lib/mongodb```  
 
**Или** помещаем в другую директорию, запуская mondgod с ключем   

```--dbpath mongod&```

   4. Запускаем шелл
   
mongo

   5. Указываем БД
   
```use garage;```

   6. Вставка:  
   
```db.garage.insert( {'fName' : 'Egor', 'lName' : 'Omelchuk', 'car' : 'toyota VISTA' } )```

   7. Апдейт, строго необходимо писать $set, иначе затрёт все поля:  
   
```db.garage.update({ "_id" : ObjectId("5a2d3383f04d264bab6c7503")}, {$set: {'fName':'Igor' }})```

