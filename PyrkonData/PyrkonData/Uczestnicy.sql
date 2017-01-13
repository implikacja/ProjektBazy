CREATE TABLE [dbo].[Uczestnicy]
(
	[Id_Uczestnika] INT NOT NULL PRIMARY KEY IDENTITY(1000,3),
	[Imie] VARCHAR(50) NOT NULL,
	[Nazwisko] VARCHAR(50) NOT NULL,
	[Wiek] INT NOT NULL,
	[Nocleg] BIT NOT NULL DEFAULT 0, 
    [Email] VARCHAR(50) NOT NULL, 
    [Haslo] VARCHAR(32) NOT NULL, 
    [Nick] VARCHAR(50) NOT NULL, 
    [Telefon_kontaktowy] VARCHAR(9) NULL, 
	[Telefon_opiekuna] VARCHAR(9) NULL, 
    [Id_Funkcji] INT NOT NULL DEFAULT 3, 
	CONSTRAINT [Unikatowosc_uczestnika] UNIQUE (Email),
    CONSTRAINT [FK_Uczestnicy_Funkcje] FOREIGN KEY ([Id_Funkcji]) REFERENCES [Funkcje]([Id_Funkcji]) ON DELETE CASCADE,
	CONSTRAINT [Zgoda_opiekuna] CHECK ([Wiek]>=18 OR [Telefon_opiekuna] IS NOT NULL),
	CONSTRAINT [Prawidlowy_wiek] CHECK ([Wiek]>0 AND [Wiek]<150),
	CONSTRAINT [Prawidlowy_mail] CHECK ([Email] LIKE '%_@_%._%'),
	CONSTRAINT [Prawidlowy_numer] CHECK ([Telefon_kontaktowy] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT [Prawidlowy_numer_opiekuna] CHECK ([Telefon_opiekuna] IS NULL OR [Telefon_opiekuna] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT [Prawidlowe_haslo] CHECK (LEN([Haslo])=32)
) 
