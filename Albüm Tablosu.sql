create table Album (
Album_ID int primary key,
Sark�c�_ID int,
Album_ad� varchar(70),
Cikis_Tarihi date,
foreign key (Sark�c�_ID) references Sark�c�(Sark�c�_ID))