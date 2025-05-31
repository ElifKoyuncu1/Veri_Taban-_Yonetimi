--En �ok Dinlenmi� �ark�y� Getir (Alt sorguyla)

SELECT *
FROM Sarki
WHERE Sarki_ID = (
    SELECT TOP 1 Sarki_ID
    FROM DinlemeGecmisi_Sarki
    GROUP BY Sarki_ID
    ORDER BY SUM(Dinleme_Sayisi) DESC
);

--Belirli bir kullan�c�n�n en �ok dinledi�i podcast ba�l���n� getir

SELECT Basl�k
FROM Podcast
WHERE Podcast_ID = (
    SELECT TOP 1 Podcast_ID
    FROM DinlemeGecmisi_Podcast
    WHERE Kullan�c�_ID = 1
    GROUP BY Podcast_ID
    ORDER BY SUM(Dinleme_Sayisi) DESC
);


--Hi� alb�m� olmayan �ark�c�lar� listele

SELECT Sark�c�_ad�
FROM Sark�c�
WHERE Sark�c�_ID NOT IN (
    SELECT DISTINCT Sark�c�_ID
    FROM Album
);

--En �ok be�enilen �ark�n�n ait oldu�u alb�m ad�

SELECT Album_ad�
FROM Album
WHERE Album_ID = (
    SELECT Album_ID
    FROM Sarki
    WHERE Sarki_ID = (
        SELECT TOP 1 Sarki_ID
        FROM DinlemeGecmisi_Sarki
        WHERE Begeni = 1
        GROUP BY Sarki_ID
        ORDER BY COUNT(*) DESC
    )
);

--Kullan�c�n�n dinledi�i �ark�lar�n t�rlerini listele (tekil)

SELECT DISTINCT Tur
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM DinlemeGecmisi_Sarki
    WHERE Kullan�c�_ID = 1
);

--Bir kullan�c�ya �nerilen ve daha �nce hi� dinlemedi�i �ark�lar

SELECT Sark�_ad�
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM SarkiOneri
    WHERE Kullan�c�_ID = 1
)
AND Sarki_ID NOT IN (
    SELECT Sarki_ID
    FROM DinlemeGecmisi_Sarki
    WHERE Kullan�c�_ID = 1
);

-- �ark� s�resi en uzun olan �ark�c�n�n ad�

SELECT Sark�c�_ad�
FROM Sark�c�
WHERE Sark�c�_ID = (
    SELECT Album.Sark�c�_ID
    FROM Sarki
    JOIN Album ON Sarki.Album_ID = Album.Album_ID
    WHERE Sure = (
        SELECT MAX(Sure)
        FROM Sarki
    )
);

--Kullan�c� ad� "ahmet" olan ki�inin dinledi�i podcastlerin ba�l�klar�

SELECT Basl�k
FROM Podcast
WHERE Podcast_ID IN (
    SELECT Podcast_ID
    FROM DinlemeGecmisi_Podcast
    WHERE Kullan�c�_ID = (
        SELECT Kullan�c�_ID
        FROM Kullan�c�
        WHERE Kullan�c�_ad� = 'ahmet'
    )
);

-- En az bir podcast be�enmi� kullan�c�lar�n e-posta adresleri

SELECT E_mail
FROM Kullan�c�
WHERE Kullan�c�_ID IN (
    SELECT Kullan�c�_ID
    FROM DinlemeGecmisi_Podcast
    WHERE Begeni = 1
);

--Hi� �ark� �nerilmemi� kullan�c�lar� listele

SELECT Kullan�c�_ad�
FROM Kullan�c�
WHERE Kullan�c�_ID NOT IN (
    SELECT Kullan�c�_ID
    FROM SarkiOneri
);

--�ark�larla ayn� t�rde olan podcastleri bul

SELECT DISTINCT Basl�k
FROM Podcast
WHERE Tur IN (
    SELECT DISTINCT Tur
    FROM Sarki
);

--Dinlenme say�s� ortalaman�n �st�nde olan �ark�lar

SELECT Sark�_ad�
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM DinlemeGecmisi_Sarki
    GROUP BY Sarki_ID
    HAVING AVG(Dinleme_Sayisi) > (
        SELECT AVG(Dinleme_Sayisi)
        FROM DinlemeGecmisi_Sarki
    )
);

--En son olu�turulan �alma listesinin ad�n� bul

SELECT Liste_ad�
FROM CalmaL�stesi
WHERE Liste_ID = (
    SELECT MAX(Liste_ID)
    FROM CalmaL�stesi
);

--Kullan�c�lar�n toplamda ka� �ark� be�endi�ini g�ster

SELECT Kullan�c�_ad�, (
    SELECT COUNT(*)
    FROM DinlemeGecmisi_Sarki
    WHERE DinlemeGecmisi_Sarki.Kullan�c�_ID = Kullan�c�.Kullan�c�_ID AND Begeni = 1
) AS Begenilen_Sarki_Sayisi
FROM Kullan�c�;

--Kullan�c�n�n olu�turdu�u listedeki t�m �ark�lar� getir (�rnek i�in kullan�c� ID = 2)

SELECT Sark�_ad�
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM CalmaL�stesi
    WHERE Kullan�c�_ID = 2
);

--En �ok podcast �nerisi yap�lm�� kullan�c�y� bul

SELECT Kullan�c�_ad�
FROM Kullan�c�
WHERE Kullan�c�_ID = (
    SELECT TOP 1 Kullan�c�_ID
    FROM PodcastOneri
    GROUP BY Kullan�c�_ID
    ORDER BY COUNT(*) DESC
);

--