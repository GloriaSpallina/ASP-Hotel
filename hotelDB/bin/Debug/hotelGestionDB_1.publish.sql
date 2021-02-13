/*
Script de déploiement pour hotelGestionDB

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "hotelGestionDB"
:setvar DefaultFilePrefix "hotelGestionDB"
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
PRINT N'Suppression de [dbo].[FK_Hotel_ToCompagnieHotel]...';


GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [FK_Hotel_ToCompagnieHotel];


GO
PRINT N'Début de la régénération de la table [dbo].[CompanyHotel]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_CompanyHotel] (
    [IdCompanyHotel]    INT            IDENTITY (1, 1) NOT NULL,
    [Nom]               NVARCHAR (50)  NOT NULL,
    [Slogan]            NVARCHAR (20)  NULL,
    [DateFondation]     DATE           NOT NULL,
    [DescriptionCourte] NVARCHAR (50)  NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCompanyHotel] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[CompanyHotel])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_CompanyHotel] ON;
        INSERT INTO [dbo].[tmp_ms_xx_CompanyHotel] ([IdCompanyHotel], [Nom], [Slogan], [DateFondation], [DescriptionCourte], [DescriptionLongue])
        SELECT   [IdCompanyHotel],
                 [Nom],
                 [Slogan],
                 [DateFondation],
                 [DescriptionCourte],
                 [DescriptionLongue]
        FROM     [dbo].[CompanyHotel]
        ORDER BY [IdCompanyHotel] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_CompanyHotel] OFF;
    END

DROP TABLE [dbo].[CompanyHotel];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_CompanyHotel]', N'CompanyHotel';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de [dbo].[FK_Hotel_ToCompagnieHotel]...';


GO
ALTER TABLE [dbo].[Hotel] WITH NOCHECK
    ADD CONSTRAINT [FK_Hotel_ToCompagnieHotel] FOREIGN KEY ([IdCompanyHotel]) REFERENCES [dbo].[CompanyHotel] ([IdCompanyHotel]);


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Hotel] WITH CHECK CHECK CONSTRAINT [FK_Hotel_ToCompagnieHotel];


GO
PRINT N'Mise à jour terminée.';


GO
