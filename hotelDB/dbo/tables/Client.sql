CREATE TABLE [dbo].[Client]
(
	[IdClient] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Telephone] VARCHAR(16) NOT NULL, 
    [Pays] NVARCHAR(50) NOT NULL, 
    [MotDePasse] VARBINARY(32) NOT NULL, 
    [Salt] CHAR(8) NOT NULL, 
    [IdUser] INT NOT NULL, 
    CONSTRAINT [FK_Client_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [User]([IdUser])
)
