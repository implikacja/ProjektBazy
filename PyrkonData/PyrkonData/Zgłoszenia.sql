CREATE TABLE [dbo].[Zgloszenia]
(
	[Id_Zgloszenia] INT NOT NULL PRIMARY KEY, 
    [Temat] VARCHAR(50) NOT NULL, 
    [Opis] VARCHAR(250) NOT NULL, 
    [Status] NVARCHAR(50) NOT NULL, 
    [Id_Uczestnika] INT NOT NULL, 
    CONSTRAINT [FK_Zgloszenia_Uczestnicy] FOREIGN KEY ([Id_Uczestnika]) REFERENCES [Uczestnicy]([Id_Uczestnika]) ON DELETE CASCADE
)
