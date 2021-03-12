CREATE TABLE [dbo].[Reservation] (
    [IdReservation]       INT      IDENTITY (1, 1) NOT NULL,
    [DateReservation]     DATETIME NOT NULL,
    [DateDebutSejour]     DATETIME NOT NULL,
    [DateFinSejour]       DATETIME NOT NULL,
    [NombreAdulte]        INT      NOT NULL,
    [NombreEnfant]        INT      NOT NULL,
    [Statut]              BIT      NULL,
    [AssuranceAnnulation] BIT      NOT NULL,
    [IdChambre]           INT      NOT NULL,
    [IdClient]            INT      NOT NULL,
    CONSTRAINT [PK__Reservat__7E69A57BE25FCA81] PRIMARY KEY CLUSTERED ([IdReservation] ASC),
    CONSTRAINT [FK_Reservation_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [dbo].[Chambre] ([IdChambre]),
    CONSTRAINT [FK_Reservation_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client] ([IdClient])
);


