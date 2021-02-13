CREATE TABLE [dbo].[ServiceHotel]
(
	[IdServiceHotel] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdHotel] INT NOT NULL, 
    [IdService] INT NOT NULL, 
    CONSTRAINT [FK_ServiceHotel_ToHotel] FOREIGN KEY (IdHotel) REFERENCES [Hotel]([IdHotel]), 
    CONSTRAINT [FK_ServiceHotel_ToService] FOREIGN KEY ([IdService]) REFERENCES [Service]([IdService])
    
)
