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
PRINT N'Modification de [dbo].[SF_EncryptedPassword]...';


GO
ALTER FUNCTION [dbo].[SF_EncryptedPassword]
(
	@MotDePasse NVARCHAR(32),
	@salt CHAR(8)
)
RETURNS VARBINARY(32)
AS
BEGIN
	RETURN HASHBYTES('SHA2_256',CONCAT(SUBSTRING(@salt,0,4),@MotDePasse,SUBSTRING(@salt,4,4)))
END
GO
PRINT N'Actualisation de [dbo].[SP_CLIENT_Insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_CLIENT_Insert]';


GO
PRINT N'Mise à jour terminée.';


GO
