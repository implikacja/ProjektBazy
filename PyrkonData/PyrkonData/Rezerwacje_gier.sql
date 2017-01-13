CREATE TABLE [dbo].[Rezerwacje_gier]
(
	[Id_Rezerwacji_Gry] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Godzina_rozpoczecia] SMALLDATETIME NOT NULL, 
    [Godzina_zakonczenia] SMALLDATETIME NOT NULL,
	[Id_Gry] INT NOT NULL, 
    [Id_Uczestnika] INT NOT NULL, 
	CONSTRAINT [Unikatowosc_rezerwacji_gry] UNIQUE ([Godzina_rozpoczecia],[Id_Uczestnika]),
	CONSTRAINT [Prawidlowe_godziny_gry] CHECK ([Godzina_rozpoczecia]<[Godzina_zakonczenia]),
	CONSTRAINT [Dlugosc_gry] CHECK (DATEDIFF(hh,[Godzina_rozpoczecia],[Godzina_zakonczenia])<=5),
    CONSTRAINT [FK_Rezerwacje_gier_Gry] FOREIGN KEY ([Id_Gry]) REFERENCES [Gry]([Id_Gry]) ON DELETE CASCADE,
	CONSTRAINT [FK_Rezerwacje_gier_Uczestnicy] FOREIGN KEY ([Id_Uczestnika]) REFERENCES [Uczestnicy]([Id_Uczestnika]) ON DELETE CASCADE
)
