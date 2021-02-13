CREATE TABLE [dbo].[Service]
(
	[IdService] INT NOT NULL PRIMARY KEY IDENTITY, 
    [NomService] NVARCHAR(50) NOT NULL, 
    [DescriptionCourte] NVARCHAR(150) NOT NULL, 
    [DescriptionLongue] NVARCHAR(MAX) NOT NULL
)
