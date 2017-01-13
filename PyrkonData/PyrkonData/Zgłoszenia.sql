CREATE TABLE [dbo].[Zgloszenia]
(
	[Id_Zgloszenia] INT NOT NULL PRIMARY KEY IDENTITY(100,1), 
    [Temat] VARCHAR(50) NOT NULL, 
    [Opis] VARCHAR(250) NOT NULL, 
    [Status] NVARCHAR(50) NOT NULL DEFAULT 'Nowe zgłoszenie', 
    [Id_Uczestnika] INT NOT NULL, 
	[Id_Bloku] INT NOT NULL,
    CONSTRAINT [Unikatowosc_zgloszenia] UNIQUE ([Id_Uczestnika],[Temat]),
	CONSTRAINT [Poprawnosc_statusu] CHECK ([Status] IN ('Nowe zgłoszenie','Lista rezerwowych','Przyjęte','Odrzucone')),
	CONSTRAINT [Poprawnosc_tematu] CHECK (LEN([Temat])>=5),
	CONSTRAINT [FK_Zgloszenia_Uczestnicy] FOREIGN KEY ([Id_Uczestnika]) REFERENCES [Uczestnicy]([Id_Uczestnika]) ON DELETE CASCADE,
	CONSTRAINT [FK_Zgloszenia_Bloki] FOREIGN KEY ([Id_Bloku]) REFERENCES [Bloki]([Id_Bloku]) ON DELETE CASCADE
)
