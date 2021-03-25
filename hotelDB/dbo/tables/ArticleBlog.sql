CREATE TABLE [dbo].[ArticleBlog] (
    [IdArticleBlog]   INT            IDENTITY (1, 1) NOT NULL,
    [Photo]           NVARCHAR (250) NOT NULL,
    [Titre]           NVARCHAR (250) NOT NULL,
    [Accroche]        NVARCHAR (250) NOT NULL,
    [ContenuArticle]  NVARCHAR (MAX) NULL,
    [TexteEvidence]   NVARCHAR (MAX) NULL,
    [Pargraphe1]      NVARCHAR (MAX) NULL,
    [Pargraphe2]      NVARCHAR (MAX) NULL,
    [Pargraphe3]      NVARCHAR (MAX) NULL,
    [Pargraphe4]      NVARCHAR (MAX) NULL,
    [Date]            DATETIME       NOT NULL,
    [IdHotel]         INT            NOT NULL,
    [IdAuteurArticle] INT            NOT NULL,
    CONSTRAINT [PK__tmp_ms_x__F42DD34E7668CB16] PRIMARY KEY CLUSTERED ([IdArticleBlog] ASC),
    CONSTRAINT [FK_ArticleBlog_ToAuteurArticle] FOREIGN KEY ([IdAuteurArticle]) REFERENCES [dbo].[AuteurArticle] ([IdAuteurArticle]),
    CONSTRAINT [FK_ArticleBlog_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel])
);


