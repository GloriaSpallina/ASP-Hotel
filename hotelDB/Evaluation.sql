CREATE TABLE [dbo].[Evaluation]
(
	[IdEvaluation] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Note] FLOAT NOT NULL, 
    [Commentaire] NVARCHAR(MAX) NOT NULL, 
    [IdChambre] INT NOT NULL, 
    [IdClient] INT NOT NULL, 
    CONSTRAINT [FK_Evaluation_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [Chambre]([IdChambre]), 
    CONSTRAINT [FK_Evaluation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [Client]([IdClient])
)
