CREATE TABLE [dbo].[Funkcje]
(
	[Id_Funkcji] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Nazwa] VARCHAR(50) NOT NULL, 
    [Cena_biletu] MONEY NOT NULL,
	CONSTRAINT [Unikatowosc_funkcji] UNIQUE(Nazwa,Cena_biletu)
)
