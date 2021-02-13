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
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de [dbo].[Admin]...';


GO
CREATE TABLE [dbo].[Admin] (
    [IdAdmin]    INT            NOT NULL,
    [MotDePasse] VARBINARY (32) NOT NULL,
    [Salt]       CHAR (8)       NOT NULL,
    [IdHotel]    INT            NOT NULL,
    [IdUser]     INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdAdmin] ASC)
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
    [Telephone]  VARCHAR (16)   NOT NULL,
    [Pays]       NVARCHAR (50)  NOT NULL,
    [MotDePasse] VARBINARY (32) NOT NULL,
    [Salt]       CHAR (8)       NOT NULL,
    [IdUser]     INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdClient] ASC)
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
    [Latitude]       DECIMAL (9, 6) NULL,
    [Longitude]      DECIMAL (8, 6) NULL,
    [Telephone]      NVARCHAR (12)  NOT NULL,
    [Email]          NVARCHAR (323) NOT NULL,
    [IdCompanyHotel] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdHotel] ASC)
);


GO
PRINT N'Création de [dbo].[Message]...';


GO
CREATE TABLE [dbo].[Message] (
    [IdMessage]   INT            IDENTITY (1, 1) NOT NULL,
    [ContenuMail] NVARCHAR (MAX) NOT NULL,
    [DateEnvoie]  DATETIME       NOT NULL,
    [IdUser]      INT            NULL,
    PRIMARY KEY CLUSTERED ([IdMessage] ASC)
);


GO
PRINT N'Création de [dbo].[PhotoTypeChambre]...';


GO
CREATE TABLE [dbo].[PhotoTypeChambre] (
    [IdPhotoTypeChambre] INT         IDENTITY (1, 1) NOT NULL,
    [LienPhoto]          NCHAR (250) NOT NULL,
    [IdTypeChambre]      INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPhotoTypeChambre] ASC)
);


GO
PRINT N'Création de [dbo].[Reservation]...';


GO
CREATE TABLE [dbo].[Reservation] (
    [IdReservation]       INT      NOT NULL,
    [DateReservation]     DATETIME NOT NULL,
    [DateDebutSejour]     DATETIME NOT NULL,
    [DateFinSejour]       DATETIME NOT NULL,
    [NombreAdulte]        INT      NOT NULL,
    [NombreEnfant]        INT      NOT NULL,
    [Statut]              BIT      NULL,
    [AssuranceAnnulation] BIT      NOT NULL,
    [IdChambre]           INT      NOT NULL,
    [IdClient]            INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([IdReservation] ASC)
);


GO
PRINT N'Création de [dbo].[Service]...';


GO
CREATE TABLE [dbo].[Service] (
    [IdService]         INT            IDENTITY (1, 1) NOT NULL,
    [NomService]        NVARCHAR (50)  NOT NULL,
    [DescriptionCourte] NVARCHAR (150) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
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
PRINT N'Création de [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [IdUser] INT            IDENTITY (1, 1) NOT NULL,
    [Nom]    NVARCHAR (64)  NOT NULL,
    [Prenom] NVARCHAR (64)  NOT NULL,
    [Email]  NVARCHAR (323) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUser] ASC)
);


GO
PRINT N'Création de [dbo].[FK_Admin_ToHotel]...';


GO
ALTER TABLE [dbo].[Admin]
    ADD CONSTRAINT [FK_Admin_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_Admin_ToUser]...';


GO
ALTER TABLE [dbo].[Admin]
    ADD CONSTRAINT [FK_Admin_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


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
PRINT N'Création de [dbo].[FK_Client_ToUser]...';


GO
ALTER TABLE [dbo].[Client]
    ADD CONSTRAINT [FK_Client_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


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
PRINT N'Création de [dbo].[FK_Message_ToUser]...';


GO
ALTER TABLE [dbo].[Message]
    ADD CONSTRAINT [FK_Message_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


GO
PRINT N'Création de [dbo].[FK_PhotoTypeChambre_ToTypeChambre]...';


GO
ALTER TABLE [dbo].[PhotoTypeChambre]
    ADD CONSTRAINT [FK_PhotoTypeChambre_ToTypeChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


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
