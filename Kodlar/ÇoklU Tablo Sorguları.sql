--Bir kullan�c�n�n dinledi�i �ark�lar�n ad�n�, sanat��s�n� ve dinleme tarihini listele

SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�,
    sa.Sark�c�_ad�,
    dgs.Dinleme_tarihi
FROM DinlemeGecmisi_Sarki dgs
JOIN Kullan�c� k ON dgs.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON dgs.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sark�c� sa ON a.Sark�c�_ID = sa.Sark�c�_ID;

--Bir �ark�c�n�n t�m alb�mleri ve o alb�mlerdeki �ark�lar�n isimleri

SELECT 
    sa.Sark�c�_ad�,
    a.Album_ad�,
    s.Sark�_ad�
FROM Sark�c� sa
JOIN Album a ON sa.Sark�c�_ID = a.Sark�c�_ID
JOIN Sarki s ON a.Album_ID = s.Album_ID;

--Bir kullan�c�n�n dinledi�i podcast ba�l�klar�, yay�nc�lar� ve ka� kez dinledi�i

SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k,
    p.Yayinci,
    dgp.Dinleme_Sayisi
FROM DinlemeGecmisi_Podcast dgp
JOIN Kullan�c� k ON dgp.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Podcast p ON dgp.Podcast_ID = p.Podcast_ID;

--Bir kullan�c�ya �nerilen �ark�lar�n ad� ve sanat��s�

SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�,
    sa.Sark�c�_ad�,
    so.Oneri_Tarihi
FROM SarkiOneri so
JOIN Kullan�c� k ON so.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON so.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sark�c� sa ON a.Sark�c�_ID = sa.Sark�c�_ID;

--Bir kullan�c�n�n olu�turdu�u �alma listelerinde yer alan �ark�lar�n adlar�n� ve sanat��lar�n� getir

SELECT 
    k.Kullan�c�_ad�,
    cl.Liste_ad�,
    s.Sark�_ad�,
    sa.Sark�c�_ad�
FROM CalmaL�stesi cl
JOIN Kullan�c� k ON cl.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON cl.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sark�c� sa ON a.Sark�c�_ID = sa.Sark�c�_ID;

--En �ok dinlenen �ark�lar� ve sanat��lar�n� getir (top 5)

SELECT TOP 5
    s.Sark�_ad�,
    sa.Sark�c�_ad�,
    SUM(dgs.Dinleme_Sayisi) AS Toplam_Dinlenme
FROM DinlemeGecmisi_Sarki dgs
JOIN Sarki s ON dgs.Sarki_ID = s.Sarki_ID
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sark�c� sa ON a.Sark�c�_ID = sa.Sark�c�_ID
GROUP BY s.Sark�_ad�, sa.Sark�c�_ad�
ORDER BY Toplam_Dinlenme DESC;

--Bir t�rde (�rne�in 'Pop') �nerilen �ark�lar ve o t�rde ka� �neri yap�ld���

SELECT 
    s.Tur,
    COUNT(*) AS Oneri_Sayisi
FROM SarkiOneri so
JOIN Sarki s ON so.Sarki_ID = s.Sarki_ID
WHERE s.Tur = 'Pop'
GROUP BY s.Tur;

--Kullan�c�n�n dinledi�i �ark�lar� listele

SELECT 
    k.Kullan�c�_ad�,
    s.Sark�_ad�
FROM DinlemeGecmisi_Sarki d
JOIN Kullan�c� k ON d.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Sarki s ON d.Sarki_ID = s.Sarki_ID;

--Bir alb�mdeki �ark�lar� listele

SELECT 
    a.Album_ad�,
    s.Sark�_ad�
FROM Album a
JOIN Sarki s ON a.Album_ID = s.Album_ID;

--Podcast dinleyen kullan�c�lar� g�ster

SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k
FROM DinlemeGecmisi_Podcast d
JOIN Kullan�c� k ON d.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Podcast p ON d.Podcast_ID = p.Podcast_ID;

--�ark� ve sanat��s�n� birlikte g�ster
SELECT 
    s.Sark�_ad�,
    sa.Sark�c�_ad�
FROM Sarki s
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sark�c� sa ON a.Sark�c�_ID = sa.Sark�c�_ID;

--Kullan�c�n�n �neri olarak ald��� podcastleri listele

SELECT 
    k.Kullan�c�_ad�,
    p.Basl�k
FROM PodcastOneri o
JOIN Kullan�c� k ON o.Kullan�c�_ID = k.Kullan�c�_ID
JOIN Podcast p ON o.Podcast_ID = p.Podcast_ID;

--Bir �alma listesinde yer alan �ark�lar

SELECT 
    cl.Liste_ad�,
    s.Sark�_ad�
FROM CalmaL�stesi cl
JOIN Sarki s ON cl.Sarki_ID = s.Sarki_ID;

-- Her sanat��n�n ka� alb�m� var?

SELECT 
    sa.Sark�c�_ad�,
    COUNT(a.Album_ID) AS Album_Say�s�
FROM Sark�c� sa
JOIN Album a ON sa.Sark�c�_ID = a.Sark�c�_ID
GROUP BY sa.Sark�c�_ad�;

--�ark�n�n t�r�yle birlikte sanat��s�n� g�ster

SELECT 
    s.Sark�_ad�,
    s.Tur,
    sa.Sark�c�_ad�
FROM Sarki s
JOIN Album a ON s.Album_ID = a.Album_ID
JOIN Sark�c� sa ON a.Sark�c�_ID = sa.Sark�c�_ID;
