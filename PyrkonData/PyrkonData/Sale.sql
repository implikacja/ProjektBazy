CREATE TABLE [dbo].[Sale]
(
	[Id_sali] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[Nazwa] varchar(20) NOT NULL,
    [Pojemnosc] INT NOT NULL, 
    [Id_Budynku] INT NOT NULL,
	CONSTRAINT [Unikatowosc_sali] UNIQUE ([Id_Budynku],[Nazwa]),
	CONSTRAINT [FK_Sale_Budynki] FOREIGN KEY ([Id_Budynku]) REFERENCES [Budynki]([Id_Budynku]) ON DELETE CASCADE,
	CONSTRAINT [Poprawna_pojemnosc] CHECK ([Pojemnosc]>0)
)
