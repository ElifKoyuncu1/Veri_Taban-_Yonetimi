--Database

use database m�zik

--DDL

--Veri Ekleme (INSERT INTO)

--�ark�c� Ekleme
INSERT INTO Sark�c� (Sark�c�_ID, Sark�c�_ad�, Biyografi, Ayl�k_dinleyici)
VALUES (1, 'Tarkan', 'T�rk pop m�zi�inin megastar�', 5000000);

--Alb�m Ekleme
INSERT INTO Album (Album_ID, Sark�c�_ID, Album_ad�, Cikis_Tarihi)
VALUES (1, 1, 'Karma', '2001-07-05');

--�ark� Ekleme
INSERT INTO Sarki (Sarki_ID, Album_ID, Sark�_ad�, Sure, Tur)
VALUES (1, 1, 'Kuzu Kuzu', '00:03:45', 'Pop');

--Kullan�c� Ekleme
INSERT INTO Kullan�c� (Kullan�c�_ID, Kullan�c�_ad�, E_mail, Sifre_hash)
VALUES (1, 'mehmet123', 'mehmet@example.com', 'abc123hash');



--Verileri Listeleme (SELECT)

--T�m �ark�c�lar� Listele
SELECT * FROM Sark�c�;

--Belirli T�rdeki �ark�lar� Listele (�rn. Pop)
SELECT Sark�_ad�, Tur FROM Sarki
WHERE Tur = 'Pop';

--Kullan�c�n�n Dinledi�i �ark�lar
SELECT k.Kullan�c�_ad�, s.Sark�_ad�, d.Dinleme_tarihi
FROM DinlemeGecmisi_Sarki d
JOIN Kullan�c� k ON d.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID
WHERE k.Kullan�c�_ID = 1;


--G�ncelleme (UPDATE)

--Kullan�c�n�n E-Postas�n� G�ncelle
UPDATE Kullan�c�
SET E_mail = 'yenimail@example.com'
WHERE Kullan�c�_ID = 1;

--�ark�n�n T�r�n� G�ncelle
UPDATE Sarki
SET Tur = 'Rock'
WHERE Sarki_ID = 1;



--Silme (DELETE)

--Bir �ark�y� Sil
DELETE FROM Sarki
WHERE Sarki_ID = 1;

--Kullan�c�n�n Podcast Dinleme Ge�mi�ini Sil
DELETE FROM DinlemeGecmisi_Podcast
WHERE Kullan�c�_ID = 1;


-- En �ok Dinlenen �ark�lar� Getirme
SELECT s.Sark�_ad�, SUM(d.Dinleme_Sayisi) AS Toplam_Dinlenme
FROM DinlemeGecmisi_Sarki d
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID
GROUP BY s.Sark�_ad�
ORDER BY Toplam_Dinlenme DESC
LIMIT 10;





--DML

--Veri Ekleme (INSERT INTO)
-- �ark�c� ekleme
INSERT INTO Sark�c� (Sark�c�_ID, Sark�c�_ad�, Biyografi, Ayl�k_dinleyici)
VALUES (1, 'Tarkan', 'Pop m�zik sanat��s�', 5000000);

-- Alb�m ekleme
INSERT INTO Album (Album_ID, Sark�c�_ID, Album_ad�, Cikis_Tarihi)
VALUES (1, 1, 'Metamorfoz', '2007-12-25');

-- �ark� ekleme
INSERT INTO Sarki (Sarki_ID, Album_ID, Sark�_ad�, Sure, Tur)
VALUES (1, 1, 'Dilli D�d�k', '00:03:45', 'Pop');

-- Podcast ekleme
INSERT INTO Podcast (Podcast_ID, Basl�k, Yayinci, Hakk�nda, Tur)
VALUES (1, 'Tarih Konu�malar�', 'Ahmet', 'Tarih �zerine sohbetler', 'Tarih');

-- Kullan�c� ekleme
INSERT INTO Kullan�c� (Kullan�c�_ID, Kullan�c�_ad�, E_mail, Sifre_hash)
VALUES (1, 'melisa', 'melisa@example.com', 'abc123');

-- Dinleme ge�mi�i (Podcast)
INSERT INTO DinlemeGecmisi_Podcast (Gecmis_ID, Kullan�c�_ID, Podcast_ID, Dinleme_tarihi, Dinleme_Sayisi, Begeni)
VALUES (1, 1, 1, '2025-05-30 14:00:00', 3, 1);

-- Dinleme ge�mi�i (�ark�)
INSERT INTO DinlemeGecmisi_Sarki (Gecmis_ID, Kullan�c�_ID, Sarki_ID, Dinleme_tarihi, Dinleme_Sayisi, Begeni)
VALUES (1, 1, 1, '2025-05-30 15:00:00', 5, 1);

-- �alma listesi
INSERT INTO CalmaL�stesi (Liste_ID, Kullan�c�_ID, Liste_ad�, Olusturan, Gizlilik, Sarki_ID)
VALUES (1, 1, 'Enerjik Sabahlar', 'melisa', 0, 1);

-- �ark� �nerisi
INSERT INTO SarkiOneri (Oneri_ID, Kullan�c�_ID, Sarki_ID, Oneri_Tarihi)
VALUES (1, 1, 1, '2025-05-31');

-- Podcast �nerisi
INSERT INTO PodcastOneri (Oneri_ID, Kullan�c�_ID, Podcast_ID, Oneri_Tarihi)
VALUES (1, 1, 1, '2025-05-31');



