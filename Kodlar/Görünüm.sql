--Þarkýcý ve Albüm Bilgileri Görünümü

CREATE VIEW vw_Sarkici_Album AS
SELECT 
    s.Sarkýcý_ID,
    s.Sarkýcý_adý,
    a.Album_ID,
    a.Album_adý,
    a.Cikis_Tarihi
FROM 
    Sarkýcý s
JOIN 
    Album a ON s.Sarkýcý_ID = a.Sarkýcý_ID;

-- Kullanýcýnýn Þarký Dinleme Geçmiþi Görünümü

CREATE VIEW vw_Kullanici_Sarki_Gecmisi AS
SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý,
    ds.Dinleme_tarihi,
    ds.Dinleme_Sayisi,
    ds.Begeni
FROM 
    DinlemeGecmisi_Sarki ds
JOIN 
    Kullanýcý k ON ds.Kullanýcý_ID = k.Kullanýcý_ID
JOIN 
    Sarki s ON ds.Sarki_ID = s.Sarki_ID;

--Kullanýcýnýn Podcast Dinleme Geçmiþi Görünümü

CREATE VIEW vw_Kullanici_Podcast_Gecmisi AS
SELECT 
    k.Kullanýcý_adý,
    p.Baslýk AS Podcast_Baslýk,
    dp.Dinleme_tarihi,
    dp.Dinleme_Sayisi,
    dp.Begeni
FROM 
    DinlemeGecmisi_Podcast dp
JOIN 
    Kullanýcý k ON dp.Kullanýcý_ID = k.Kullanýcý_ID
JOIN 
    Podcast p ON dp.Podcast_ID = p.Podcast_ID;

--Çalma Listesi Detaylarý Görünümü

CREATE VIEW vw_Calma_Listesi_Detay AS
SELECT 
    cl.Liste_adý,
    cl.Olusturan,
    cl.Gizlilik,
    k.Kullanýcý_adý,
    s.Sarký_adý
FROM 
    CalmaLÝstesi cl
JOIN 
    Kullanýcý k ON cl.Kullanýcý_ID = k.Kullanýcý_ID
JOIN 
    Sarki s ON cl.Sarki_ID = s.Sarki_ID;

--Kullanýcýya Önerilen Þarkýlar Görünümü

CREATE VIEW vw_Sarki_Oneri AS
SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý,
    so.Oneri_Tarihi
FROM 
    SarkiOneri so
JOIN 
    Kullanýcý k ON so.Kullanýcý_ID = k.Kullanýcý_ID
JOIN 
    Sarki s ON so.Sarki_ID = s.Sarki_ID;

--Kullanýcýya Önerilen Podcastler Görünümü

CREATE VIEW vw_Podcast_Oneri AS
SELECT 
    k.Kullanýcý_adý,
    p.Baslýk AS Podcast_Baslýk,
    po.Oneri_Tarihi
FROM 
    PodcastOneri po
JOIN 
    Kullanýcý k ON po.Kullanýcý_ID = k.Kullanýcý_ID
JOIN 
    Podcast p ON po.Podcast_ID = p.Podcast_ID;

--Þarkýcýlarýn genel bilgisi ve kaç albümleri olduðu

CREATE VIEW vw_SarkiciBilgisi AS
SELECT 
    s.Sarkýcý_ID,
    s.Sarkýcý_adý,
    s.Aylýk_dinleyici,
    COUNT(a.Album_ID) AS Album_Sayisi
FROM 
    Sarkýcý s
LEFT JOIN 
    Album a ON s.Sarkýcý_ID = a.Sarkýcý_ID
GROUP BY 
    s.Sarkýcý_ID, s.Sarkýcý_adý, s.Aylýk_dinleyici;

--Tüm þarkýlarýn adý, albümü ve sanatçýsý

CREATE VIEW vw_SarkiListesi AS
SELECT 
    s.Sarki_ID,
    s.Sarký_adý,
    s.Tur,
    s.Sure,
    al.Album_adý,
    sa.Sarkýcý_adý
FROM 
    Sarki s
JOIN Album al ON s.Album_ID = al.Album_ID
JOIN Sarkýcý sa ON al.Sarkýcý_ID = sa.Sarkýcý_ID;

--Kullanýcýnýn dinlediði þarkýlar (en son tarih, beðeni dahil)

CREATE VIEW vw_KullaniciDinlemeSarkilar AS
SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý,
    d.Dinleme_tarihi,
    d.Dinleme_Sayisi,
    CASE WHEN d.Begeni = 1 THEN 'Beðenildi' ELSE 'Beðenilmedi' END AS Begeni_Durumu
FROM 
    DinlemeGecmisi_Sarki d
JOIN Kullanýcý k ON d.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID;

--Kullanýcýnýn dinlediði podcastler

CREATE VIEW vw_KullaniciPodcastDinleme AS
SELECT 
    k.Kullanýcý_adý,
    p.Baslýk AS Podcast_Adi,
    d.Dinleme_tarihi,
    d.Dinleme_Sayisi,
    CASE WHEN d.Begeni = 1 THEN 'Beðenildi' ELSE 'Beðenilmedi' END AS Begeni_Durumu
FROM 
    DinlemeGecmisi_Podcast d
JOIN Kullanýcý k ON d.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Podcast p ON d.Podcast_ID = p.Podcast_ID;


--Kullanýcýya önerilen þarkýlar

CREATE VIEW vw_SarkiOnerileri AS
SELECT 
    k.Kullanýcý_adý,
    s.Sarký_adý,
    o.Oneri_Tarihi
FROM 
    SarkiOneri o
JOIN Kullanýcý k ON o.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Sarki s ON o.Sarki_ID = s.Sarki_ID;

--Kullanýcýya önerilen podcastler

CREATE VIEW vw_PodcastOnerileri AS
SELECT 
    k.Kullanýcý_adý,
    p.Baslýk AS Podcast_Adi,
    o.Oneri_Tarihi
FROM 
    PodcastOneri o
JOIN Kullanýcý k ON o.Kullanýcý_ID = k.Kullanýcý_ID
JOIN Podcast p ON o.Podcast_ID = p.Podcast_ID;
