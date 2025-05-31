--Her �ark�c�n�n toplam alb�m say�s�

SELECT s.Sark�c�_ad�, COUNT(a.Album_ID) AS Toplam_Album
FROM Sark�c� s
JOIN Album a ON s.Sark�c�_ID = a.Sark�c�_ID
GROUP BY s.Sark�c�_ad�;

--Her alb�mdeki �ark� say�s�

SELECT a.Album_ad�, COUNT(s.Sarki_ID) AS Sarki_Sayisi
FROM Album a
JOIN Sarki s ON a.Album_ID = s.Album_ID
GROUP BY a.Album_ad�;

-- Her kullan�c� i�in toplam dinledi�i �ark� say�s�

SELECT k.Kullan�c�_ad�, SUM(d.Dinleme_Sayisi) AS Toplam_Sarki_Dinleme
FROM Kullan�c� k
JOIN DinlemeGecmisi_Sarki d ON k.Kullan�c�_ID = d.Kullan�c�_ID
GROUP BY k.Kullan�c�_ad�;

--Her kullan�c� i�in toplam dinledi�i podcast say�s�

SELECT k.Kullan�c�_ad�, SUM(d.Dinleme_Sayisi) AS Toplam_Podcast_Dinleme
FROM Kullan�c� k
JOIN DinlemeGecmisi_Podcast d ON k.Kullan�c�_ID = d.Kullan�c�_ID
GROUP BY k.Kullan�c�_ad�;

-- Her t�rdeki (genre) �ark� say�s�

SELECT Tur, COUNT(*) AS Sarki_Sayisi
FROM Sarki
GROUP BY Tur;

--Her podcast yay�mc�s�n�n podcast say�s�

SELECT Yayinci, COUNT(*) AS Podcast_Sayisi
FROM Podcast
GROUP BY Yayinci;

--Kullan�c�lara �nerilen �ark� say�s�

SELECT k.Kullan�c�_ad�, COUNT(o.Oneri_ID) AS Onerilen_Sarki_Sayisi
FROM Kullan�c� k
JOIN SarkiOneri o ON k.Kullan�c�_ID = o.Kullan�c�_ID
GROUP BY k.Kullan�c�_ad�;

--Kullan�c�lara �nerilen podcast say�s�

SELECT k.Kullan�c�_ad�, COUNT(o.Oneri_ID) AS Onerilen_Podcast_Sayisi
FROM Kullan�c� k
JOIN PodcastOneri o ON k.Kullan�c�_ID = o.Kullan�c�_ID
GROUP BY k.Kullan�c�_ad�;

--Her kullan�c� i�in olu�turdu�u �alma listesi say�s�

SELECT k.Kullan�c�_ad�, COUNT(c.Liste_ID) AS Calma_Listesi_Sayisi
FROM Kullan�c� k
JOIN CalmaL�stesi c ON k.Kullan�c�_ID = c.Kullan�c�_ID
GROUP BY k.Kullan�c�_ad�;

--Her �ark�c�n�n �ark�lar�n�n toplam dinlenme say�s�

SELECT sa.Sark�c�_ad�, SUM(d.Dinleme_Sayisi) AS Toplam_Dinlenme
FROM Sark�c� sa
JOIN Album al ON sa.Sark�c�_ID = al.Sark�c�_ID
JOIN Sarki s ON al.Album_ID = s.Album_ID
JOIN DinlemeGecmisi_Sarki d ON s.Sarki_ID = d.Sarki_ID
GROUP BY sa.Sark�c�_ad�;
