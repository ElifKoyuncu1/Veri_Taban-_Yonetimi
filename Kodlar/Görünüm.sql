--�ark�c� ve Alb�m Bilgileri G�r�n�m�

CREATE VIEW vw_Sarkici_Album AS
SELECT 
    s.Sark�c�_ID,
    s.Sark�c�_ad�,
    a.Album_ID,
    a.Album_ad�,
    a.Cikis_Tarihi
FROM 
    Sark�c� s
JOIN 
    Album a ON s.Sark�c�_ID = a.Sark�c�_ID;

-- Kullan�c�n�n �ark� Dinleme Ge�mi�i G�r�n�m�

CREATE VIEW vw_Kullanici_Sarki_Gecmisi AS
SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�,
    ds.Dinleme_tarihi,
    ds.Dinleme_Sayisi,
    ds.Begeni
FROM 
    DinlemeGecmisi_Sarki ds
JOIN 
    Kullan�c� k ON ds.Kullan�c�_ID = k.Kullan�c�_ID
JOIN 
    Sarki s ON ds.Sarki_ID = s.Sarki_ID;

--Kullan�c�n�n Podcast Dinleme Ge�mi�i G�r�n�m�

CREATE VIEW vw_Kullanici_Podcast_Gecmisi AS
SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k AS Podcast_Basl�k,
    dp.Dinleme_tarihi,
    dp.Dinleme_Sayisi,
    dp.Begeni
FROM 
    DinlemeGecmisi_Podcast dp
JOIN 
    Kullan�c� k ON dp.Kullan�c�_ID = k.Kullan�c�_ID
JOIN 
    Podcast p ON dp.Podcast_ID = p.Podcast_ID;

--�alma Listesi Detaylar� G�r�n�m�

CREATE VIEW vw_Calma_Listesi_Detay AS
SELECT 
    cl.Liste_ad�,
    cl.Olusturan,
    cl.Gizlilik,
    k.Kullan�c�_ad�,
    s.Sark�_ad�
FROM 
    CalmaL�stesi cl
JOIN 
    Kullan�c� k ON cl.Kullan�c�_ID = k.Kullan�c�_ID
JOIN 
    Sarki s ON cl.Sarki_ID = s.Sarki_ID;

--Kullan�c�ya �nerilen �ark�lar G�r�n�m�

CREATE VIEW vw_Sarki_Oneri AS
SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�,
    so.Oneri_Tarihi
FROM 
    SarkiOneri so
JOIN 
    Kullan�c� k ON so.Kullan�c�_ID = k.Kullan�c�_ID
JOIN 
    Sarki s ON so.Sarki_ID = s.Sarki_ID;

--Kullan�c�ya �nerilen Podcastler G�r�n�m�

CREATE VIEW vw_Podcast_Oneri AS
SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k AS Podcast_Basl�k,
    po.Oneri_Tarihi
FROM 
    PodcastOneri po
JOIN 
    Kullan�c� k ON po.Kullan�c�_ID = k.Kullan�c�_ID
JOIN 
    Podcast p ON po.Podcast_ID = p.Podcast_ID;

--�ark�c�lar�n genel bilgisi ve ka� alb�mleri oldu�u

CREATE VIEW vw_SarkiciBilgisi AS
SELECT 
    s.Sark�c�_ID,
    s.Sark�c�_ad�,
    s.Ayl�k_dinleyici,
    COUNT(a.Album_ID) AS Album_Sayisi
FROM 
    Sark�c� s
LEFT JOIN 
    Album a ON s.Sark�c�_ID = a.Sark�c�_ID
GROUP BY 
    s.Sark�c�_ID, s.Sark�c�_ad�, s.Ayl�k_dinleyici;

--T�m �ark�lar�n ad�, alb�m� ve sanat��s�

CREATE VIEW vw_SarkiListesi AS
SELECT 
    s.Sarki_ID,
    s.Sark�_ad�,
    s.Tur,
    s.Sure,
    al.Album_ad�,
    sa.Sark�c�_ad�
FROM 
    Sarki s
JOIN Album al ON s.Album_ID = al.Album_ID
JOIN Sark�c� sa ON al.Sark�c�_ID = sa.Sark�c�_ID;

--Kullan�c�n�n dinledi�i �ark�lar (en son tarih, be�eni dahil)

CREATE VIEW vw_KullaniciDinlemeSarkilar AS
SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�,
    d.Dinleme_tarihi,
    d.Dinleme_Sayisi,
    CASE WHEN d.Begeni = 1 THEN 'Be�enildi' ELSE 'Be�enilmedi' END AS Begeni_Durumu
FROM 
    DinlemeGecmisi_Sarki d
JOIN Kullan�c� k ON d.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID;

--Kullan�c�n�n dinledi�i podcastler

CREATE VIEW vw_KullaniciPodcastDinleme AS
SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k AS Podcast_Adi,
    d.Dinleme_tarihi,
    d.Dinleme_Sayisi,
    CASE WHEN d.Begeni = 1 THEN 'Be�enildi' ELSE 'Be�enilmedi' END AS Begeni_Durumu
FROM 
    DinlemeGecmisi_Podcast d
JOIN Kullan�c� k ON d.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Podcast p ON d.Podcast_ID = p.Podcast_ID;


--Kullan�c�ya �nerilen �ark�lar

CREATE VIEW vw_SarkiOnerileri AS
SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�,
    o.Oneri_Tarihi
FROM 
    SarkiOneri o
JOIN Kullan�c� k ON o.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON o.Sarki_ID = s.Sarki_ID;

--Kullan�c�ya �nerilen podcastler

CREATE VIEW vw_PodcastOnerileri AS
SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k AS Podcast_Adi,
    o.Oneri_Tarihi
FROM 
    PodcastOneri o
JOIN Kullan�c� k ON o.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Podcast p ON o.Podcast_ID = p.Podcast_ID;
