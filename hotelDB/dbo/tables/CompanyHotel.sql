CREATE TABLE [dbo].[CompanyHotel] (
    [IdCompanyHotel]    INT            IDENTITY (1, 1) NOT NULL,
    [Nom]               NVARCHAR (250) NOT NULL,
    [Slogan]            NVARCHAR (250) NULL,
    [DateFondation]     DATE           NOT NULL,
    [DescriptionCourte] NVARCHAR (250) NOT NULL,
    [DescriptionLongue] NVARCHAR (MAX) NOT NULL,
    [Photo]             NVARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([IdCompanyHotel] ASC)
);


