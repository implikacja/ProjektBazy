CREATE TABLE [dbo].[Sale]
(
	[Id_sali] INT NOT NULL PRIMARY KEY, 
    [Pojemnosc] INT NOT NULL, 
    [Id_Budynku] INT NOT NULL,
	CONSTRAINT [FK_Sale_Budynki] FOREIGN KEY ([Id_Budynku]) REFERENCES [Budynki]([Id_Budynku]) ON DELETE CASCADE
)
