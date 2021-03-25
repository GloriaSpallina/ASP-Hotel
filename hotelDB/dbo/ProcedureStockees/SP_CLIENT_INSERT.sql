CREATE PROCEDURE [dbo].[SP_CLIENT_Insert]
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

