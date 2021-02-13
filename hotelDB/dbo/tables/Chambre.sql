CREATE TABLE [dbo].[Chambre]
(
	[IdChambre] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(50) NULL, 
    [NumeroChambre] INT NOT NULL, 
    [Etage] INT NOT NULL, 
    [IdHotel] INT NOT NULL, 
    [IdTypeChambre] INT NOT NULL, 
    CONSTRAINT [FK_Chambre_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [Hotel]([IdHotel]),
    CONSTRAINT [FK_Chambre_ToTypeChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [TypeChambre]([IdTypeChambre]),
)
