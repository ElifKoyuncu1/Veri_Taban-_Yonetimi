--Kullan�c�n�n Dinledi�i Toplam �ark� Say�s�n� + 5 G�ster

SELECT 
    Kullan�c�_ID, 
    Dinleme_Sayisi + 5 AS Toplam_Dinleme_Puani 
FROM DinlemeGecmisi_Sarki;

--�ark�c�n�n Ayl�k Dinleyicisinin Y�zde 10 Fazlas�n� G�ster

SELECT 
    Sark�c�_ad�, 
    Ayl�k_dinleyici, 
    Ayl�k_dinleyici * 1.10 AS Artirilmis_Dinleyici 
FROM Sark�c�;

--Dinleme Say�s�n�n Ortalamas�ndan Fark�n� Hesapla (�ark�)

SELECT 
    Kullan�c�_ID, 
    Sarki_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi - (SELECT AVG(Dinleme_Sayisi) FROM DinlemeGecmisi_Sarki) AS Ortalamadan_Fark 
FROM DinlemeGecmisi_Sarki;


--Dinleme Say�s� Tek mi �ift mi? (MOD kullan�m�)

SELECT 
    Gecmis_ID, 
    Dinleme_Sayisi, 
    CASE 
        WHEN Dinleme_Sayisi % 2 = 0 THEN '�ift' 
        ELSE 'Tek' 
    END AS Sayi_Turu 
FROM DinlemeGecmisi_Podcast;

--�ark�lar�n Toplam Dinlenme Puan� (be�eni say�s� � dinleme say�s�)

SELECT 
    Sarki_ID, 
    SUM(Dinleme_Sayisi * CAST(Begeni AS INT)) AS Toplam_Begeni_Puani 
FROM DinlemeGecmisi_Sarki 
GROUP BY Sarki_ID;

--�ark�c�lar�n Ayl�k Dinleyici Say�s�na 1000 Ki�i Eklendi�inde

SELECT 
    Sark�c�_ad�, 
    Ayl�k_dinleyici, 
    Ayl�k_dinleyici + 1000 AS Yeni_Dinleyici_Sayisi 
FROM Sark�c�;

-- �ark� Dinleme Say�s�ndan 2 Eksilt

SELECT 
    Kullan�c�_ID, 
    Sarki_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi - 2 AS Guncel_Dinleme 
FROM DinlemeGecmisi_Sarki;

--Dinleme Say�s�n�n �ki Kat�n� Hesapla

SELECT 
    Kullan�c�_ID, 
    Podcast_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi * 2 AS Iki_Kati 
FROM DinlemeGecmisi_Podcast;

--�ark�c�lar�n Ayl�k Dinleyici Ortalamas�n� Hesapla

SELECT 
    AVG(Ayl�k_dinleyici) AS Ortalama_Dinleyici 
FROM Sark�c�;

--Be�eni Ba��na Ortalama Dinleme (S�f�ra b�lmeyi �nlemek i�in kontrol var)

SELECT 
    Kullan�c�_ID, 
    Dinleme_Sayisi, 
    CASE 
        WHEN Begeni = 1 THEN Dinleme_Sayisi / 1 
        ELSE Dinleme_Sayisi / 2 
    END AS Ortalama_Begeni_Dinleme 
FROM DinlemeGecmisi_Sarki;


--Kullan�c�lar�n Rastgele Puan� (Be�eniye g�re bonus puan hesaplama)

SELECT 
    Kullan�c�_ID, 
    Dinleme_Sayisi, 
    Dinleme_Sayisi + (Begeni * 10) AS Bonuslu_Puan 
FROM DinlemeGecmisi_Sarki;

--Her Dinleme Say�s�n� 3�e B�l (ondal�k g�sterimle)

SELECT 
    Sarki_ID, 
    Dinleme_Sayisi, 
    CAST(Dinleme_Sayisi AS FLOAT) / 3 AS Uc_Bolum 
FROM DinlemeGecmisi_Sarki;

--Be�eniye G�re Y�zdelik De�er (Varsay�m: be�eni varsa %100, yoksa %50)

SELECT 
    Podcast_ID, 
    Dinleme_Sayisi, 
    CASE 
        WHEN Begeni = 1 THEN Dinleme_Sayisi * 1.0 
        ELSE Dinleme_Sayisi * 0.5 
    END AS Yuzdelik_Puan 
FROM DinlemeGecmisi_Podcast;

