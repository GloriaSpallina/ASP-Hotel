CREATE TABLE [dbo].[Message] (
    [IdMessage]   INT            IDENTITY (1, 1) NOT NULL,
    [ContenuMail] NVARCHAR (MAX) NOT NULL,
    [DateEnvoie]  DATETIME       NOT NULL,
    [Nom]         NVARCHAR (250) NOT NULL,
    [Sujet]       NVARCHAR (500) NULL,
    [Email]       NVARCHAR (323) NOT NULL,
    CONSTRAINT [PK__Message__47AAF3043F396981] PRIMARY KEY CLUSTERED ([IdMessage] ASC)
);


