create table CalmaL�stesi(
Liste_ID int primary key,
Kullan�c�_ID int,
Liste_ad� varchar(50),
Olusturan varchar(40),
Gizlilik tinyint,  -- 1 = gizli, 0 = herkese a��k
Sarki_ID int,
foreign key (Kullan�c�_ID) references Kullan�c�(Kullan�c�_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID))