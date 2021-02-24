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

