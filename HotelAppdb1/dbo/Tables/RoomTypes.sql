﻿CREATE TABLE [dbo].[RoomTypes]
(
	
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NVARCHAR(50) NOT NULL, 
    [Description] VARCHAR(2000) NOT NULL, 
    [Price] MONEY NOT NULL 
)
