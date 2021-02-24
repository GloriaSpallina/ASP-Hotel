CREATE TABLE [dbo].[Client] (
    [IdClient]   INT            IDENTITY (1, 1) NOT NULL,
    [Telephone]  VARCHAR (16)   NOT NULL,
    [Pays]       NVARCHAR (50)  NOT NULL,
    [MotDePasse] VARBINARY (32) NOT NULL,
    [Salt]       CHAR (8)       NOT NULL,
    [IdUser]     INT            NOT NULL,
    [IsAdmin]    BIT            NOT NULL,
    CONSTRAINT [PK__Client__C1961B33CD1C3FCB] PRIMARY KEY CLUSTERED ([IdClient] ASC),
    CONSTRAINT [FK_Client_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser])
);


