CREATE TABLE [dbo].[HotelPhoto]
(
	[IdHotelPhoto] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Photo] NVARCHAR(250) NOT NULL, 
    [IdHotel] INT NOT NULL, 
    CONSTRAINT [FK_HotelPhoto_ToHotel] FOREIGN KEY ([IdHotel]) REFERENCES [Hotel]([IdHotel])
)
