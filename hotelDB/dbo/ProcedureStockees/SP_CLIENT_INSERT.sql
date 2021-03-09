CREATE PROCEDURE [dbo].[SP_CLIENT_Insert]
	@Rue NVARCHAR (150) = NULL,
    @Numero NVARCHAR (10) = NULL,
    @Ville  NVARCHAR (150) = NULL,
    @Telephone VARCHAR(16) = NULL,
    @Pays NVARCHAR(50) = NULL,
    @MotDePasse NVARCHAR(MAX),
	@Nom NVARCHAR(64), 
    @Prenom NVARCHAR(64), 
    @Email NVARCHAR(323) = NULL, 
    @Photo NVARCHAR(50) = NULL,
	@Login NVARCHAR(50)

	
    
AS
	DECLARE @salt CHAR(8)
	SET @salt = [dbo].SF_GenerateSalt()
	INSERT INTO [Client]([MotDePasse],[Nom], [Prenom],[Login], [Email], [Photo],[Telephone],[Salt],[Rue],[Numero],[Ville],[Pays])
	OUTPUT inserted.IdClient
		VALUES (dbo.SF_EncryptedPassword(@MotDePasse, @salt),@Nom, @Prenom,@Login, @Email, @Photo, @Telephone,@salt,@Rue,@Numero,@Ville,@Pays)

