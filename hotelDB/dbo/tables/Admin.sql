CREATE TABLE [dbo].[Admin]
(
	[IdAdmin] INT NOT NULL PRIMARY KEY, 
    [MotDePasse] VARBINARY(32) NOT NULL, 
    [Salt] CHAR(8) NOT NULL, 
    [IdHotel] INT NOT NULL, 
    [IdUser] INT NOT NULL, 
    CONSTRAINT [FK_Admin_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [Hotel]([IdHotel]),
    CONSTRAINT [FK_Admin_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [User]([IdUser])
)
