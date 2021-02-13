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
La colonne [dbo].[Hotel].[CodePostal] de la table [dbo].[Hotel] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[Hotel].[Pays] de la table [dbo].[Hotel] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Hotel])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de [dbo].[FK_Admin_ToHotel]...';


GO
ALTER TABLE [dbo].[Admin] DROP CONSTRAINT [FK_Admin_ToHotel];


GO
PRINT N'Suppression de [dbo].[FK_Chambre_ToHotel]...';


GO
ALTER TABLE [dbo].[Chambre] DROP CONSTRAINT [FK_Chambre_ToHotel];


GO
PRINT N'Suppression de [dbo].[FK_Hotel_ToCompagnieHotel]...';


GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [FK_Hotel_ToCompagnieHotel];


GO
PRINT N'Suppression de [dbo].[FK_ServiceHotel_ToHotel]...';


GO
ALTER TABLE [dbo].[ServiceHotel] DROP CONSTRAINT [FK_ServiceHotel_ToHotel];


GO
PRINT N'Début de la régénération de la table [dbo].[Hotel]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Hotel] (
    [IdHotel]        INT            IDENTITY (1, 1) NOT NULL,
    [Nom]            NVARCHAR (100) NOT NULL,
    [Etoile]         FLOAT (53)     NOT NULL,
    [Rue]            NVARCHAR (250) NOT NULL,
    [NumeroRue]      NVARCHAR (10)  NOT NULL,
    [Ville]          NVARCHAR (50)  NULL,
    [CodePostal]     NVARCHAR (10)  NOT NULL,
    [Pays]           NVARCHAR (50)  NOT NULL,
    [Latitude]       DECIMAL (9, 6) NULL,
    [Longitude]      DECIMAL (8, 6) NULL,
    [Telephone]      NVARCHAR (12)  NOT NULL,
    [Email]          NVARCHAR (323) NOT NULL,
    [IdCompanyHotel] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdHotel] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Hotel])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Hotel] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Hotel] ([IdHotel], [Nom], [Etoile], [Rue], [NumeroRue], [Latitude], [Longitude], [Telephone], [Email], [IdCompanyHotel])
        SELECT   [IdHotel],
                 [Nom],
                 [Etoile],
                 [Rue],
                 [NumeroRue],
                 [Latitude],
                 [Longitude],
                 [Telephone],
                 [Email],
                 [IdCompanyHotel]
        FROM     [dbo].[Hotel]
        ORDER BY [IdHotel] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Hotel] OFF;
    END

DROP TABLE [dbo].[Hotel];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Hotel]', N'Hotel';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de [dbo].[FK_Admin_ToHotel]...';


GO
ALTER TABLE [dbo].[Admin] WITH NOCHECK
    ADD CONSTRAINT [FK_Admin_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_Chambre_ToHotel]...';


GO
ALTER TABLE [dbo].[Chambre] WITH NOCHECK
    ADD CONSTRAINT [FK_Chambre_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Création de [dbo].[FK_Hotel_ToCompagnieHotel]...';


GO
ALTER TABLE [dbo].[Hotel] WITH NOCHECK
    ADD CONSTRAINT [FK_Hotel_ToCompagnieHotel] FOREIGN KEY ([IdCompanyHotel]) REFERENCES [dbo].[CompanyHotel] ([IdCompanyHotel]);


GO
PRINT N'Création de [dbo].[FK_ServiceHotel_ToHotel]...';


GO
ALTER TABLE [dbo].[ServiceHotel] WITH NOCHECK
    ADD CONSTRAINT [FK_ServiceHotel_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel]);


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Admin] WITH CHECK CHECK CONSTRAINT [FK_Admin_ToHotel];

ALTER TABLE [dbo].[Chambre] WITH CHECK CHECK CONSTRAINT [FK_Chambre_ToHotel];

ALTER TABLE [dbo].[Hotel] WITH CHECK CHECK CONSTRAINT [FK_Hotel_ToCompagnieHotel];

ALTER TABLE [dbo].[ServiceHotel] WITH CHECK CHECK CONSTRAINT [FK_ServiceHotel_ToHotel];


GO
PRINT N'Mise à jour terminée.';


GO
