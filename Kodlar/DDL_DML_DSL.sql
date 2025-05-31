--Database

use database müzik

--DDL

--Veri Ekleme (INSERT INTO)

--Þarkýcý Ekleme
INSERT INTO Sarkýcý (Sarkýcý_ID, Sarkýcý_adý, Biyografi, Aylýk_dinleyici)
VALUES (1, 'Tarkan', 'Türk pop müziðinin megastarý', 5000000);

--Albüm Ekleme
INSERT INTO Album (Album_ID, Sarkýcý_ID, Album_adý, Cikis_Tarihi)
VALUES (1, 1, 'Karma', '2001-07-05');

--Þarký Ekleme
INSERT INTO Sarki (Sarki_ID, Album_ID, Sarký_adý, Sure, Tur)
VALUES (1, 1, 'Kuzu Kuzu', '00:03:45', 'Pop');

--Kullanýcý Ekleme
INSERT INTO Kullanýcý (Kullanýcý_ID, Kullanýcý_adý, E_mail, Sifre_hash)
VALUES (1, 'mehmet123', 'mehmet@example.com', 'abc123hash');



--Verileri Listeleme (SELECT)

--Tüm Þarkýcýlarý Listele
SELECT * FROM Sarkýcý;

--Belirli Türdeki Þarkýlarý Listele (örn. Pop)
SELECT Sarký_adý, Tur FROM Sarki
WHERE Tur = 'Pop';

--Kullanýcýnýn Dinlediði Þarkýlar
SELECT k.Kullanýcý_adý, s.Sarký_adý, d.Dinleme_tarihi
FROM DinlemeGecmisi_Sarki d
JOIN Kullanýcý k ON d.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID
WHERE k.Kullanýcý_ID = 1;


--Güncelleme (UPDATE)

--Kullanýcýnýn E-Postasýný Güncelle
UPDATE Kullanýcý
SET E_mail = 'yenimail@example.com'
WHERE Kullanýcý_ID = 1;

--Þarkýnýn Türünü Güncelle
UPDATE Sarki
SET Tur = 'Rock'
WHERE Sarki_ID = 1;



--Silme (DELETE)

--Bir Þarkýyý Sil
DELETE FROM Sarki
WHERE Sarki_ID = 1;

--Kullanýcýnýn Podcast Dinleme Geçmiþini Sil
DELETE FROM DinlemeGecmisi_Podcast
WHERE Kullanýcý_ID = 1;


-- En Çok Dinlenen Þarkýlarý Getirme
SELECT s.Sarký_adý, SUM(d.Dinleme_Sayisi) AS Toplam_Dinlenme
FROM DinlemeGecmisi_Sarki d
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID
GROUP BY s.Sarký_adý
ORDER BY Toplam_Dinlenme DESC
LIMIT 10;





--DML

--Veri Ekleme (INSERT INTO)
-- Þarkýcý ekleme
INSERT INTO Sarkýcý (Sarkýcý_ID, Sarkýcý_adý, Biyografi, Aylýk_dinleyici)
VALUES (1, 'Tarkan', 'Pop müzik sanatçýsý', 5000000);

-- Albüm ekleme
INSERT INTO Album (Album_ID, Sarkýcý_ID, Album_adý, Cikis_Tarihi)
VALUES (1, 1, 'Metamorfoz', '2007-12-25');

-- Þarký ekleme
INSERT INTO Sarki (Sarki_ID, Album_ID, Sarký_adý, Sure, Tur)
VALUES (1, 1, 'Dilli Düdük', '00:03:45', 'Pop');

-- Podcast ekleme
INSERT INTO Podcast (Podcast_ID, Baslýk, Yayinci, Hakkýnda, Tur)
VALUES (1, 'Tarih Konuþmalarý', 'Ahmet', 'Tarih üzerine sohbetler', 'Tarih');

-- Kullanýcý ekleme
INSERT INTO Kullanýcý (Kullanýcý_ID, Kullanýcý_adý, E_mail, Sifre_hash)
VALUES (1, 'melisa', 'melisa@example.com', 'abc123');

-- Dinleme geçmiþi (Podcast)
INSERT INTO DinlemeGecmisi_Podcast (Gecmis_ID, Kullanýcý_ID, Podcast_ID, Dinleme_tarihi, Dinleme_Sayisi, Begeni)
VALUES (1, 1, 1, '2025-05-30 14:00:00', 3, 1);

-- Dinleme geçmiþi (Þarký)
INSERT INTO DinlemeGecmisi_Sarki (Gecmis_ID, Kullanýcý_ID, Sarki_ID, Dinleme_tarihi, Dinleme_Sayisi, Begeni)
VALUES (1, 1, 1, '2025-05-30 15:00:00', 5, 1);

-- Çalma listesi
INSERT INTO CalmaLÝstesi (Liste_ID, Kullanýcý_ID, Liste_adý, Olusturan, Gizlilik, Sarki_ID)
VALUES (1, 1, 'Enerjik Sabahlar', 'melisa', 0, 1);

-- Þarký önerisi
INSERT INTO SarkiOneri (Oneri_ID, Kullanýcý_ID, Sarki_ID, Oneri_Tarihi)
VALUES (1, 1, 1, '2025-05-31');

-- Podcast önerisi
INSERT INTO PodcastOneri (Oneri_ID, Kullanýcý_ID, Podcast_ID, Oneri_Tarihi)
VALUES (1, 1, 1, '2025-05-31');



