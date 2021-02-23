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
PRINT N'Création de [dbo].[V_GetRandom]...';


GO
CREATE VIEW [dbo].[V_GetRandom]
	AS SELECT FLOOR(RAND()*10) AS RandomValue
GO
PRINT N'Création de [dbo].[SF_EncryptedPassword]...';


GO
CREATE FUNCTION [dbo].[SF_EncryptedPassword]
(
	@password NVARCHAR(32),
	@salt CHAR(8)
)
RETURNS VARBINARY(32)
AS
BEGIN
	RETURN HASHBYTES('SHA2_256',CONCAT(SUBSTRING(@salt,0,4),@password,SUBSTRING(@salt,4,4)))
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
PRINT N'Création de [dbo].[SP_CLIENT_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_CLIENT_Insert]
	@IdClient INTEGER,
    @Telephone VARCHAR(16),
    @Pays NVARCHAR(50),
    @MotDePasse VARBINARY(32),
    @IdUser INT
    
AS
	DECLARE @idAddress INTEGER, @salt CHAR(8)
	SET @salt = [dbo].SF_GenerateSalt()
	
	INSERT INTO [Client]([MotDePasse],[Telephone],[Salt], [IdUser])
	OUTPUT inserted.IdClient
		VALUES (dbo.SF_EncryptedPassword(@MotDePasse, @salt), @Telephone,@salt)
GO
PRINT N'Mise à jour terminée.';


GO
