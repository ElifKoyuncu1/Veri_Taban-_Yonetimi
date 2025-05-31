-- Kullan�c�ya g�re �ark� ge�mi�ine h�zl� eri�im
CREATE NONCLUSTERED INDEX IX_DinlemeGecmisi_Sarki_KullaniciID
ON DinlemeGecmisi_Sarki (Kullan�c�_ID);

-- Yaln�zca be�enilen �ark�lara �zel filtreli index
CREATE NONCLUSTERED INDEX IX_DinlemeGecmisi_Sarki_Begeni1
ON DinlemeGecmisi_Sarki (Begeni)
WHERE Begeni = 1;

-- Podcast dinlemelerini tarihe g�re s�ralamak i�in
CREATE CLUSTERED INDEX IX_DinlemeGecmisi_Podcast_Tarih
ON DinlemeGecmisi_Podcast (Dinleme_tarihi);

-- Podcast �nerilerinde tarih + kullan�c� kombinasyonu
CREATE NONCLUSTERED INDEX IX_PodcastOneri_KullaniciTarih
ON PodcastOneri (Kullan�c�_ID, Oneri_Tarihi);
