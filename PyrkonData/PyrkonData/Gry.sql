CREATE TABLE [dbo].[Gry]
(
	[Id_Gry] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Tytul] VARCHAR(50) NOT NULL, 
    [Wydawnictwo] VARCHAR(50) NOT NULL, 
    [Min_graczy] INT NOT NULL, 
    [Max_graczy] INT NOT NULL, 
    [Czas_rozgrywki] INT NOT NULL,
	CONSTRAINT [Poprawnosc_minimum] CHECK ([Min_graczy]>0),
	CONSTRAINT [Poprawnosc_maximum] CHECK ([Min_graczy]<=[Max_graczy]),
	CONSTRAINT [Poprawnosc_czasu] CHECK ([Czas_rozgrywki]>=5)
)
