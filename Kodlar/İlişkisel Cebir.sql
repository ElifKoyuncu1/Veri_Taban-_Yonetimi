--Belirli bir kullanıcının dinlediği tüm şarkılar 

π Sarki_adı (
    Sarki ⨝ Sarki.Sarki_ID = DinlemeGecmisi_Sarki.Sarki_ID
          ⨝ DinlemeGecmisi_Sarki.Kullanıcı_ID = 5
)

-- "Pop" türündeki şarkıları içeren çalma listeleri 

π Liste_ID (
    σ Tur = "Pop" (
        Sarki ⨝ CalmaListesi_Sarkilar
)

-- En çok beğeni alan almış podcast'ler

π Podcast_ID, COUNT(*) AS Begenme_Sayisi (
    σ Begeni = 1 (DinlemeGecmisi_Podcast)
) GROUP BY Podcast_ID

-- "Pop" türündeki tüm şarkıların adlarını listele

π Sarki_adı (σ Tur = 'Pop' (Sarki))

-- Kullanıcı ID’si 3 olan kişinin dinlediği şarkıların adlarını listele

π Sarki_adı (
    σ Kullanıcı_ID = 3 (DinlemeGecmisi_Sarki) 
    ⨝ DinlemeGecmisi_Sarki.Sarki_ID = Sarki.Sarki_ID
)

-- "Mehmet" adlı şarkıcının çıkardığı albümlerin adlarını ve çıkış tarihlerini getir

π Album_adı, Cikis_Tarihi (
    σ Sarkıcı_adı = 'Mehmet' (Sarkıcı) 
    ⨝ Sarkıcı.Sarkıcı_ID = Album.Sarkıcı_ID
)
-- En az bir kez beğenilmiş tüm podcast başlıklarını listele

π Baslık (
    σ Begeni = 1 (DinlemeGecmisi_Podcast)
    ⨝ DinlemeGecmisi_Podcast.Podcast_ID = Podcast.Podcast_ID
)

-- Liste ID’si 10 olan çalma listesinde yer alan şarkıların adlarını getir

π Sarkı_adı (
    σ Liste_ID = 10 (CalmaListesi_Sarkilar)
    ⨝ CalmaListesi_Sarkilar.Sarki_ID = Sarki.Sarki_ID
)

-- Hiç podcast dinlememiş kullanıcıların adlarını listele

π Kullanıcı_adı (Kullanıcı) −
π Kullanıcı_adı (
    DinlemeGecmisi_Podcast ⨝ Kullanıcı
)

-- Herhangi bir şarkıyı beğenen kullanıcıların e-mail adreslerini bul

π E_mail (
    σ Begeni = 1 (DinlemeGecmisi_Sarki)
    ⨝ Kullanıcı
)

 -- "Cem.oz" adlı kullanıcının öneri olarak aldığı podcast’lerin başlıklarını listele

 π Baslık (
    σ Kullanıcı_adı = 'Cem' (Kullanıcı)
    ⨝ Kullanıcı.Kullanıcı_ID = PodcastOneri.Kullanıcı_ID
    ⨝ PodcastOneri.Podcast_ID = Podcast.Podcast_ID
)

-- 2024 yılında yayınlanan tüm albümlerin adlarını ve şarkıcılarını getir4
π Album_adı, Sarkıcı_adı (
    σ Cikis_Tarihi ≥ '2024-01-01' ∧ Cikis_Tarihi ≤ '2024-12-31' (Album)
    ⨝ Sarkıcı
)
-- Aynı şarkıyı birden fazla kez dinlemiş kullanıcıların ID’lerini getir

π Kullanıcı_ID (
    σ Dinleme_Sayisi > 1 (DinlemeGecmisi_Sarki)
)

