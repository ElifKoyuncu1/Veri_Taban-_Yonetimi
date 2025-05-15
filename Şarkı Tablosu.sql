create table Sarki(
Sarki_ID int primary key,
Album_ID int,
Sarký_adý varchar(70),
Sure time,
Tur varchar(30),
foreign key (Album_ID) references Album(Album_ID))