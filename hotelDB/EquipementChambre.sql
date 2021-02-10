CREATE TABLE [dbo].[EquipementChambre]
(
	[IdEquipementChambre] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdChambre] INT NOT NULL, 
    [IdEquipement] INT NOT NULL, 
    CONSTRAINT [FK_EquipementChambre_ToChambre] FOREIGN KEY ([IdChambre]) REFERENCES [Chambre]([IdChambre]), 
    CONSTRAINT [FK_EquipementChambre_ToEquipement] FOREIGN KEY ([IdEquipement]) REFERENCES [Equipement]([IdEquipement])
)
