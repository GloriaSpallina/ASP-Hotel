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
PRINT N'Création de [dbo].[SP_Check_Password]...';


GO
CREATE PROCEDURE [dbo].[SP_Check_Password]
    @Login VARCHAR (16),
    @MotDePasse NVARCHAR(MAX)
    
AS
    DECLARE @hMotDePasse VARBINARY(32)
    DECLARE @salt CHAR(8)
    DECLARE @newMotDePasse VARBINARY(32)
    SELECT @salt = salt, @hMotDePasse = MotDePasse FROM Client WHERE login = @login
    SELECT @newMotDePasse = dbo.SF_EncryptedPassword (@MotDePasse, @salt)
    IF (@newMotDePasse = @hMotDePasse)
    BEGIN 
        --SELECT [Login], Nom, Prenom, DateNaiss, Photo, Email, IdUtilisateur FROM Utilisateur WHERE login=@login 
    select [Login], Nom, Prenom, Email, Photo,Telephone, Rue, Numero, Ville, Pays
    FROM Client
    END
GO
PRINT N'Mise à jour terminée.';


GO
