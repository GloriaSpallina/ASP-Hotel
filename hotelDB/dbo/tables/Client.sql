CREATE TABLE [dbo].[Client] (
    [IdClient] INT IDENTITY NOT NULL,
    [Nom] NVARCHAR(64) NOT NULL, 
    [Prenom] NVARCHAR(64) NOT NULL, 
    [Email] NVARCHAR(323) UNIQUE NULL, 
    [Photo] NVARCHAR(50) NULL,
    [Telephone]  VARCHAR (16) UNIQUE  NULL,
    [Rue]       NVARCHAR (150)  NULL,
    [Numero]       NVARCHAR (10)  NULL,
    [Ville]       NVARCHAR (150)  NULL,
    [Pays]       NVARCHAR (50)  NULL,
    [Login] NVARCHAR(50) UNIQUE NOT NULL,
    [MotDePasse] NVARCHAR(MAX) NOT NULL,
    [Salt]       CHAR (8)       NULL,
    [IsAdmin]    BIT            NULL,
    CONSTRAINT [PK__Client__C1961B33CD1C3FCB] PRIMARY KEY CLUSTERED ([IdClient] ASC),
   
);


