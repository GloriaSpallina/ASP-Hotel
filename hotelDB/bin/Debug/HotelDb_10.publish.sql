/*
Script de déploiement pour HotelDb

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HotelDb"
:setvar DefaultFilePrefix "HotelDb"
:setvar DefaultDataPath "C:\Users\Glori\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Glori\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9f9ba7c3-b5c5-484f-ad75-0831f4f122bf est ignorée, l''élément [dbo].[Blog].[Id] (SqlSimpleColumn) ne sera pas renommé en IdBlog';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 66a9fcce-9846-48ad-a906-a1b4bfed6290 est ignorée, l''élément [dbo].[Blog].[Artice] (SqlSimpleColumn) ne sera pas renommé en Article';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 71aa8d4a-0148-411d-80af-07bdbaba519e est ignorée, l''élément [dbo].[ArticleBlog].[IdBlog] (SqlSimpleColumn) ne sera pas renommé en IdArticleBlog';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f8a00360-d227-4280-9512-9fdef51fb7ee est ignorée, l''élément [dbo].[ArticleBlog].[DescriptionCourte] (SqlSimpleColumn) ne sera pas renommé en Accroche';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé cba5dbf0-5b73-4115-ac4c-3fbebbbf205c est ignorée, l''élément [dbo].[ArticleBlog].[Article] (SqlSimpleColumn) ne sera pas renommé en ContenuArticle';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé ab96280d-3f26-43ec-8dc5-b22438cb2f12 est ignorée, l''élément [dbo].[CommentaireArticle].[Id] (SqlSimpleColumn) ne sera pas renommé en IdCommentaireArticle';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 514c024e-de65-4163-b09c-fc216b1bae43 est ignorée, l''élément [dbo].[HotelPhoto].[Id] (SqlSimpleColumn) ne sera pas renommé en IdHotelPhoto';


GO
PRINT N'Modification de [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD [Photo] NVARCHAR (50) NULL;


GO
PRINT N'Création de [dbo].[ArticleBlog]...';


GO
CREATE TABLE [dbo].[ArticleBlog] (
    [IdArticleBlog]  INT            IDENTITY (1, 1) NOT NULL,
    [Photo]          NVARCHAR (250) NOT NULL,
    [Titre]          NVARCHAR (250) NOT NULL,
    [Accroche]       NVARCHAR (250) NOT NULL,
    [ContenuArticle] NVARCHAR (MAX) NOT NULL,
    [TexteEvidence]  NVARCHAR (MAX) NULL,
    [Date]           DATETIME       NOT NULL,
    [IdHotel]        INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdArticleBlog] ASC)
);


GO
PRINT N'Création de [dbo].[CommentaireArticle]...';


GO
CREATE TABLE [dbo].[CommentaireArticle] (
    [IdCommentaireArticle] INT            IDENTITY (1, 1) NOT NULL,
    [Commentaire]          NVARCHAR (MAX) NOT NULL,
    [Date]                 DATETIME       NOT NULL,
    [IdUser]               INT            NOT NULL,
    [IdArticleBlog]        INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCommentaireArticle] ASC)
);


GO
PRINT N'Création de [dbo].[HotelPhoto]...';


GO
CREATE TABLE [dbo].[HotelPhoto] (
    [IdHotelPhoto] INT            IDENTITY (1, 1) NOT NULL,
    [Photo]        NVARCHAR (250) NOT NULL,
    [IdHotel]      INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdHotelPhoto] ASC)
);


GO
PRINT N'Création de [dbo].[FK_ArticleBlog_ToHotel]...';


GO
ALTER TABLE [dbo].[ArticleBlog] WITH NOCHECK
    ADD CONSTRAINT [FK_ArticleBlog_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_CommentaireArticle_ToUser]...';


GO
ALTER TABLE [dbo].[CommentaireArticle] WITH NOCHECK
    ADD CONSTRAINT [FK_CommentaireArticle_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


GO
PRINT N'Création de [dbo].[FK_CommentaireArticle_ToArticleBlog]...';


GO
ALTER TABLE [dbo].[CommentaireArticle] WITH NOCHECK
    ADD CONSTRAINT [FK_CommentaireArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [dbo].[ArticleBlog] ([IdArticleBlog]);


GO
PRINT N'Création de [dbo].[FK_HotelPhoto_ToHotel]...';


GO
ALTER TABLE [dbo].[HotelPhoto] WITH NOCHECK
    ADD CONSTRAINT [FK_HotelPhoto_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9f9ba7c3-b5c5-484f-ad75-0831f4f122bf')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9f9ba7c3-b5c5-484f-ad75-0831f4f122bf')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '66a9fcce-9846-48ad-a906-a1b4bfed6290')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('66a9fcce-9846-48ad-a906-a1b4bfed6290')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '71aa8d4a-0148-411d-80af-07bdbaba519e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('71aa8d4a-0148-411d-80af-07bdbaba519e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f8a00360-d227-4280-9512-9fdef51fb7ee')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f8a00360-d227-4280-9512-9fdef51fb7ee')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cba5dbf0-5b73-4115-ac4c-3fbebbbf205c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cba5dbf0-5b73-4115-ac4c-3fbebbbf205c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ab96280d-3f26-43ec-8dc5-b22438cb2f12')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ab96280d-3f26-43ec-8dc5-b22438cb2f12')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '514c024e-de65-4163-b09c-fc216b1bae43')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('514c024e-de65-4163-b09c-fc216b1bae43')

GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[ArticleBlog] WITH CHECK CHECK CONSTRAINT [FK_ArticleBlog_ToHotel];

ALTER TABLE [dbo].[CommentaireArticle] WITH CHECK CHECK CONSTRAINT [FK_CommentaireArticle_ToUser];

ALTER TABLE [dbo].[CommentaireArticle] WITH CHECK CHECK CONSTRAINT [FK_CommentaireArticle_ToArticleBlog];

ALTER TABLE [dbo].[HotelPhoto] WITH CHECK CHECK CONSTRAINT [FK_HotelPhoto_ToHotel];


GO
PRINT N'Mise à jour terminée.';


GO
