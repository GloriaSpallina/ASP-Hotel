CREATE TABLE [dbo].[Facture]
(
	[IdFacture] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Montant] FLOAT NOT NULL, 
    [FraisDossier] FLOAT NOT NULL, 
    [Taxe] FLOAT NOT NULL, 
    [IdClient] INT NULL, 
    CONSTRAINT [FK_Facture_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [Client]([IdClient])
)
