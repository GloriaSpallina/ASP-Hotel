CREATE TABLE [dbo].[Hotel]
(
	[IdHotel] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(50) NOT NULL, 
    [Etoile] FLOAT NOT NULL, 
    [Rue] NVARCHAR(250) NOT NULL, 
    [NumeroRue] NVARCHAR(10) NOT NULL, 
    [Latitude] DECIMAL(9, 6) NOT NULL, 
    [Longitude] DECIMAL(8, 6) NOT NULL, 
    [Telephone] NVARCHAR(12) NOT NULL, 
    [Email] NVARCHAR(323) NOT NULL
)
