CREATE TABLE [dbo].[PhotoTypeChambre] (
    [IdPhotoTypeChambre] INT            IDENTITY (1, 1) NOT NULL,
    [Photo]              NVARCHAR (250) NOT NULL,
    [IdTypeChambre]      INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPhotoTypeChambre] ASC),
    CONSTRAINT [FK_PhotoCategorieChambre_CategorieChambre] FOREIGN KEY ([IdTypeChambre]) REFERENCES [dbo].[TypeChambre] ([IdTypeChambre])
);

