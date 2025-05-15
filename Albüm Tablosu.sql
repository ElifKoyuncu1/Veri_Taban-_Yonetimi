create table Album (
Album_ID int primary key,
Sarkıcı_ID int,
Album_adı varchar(70),
Cikis_Tarihi date,
foreign key (Sarkıcı_ID) references Sarkıcı(Sarkıcı_ID))