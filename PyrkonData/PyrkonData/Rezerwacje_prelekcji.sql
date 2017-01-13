CREATE TABLE [dbo].[Rezerwacje_prelekcji]
(
	[Id_Rezerwacji_Prelekcji] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Id_Uczestnika] INT NOT NULL, 
    [Id_Prelekcji] INT NOT NULL,
	CONSTRAINT [Unikatowosc_rezerwacji] UNIQUE (Id_Uczestnika,Id_Prelekcji),
	CONSTRAINT [FK_Rezerwacje_prelekcji_Uczestnicy] FOREIGN KEY ([Id_Uczestnika]) REFERENCES [Uczestnicy]([Id_Uczestnika]) ON DELETE CASCADE,
	CONSTRAINT [FK_Rezerwacje_prelekcji_Prelekcje] FOREIGN KEY ([Id_Prelekcji]) REFERENCES [Prelekcje]([Id_Prelekcji]) ON DELETE CASCADE
)