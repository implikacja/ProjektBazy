CREATE TABLE [dbo].[Budynki]
(
	[Id_Budynku] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Nazwa] VARCHAR(50) NOT NULL, 
    [Adres] VARCHAR(100) NOT NULL, 
	[Calodobowy] BIT NOT NULL,
    [Godzina_otwarcia] TIME NULL, 
    [Godzina_zamkniecia] TIME NULL,
	CONSTRAINT [Unikatowosc_budynku] UNIQUE (Nazwa),
	CONSTRAINT [Okreslone_godziny_otwarcia] CHECK ([Calodobowy]=1 OR ([Godzina_otwarcia] IS NOT NULL AND [Godzina_zamkniecia] IS NOT NULL)),
	CONSTRAINT [Prawidlowe_godziny_otwarcia] CHECK ([Calodobowy]=1 OR [Godzina_otwarcia]<[Godzina_zamkniecia])
)
