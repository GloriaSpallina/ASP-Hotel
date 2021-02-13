CREATE TABLE [dbo].[CompanyHotel]
(
	[IdCompanyHotel] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(250) NOT NULL, 
    [Slogan] NVARCHAR(250) NULL, 
    [DateFondation] DATE NOT NULL, 
    [DescriptionCourte] NVARCHAR(250) NOT NULL, 
    [DescriptionLongue] NVARCHAR(MAX) NOT NULL
)