--Veri Sorgulama (SELECT)
-- Tüm þarkýcýlarý listele
SELECT * FROM Sarkýcý;

-- Belirli bir kullanýcýya ait çalma listesi
SELECT * FROM CalmaLÝstesi WHERE Kullanýcý_ID = 1;

-- Kullanýcýnýn dinlediði þarkýlar
SELECT Sarki_adý, Dinleme_tarihi FROM DinlemeGecmisi_Sarki 
JOIN Sarki ON DinlemeGecmisi_Sarki.Sarki_ID = Sarki.Sarki_ID
WHERE Kullanýcý_ID = 1;

-- En çok dinlenen podcastler
SELECT Podcast.Baslýk, SUM(Dinleme_Sayisi) AS ToplamDinleme 
FROM DinlemeGecmisi_Podcast 
JOIN Podcast ON DinlemeGecmisi_Podcast.Podcast_ID = Podcast.Podcast_ID
GROUP BY Podcast.Baslýk
ORDER BY ToplamDinleme DESC;



--Veri Güncelleme (UPDATE)
-- Þarkýcýnýn aylýk dinleyici sayýsýný güncelle
UPDATE Sarkýcý
SET Aylýk_dinleyici = 6000000
WHERE Sarkýcý_ID = 1;

-- Þarký süresini güncelle
UPDATE Sarki
SET Sure = '00:04:00'
WHERE Sarki_ID = 1;



--Veri Güncelleme (UPDATE)
-- Kullanýcý silme
DELETE FROM Kullanýcý
WHERE Kullanýcý_ID = 1;

-- Þarký önerisi silme
DELETE FROM SarkiOneri
WHERE Oneri_ID = 1;





--DSL 

--Veri Ekleme (INSERT INTO)
-- Þarkýcý Ekleme
INSERT INTO Sarkýcý (Sarkýcý_ID, Sarkýcý_adý, Biyografi, Aylýk_dinleyici)
VALUES (1, 'Tarkan', 'Türk pop müziði sanatçýsý.', 5000000);

-- Albüm Ekleme
INSERT INTO Album (Album_ID, Sarkýcý_ID, Album_adý, Cikis_Tarihi)
VALUES (1, 1, 'Karma', '2001-07-01');

-- Þarký Ekleme
INSERT INTO Sarki (Sarki_ID, Album_ID, Sarký_adý, Sure, Tur)
VALUES (1, 1, 'Kuzu Kuzu', '00:03:45', 'Pop');

-- Podcast Ekleme
INSERT INTO Podcast (Podcast_ID, Baslýk, Yayinci, Hakkýnda, Tur)
VALUES (1, 'Tarih Sohbetleri', 'Can Yayýnlarý', 'Tarihi olaylarýn tartýþýldýðý bir podcast.', 'Tarih');

-- Kullanýcý Ekleme
INSERT INTO Kullanýcý (Kullanýcý_ID, Kullanýcý_adý, E_mail, Sifre_hash)
VALUES (1, 'ahmet123', 'ahmet@example.com', 'abc123xyz');

-- Dinleme Geçmiþi - Þarký
INSERT INTO DinlemeGecmisi_Sarki (Gecmis_ID, Kullanýcý_ID, Sarki_ID, Dinleme_tarihi, Dinleme_Sayisi, Begeni)
VALUES (1, 1, 1, '2025-05-30 14:00:00', 3, 1);

-- Çalma Listesi Ekleme
INSERT INTO CalmaLÝstesi (Liste_ID, Kullanýcý_ID, Liste_adý, Olusturan, Gizlilik, Sarki_ID)
VALUES (1, 1, 'Sabah Listesi', 'ahmet123', 0, 1);


--Veri Güncelleme (UPDATE)
-- Þarkýcýnýn aylýk dinleyici sayýsýný güncelle
UPDATE Sarkýcý
SET Aylýk_dinleyici = 6000000
WHERE Sarkýcý_ID = 1;

-- Kullanýcýnýn e-posta adresini deðiþtir
UPDATE Kullanýcý
SET E_mail = 'ahmet_yeni@example.com'
WHERE Kullanýcý_ID = 1;


-- Veri Silme (DELETE)
-- Bir þarkýyý sil
DELETE FROM Sarki
WHERE Sarki_ID = 1;

-- Bir kullanýcýyý sil
DELETE FROM Kullanýcý
WHERE Kullanýcý_ID = 1;


-- Veri Sorgulama (SELECT)
-- Tüm þarkýcýlarý listele
SELECT * FROM Sarkýcý;

-- Belirli bir kullanýcýya ait çalma listelerini getir
SELECT * FROM CalmaLÝstesi
WHERE Kullanýcý_ID = 1;

-- En çok dinlenmiþ þarkýlar
SELECT S.Sarký_adý, DG.Dinleme_Sayisi
FROM Sarki S
JOIN DinlemeGecmisi_Sarki DG ON S.Sarki_ID = DG.Sarki_ID
ORDER BY DG.Dinleme_Sayisi DESC;

-- Belirli bir tarihten sonra önerilen podcastler
SELECT P.Baslýk, PO.Oneri_Tarihi
FROM Podcast P
JOIN PodcastOneri PO ON P.Podcast_ID = PO.Podcast_ID
WHERE PO.Oneri_Tarihi > '2025-01-01';





