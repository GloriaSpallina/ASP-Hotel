CREATE TABLE [dbo].[TypeChambre]
(
	[IdTypeChambre] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(50) NOT NULL,
     [Capacite] INT NOT NULL, 
    [DescriptionCourte] NVARCHAR(250) NOT NULL, 
    [DescriptionLongue] NVARCHAR(MAX) NOT NULL, 
    [Prix] FLOAT NOT NULL
)
