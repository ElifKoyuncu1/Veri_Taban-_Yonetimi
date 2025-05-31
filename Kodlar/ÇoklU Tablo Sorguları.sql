--Bir kullanýcýnýn dinlediði þarkýlarýn adýný, sanatçýsýný ve dinleme tarihini listele

SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý,
    sa.Sarkýcý_adý,
    dgs.Dinleme_tarihi
FROM DinlemeGecmisi_Sarki dgs
JOIN Kullanýcý k ON dgs.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON dgs.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sarkýcý sa ON a.Sarkýcý_ID = sa.Sarkýcý_ID;

--Bir þarkýcýnýn tüm albümleri ve o albümlerdeki þarkýlarýn isimleri

SELECT 
    sa.Sarkýcý_adý,
    a.Album_adý,
    s.Sarký_adý
FROM Sarkýcý sa
JOIN Album a ON sa.Sarkýcý_ID = a.Sarkýcý_ID
JOIN Sarki s ON a.Album_ID = s.Album_ID;

--Bir kullanýcýnýn dinlediði podcast baþlýklarý, yayýncýlarý ve kaç kez dinlediði

SELECT 
    k.Kullanýcý_adý,
    p.Baslýk,
    p.Yayinci,
    dgp.Dinleme_Sayisi
FROM DinlemeGecmisi_Podcast dgp
JOIN Kullanýcý k ON dgp.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Podcast p ON dgp.Podcast_ID = p.Podcast_ID;

--Bir kullanýcýya önerilen þarkýlarýn adý ve sanatçýsý

SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý,
    sa.Sarkýcý_adý,
    so.Oneri_Tarihi
FROM SarkiOneri so
JOIN Kullanýcý k ON so.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON so.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sarkýcý sa ON a.Sarkýcý_ID = sa.Sarkýcý_ID;

--Bir kullanýcýnýn oluþturduðu çalma listelerinde yer alan þarkýlarýn adlarýný ve sanatçýlarýný getir

SELECT 
    k.Kullanýcý_adý,
    cl.Liste_adý,
    s.Sarký_adý,
    sa.Sarkýcý_adý
FROM CalmaLÝstesi cl
JOIN Kullanýcý k ON cl.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON cl.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sarkýcý sa ON a.Sarkýcý_ID = sa.Sarkýcý_ID;

--En çok dinlenen þarkýlarý ve sanatçýlarýný getir (top 5)

SELECT TOP 5
    s.Sarký_adý,
    sa.Sarkýcý_adý,
    SUM(dgs.Dinleme_Sayisi) AS Toplam_Dinlenme
FROM DinlemeGecmisi_Sarki dgs
JOIN Sarki s ON dgs.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sarkýcý sa ON a.Sarkýcý_ID = sa.Sarkýcý_ID
GROUP BY s.Sarký_adý, sa.Sarkýcý_adý
ORDER BY Toplam_Dinlenme DESC;

--Bir türde (örneðin 'Pop') önerilen þarkýlar ve o türde kaç öneri yapýldýðý

SELECT 
    s.Tur,
    COUNT(*) AS Oneri_Sayisi
FROM SarkiOneri so
JOIN Sarki s ON so.Sarki_ID = s.Sarki_ID
WHERE s.Tur = 'Pop'
GROUP BY s.Tur;

--Kullanýcýnýn dinlediði þarkýlarý listele

SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý
FROM DinlemeGecmisi_Sarki d
JOIN Kullanýcý k ON d.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID;

--Bir albümdeki þarkýlarý listele

SELECT 
    a.Album_adý,
    s.Sarký_adý
FROM Album a
JOIN Sarki s ON a.Album_ID = s.Album_ID;

--Podcast dinleyen kullanýcýlarý göster

SELECT 
    k.Kullanýcý_adý,
    p.Baslýk
FROM DinlemeGecmisi_Podcast d
JOIN Kullanýcý k ON d.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Podcast p ON d.Podcast_ID = p.Podcast_ID;

--Þarký ve sanatçýsýný birlikte göster
SELECT 
    s.Sarký_adý,
    sa.Sarkýcý_adý
FROM Sarki s
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sarkýcý sa ON a.Sarkýcý_ID = sa.Sarkýcý_ID;

--Kullanýcýnýn öneri olarak aldýðý podcastleri listele

SELECT 
    k.Kullanýcý_adý,
    p.Baslýk
FROM PodcastOneri o
JOIN Kullanýcý k ON o.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Podcast p ON o.Podcast_ID = p.Podcast_ID;

--Bir çalma listesinde yer alan þarkýlar

SELECT 
    cl.Liste_adý,
    s.Sarký_adý
FROM CalmaLÝstesi cl
JOIN Sarki s ON cl.Sarki_ID = s.Sarki_ID;

-- Her sanatçýnýn kaç albümü var?

SELECT 
    sa.Sarkýcý_adý,
    COUNT(a.Album_ID) AS Album_Sayýsý
FROM Sarkýcý sa
JOIN Album a ON sa.Sarkýcý_ID = a.Sarkýcý_ID
GROUP BY sa.Sarkýcý_adý;

--Þarkýnýn türüyle birlikte sanatçýsýný göster

SELECT 
    s.Sarký_adý,
    s.Tur,
    sa.Sarkýcý_adý
FROM Sarki s
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sarkýcý sa ON a.Sarkýcý_ID = sa.Sarkýcý_ID;
