CREATE TABLE [dbo].[Budynki]
(
	[Id_Budynku] INT NOT NULL PRIMARY KEY, 
    [Nazwa] VARCHAR(50) NOT NULL, 
    [Adres] VARCHAR(100) NOT NULL, 
    [Godzina_otwarcia] DATE NOT NULL, 
    [Godzina_zamkniecia] DATE NOT NULL
)
