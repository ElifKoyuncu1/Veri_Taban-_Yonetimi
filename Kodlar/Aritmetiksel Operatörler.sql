--Kullanýcýnýn Dinlediði Toplam Þarký Sayýsýný + 5 Göster

SELECT 
    Kullanýcý_ID, 
    Dinleme_Sayisi + 5 AS Toplam_Dinleme_Puani 
FROM DinlemeGecmisi_Sarki;

--Þarkýcýnýn Aylýk Dinleyicisinin Yüzde 10 Fazlasýný Göster

SELECT 
    Sarkýcý_adý, 
    Aylýk_dinleyici, 
    Aylýk_dinleyici * 1.10 AS Artirilmis_Dinleyici 
FROM Sarkýcý;

--Dinleme Sayýsýnýn Ortalamasýndan Farkýný Hesapla (Þarký)

SELECT 
    Kullanýcý_ID, 
    Sarki_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi - (SELECT AVG(Dinleme_Sayisi) FROM DinlemeGecmisi_Sarki) AS Ortalamadan_Fark 
FROM DinlemeGecmisi_Sarki;


--Dinleme Sayýsý Tek mi Çift mi? (MOD kullanýmý)

SELECT 
    Gecmis_ID, 
    Dinleme_Sayisi, 
    CASE 
        WHEN Dinleme_Sayisi % 2 = 0 THEN 'Çift' 
        ELSE 'Tek' 
    END AS Sayi_Turu 
FROM DinlemeGecmisi_Podcast;

--Þarkýlarýn Toplam Dinlenme Puaný (beðeni sayýsý × dinleme sayýsý)

SELECT 
    Sarki_ID, 
    SUM(Dinleme_Sayisi * CAST(Begeni AS INT)) AS Toplam_Begeni_Puani 
FROM DinlemeGecmisi_Sarki 
GROUP BY Sarki_ID;

--Þarkýcýlarýn Aylýk Dinleyici Sayýsýna 1000 Kiþi Eklendiðinde

SELECT 
    Sarkýcý_adý, 
    Aylýk_dinleyici, 
    Aylýk_dinleyici + 1000 AS Yeni_Dinleyici_Sayisi 
FROM Sarkýcý;

-- Þarký Dinleme Sayýsýndan 2 Eksilt

SELECT 
    Kullanýcý_ID, 
    Sarki_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi - 2 AS Guncel_Dinleme 
FROM DinlemeGecmisi_Sarki;

--Dinleme Sayýsýnýn Ýki Katýný Hesapla

SELECT 
    Kullanýcý_ID, 
    Podcast_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi * 2 AS Iki_Kati 
FROM DinlemeGecmisi_Podcast;

--Þarkýcýlarýn Aylýk Dinleyici Ortalamasýný Hesapla

SELECT 
    AVG(Aylýk_dinleyici) AS Ortalama_Dinleyici 
FROM Sarkýcý;

--Beðeni Baþýna Ortalama Dinleme (Sýfýra bölmeyi önlemek için kontrol var)

SELECT 
    Kullanýcý_ID, 
    Dinleme_Sayisi, 
    CASE 
        WHEN Begeni = 1 THEN Dinleme_Sayisi / 1 
        ELSE Dinleme_Sayisi / 2 
    END AS Ortalama_Begeni_Dinleme 
FROM DinlemeGecmisi_Sarki;


--Kullanýcýlarýn Rastgele Puaný (Beðeniye göre bonus puan hesaplama)

SELECT 
    Kullanýcý_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi + (Begeni * 10) AS Bonuslu_Puan 
FROM DinlemeGecmisi_Sarki;

--Her Dinleme Sayýsýný 3’e Böl (ondalýk gösterimle)

SELECT 
    Sarki_ID, 
    Dinleme_Sayisi, 
    CAST(Dinleme_Sayisi AS FLOAT) / 3 AS Uc_Bolum 
FROM DinlemeGecmisi_Sarki;

--Beðeniye Göre Yüzdelik Deðer (Varsayým: beðeni varsa %100, yoksa %50)

SELECT 
    Podcast_ID, 
    Dinleme_Sayisi, 
    CASE 
        WHEN Begeni = 1 THEN Dinleme_Sayisi * 1.0 
        ELSE Dinleme_Sayisi * 0.5 
    END AS Yuzdelik_Puan 
FROM DinlemeGecmisi_Podcast;

