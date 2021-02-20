CREATE TABLE [dbo].[ArticleBlog]
(
	[IdArticleBlog] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Photo] NVARCHAR(250) NOT NULL, 
    [Titre] NVARCHAR(250) NOT NULL, 
    [Accroche] NVARCHAR(250) NOT NULL, 
    [ContenuArticle] NVARCHAR(MAX) NOT NULL, 
    [TexteEvidence] NVARCHAR(MAX) NULL, 
    [Date] DATETIME NOT NULL, 
    [IdHotel] INT NOT NULL, 
    CONSTRAINT [FK_ArticleBlog_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [Hotel]([IdHotel])
)
