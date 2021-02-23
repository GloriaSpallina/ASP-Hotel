CREATE TABLE [dbo].[ArticleBlog]
(
	[IdArticleBlog] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Photo] NVARCHAR(250) NOT NULL, 
    [Titre] NVARCHAR(250) NOT NULL, 
    [Accroche] NVARCHAR(250) NOT NULL, 
    [ContenuArticle] NVARCHAR(MAX) NULL, 
    [TexteEvidence] NVARCHAR(MAX) NULL, 
    Pargraphe1 NVARCHAR(MAX)NUll,
    Pargraphe2 NVARCHAR(MAX)NUll,
    Pargraphe3 NVARCHAR(MAX)NUll,
    Pargraphe4 NVARCHAR(MAX)NUll,
    [Date] DATETIME NOT NULL, 
    [IdHotel] INT NOT NULL, 
    [IdAuteurArticle] INT NOT NULL, 
    CONSTRAINT [FK_ArticleBlog_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [Hotel]([IdHotel]),
    CONSTRAINT [FK_ArticleBlog_ToAuteurArticle] FOREIGN KEY ([IdAuteurArticle]) REFERENCES [AuteurArticle]([IdAuteurArticle])
)
