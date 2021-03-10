CREATE PROCEDURE [dbo].[SP_Check_Password]
    @Login VARCHAR (16),
    @MotDePasse NVARCHAR(MAX)
    
AS
    DECLARE @hMotDePasse NVARCHAR(MAX)
    DECLARE @salt CHAR(8)
    DECLARE @newMotDePasse NVARCHAR(MAX)
    SELECT @salt = salt, @hMotDePasse = MotDePasse FROM Client WHERE login = @login
    SELECT @newMotDePasse = dbo.SF_EncryptedPassword (@MotDePasse, @salt)
    IF (@newMotDePasse = @hMotDePasse)
    BEGIN 
        --SELECT [Login], Nom, Prenom, DateNaiss, Photo, Email, IdUtilisateur FROM Utilisateur WHERE login=@login 
    select [Login], Nom, Prenom, Email, Photo,Telephone, Rue, Numero, Ville, Pays
    FROM Client
    END

