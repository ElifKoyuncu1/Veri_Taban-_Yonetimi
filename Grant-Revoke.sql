-- Her kullan�c� i�in login olu�tur
CREATE LOGIN elifk WITH PASSWORD = '1234';
CREATE LOGIN esrak WITH PASSWORD = '1234';
CREATE LOGIN dilab WITH PASSWORD = '1234';


-- Login'leri veritaban� kullan�c�lar�na ba�la
USE muzik_platformu;

CREATE USER elifk FOR LOGIN elifk;
CREATE USER esrak FOR LOGIN esrak;
CREATE USER dilab FOR LOGIN dilab;


-- 1. Elif Koyuncu- Y�netici
GRANT CONTROL ON DATABASE::m�zik TO elifk;

-- 2. Esra Koyuncu- Veri Sorumlusu
GRANT SELECT, INSERT, UPDATE ON dbo.Sark�c� TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Album TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Sarki TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Podcast TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.DinlemeGecmisi TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.Kullan�c� TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.OneriSistemi TO esrak;
GRANT SELECT, INSERT, UPDATE ON dbo.CalmaListesi TO esrak;

-- Silme yetkisini �zellikle engelle (g�venlik i�in)
REVOKE DELETE ON dbo.Sark�c� FROM esrak;
REVOKE DELETE ON dbo.Album FROM esrak;
REVOKE DELETE ON dbo.Sarki FROM esrak;
REVOKE DELETE ON dbo.Podcast FROM esrak;
REVOKE DELETE ON dbo.DinlemeGecmisi FROM esrak;
REVOKE DELETE ON dbo.Kullan�c� FROM esrak;
REVOKE DELETE ON dbo.OneriSistemi FROM esrak;
REVOKE DELETE ON dbo.CalmaListesi FROM esrak;

-- 3. Dila Bilgen- Sorgulay�c�
GRANT SELECT ON dbo.Sark�c� TO dilab;
GRANT SELECT ON dbo.Album TO dilab;
GRANT SELECT ON dbo.Sarki TO dilab;
GRANT SELECT ON dbo.Podcast TO dilab;
GRANT SELECT ON dbo.DinlemeGecmisi TO dilab;
GRANT SELECT ON dbo.Kullan�c� TO dilab;
GRANT SELECT ON dbo.OneriSistemi TO dilab;
GRANT SELECT ON dbo.CalmaListesi TO dilab;

-- Di�er t�m yetkileri engelle (g�venlik i�in net olsun)
REVOKE INSERT, UPDATE, DELETE ON dbo.Sark�c� FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Album FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Sarki FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Podcast FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.DinlemeGecmisi FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.Kullan�c� FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.OneriSistemi FROM dilab;
REVOKE INSERT, UPDATE, DELETE ON dbo.CalmaListesi FROM dilab;





