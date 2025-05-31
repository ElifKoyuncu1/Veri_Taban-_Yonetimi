-- Her kullanýcý için login oluþtur
CREATE LOGIN elifk WITH PASSWORD = '1234';
CREATE LOGIN esrak WITH PASSWORD = '1234';
CREATE LOGIN dilab WITH PASSWORD = '1234';


-- Login'leri veritabaný kullanýcýlarýna baðla
USE muzik_platformu;

CREATE USER elifk FOR LOGIN elifk;
CREATE USER esrak FOR LOGIN esrak;
CREATE USER dilab FOR LOGIN dilab;


-- 1. Elif Koyuncu- Yönetici
GRANT CONTROL ON DATABASE::müzik TO elifk;

-- 2. Esra Koyuncu- Veri Sorumlusu
GRANT SELECT, INSERT, UPDATE ON dbo.Sarkýcý TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Album TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Sarki TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Podcast TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.DinlemeGecmisi TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Kullanýcý TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.OneriSistemi TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.CalmaListesi TO esrak;

-- Silme yetkisini özellikle engelle (güvenlik için)
REVOKE DELETE ON dbo.Sarkýcý FROM esrak;
REVOKE DELETE ON dbo.Album FROM esrak;
REVOKE DELETE ON dbo.Sarki FROM esrak;
REVOKE DELETE ON dbo.Podcast FROM esrak;
REVOKE DELETE ON dbo.DinlemeGecmisi FROM esrak;
REVOKE DELETE ON dbo.Kullanýcý FROM esrak;
REVOKE DELETE ON dbo.OneriSistemi FROM esrak;
REVOKE DELETE ON dbo.CalmaListesi FROM esrak;

-- 3. Dila Bilgen- Sorgulayýcý
GRANT SELECT ON dbo.Sarkýcý TO dilab;
GRANT SELECT ON dbo.Album TO dilab;
GRANT SELECT ON dbo.Sarki TO dilab;
GRANT SELECT ON dbo.Podcast TO dilab;
GRANT SELECT ON dbo.DinlemeGecmisi TO dilab;
GRANT SELECT ON dbo.Kullanýcý TO dilab;
GRANT SELECT ON dbo.OneriSistemi TO dilab;
GRANT SELECT ON dbo.CalmaListesi TO dilab;

-- Diðer tüm yetkileri engelle (güvenlik için net olsun)
REVOKE INSERT, UPDATE, DELETE ON dbo.Sarkýcý FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Album FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Sarki FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Podcast FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.DinlemeGecmisi FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Kullanýcý FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.OneriSistemi FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.CalmaListesi FROM dilab;





