--Her þarkýcýnýn toplam albüm sayýsý

SELECT s.Sarkýcý_adý, COUNT(a.Album_ID) AS Toplam_Album
FROM Sarkýcý s
JOIN Album a ON s.Sarkýcý_ID = a.Sarkýcý_ID
GROUP BY s.Sarkýcý_adý;

--Her albümdeki þarký sayýsý

SELECT a.Album_adý, COUNT(s.Sarki_ID) AS Sarki_Sayisi
FROM Album a
JOIN Sarki s ON a.Album_ID = s.Album_ID
GROUP BY a.Album_adý;

-- Her kullanýcý için toplam dinlediði þarký sayýsý

SELECT k.Kullanýcý_adý, SUM(d.Dinleme_Sayisi) AS Toplam_Sarki_Dinleme
FROM Kullanýcý k
JOIN DinlemeGecmisi_Sarki d ON k.Kullanýcý_ID = d.Kullanýcý_ID
GROUP BY k.Kullanýcý_adý;

--Her kullanýcý için toplam dinlediði podcast sayýsý

SELECT k.Kullanýcý_adý, SUM(d.Dinleme_Sayisi) AS Toplam_Podcast_Dinleme
FROM Kullanýcý k
JOIN DinlemeGecmisi_Podcast d ON k.Kullanýcý_ID = d.Kullanýcý_ID
GROUP BY k.Kullanýcý_adý;

-- Her türdeki (genre) þarký sayýsý

SELECT Tur, COUNT(*) AS Sarki_Sayisi
FROM Sarki
GROUP BY Tur;

--Her podcast yayýmcýsýnýn podcast sayýsý

SELECT Yayinci, COUNT(*) AS Podcast_Sayisi
FROM Podcast
GROUP BY Yayinci;

--Kullanýcýlara önerilen þarký sayýsý

SELECT k.Kullanýcý_adý, COUNT(o.Oneri_ID) AS Onerilen_Sarki_Sayisi
FROM Kullanýcý k
JOIN SarkiOneri o ON k.Kullanýcý_ID = o.Kullanýcý_ID
GROUP BY k.Kullanýcý_adý;

--Kullanýcýlara önerilen podcast sayýsý

SELECT k.Kullanýcý_adý, COUNT(o.Oneri_ID) AS Onerilen_Podcast_Sayisi
FROM Kullanýcý k
JOIN PodcastOneri o ON k.Kullanýcý_ID = o.Kullanýcý_ID
GROUP BY k.Kullanýcý_adý;

--Her kullanýcý için oluþturduðu çalma listesi sayýsý

SELECT k.Kullanýcý_adý, COUNT(c.Liste_ID) AS Calma_Listesi_Sayisi
FROM Kullanýcý k
JOIN CalmaLÝstesi c ON k.Kullanýcý_ID = c.Kullanýcý_ID
GROUP BY k.Kullanýcý_adý;

--Her þarkýcýnýn þarkýlarýnýn toplam dinlenme sayýsý

SELECT sa.Sarkýcý_adý, SUM(d.Dinleme_Sayisi) AS Toplam_Dinlenme
FROM Sarkýcý sa
JOIN Album al ON sa.Sarkýcý_ID = al.Sarkýcý_ID
JOIN Sarki s ON al.Album_ID = s.Album_ID
JOIN DinlemeGecmisi_Sarki d ON s.Sarki_ID = d.Sarki_ID
GROUP BY sa.Sarkýcý_adý;
