CREATE TABLE [dbo].[AuteurArticle]
(
	[IdAuteurArticle] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(60) NOT NULL, 
    [Prenom] NVARCHAR(60) NOT NULL, 
    [Description] NVARCHAR(MAX) NULL
)
