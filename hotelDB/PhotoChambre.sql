CREATE TABLE [dbo].[PhotoChambre]
(
	[IdPhotoChambre] INT NOT NULL PRIMARY KEY Identity, 
    [LienPhoto] NCHAR(250) NOT NULL, 
    [IdChambre] INT NOT NULL, 
    CONSTRAINT [FK_PhotoChambre_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [Chambre]([IdChambre])
)
