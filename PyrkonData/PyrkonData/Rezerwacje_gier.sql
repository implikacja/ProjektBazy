CREATE TABLE [dbo].[Rezerwacje_gier]
(
	[Id_Rezerwacji_Gry] INT NOT NULL PRIMARY KEY, 
    [Godzina_rozpoczecia] TIME NOT NULL, 
    [Godzina_zakonczenia] TIME NOT NULL,
	[Id_Gry] INT NOT NULL, 
    [Id_Uczestnika] INT NOT NULL, 
    CONSTRAINT [FK_Rezerwacje_gier_Gry] FOREIGN KEY ([Id_Gry]) REFERENCES [Gry]([Id_Gry]) ON DELETE CASCADE,
	CONSTRAINT [FK_Rezerwacje_gier_Uczestnicy] FOREIGN KEY ([Id_Uczestnika]) REFERENCES [Uczestnicy]([Id_Uczestnika]) ON DELETE CASCADE
)
