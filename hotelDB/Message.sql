CREATE TABLE [dbo].[Message]
(
	[IdMessage] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ContenuMail] NVARCHAR(MAX) NOT NULL, 
    [DateEnvoie] DATETIME NOT NULL, 
    [IdUser] INT NULL, 
    CONSTRAINT [FK_Message_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [User]([IdUser])
)
