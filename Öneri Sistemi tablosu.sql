create table OneriSistemi(
Oneri_ID int primary key,
Kullanýcý_ID int,
Sarki_ID int,
Podcast_ID int,
Oneri_Tarihi date,
foreign key (Kullanýcý_ID) references Kullanýcý(Kullanýcý_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID),
foreign key (Podcast_ID) references Podcast(Podcast_ID))