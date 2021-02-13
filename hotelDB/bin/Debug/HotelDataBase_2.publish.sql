/*
Script de déploiement pour HotelDataBase

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HotelDataBase"
:setvar DefaultFilePrefix "HotelDataBase"
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
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9360299f-8465-4fe4-97ca-9b5784cce947 est ignorée, l''élément [dbo].[PhotoChambre].[IdPhotoChambre] (SqlSimpleColumn) ne sera pas renommé en IdPhotoTypeChambre';


GO
PRINT N'Création de [dbo].[FK_EquipementChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[EquipementTypeChambre] WITH NOCHECK
    ADD CONSTRAINT [FK_EquipementChambre_ToChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
PRINT N'Création de [dbo].[FK_EquipementTypeChambre_ToEquipement]...';


GO
ALTER TABLE [dbo].[EquipementTypeChambre] WITH NOCHECK
    ADD CONSTRAINT [FK_EquipementTypeChambre_ToEquipement] FOREIGN KEY ([IdEquipement]) REFERENCES [dbo].[Equipement] ([IdEquipement]);


GO
PRINT N'Création de [dbo].[FK_PhotoTypeChambre_ToChambre]...';


GO
ALTER TABLE [dbo].[PhotoTypeChambre] WITH NOCHECK
    ADD CONSTRAINT [FK_PhotoTypeChambre_ToChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9360299f-8465-4fe4-97ca-9b5784cce947')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9360299f-8465-4fe4-97ca-9b5784cce947')

GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[EquipementTypeChambre] WITH CHECK CHECK CONSTRAINT [FK_EquipementChambre_ToChambre];

ALTER TABLE [dbo].[EquipementTypeChambre] WITH CHECK CHECK CONSTRAINT [FK_EquipementTypeChambre_ToEquipement];

ALTER TABLE [dbo].[PhotoTypeChambre] WITH CHECK CHECK CONSTRAINT [FK_PhotoTypeChambre_ToChambre];


GO
PRINT N'Mise à jour terminée.';


GO
