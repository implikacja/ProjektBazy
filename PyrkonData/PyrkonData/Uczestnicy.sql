CREATE TABLE [dbo].[Uczestnicy]
(
	[Id_Uczestnika] INT NOT NULL PRIMARY KEY,
	[Imie] VARCHAR(50) NOT NULL,
	[Nazwisko] VARCHAR(50) NOT NULL,
	[Wiek] INT NOT NULL,
	[Nocleg] INT NOT NULL, 
    [Email] VARCHAR(50) NOT NULL, 
    [Hasło] VARCHAR(50) NOT NULL, 
    [Nick] VARCHAR(50) NOT NULL, 
    [Telefon_kontaktowy] INT NULL, 
    [Id_Funkcji] INT NOT NULL, 
    CONSTRAINT [FK_Uczestnicy_Funkcje] FOREIGN KEY ([Id_Funkcji]) REFERENCES [Funkcje]([Id_Funkcji]) ON DELETE CASCADE,

)
