CREATE TABLE [dbo].[EquipementTypeChambre]
(
	[IdEquipementTypeChambre] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdTypeChambre] INT NOT NULL, 
    [IdEquipement] INT NOT NULL, 
    CONSTRAINT [FK_EquipementChambre_ToChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [TypeChambre]([IdTypeChambre]), 
    CONSTRAINT [FK_EquipementTypeChambre_ToEquipement] FOREIGN KEY ([IdEquipement]) REFERENCES [Equipement]([IdEquipement])
)
