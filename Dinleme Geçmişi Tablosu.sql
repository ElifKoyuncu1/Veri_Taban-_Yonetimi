create table DinlemeGecmisi(
Gecmis_ID int primary key,
Kullanýcý_ID int,
Sarki_ID int,
Podcast_ID int,
Dinleme_Tarihi datetime,
Dinlenme_Sayýsý int,
Begeni tinyint, -- 1 = beðendi, 0 = beðenemedi
foreign key (Kullanýcý_ID) references Kullanýcý(Kullanýcý_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID),
foreign key (Podcast_ID) references Podcast(Podcast_ID))