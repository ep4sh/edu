![AWS](../../img/aws.png)
# AWS. Elastic Cloud Computing - EC2




#### Типы серверов:

 * On demand (по запросу)
 * Spot (делаешь ставку, получаешь сервер, когда цена Амазона <= **YOUR_BID**, terminate когда цена возрастает
 * Reserved 1-3 years (цена ниже на 70%)
 * Scheduled Reserved (daily, weekly, monthly)
 * Dedicated Servers (выделенные сервера, без виртуализации)

* **T** - General purposes
* **M** - General purposes
* **C** - Compute optimized (xeon 2.9)
* **F** - FPGA (аппаратное ускорение приложений)
* **G,P** - GPU otimized
* **X,R** - RAM Mem Optimized
* **D, I** - General purposes


## EBS - Elastics Block Storage

#### Root-boot:
* General purpose SSD, **GP2** - 10k IOPS
* Provisioned IOPS SSD, **IO1** - 20k IOPS
* Magnetic
#### НЕЗАГРУЖАЕМЫЕ ДИСКИ:
* Cold HDD, **SC1**
* Throughput optimized, **ST1**
