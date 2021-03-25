CREATE TABLE [dbo].[AuteurArticle] (
    [IdAuteurArticle] INT            IDENTITY (1, 1) NOT NULL,
    [Nom]             NVARCHAR (60)  NOT NULL,
    [Prenom]          NVARCHAR (60)  NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [Photo]           NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([IdAuteurArticle] ASC)
);


