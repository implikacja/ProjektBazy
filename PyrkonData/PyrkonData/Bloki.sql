CREATE TABLE [dbo].[Bloki]
(
	[Id_Bloku] INT NOT NULL PRIMARY KEY, 
    [Nazwa] VARCHAR(50) NOT NULL, 
    [Opis] VARCHAR(250) NULL, 
    [Id_Uczestnika] INT NOT NULL, 	
    CONSTRAINT [FK_Bloki_Uczestnicy] FOREIGN KEY ([Id_Uczestnika]) REFERENCES [Uczestnicy]([Id_Uczestnika]) ON DELETE CASCADE,
)
