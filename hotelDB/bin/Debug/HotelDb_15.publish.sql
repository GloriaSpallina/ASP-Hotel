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
/*
La colonne [dbo].[Client].[IdUser] est en cours de suppression, des données risquent d'être perdues.

La colonne [dbo].[Client].[Login] de la table [dbo].[Client] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[Client].[Nom] de la table [dbo].[Client] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[Client].[Prenom] de la table [dbo].[Client] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Client])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[CommentaireArticle].[IdUser] est en cours de suppression, des données risquent d'être perdues.

La colonne [dbo].[CommentaireArticle].[IdClient] de la table [dbo].[CommentaireArticle] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[CommentaireArticle])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de [dbo].[FK_Client_ToUser]...';


GO
ALTER TABLE [dbo].[Client] DROP CONSTRAINT [FK_Client_ToUser];


GO
PRINT N'Suppression de [dbo].[FK_Evaluation_ToClient]...';


GO
ALTER TABLE [dbo].[Evaluation] DROP CONSTRAINT [FK_Evaluation_ToClient];


GO
PRINT N'Suppression de [dbo].[FK_Facture_ToClient]...';


GO
ALTER TABLE [dbo].[Facture] DROP CONSTRAINT [FK_Facture_ToClient];


GO
PRINT N'Suppression de [dbo].[FK_Reservation_ToClient]...';


GO
ALTER TABLE [dbo].[Reservation] DROP CONSTRAINT [FK_Reservation_ToClient];


GO
PRINT N'Suppression de [dbo].[FK_CommentaireArticle_ToArticleBlog]...';


GO
ALTER TABLE [dbo].[CommentaireArticle] DROP CONSTRAINT [FK_CommentaireArticle_ToArticleBlog];


GO
PRINT N'Suppression de [dbo].[FK_CommentaireArticle_ToUser]...';


GO
ALTER TABLE [dbo].[CommentaireArticle] DROP CONSTRAINT [FK_CommentaireArticle_ToUser];


GO
PRINT N'Début de la régénération de la table [dbo].[Client]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Client] (
    [IdClient]   INT            IDENTITY (1, 1) NOT NULL,
    [Nom]        NVARCHAR (64)  NOT NULL,
    [Prenom]     NVARCHAR (64)  NOT NULL,
    [Email]      NVARCHAR (323) NULL,
    [Photo]      NVARCHAR (50)  NULL,
    [Telephone]  VARCHAR (16)   NULL,
    [Rue]        NVARCHAR (150) NULL,
    [Numero]     NVARCHAR (10)  NULL,
    [Ville]      NVARCHAR (150) NULL,
    [Pays]       NVARCHAR (50)  NULL,
    [Login]      NVARCHAR (50)  NOT NULL,
    [MotDePasse] VARBINARY (32) NOT NULL,
    [Salt]       CHAR (8)       NOT NULL,
    [IsAdmin]    BIT            NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK__Client__C1961B33CD1C3FCB1] PRIMARY KEY CLUSTERED ([IdClient] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Client])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Client] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Client] ([IdClient], [Telephone], [Pays], [MotDePasse], [Salt], [IsAdmin])
        SELECT   [IdClient],
                 [Telephone],
                 [Pays],
                 [MotDePasse],
                 [Salt],
                 [IsAdmin]
        FROM     [dbo].[Client]
        ORDER BY [IdClient] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Client] OFF;
    END

DROP TABLE [dbo].[Client];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Client]', N'Client';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK__Client__C1961B33CD1C3FCB1]', N'PK__Client__C1961B33CD1C3FCB', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Début de la régénération de la table [dbo].[CommentaireArticle]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_CommentaireArticle] (
    [IdCommentaireArticle] INT            IDENTITY (1, 1) NOT NULL,
    [Commentaire]          NVARCHAR (MAX) NOT NULL,
    [Date]                 DATETIME       NOT NULL,
    [IdClient]             INT            NOT NULL,
    [IdArticleBlog]        INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCommentaireArticle] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[CommentaireArticle])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_CommentaireArticle] ON;
        INSERT INTO [dbo].[tmp_ms_xx_CommentaireArticle] ([IdCommentaireArticle], [Commentaire], [Date], [IdArticleBlog])
        SELECT   [IdCommentaireArticle],
                 [Commentaire],
                 [Date],
                 [IdArticleBlog]
        FROM     [dbo].[CommentaireArticle]
        ORDER BY [IdCommentaireArticle] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_CommentaireArticle] OFF;
    END

DROP TABLE [dbo].[CommentaireArticle];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_CommentaireArticle]', N'CommentaireArticle';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de [dbo].[FK_Evaluation_ToClient]...';


GO
ALTER TABLE [dbo].[Evaluation] WITH NOCHECK
    ADD CONSTRAINT [FK_Evaluation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_Facture_ToClient]...';


GO
ALTER TABLE [dbo].[Facture] WITH NOCHECK
    ADD CONSTRAINT [FK_Facture_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_Reservation_ToClient]...';


GO
ALTER TABLE [dbo].[Reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_Reservation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_CommentaireArticle_ToArticleBlog]...';


GO
ALTER TABLE [dbo].[CommentaireArticle] WITH NOCHECK
    ADD CONSTRAINT [FK_CommentaireArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [dbo].[ArticleBlog] ([IdArticleBlog]);


GO
PRINT N'Création de [dbo].[FK_CommentaireArticle_ToClient]...';


GO
ALTER TABLE [dbo].[CommentaireArticle] WITH NOCHECK
    ADD CONSTRAINT [FK_CommentaireArticle_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Actualisation de [dbo].[V_ArticleTop3]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[V_ArticleTop3]';


GO
PRINT N'Modification de [dbo].[SP_CLIENT_Insert]...';


GO
ALTER PROCEDURE [dbo].[SP_CLIENT_Insert]
	@IdClient INTEGER,
	@Rue NVARCHAR (150) = NULL,
    @Numero NVARCHAR (10) = NULL,
    @Ville  NVARCHAR (150) = NULL,
    @Telephone VARCHAR(16) = NULL,
    @Pays NVARCHAR(50) = NULL,
    @MotDePasse VARBINARY(32),
	@Nom NVARCHAR(64), 
    @Prenom NVARCHAR(64), 
    @Email NVARCHAR(323) = NULL, 
    @Photo NVARCHAR(50) = NULL,
	@Login NVARCHAR(50)

	
    
AS
	DECLARE @idAddress INTEGER, @salt CHAR(8)
	SET @salt = [dbo].SF_GenerateSalt()
	INSERT INTO [Client]([MotDePasse],[Nom], [Prenom],[Login], [Email], [Photo],[Telephone],[Salt],[IdClient],[Rue],[Numero],[Ville],[Pays])
	OUTPUT inserted.IdClient
		VALUES (dbo.SF_EncryptedPassword(@MotDePasse, @salt),@Nom, @Prenom,@Login, @Email, @Photo, @Telephone,@salt,@IdClient,@Rue,@Numero,@Ville,@Pays)
GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Evaluation] WITH CHECK CHECK CONSTRAINT [FK_Evaluation_ToClient];

ALTER TABLE [dbo].[Facture] WITH CHECK CHECK CONSTRAINT [FK_Facture_ToClient];

ALTER TABLE [dbo].[Reservation] WITH CHECK CHECK CONSTRAINT [FK_Reservation_ToClient];

ALTER TABLE [dbo].[CommentaireArticle] WITH CHECK CHECK CONSTRAINT [FK_CommentaireArticle_ToArticleBlog];

ALTER TABLE [dbo].[CommentaireArticle] WITH CHECK CHECK CONSTRAINT [FK_CommentaireArticle_ToClient];


GO
PRINT N'Mise à jour terminée.';


GO
