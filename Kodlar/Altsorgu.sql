--En Çok Dinlenmiþ Þarkýyý Getir (Alt sorguyla)

SELECT *
FROM Sarki
WHERE Sarki_ID = (
    SELECT TOP 1 Sarki_ID
    FROM DinlemeGecmisi_Sarki
    GROUP BY Sarki_ID
    ORDER BY SUM(Dinleme_Sayisi) DESC
);

--Belirli bir kullanýcýnýn en çok dinlediði podcast baþlýðýný getir

SELECT Baslýk
FROM Podcast
WHERE Podcast_ID = (
    SELECT TOP 1 Podcast_ID
    FROM DinlemeGecmisi_Podcast
    WHERE Kullanýcý_ID = 1
    GROUP BY Podcast_ID
    ORDER BY SUM(Dinleme_Sayisi) DESC
);


--Hiç albümü olmayan þarkýcýlarý listele

SELECT Sarkýcý_adý
FROM Sarkýcý
WHERE Sarkýcý_ID NOT IN (
    SELECT DISTINCT Sarkýcý_ID
    FROM Album
);

--En çok beðenilen þarkýnýn ait olduðu albüm adý

SELECT Album_adý
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

--Kullanýcýnýn dinlediði þarkýlarýn türlerini listele (tekil)

SELECT DISTINCT Tur
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM DinlemeGecmisi_Sarki
    WHERE Kullanýcý_ID = 1
);

--Bir kullanýcýya önerilen ve daha önce hiç dinlemediði þarkýlar

SELECT Sarký_adý
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM SarkiOneri
    WHERE Kullanýcý_ID = 1
)
AND Sarki_ID NOT IN (
    SELECT Sarki_ID
    FROM DinlemeGecmisi_Sarki
    WHERE Kullanýcý_ID = 1
);

-- Þarký süresi en uzun olan þarkýcýnýn adý

SELECT Sarkýcý_adý
FROM Sarkýcý
WHERE Sarkýcý_ID = (
    SELECT Album.Sarkýcý_ID
    FROM Sarki
    JOIN Album ON Sarki.Album_ID = Album.Album_ID
    WHERE Sure = (
        SELECT MAX(Sure)
        FROM Sarki
    )
);

--Kullanýcý adý "ahmet" olan kiþinin dinlediði podcastlerin baþlýklarý

SELECT Baslýk
FROM Podcast
WHERE Podcast_ID IN (
    SELECT Podcast_ID
    FROM DinlemeGecmisi_Podcast
    WHERE Kullanýcý_ID = (
        SELECT Kullanýcý_ID
        FROM Kullanýcý
        WHERE Kullanýcý_adý = 'ahmet'
    )
);

-- En az bir podcast beðenmiþ kullanýcýlarýn e-posta adresleri

SELECT E_mail
FROM Kullanýcý
WHERE Kullanýcý_ID IN (
    SELECT Kullanýcý_ID
    FROM DinlemeGecmisi_Podcast
    WHERE Begeni = 1
);

--Hiç þarký önerilmemiþ kullanýcýlarý listele

SELECT Kullanýcý_adý
FROM Kullanýcý
WHERE Kullanýcý_ID NOT IN (
    SELECT Kullanýcý_ID
    FROM SarkiOneri
);

--Þarkýlarla ayný türde olan podcastleri bul

SELECT DISTINCT Baslýk
FROM Podcast
WHERE Tur IN (
    SELECT DISTINCT Tur
    FROM Sarki
);

--Dinlenme sayýsý ortalamanýn üstünde olan þarkýlar

SELECT Sarký_adý
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

--En son oluþturulan çalma listesinin adýný bul

SELECT Liste_adý
FROM CalmaLÝstesi
WHERE Liste_ID = (
    SELECT MAX(Liste_ID)
    FROM CalmaLÝstesi
);

--Kullanýcýlarýn toplamda kaç þarký beðendiðini göster

SELECT Kullanýcý_adý, (
    SELECT COUNT(*)
    FROM DinlemeGecmisi_Sarki
    WHERE DinlemeGecmisi_Sarki.Kullanýcý_ID = Kullanýcý.Kullanýcý_ID AND Begeni = 1
) AS Begenilen_Sarki_Sayisi
FROM Kullanýcý;

--Kullanýcýnýn oluþturduðu listedeki tüm þarkýlarý getir (örnek için kullanýcý ID = 2)

SELECT Sarký_adý
FROM Sarki
WHERE Sarki_ID IN (
    SELECT Sarki_ID
    FROM CalmaLÝstesi
    WHERE Kullanýcý_ID = 2
);

--En çok podcast önerisi yapýlmýþ kullanýcýyý bul

SELECT Kullanýcý_adý
FROM Kullanýcý
WHERE Kullanýcý_ID = (
    SELECT TOP 1 Kullanýcý_ID
    FROM PodcastOneri
    GROUP BY Kullanýcý_ID
    ORDER BY COUNT(*) DESC
);

--