create table DinlemeGecmisi(
Gecmis_ID int primary key,
Kullan�c�_ID int,
Sarki_ID int,
Podcast_ID int,
Dinleme_Tarihi datetime,
Dinlenme_Say�s� int,
Begeni tinyint, -- 1 = be�endi, 0 = be�enemedi
foreign key (Kullan�c�_ID) references Kullan�c�(Kullan�c�_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID),
foreign key (Podcast_ID) references Podcast(Podcast_ID))