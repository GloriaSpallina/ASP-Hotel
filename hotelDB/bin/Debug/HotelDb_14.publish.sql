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
PRINT N'Création de [dbo].[SP_CLIENT_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_CLIENT_Insert]
	@IdClient INTEGER,
    @Telephone VARCHAR(16),
    @Pays NVARCHAR(50),
    @MotDePasse VARBINARY(32),
    @IdUser INT,
	@Nom NVARCHAR(64), 
    @Prenom NVARCHAR(64), 
    @Email NVARCHAR(323), 
    @Photo NVARCHAR(50) = NULL
	
    
AS
	DECLARE @idAddress INTEGER, @salt CHAR(8)
	SET @salt = [dbo].SF_GenerateSalt()
	INSERT INTO [User](Nom, Prenom, Email, Photo)
		VALUES (@Nom, @Prenom, @Email, @Photo)
	INSERT INTO [Client]([MotDePasse],[Telephone],[Salt], [IdUser],[IdClient],[Pays])
	OUTPUT inserted.IdClient
		VALUES (dbo.SF_EncryptedPassword(@MotDePasse, @salt), @Telephone,@salt,@IdUser,@IdClient,@Pays)
GO
PRINT N'Mise à jour terminée.';


GO
