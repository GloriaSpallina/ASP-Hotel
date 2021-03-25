/*
Script de déploiement pour HotelTest

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HotelTest"
:setvar DefaultFilePrefix "HotelTest"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\"

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de [dbo].[ArticleBlog]...';


GO
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
    PRIMARY KEY CLUSTERED ([IdArticleBlog] ASC)
);


GO
PRINT N'Création de [dbo].[AuteurArticle]...';


GO
CREATE TABLE [dbo].[AuteurArticle] (
    [IdAuteurArticle] INT            IDENTITY (1, 1) NOT NULL,
    [Nom]             NVARCHAR (60)  NOT NULL,
    [Prenom]          NVARCHAR (60)  NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([IdAuteurArticle] ASC)
);


GO
PRINT N'Création de [dbo].[Chambre]...';


GO
CREATE TABLE [dbo].[Chambre] (
    [IdChambre]     INT           IDENTITY (1, 1) NOT NULL,
    [Nom]           NVARCHAR (50) NULL,
    [NumeroChambre] INT           NOT NULL,
    [Etage]         INT           NOT NULL,
    [IdHotel]       INT           NOT NULL,
    [IdTypeChambre] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdChambre] ASC)
);


GO
PRINT N'Création de [dbo].[Client]...';


GO
CREATE TABLE [dbo].[Client] (
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
    [MotDePasse] NVARCHAR (MAX) NOT NULL,
    [Salt]       CHAR (8)       NULL,
    [IsAdmin]    BIT            NULL,
    CONSTRAINT [PK__Client__C1961B33CD1C3FCB] PRIMARY KEY CLUSTERED ([IdClient] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC),
    UNIQUE NONCLUSTERED ([Telephone] ASC)
);


GO
PRINT N'Création de [dbo].[CommentaireArticle]...';


GO
CREATE TABLE [dbo].[CommentaireArticle] (
    [IdCommentaireArticle] INT            IDENTITY (1, 1) NOT NULL,
    [Commentaire]          NVARCHAR (MAX) NOT NULL,
    [Date]                 DATETIME       NOT NULL,
    [IdClient]             INT            NOT NULL,
    [IdArticleBlog]        INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCommentaireArticle] ASC)
);


GO
PRINT N'Création de [dbo].[CompanyHotel]...';


GO
CREATE TABLE [dbo].[CompanyHotel] (
    [IdCompanyHotel]    INT            IDENTITY (1, 1) NOT NULL,
    [Nom]               NVARCHAR (250) NOT NULL,
    [Slogan]            NVARCHAR (250) NULL,
    [DateFondation]     DATE           NOT NULL,
    [DescriptionCourte] NVARCHAR (250) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    [Photo]             NVARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([IdCompanyHotel] ASC)
);


GO
PRINT N'Création de [dbo].[Equipement]...';


GO
CREATE TABLE [dbo].[Equipement] (
    [IdEquipement] INT           IDENTITY (1, 1) NOT NULL,
    [Libelle]      NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEquipement] ASC)
);


GO
PRINT N'Création de [dbo].[EquipementTypeChambre]...';


GO
CREATE TABLE [dbo].[EquipementTypeChambre] (
    [IdEquipementTypeChambre] INT IDENTITY (1, 1) NOT NULL,
    [IdTypeChambre]           INT NOT NULL,
    [IdEquipement]            INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEquipementTypeChambre] ASC)
);


GO
PRINT N'Création de [dbo].[Evaluation]...';


GO
CREATE TABLE [dbo].[Evaluation] (
    [IdEvaluation] INT            IDENTITY (1, 1) NOT NULL,
    [Note]         FLOAT (53)     NOT NULL,
    [Commentaire]  NVARCHAR (MAX) NOT NULL,
    [IdChambre]    INT            NOT NULL,
    [IdClient]     INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEvaluation] ASC)
);


GO
PRINT N'Création de [dbo].[Facture]...';


GO
CREATE TABLE [dbo].[Facture] (
    [IdFacture]    INT        IDENTITY (1, 1) NOT NULL,
    [Montant]      FLOAT (53) NOT NULL,
    [FraisDossier] FLOAT (53) NOT NULL,
    [Taxe]         FLOAT (53) NOT NULL,
    [IdClient]     INT        NULL,
    PRIMARY KEY CLUSTERED ([IdFacture] ASC)
);


GO
PRINT N'Création de [dbo].[Hotel]...';


GO
CREATE TABLE [dbo].[Hotel] (
    [IdHotel]        INT            IDENTITY (1, 1) NOT NULL,
    [Nom]            NVARCHAR (100) NOT NULL,
    [Etoile]         FLOAT (53)     NOT NULL,
    [Rue]            NVARCHAR (250) NOT NULL,
    [NumeroRue]      NVARCHAR (10)  NOT NULL,
    [Ville]          NVARCHAR (50)  NULL,
    [CodePostal]     NVARCHAR (10)  NULL,
    [Pays]           NVARCHAR (50)  NULL,
    [Latitude]       DECIMAL (9, 6) NULL,
    [Longitude]      DECIMAL (8, 6) NULL,
    [Telephone]      NVARCHAR (12)  NOT NULL,
    [Email]          NVARCHAR (323) NOT NULL,
    [LienPhoto]      NVARCHAR (250) NULL,
    [IdCompanyHotel] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdHotel] ASC)
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
PRINT N'Création de [dbo].[Message]...';


GO
CREATE TABLE [dbo].[Message] (
    [IdMessage]   INT            IDENTITY (1, 1) NOT NULL,
    [ContenuMail] NVARCHAR (MAX) NOT NULL,
    [DateEnvoie]  DATETIME       NOT NULL,
    [Nom]         NVARCHAR (250) NOT NULL,
    [Sujet]       NVARCHAR (500) NULL,
    [Email]       NVARCHAR (323) NOT NULL,
    CONSTRAINT [PK__Message__47AAF3043F396981] PRIMARY KEY CLUSTERED ([IdMessage] ASC)
);


GO
PRINT N'Création de [dbo].[PhotoTypeChambre]...';


GO
CREATE TABLE [dbo].[PhotoTypeChambre] (
    [IdPhotoTypeChambre] INT            IDENTITY (1, 1) NOT NULL,
    [Photo]              NVARCHAR (250) NOT NULL,
    [IdTypeChambre]      INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPhotoTypeChambre] ASC)
);


GO
PRINT N'Création de [dbo].[Reservation]...';


GO
CREATE TABLE [dbo].[Reservation] (
    [IdReservation]       INT      IDENTITY (1, 1) NOT NULL,
    [DateReservation]     DATETIME NOT NULL,
    [DateDebutSejour]     DATETIME NOT NULL,
    [DateFinSejour]       DATETIME NOT NULL,
    [NombreAdulte]        INT      NOT NULL,
    [NombreEnfant]        INT      NOT NULL,
    [Statut]              BIT      NULL,
    [AssuranceAnnulation] BIT      NOT NULL,
    [IdChambre]           INT      NOT NULL,
    [IdClient]            INT      NOT NULL,
    CONSTRAINT [PK__Reservat__7E69A57BE25FCA81] PRIMARY KEY CLUSTERED ([IdReservation] ASC)
);


GO
PRINT N'Création de [dbo].[Service]...';


GO
CREATE TABLE [dbo].[Service] (
    [IdService]         INT            IDENTITY (1, 1) NOT NULL,
    [NomService]        NVARCHAR (50)  NOT NULL,
    [DescriptionCourte] NVARCHAR (150) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    [PhotoService]      NVARCHAR (250) NULL,
    [Orientation]       NVARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([IdService] ASC)
);


GO
PRINT N'Création de [dbo].[ServiceHotel]...';


GO
CREATE TABLE [dbo].[ServiceHotel] (
    [IdServiceHotel] INT IDENTITY (1, 1) NOT NULL,
    [IdHotel]        INT NOT NULL,
    [IdService]      INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdServiceHotel] ASC)
);


GO
PRINT N'Création de [dbo].[Theme]...';


GO
CREATE TABLE [dbo].[Theme] (
    [IdTheme] INT           IDENTITY (1, 1) NOT NULL,
    [Libelle] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdTheme] ASC)
);


GO
PRINT N'Création de [dbo].[ThemeArticle]...';


GO
CREATE TABLE [dbo].[ThemeArticle] (
    [IdThemeArticle] INT IDENTITY (1, 1) NOT NULL,
    [IdTheme]        INT NOT NULL,
    [IdArticleBlog]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdThemeArticle] ASC)
);


GO
PRINT N'Création de [dbo].[TypeChambre]...';


GO
CREATE TABLE [dbo].[TypeChambre] (
    [IdTypeChambre]     INT            IDENTITY (1, 1) NOT NULL,
    [Nom]               NVARCHAR (50)  NOT NULL,
    [Capacite]          INT            NOT NULL,
    [DescriptionCourte] NVARCHAR (250) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    [Prix]              FLOAT (53)     NOT NULL,
    PRIMARY KEY CLUSTERED ([IdTypeChambre] ASC)
);


GO
PRINT N'Création de [dbo].[FK_ArticleBlog_ToHotel]...';


GO
ALTER TABLE [dbo].[ArticleBlog]
    ADD CONSTRAINT [FK_ArticleBlog_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_ArticleBlog_ToAuteurArticle]...';


GO
ALTER TABLE [dbo].[ArticleBlog]
    ADD CONSTRAINT [FK_ArticleBlog_ToAuteurArticle] FOREIGN KEY ([IdAuteurArticle]) REFERENCES [dbo].[AuteurArticle] ([IdAuteurArticle]);


GO
PRINT N'Création de [dbo].[FK_Chambre_ToHotel]...';


GO
ALTER TABLE [dbo].[Chambre]
    ADD CONSTRAINT [FK_Chambre_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_Chambre_ToTypeChambre]...';


GO
ALTER TABLE [dbo].[Chambre]
    ADD CONSTRAINT [FK_Chambre_ToTypeChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_CommentaireArticle_ToClient]...';


GO
ALTER TABLE [dbo].[CommentaireArticle]
    ADD CONSTRAINT [FK_CommentaireArticle_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_CommentaireArticle_ToArticleBlog]...';


GO
ALTER TABLE [dbo].[CommentaireArticle]
    ADD CONSTRAINT [FK_CommentaireArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [dbo].[ArticleBlog] ([IdArticleBlog]);


GO
PRINT N'Création de [dbo].[FK_EquipementChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[EquipementTypeChambre]
    ADD CONSTRAINT [FK_EquipementChambre_ToChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_EquipementTypeChambre_ToEquipement]...';


GO
ALTER TABLE [dbo].[EquipementTypeChambre]
    ADD CONSTRAINT [FK_EquipementTypeChambre_ToEquipement] FOREIGN KEY ([IdEquipement]) REFERENCES [dbo].[Equipement] ([IdEquipement]);


GO
PRINT N'Création de [dbo].[FK_Evaluation_ToChambre]...';


GO
ALTER TABLE [dbo].[Evaluation]
    ADD CONSTRAINT [FK_Evaluation_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [dbo].[Chambre] ([IdChambre]);


GO
PRINT N'Création de [dbo].[FK_Evaluation_ToClient]...';


GO
ALTER TABLE [dbo].[Evaluation]
    ADD CONSTRAINT [FK_Evaluation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_Facture_ToClient]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [FK_Facture_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_Hotel_ToCompagnieHotel]...';


GO
ALTER TABLE [dbo].[Hotel]
    ADD CONSTRAINT [FK_Hotel_ToCompagnieHotel] FOREIGN KEY ([IdCompanyHotel]) REFERENCES [dbo].[CompanyHotel] ([IdCompanyHotel]);


GO
PRINT N'Création de [dbo].[FK_HotelPhoto_ToHotel]...';


GO
ALTER TABLE [dbo].[HotelPhoto]
    ADD CONSTRAINT [FK_HotelPhoto_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_PhotoCategorieChambre_CategorieChambre]...';


GO
ALTER TABLE [dbo].[PhotoTypeChambre]
    ADD CONSTRAINT [FK_PhotoCategorieChambre_CategorieChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_Reservation_ToChambre]...';


GO
ALTER TABLE [dbo].[Reservation]
    ADD CONSTRAINT [FK_Reservation_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [dbo].[Chambre] ([IdChambre]);


GO
PRINT N'Création de [dbo].[FK_Reservation_ToClient]...';


GO
ALTER TABLE [dbo].[Reservation]
    ADD CONSTRAINT [FK_Reservation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient]);


GO
PRINT N'Création de [dbo].[FK_ServiceHotel_ToHotel]...';


GO
ALTER TABLE [dbo].[ServiceHotel]
    ADD CONSTRAINT [FK_ServiceHotel_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_ServiceHotel_ToService]...';


GO
ALTER TABLE [dbo].[ServiceHotel]
    ADD CONSTRAINT [FK_ServiceHotel_ToService] FOREIGN KEY ([IdService]) REFERENCES [dbo].[Service] ([IdService]);


GO
PRINT N'Création de [dbo].[FK_ThemeArticle_ToTheme]...';


GO
ALTER TABLE [dbo].[ThemeArticle]
    ADD CONSTRAINT [FK_ThemeArticle_ToTheme] FOREIGN KEY ([IdTheme]) REFERENCES [dbo].[Theme] ([IdTheme]);


GO
PRINT N'Création de [dbo].[FK_ThemeArticle_ToArticleBlog]...';


GO
ALTER TABLE [dbo].[ThemeArticle]
    ADD CONSTRAINT [FK_ThemeArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [dbo].[ArticleBlog] ([IdArticleBlog]);


GO
PRINT N'Création de [dbo].[V_ArticleTop3]...';


GO
CREATE VIEW dbo.V_ArticleTop3
AS
SELECT TOP (3) dbo.ArticleBlog.Titre, dbo.ArticleBlog.Photo, dbo.ArticleBlog.Date, dbo.AuteurArticle.Nom, dbo.AuteurArticle.Prenom,
                      (SELECT COUNT(*) AS Expr1
                       FROM      dbo.CommentaireArticle
                       WHERE   (dbo.ArticleBlog.IdArticleBlog = IdArticleBlog)) AS NBComment
FROM     dbo.ArticleBlog LEFT OUTER JOIN
                  dbo.AuteurArticle ON dbo.ArticleBlog.IdAuteurArticle = dbo.AuteurArticle.IdAuteurArticle
ORDER BY dbo.ArticleBlog.Date DESC
GO
PRINT N'Création de [dbo].[V_GetRandom]...';


GO
CREATE VIEW [dbo].[V_GetRandom]
	AS SELECT FLOOR(RAND()*10) AS RandomValue
GO
PRINT N'Création de [dbo].[V_Room]...';


GO
CREATE VIEW dbo.V_Room
AS
SELECT dbo.TypeChambre.Nom, dbo.TypeChambre.Prix, dbo.PhotoTypeChambre.Photo, dbo.TypeChambre.Nom AS NomType, dbo.TypeChambre.Capacite, dbo.TypeChambre.DescriptionCourte, dbo.TypeChambre.DescriptionLongue, 
                  dbo.TypeChambre.Prix AS Expr2, dbo.PhotoTypeChambre.Photo AS Expr1, dbo.TypeChambre.Capacite AS Expr4, dbo.TypeChambre.DescriptionCourte AS Expr5, dbo.TypeChambre.DescriptionLongue AS Expr6
FROM     dbo.TypeChambre INNER JOIN
                  dbo.PhotoTypeChambre ON dbo.TypeChambre.IdTypeChambre = dbo.PhotoTypeChambre.IdTypeChambre
GO
PRINT N'Création de [dbo].[FN_GETTHEME]...';


GO

CREATE FUNCTION [dbo].[FN_GETTHEME] 
(
	-- Add the parameters for the function here
	@ArticleBlogId INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	declare @Info NVARCHAR(MAX)
	SELECT @Info=SUBSTRING(
	(
	   select ', '+ t.Libelle AS 'data()'
	   FROM dbo.Theme t
	   inner join dbo.ThemeArticle ta
	   on t.IdTheme= ta.IdTheme
	   WHERE ta.IdArticleBlog=@ArticleBlogId
	   FOR XML PATH('')
	)	
	,2,9999)

	return @Info
END
GO
PRINT N'Création de [dbo].[SF_EncryptedPassword]...';


GO
CREATE FUNCTION [dbo].[SF_EncryptedPassword]
(
	@MotDePasse NVARCHAR(MAX),
	@salt CHAR(8)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	RETURN HASHBYTES('SHA2_256',CONCAT(SUBSTRING(@salt,0,4),@MotDePasse,SUBSTRING(@salt,4,4)))
END
GO
PRINT N'Création de [dbo].[SF_GenerateSalt]...';


GO
CREATE FUNCTION [dbo].[SF_GenerateSalt]
()
RETURNS CHAR(8)
AS
BEGIN
	DECLARE @saltResult NVARCHAR(8)
	DECLARE @randomValue SMALLINT, @i SMALLINT
	SET @i = 0;
	WHILE @i < 8
	BEGIN
		SET @randomValue = (SELECT RandomValue FROM [V_GetRandom])
		SET @saltResult = CONCAT(@saltResult,@randomValue)
		SET @i = @i + 1;
	END

	RETURN @saltResult


	--IF (@i = 0)
	--BEGIN
	--	PRINT(CONCAT(@i, ' est égale à zéro'))
	--END

END
GO
PRINT N'Création de [dbo].[V_ArticleThemes]...';


GO
CREATE VIEW dbo.V_ArticleThemes
AS
SELECT TOP (100) PERCENT dbo.ArticleBlog.Titre, dbo.ArticleBlog.Photo, dbo.ArticleBlog.Date, dbo.ArticleBlog.Accroche, dbo.AuteurArticle.Nom, dbo.AuteurArticle.Prenom,
                      (SELECT COUNT(*) AS Expr1
                       FROM      dbo.CommentaireArticle
                       WHERE   (dbo.ArticleBlog.IdArticleBlog = IdArticleBlog)) AS NBComment, dbo.FN_GETTHEME(dbo.ArticleBlog.IdArticleBlog) AS Themes
FROM     dbo.ArticleBlog LEFT OUTER JOIN
                  dbo.AuteurArticle ON dbo.ArticleBlog.IdAuteurArticle = dbo.AuteurArticle.IdAuteurArticle
ORDER BY dbo.ArticleBlog.Date DESC
GO
PRINT N'Création de [dbo].[SP_Check_Password]...';


GO
CREATE PROCEDURE [dbo].[SP_Check_Password]
    @Login NVARCHAR (50),
    @MotDePasse NVARCHAR(MAX)
    
AS
    DECLARE @hMotDePasse NVARCHAR(MAX)
    DECLARE @salt CHAR(8)
    DECLARE @newMotDePasse NVARCHAR(MAX)
    SELECT @salt = salt, @hMotDePasse = MotDePasse FROM Client WHERE login = @Login
    SELECT @newMotDePasse = dbo.SF_EncryptedPassword (@MotDePasse, @salt)
    IF (@newMotDePasse = @hMotDePasse)
    BEGIN 
        --SELECT [Login], Nom, Prenom, DateNaiss, Photo, Email, IdUtilisateur FROM Utilisateur WHERE login=@login 
    select [Login], Nom, Prenom, Email, Photo,Telephone, Rue, Numero, Ville, Pays
    FROM Client
    END
GO
PRINT N'Création de [dbo].[SP_CLIENT_INSERT]...';


GO
CREATE PROCEDURE [dbo].[SP_CLIENT_INSERT]
    @MotDePasse NVARCHAR(MAX),
	@Nom NVARCHAR(64), 
    @Prenom NVARCHAR(64), 
	@Login NVARCHAR(50),
    @Pays NVARCHAR(50) = NULL,
    @Ville  NVARCHAR (150) = NULL,
	@Rue NVARCHAR (150) = NULL,
    @Numero NVARCHAR (10) = NULL,
    @Telephone VARCHAR(16) = NULL,
    @Email NVARCHAR(323) = NULL, 
    @Photo NVARCHAR(50) = NULL

	
    
AS
	DECLARE @IdClient INT, @salt CHAR(8)
	SET @salt = [dbo].SF_GenerateSalt()
	INSERT INTO [Client]([MotDePasse],[Nom], [Prenom],[Login],[Pays],[Ville], [Email], [Photo],[Telephone],[Salt],[Rue],[Numero])
	--OUTPUT inserted.IdClient
		VALUES (dbo.SF_EncryptedPassword(@MotDePasse, @salt), @Nom, @Prenom, @Login, @Pays, @Ville, @Email, @Photo, @Telephone, @salt, @Rue, @Numero)
	SET @IdClient = @@IDENTITY
GO
PRINT N'Création de [dbo].[V_ArticleThemes].[MS_DiagramPaneCount]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ArticleThemes';


GO
PRINT N'Création de [dbo].[V_ArticleThemes].[MS_DiagramPane1]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ArticleBlog"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AuteurArticle"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2760
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ArticleThemes';


GO
PRINT N'Création de [dbo].[V_ArticleTop3].[MS_DiagramPaneCount]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ArticleTop3';


GO
PRINT N'Création de [dbo].[V_ArticleTop3].[MS_DiagramPane1]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[36] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ArticleBlog"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "AuteurArticle"
            Begin Extent = 
               Top = 7
               Left = 580
               Bottom = 170
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ArticleTop3';


GO
PRINT N'Création de [dbo].[V_Room].[MS_DiagramPaneCount]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Room';


GO
PRINT N'Création de [dbo].[V_Room].[MS_DiagramPane1]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TypeChambre"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PhotoTypeChambre"
            Begin Extent = 
               Top = 7
               Left = 316
               Bottom = 148
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Room';


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0fdb1f5b-6725-4f82-98f8-561260acfe1c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0fdb1f5b-6725-4f82-98f8-561260acfe1c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '398983b2-0947-4345-bdab-ac5db4d261cc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('398983b2-0947-4345-bdab-ac5db4d261cc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '968f8654-3aa8-4c61-845e-934d02eeaee3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('968f8654-3aa8-4c61-845e-934d02eeaee3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'de2d2e4d-89bd-4853-b248-4f8913860bd4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('de2d2e4d-89bd-4853-b248-4f8913860bd4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2cd71d32-2389-49a2-8769-88aac2e6d648')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2cd71d32-2389-49a2-8769-88aac2e6d648')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd019d363-d5ad-47cd-8434-a88546d1d102')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d019d363-d5ad-47cd-8434-a88546d1d102')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0fff6e4e-4114-4014-8d41-2a7957fcaa06')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0fff6e4e-4114-4014-8d41-2a7957fcaa06')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5dbbf639-2520-4953-9318-7fd198bce9d8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5dbbf639-2520-4953-9318-7fd198bce9d8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0c5ded13-a8f5-49cd-a2e1-4d2fcb592855')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0c5ded13-a8f5-49cd-a2e1-4d2fcb592855')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3eb93d78-4e71-4e21-b421-bafc3c681416')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3eb93d78-4e71-4e21-b421-bafc3c681416')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2b6d3ffa-cb11-4eb3-952e-abbaffe8e1dc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2b6d3ffa-cb11-4eb3-952e-abbaffe8e1dc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd1f5479b-156c-4d81-a4de-1809f197896e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d1f5479b-156c-4d81-a4de-1809f197896e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e3dda202-79fa-4ebd-a78f-130faea0cf9e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e3dda202-79fa-4ebd-a78f-130faea0cf9e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5727fc8c-c55c-445a-815e-35a2e0b5ad4e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5727fc8c-c55c-445a-815e-35a2e0b5ad4e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e7e35f5e-cfec-416a-aedc-36e441d23ebf')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e7e35f5e-cfec-416a-aedc-36e441d23ebf')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '12d2ed54-7f82-4e05-86e6-3f9ece5e2f60')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('12d2ed54-7f82-4e05-86e6-3f9ece5e2f60')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ae741f98-9c29-4f79-bdd0-c9d3570e5d26')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ae741f98-9c29-4f79-bdd0-c9d3570e5d26')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '08c01ae0-69ba-45cb-a60b-9bf7fdf244af')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('08c01ae0-69ba-45cb-a60b-9bf7fdf244af')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'dffb9f0e-c127-4baf-8c83-3d5da8aa8edb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('dffb9f0e-c127-4baf-8c83-3d5da8aa8edb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a026b230-4c37-4dce-ac40-993dd2479792')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a026b230-4c37-4dce-ac40-993dd2479792')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '70da7db9-7e5f-4fcd-8d32-b1e9189c3680')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('70da7db9-7e5f-4fcd-8d32-b1e9189c3680')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c01a6eec-6702-4fdd-9470-0e2c403ee507')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c01a6eec-6702-4fdd-9470-0e2c403ee507')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '618242cb-78e6-4c90-8034-b187ade518af')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('618242cb-78e6-4c90-8034-b187ade518af')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '45311142-e0b8-44ad-8083-b9e4adab68df')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('45311142-e0b8-44ad-8083-b9e4adab68df')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b80ea6ad-6925-451b-b06a-65cbf667869e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b80ea6ad-6925-451b-b06a-65cbf667869e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5a9f641a-5a3d-4103-9c85-8aace44eaa0d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5a9f641a-5a3d-4103-9c85-8aace44eaa0d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '98bc2adf-b759-461a-b6cd-097236dfb4c7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('98bc2adf-b759-461a-b6cd-097236dfb4c7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'aa2c3358-676b-4322-a039-0d6e05db174b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('aa2c3358-676b-4322-a039-0d6e05db174b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6399734f-3841-4def-8785-162933d83630')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6399734f-3841-4def-8785-162933d83630')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9360299f-8465-4fe4-97ca-9b5784cce947')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9360299f-8465-4fe4-97ca-9b5784cce947')
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
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '41438fbb-c040-4f78-9430-82c5d68591e0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('41438fbb-c040-4f78-9430-82c5d68591e0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '98eb2bdb-2edb-47e7-bdcf-5fd21b3c22e2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('98eb2bdb-2edb-47e7-bdcf-5fd21b3c22e2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd4109757-dbdc-4251-83cb-bbaeab6a5cf8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d4109757-dbdc-4251-83cb-bbaeab6a5cf8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'aefb7a48-3b66-46b6-9752-111ebfddabc6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('aefb7a48-3b66-46b6-9752-111ebfddabc6')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
