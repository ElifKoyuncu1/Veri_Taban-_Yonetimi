-- Kullanýcýya göre þarký geçmiþine hýzlý eriþim
CREATE NONCLUSTERED INDEX IX_DinlemeGecmisi_Sarki_KullaniciID
ON DinlemeGecmisi_Sarki (Kullanýcý_ID);

-- Yalnýzca beðenilen þarkýlara özel filtreli index
CREATE NONCLUSTERED INDEX IX_DinlemeGecmisi_Sarki_Begeni1
ON DinlemeGecmisi_Sarki (Begeni)
WHERE Begeni = 1;

-- Podcast dinlemelerini tarihe göre sýralamak için
CREATE CLUSTERED INDEX IX_DinlemeGecmisi_Podcast_Tarih
ON DinlemeGecmisi_Podcast (Dinleme_tarihi);

-- Podcast önerilerinde tarih + kullanýcý kombinasyonu
CREATE NONCLUSTERED INDEX IX_PodcastOneri_KullaniciTarih
ON PodcastOneri (Kullanýcý_ID, Oneri_Tarihi);
