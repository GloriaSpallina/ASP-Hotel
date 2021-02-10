CREATE TABLE [dbo].[Reservation]
(
	[IdReservation] INT NOT NULL PRIMARY KEY, 
    [DateReservation] DATETIME NOT NULL, 
    [DateDebutSejour] DATETIME NOT NULL, 
    [DateFinSejour] DATETIME NOT NULL, 
    [NombreAdulte] INT NOT NULL, 
    [NombreEnfant] INT NOT NULL, 
    [Statut] BIT NULL, 
    [AssuranceAnnulation] BIT NOT NULL, 
    [IdChambre] INT NOT NULL, 
    [IdClient] INT NOT NULL, 
    CONSTRAINT [FK_Reservation_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [Chambre]([IdChambre]), 
    CONSTRAINT [FK_Reservation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [Client]([IdClient])
)