--Veri Sorgulama (SELECT)
-- T�m �ark�c�lar� listele
SELECT * FROM Sark�c�;

-- Belirli bir kullan�c�ya ait �alma listesi
SELECT * FROM CalmaL�stesi WHERE Kullan�c�_ID = 1;

-- Kullan�c�n�n dinledi�i �ark�lar
SELECT Sarki_ad�, Dinleme_tarihi FROM DinlemeGecmisi_Sarki 
JOIN Sarki ON DinlemeGecmisi_Sarki.Sarki_ID = Sarki.Sarki_ID
WHERE Kullan�c�_ID = 1;

-- En �ok dinlenen podcastler
SELECT Podcast.Basl�k, SUM(Dinleme_Sayisi) AS ToplamDinleme 
FROM DinlemeGecmisi_Podcast 
JOIN Podcast ON DinlemeGecmisi_Podcast.Podcast_ID = Podcast.Podcast_ID
GROUP BY Podcast.Basl�k
ORDER BY ToplamDinleme DESC;



--Veri G�ncelleme (UPDATE)
-- �ark�c�n�n ayl�k dinleyici say�s�n� g�ncelle
UPDATE Sark�c�
SET Ayl�k_dinleyici = 6000000
WHERE Sark�c�_ID = 1;

-- �ark� s�resini g�ncelle
UPDATE Sarki
SET Sure = '00:04:00'
WHERE Sarki_ID = 1;



--Veri G�ncelleme (UPDATE)
-- Kullan�c� silme
DELETE FROM Kullan�c�
WHERE Kullan�c�_ID = 1;

-- �ark� �nerisi silme
DELETE FROM SarkiOneri
WHERE Oneri_ID = 1;





--DSL 

--Veri Ekleme (INSERT INTO)
-- �ark�c� Ekleme
INSERT INTO Sark�c� (Sark�c�_ID, Sark�c�_ad�, Biyografi, Ayl�k_dinleyici)
VALUES (1, 'Tarkan', 'T�rk pop m�zi�i sanat��s�.', 5000000);

-- Alb�m Ekleme
INSERT INTO Album (Album_ID, Sark�c�_ID, Album_ad�, Cikis_Tarihi)
VALUES (1, 1, 'Karma', '2001-07-01');

-- �ark� Ekleme
INSERT INTO Sarki (Sarki_ID, Album_ID, Sark�_ad�, Sure, Tur)
VALUES (1, 1, 'Kuzu Kuzu', '00:03:45', 'Pop');

-- Podcast Ekleme
INSERT INTO Podcast (Podcast_ID, Basl�k, Yayinci, Hakk�nda, Tur)
VALUES (1, 'Tarih Sohbetleri', 'Can Yay�nlar�', 'Tarihi olaylar�n tart���ld��� bir podcast.', 'Tarih');

-- Kullan�c� Ekleme
INSERT INTO Kullan�c� (Kullan�c�_ID, Kullan�c�_ad�, E_mail, Sifre_hash)
VALUES (1, 'ahmet123', 'ahmet@example.com', 'abc123xyz');

-- Dinleme Ge�mi�i - �ark�
INSERT INTO DinlemeGecmisi_Sarki (Gecmis_ID, Kullan�c�_ID, Sarki_ID, Dinleme_tarihi, Dinleme_Sayisi, Begeni)
VALUES (1, 1, 1, '2025-05-30 14:00:00', 3, 1);

-- �alma Listesi Ekleme
INSERT INTO CalmaL�stesi (Liste_ID, Kullan�c�_ID, Liste_ad�, Olusturan, Gizlilik, Sarki_ID)
VALUES (1, 1, 'Sabah Listesi', 'ahmet123', 0, 1);


--Veri G�ncelleme (UPDATE)
-- �ark�c�n�n ayl�k dinleyici say�s�n� g�ncelle
UPDATE Sark�c�
SET Ayl�k_dinleyici = 6000000
WHERE Sark�c�_ID = 1;

-- Kullan�c�n�n e-posta adresini de�i�tir
UPDATE Kullan�c�
SET E_mail = 'ahmet_yeni@example.com'
WHERE Kullan�c�_ID = 1;


-- Veri Silme (DELETE)
-- Bir �ark�y� sil
DELETE FROM Sarki
WHERE Sarki_ID = 1;

-- Bir kullan�c�y� sil
DELETE FROM Kullan�c�
WHERE Kullan�c�_ID = 1;


-- Veri Sorgulama (SELECT)
-- T�m �ark�c�lar� listele
SELECT * FROM Sark�c�;

-- Belirli bir kullan�c�ya ait �alma listelerini getir
SELECT * FROM CalmaL�stesi
WHERE Kullan�c�_ID = 1;

-- En �ok dinlenmi� �ark�lar
SELECT S.Sark�_ad�, DG.Dinleme_Sayisi
FROM Sarki S
JOIN DinlemeGecmisi_Sarki DG ON S.Sarki_ID = DG.Sarki_ID
ORDER BY DG.Dinleme_Sayisi DESC;

-- Belirli bir tarihten sonra �nerilen podcastler
SELECT P.Basl�k, PO.Oneri_Tarihi
FROM Podcast P
JOIN PodcastOneri PO ON P.Podcast_ID = PO.Podcast_ID
WHERE PO.Oneri_Tarihi > '2025-01-01';





