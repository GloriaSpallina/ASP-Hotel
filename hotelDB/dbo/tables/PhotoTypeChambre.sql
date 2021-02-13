CREATE TABLE [dbo].[PhotoTypeChambre]
(
	[IdPhotoTypeChambre] INT NOT NULL PRIMARY KEY Identity, 
    [LienPhoto] NCHAR(250) NOT NULL, 
    [IdTypeChambre] INT NOT NULL, 
    CONSTRAINT [FK_PhotoTypeChambre_ToTypeChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [TypeChambre]([IdTypeChambre])
)
