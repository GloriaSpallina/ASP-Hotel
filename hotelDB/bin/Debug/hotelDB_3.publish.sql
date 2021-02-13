/*
Script de déploiement pour hotelDB

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "hotelDB"
:setvar DefaultFilePrefix "hotelDB"
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
La colonne [dbo].[Hotel].[IdCompanyHotel] de la table [dbo].[Hotel] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Hotel])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[Service].[DescriptionCourte] de la table [dbo].[Service] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[Service].[DescriptionLongue] de la table [dbo].[Service] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Service])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[TypeChambre].[Capacite] de la table [dbo].[TypeChambre] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[TypeChambre].[DescriptionCourte] de la table [dbo].[TypeChambre] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[TypeChambre].[DescriptionLongue] de la table [dbo].[TypeChambre] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[TypeChambre])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation c01a6eec-6702-4fdd-9470-0e2c403ee507';

PRINT N'Renommer [dbo].[TypeChambre].[IdCategorie] en IdTypeChambre';


GO
EXECUTE sp_rename @objname = N'[dbo].[TypeChambre].[IdCategorie]', @newname = N'IdTypeChambre', @objtype = N'COLUMN';


GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation 618242cb-78e6-4c90-8034-b187ade518af';

PRINT N'Renommer [dbo].[PhotoChambre].[IdChambre] en IdTypeChambre';


GO
EXECUTE sp_rename @objname = N'[dbo].[PhotoChambre].[IdChambre]', @newname = N'IdTypeChambre', @objtype = N'COLUMN';


GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation 45311142-e0b8-44ad-8083-b9e4adab68df';

PRINT N'Renommer [dbo].[EquipementChambre].[IdEquipementChambre] en IdEquipementTypeChambre';


GO
EXECUTE sp_rename @objname = N'[dbo].[EquipementChambre].[IdEquipementChambre]', @newname = N'IdEquipementTypeChambre', @objtype = N'COLUMN';


GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation b80ea6ad-6925-451b-b06a-65cbf667869e';

PRINT N'Renommer [dbo].[EquipementChambre].[IdChambre] en IdTypeChambre';


GO
EXECUTE sp_rename @objname = N'[dbo].[EquipementChambre].[IdChambre]', @newname = N'IdTypeChambre', @objtype = N'COLUMN';


GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation 5a9f641a-5a3d-4103-9c85-8aace44eaa0d';

PRINT N'Renommer [dbo].[Chambre].[IdCategorie] en IdTypeChambre';


GO
EXECUTE sp_rename @objname = N'[dbo].[Chambre].[IdCategorie]', @newname = N'IdTypeChambre', @objtype = N'COLUMN';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 98bc2adf-b759-461a-b6cd-097236dfb4c7 est ignorée, l''élément [dbo].[CompanyHotel].[Nome] (SqlSimpleColumn) ne sera pas renommé en Nom';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé aa2c3358-676b-4322-a039-0d6e05db174b est ignorée, l''élément [dbo].[Hotel].[IdComapagnieHotel] (SqlSimpleColumn) ne sera pas renommé en IdCompanyHotel';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 6399734f-3841-4def-8785-162933d83630 est ignorée, l''élément [dbo].[CompanyHotel].[Id] (SqlSimpleColumn) ne sera pas renommé en IdCompanyHotel';


GO
PRINT N'Suppression de [dbo].[FK_Chambre_ToCategorie]...';


GO
ALTER TABLE [dbo].[Chambre] DROP CONSTRAINT [FK_Chambre_ToCategorie];


GO
PRINT N'Suppression de [dbo].[FK_EquipementChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[EquipementChambre] DROP CONSTRAINT [FK_EquipementChambre_ToChambre];


GO
PRINT N'Suppression de [dbo].[FK_PhotoChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[PhotoChambre] DROP CONSTRAINT [FK_PhotoChambre_ToChambre];


GO
PRINT N'Modification de [dbo].[Hotel]...';


GO
ALTER TABLE [dbo].[Hotel]
    ADD [IdCompanyHotel] INT NOT NULL;


GO
PRINT N'Modification de [dbo].[Service]...';


GO
ALTER TABLE [dbo].[Service]
    ADD [DescriptionCourte] NVARCHAR (5)   NOT NULL,
        [DescriptionLongue] NVARCHAR (MAX) NOT NULL;


GO
PRINT N'Début de la régénération de la table [dbo].[TypeChambre]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_TypeChambre] (
    [IdTypeChambre]     INT            IDENTITY (1, 1) NOT NULL,
    [Nom]               NVARCHAR (50)  NOT NULL,
    [Capacite]          INT            NOT NULL,
    [DescriptionCourte] NVARCHAR (250) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    [Prix]              FLOAT (53)     NOT NULL,
    PRIMARY KEY CLUSTERED ([IdTypeChambre] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[TypeChambre])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TypeChambre] ON;
        INSERT INTO [dbo].[tmp_ms_xx_TypeChambre] ([IdTypeChambre], [Nom], [Prix])
        SELECT   [IdTypeChambre],
                 [Nom],
                 [Prix]
        FROM     [dbo].[TypeChambre]
        ORDER BY [IdTypeChambre] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TypeChambre] OFF;
    END

DROP TABLE [dbo].[TypeChambre];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_TypeChambre]', N'TypeChambre';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de [dbo].[CompanyHotel]...';


GO
CREATE TABLE [dbo].[CompanyHotel] (
    [IdCompanyHotel]    INT            NOT NULL,
    [Nom]               NVARCHAR (50)  NOT NULL,
    [Slogan]            NVARCHAR (20)  NULL,
    [DateFondation]     DATE           NOT NULL,
    [DescriptionCourte] NVARCHAR (50)  NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCompanyHotel] ASC)
);


GO
PRINT N'Création de [dbo].[FK_EquipementChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[EquipementChambre] WITH NOCHECK
    ADD CONSTRAINT [FK_EquipementChambre_ToChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_PhotoChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[PhotoChambre] WITH NOCHECK
    ADD CONSTRAINT [FK_PhotoChambre_ToChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_Chambre_ToTypeChambre]...';


GO
ALTER TABLE [dbo].[Chambre] WITH NOCHECK
    ADD CONSTRAINT [FK_Chambre_ToTypeChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_Hotel_ToCompagnieHotel]...';


GO
ALTER TABLE [dbo].[Hotel] WITH NOCHECK
    ADD CONSTRAINT [FK_Hotel_ToCompagnieHotel] FOREIGN KEY ([IdCompanyHotel]) REFERENCES [dbo].[CompanyHotel] ([IdCompanyHotel]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
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

GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[EquipementChambre] WITH CHECK CHECK CONSTRAINT [FK_EquipementChambre_ToChambre];

ALTER TABLE [dbo].[PhotoChambre] WITH CHECK CHECK CONSTRAINT [FK_PhotoChambre_ToChambre];

ALTER TABLE [dbo].[Chambre] WITH CHECK CHECK CONSTRAINT [FK_Chambre_ToTypeChambre];

ALTER TABLE [dbo].[Hotel] WITH CHECK CHECK CONSTRAINT [FK_Hotel_ToCompagnieHotel];


GO
PRINT N'Mise à jour terminée.';


GO
