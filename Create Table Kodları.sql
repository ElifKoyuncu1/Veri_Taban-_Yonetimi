-- Database 

create database müzik

-- Þarkýcý Tablosu

create table Sarkýcý(
Sarkýcý_ID int primary key,
Sarkýcý_adý varchar(50),
Biyografi text,
Aylýk_dinleyici int)

-- Albüm Tablosu

create table Album (
Album_ID int primary key,
Sarkýcý_ID int,
Album_adý varchar(70),
Cikis_Tarihi date,
foreign key (Sarkýcý_ID) references Sarkýcý(Sarkýcý_ID))

-- Þarký Tablosu

create table Sarki(
Sarki_ID int primary key,
Album_ID int,
Sarký_adý varchar(70),
Sure time,
Tur varchar(30),
foreign key (Album_ID) references Album(Album_ID))

-- Podcast Tablosu

create table Podcast(
Podcast_ID int primary key,
Baslýk varchar(50),
Yayinci varchar(50),
Hakkýnda text,
Tur varchar(20))

-- Kullanýcý Tablosu

create table Kullanýcý(
Kullanýcý_ID int primary key,
Kullanýcý_adý varchar(50),
E_mail varchar (80) unique,
Sifre_hash varchar(20))

-- Dinleme Geçmiþi Podcast Tablosu

CREATE TABLE DinlemeGecmisi_Podcast (
    Gecmis_ID INT PRIMARY KEY,
    Kullanýcý_ID INT,
    Podcast_ID INT,
    Dinleme_tarihi DATETIME,
    Dinleme_Sayisi INT,
    Begeni BIT,
    FOREIGN KEY (Kullanýcý_ID) REFERENCES Kullanýcý(Kullanýcý_ID),
    FOREIGN KEY (Podcast_ID) REFERENCES Podcast(Podcast_ID)
);

-- Dinleme Geçmiþi Þarký Tablosu

CREATE TABLE DinlemeGecmisi_Sarki (
    Gecmis_ID INT PRIMARY KEY,
    Kullanýcý_ID INT,
    Sarki_ID INT,
    Dinleme_tarihi DATETIME,
    Dinleme_Sayisi INT,
    Begeni BIT,
    FOREIGN KEY (Kullanýcý_ID) REFERENCES Kullanýcý(Kullanýcý_ID),
    FOREIGN KEY (Sarki_ID) REFERENCES Sarki(Sarki_ID)
);

-- Çalma Listesi Tablosu

create table CalmaLÝstesi(
Liste_ID int primary key,
Kullanýcý_ID int,
Liste_adý varchar(50),
Olusturan varchar(40),
Gizlilik tinyint,  -- 1 = gizli, 0 = herkese açýk
Sarki_ID int,
foreign key (Kullanýcý_ID) references Kullanýcý(Kullanýcý_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID))

-- Öneri Geçmiþi Þarký

CREATE TABLE SarkiOneri (
    Oneri_ID INT PRIMARY KEY,
    Kullanýcý_ID INT FOREIGN KEY REFERENCES Kullanýcý(Kullanýcý_ID),
    Sarki_ID INT FOREIGN KEY REFERENCES Sarki(Sarki_ID),
    Oneri_Tarihi DATE
);

-- Öneri Geçmiþi Podcast

CREATE TABLE PodcastOneri (
    Oneri_ID INT PRIMARY KEY,
    Kullanýcý_ID INT FOREIGN KEY REFERENCES Kullanýcý(Kullanýcý_ID),
    Podcast_ID INT FOREIGN KEY REFERENCES Podcast(Podcast_ID),
    Oneri_Tarihi DATE
);


