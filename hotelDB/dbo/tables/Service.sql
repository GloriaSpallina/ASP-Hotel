CREATE TABLE [dbo].[Service] (
    [IdService]         INT            IDENTITY (1, 1) NOT NULL,
    [NomService]        NVARCHAR (50)  NOT NULL,
    [DescriptionCourte] NVARCHAR (150) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    [PhotoService]      NVARCHAR (250) NULL,
    [Orientation]       NVARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([IdService] ASC)
);




