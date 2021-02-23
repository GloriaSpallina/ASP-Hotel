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

