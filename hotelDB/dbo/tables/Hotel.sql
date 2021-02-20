CREATE TABLE [dbo].[Hotel]
(
	[IdHotel] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(100) NOT NULL, 
    [Etoile] FLOAT NOT NULL, 
    [Rue] NVARCHAR(250) NOT NULL, 
    [NumeroRue] NVARCHAR(10) NOT NULL, 
    [Ville] NVARCHAR(50)  NULL, 
    [CodePostal] NVARCHAR(10) NULL, 
    [Pays] NVARCHAR(50) NULL, 
    [Latitude] DECIMAL(9, 6) NULL, 
    [Longitude] DECIMAL(8, 6) NULL, 
    [Telephone] NVARCHAR(12) NOT NULL, 
    [Email] NVARCHAR(323) NOT NULL, 
    [LienPhoto] NVARCHAR(250) NULL, 
    [IdCompanyHotel] INT NOT NULL, 
    CONSTRAINT [FK_Hotel_ToCompagnieHotel] FOREIGN KEY ([IdCompanyHotel]) REFERENCES [CompanyHotel]([IdCompanyHotel])
)
