create table Sarki(
Sarki_ID int primary key,
Album_ID int,
Sark�_ad� varchar(70),
Sure time,
Tur varchar(30),
foreign key (Album_ID) references Album(Album_ID))