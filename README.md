# Bank-server-cash-register-blik-application
Discription:
Project is simulation created in spring web framework,java and andorid studio. The project simulates store cash register (scannerMav): you scan products then choose payement method. There are 2 options: 1.) Blik (myApplication3), 2.) Credit card. If credit card is chosen option the request will be sent to the bank server (demoSpring) wchich processes data and does account uodates. If blik is chosen user uses blik application (MyApplication3) generates blik wchich is validated by bank and then based on blik the account update is performed.

How to use:
There are 3 diffrent programs:
1. ScannerMav - this program simualtes store cash register and is coded in java.
2. myAppliaction3 - this is andorid application that generates blik and sends it to db, it is done in androidStudio.
3. demoSpring - this is program that simulates the bank server wchich takes request from both blik app and store cash regiter, validates data and updates record in db.

To use it run local server. create databases with name products and upload there products2.sql and database with name bank and upload there second sql file.
After that run bank server, then cash register program and blik app. App is designed for barcode scanner but you can just copy paste sample codes from cosnole. Instructions are shown there. Then choose payemnt method and put data for desired user (see db).


ps. blik application was too big so i uploaded it to google drive here is link:
https://drive.google.com/file/d/1NBGeFjYPFShjxlaI3RKxaqHG3bPKQ7C4/view?usp=sharing
