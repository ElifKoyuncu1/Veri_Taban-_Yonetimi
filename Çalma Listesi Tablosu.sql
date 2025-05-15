create table CalmaLÝstesi(
Liste_ID int primary key,
Kullanýcý_ID int,
Liste_adý varchar(50),
Olusturan varchar(40),
Gizlilik tinyint,  -- 1 = gizli, 0 = herkese açýk
Sarki_ID int,
foreign key (Kullanýcý_ID) references Kullanýcý(Kullanýcý_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID))