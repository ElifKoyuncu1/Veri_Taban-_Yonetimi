-- Database 

create database m�zik

-- �ark�c� Tablosu

create table Sark�c�(
Sark�c�_ID int primary key,
Sark�c�_ad� varchar(50),
Biyografi text,
Ayl�k_dinleyici int)

-- Alb�m Tablosu

create table Album (
Album_ID int primary key,
Sark�c�_ID int,
Album_ad� varchar(70),
Cikis_Tarihi date,
foreign key (Sark�c�_ID) references Sark�c�(Sark�c�_ID))

-- �ark� Tablosu

create table Sarki(
Sarki_ID int primary key,
Album_ID int,
Sark�_ad� varchar(70),
Sure time,
Tur varchar(30),
foreign key (Album_ID) references Album(Album_ID))

-- Podcast Tablosu

create table Podcast(
Podcast_ID int primary key,
Basl�k varchar(50),
Yayinci varchar(50),
Hakk�nda text,
Tur varchar(20))

-- Kullan�c� Tablosu

create table Kullan�c�(
Kullan�c�_ID int primary key,
Kullan�c�_ad� varchar(50),
E_mail varchar (80) unique,
Sifre_hash varchar(20))

-- Dinleme Ge�mi�i Podcast Tablosu

CREATE TABLE DinlemeGecmisi_Podcast (
    Gecmis_ID INT PRIMARY KEY,
    Kullan�c�_ID INT,
    Podcast_ID INT,
    Dinleme_tarihi DATETIME,
    Dinleme_Sayisi INT,
    Begeni BIT,
    FOREIGN KEY (Kullan�c�_ID) REFERENCES Kullan�c�(Kullan�c�_ID),
    FOREIGN KEY (Podcast_ID) REFERENCES Podcast(Podcast_ID)
);

-- Dinleme Ge�mi�i �ark� Tablosu

CREATE TABLE DinlemeGecmisi_Sarki (
    Gecmis_ID INT PRIMARY KEY,
    Kullan�c�_ID INT,
    Sarki_ID INT,
    Dinleme_tarihi DATETIME,
    Dinleme_Sayisi INT,
    Begeni BIT,
    FOREIGN KEY (Kullan�c�_ID) REFERENCES Kullan�c�(Kullan�c�_ID),
    FOREIGN KEY (Sarki_ID) REFERENCES Sarki(Sarki_ID)
);

-- �alma Listesi Tablosu

create table CalmaL�stesi(
Liste_ID int primary key,
Kullan�c�_ID int,
Liste_ad� varchar(50),
Olusturan varchar(40),
Gizlilik tinyint,  -- 1 = gizli, 0 = herkese a��k
Sarki_ID int,
foreign key (Kullan�c�_ID) references Kullan�c�(Kullan�c�_ID),
foreign key (Sarki_ID) references Sarki(Sarki_ID))

-- �neri Ge�mi�i �ark�

CREATE TABLE SarkiOneri (
    Oneri_ID INT PRIMARY KEY,
    Kullan�c�_ID INT FOREIGN KEY REFERENCES Kullan�c�(Kullan�c�_ID),
    Sarki_ID INT FOREIGN KEY REFERENCES Sarki(Sarki_ID),
    Oneri_Tarihi DATE
);

-- �neri Ge�mi�i Podcast

CREATE TABLE PodcastOneri (
    Oneri_ID INT PRIMARY KEY,
    Kullan�c�_ID INT FOREIGN KEY REFERENCES Kullan�c�(Kullan�c�_ID),
    Podcast_ID INT FOREIGN KEY REFERENCES Podcast(Podcast_ID),
    Oneri_Tarihi DATE
);


