CREATE TABLE [dbo].[Chambre]
(
	[IdChambre] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(50) NULL, 
    [NumeroChambre] INT NOT NULL, 
    [Etage] INT NOT NULL, 
    [Capacite] INT NOT NULL, 
    [DescriptionCourte] NVARCHAR(250) NOT NULL, 
    [DescriptionLongue] NVARCHAR(MAX) NOT NULL, 
    [Photo] NCHAR(250) NOT NULL, 
    [IdHotel] INT NOT NULL, 
    [IdCategorie] INT NOT NULL, 
    [IdEquipement] INT NOT NULL, 
    CONSTRAINT [FK_Chambre_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [Hotel]([IdHotel]),
    CONSTRAINT [FK_Chambre_ToCategorie] FOREIGN KEY ([IdCategorie]) REFERENCES [Categorie]([IdCategorie]),
    CONSTRAINT [FK_Chambre_ToEquipement] FOREIGN KEY ([IdEquipement]) REFERENCES [Equipement]([IdEquipement])
)
