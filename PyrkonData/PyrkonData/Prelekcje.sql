CREATE TABLE [dbo].[Prelekcje]
(
	[Id_Prelekcji] INT NOT NULL PRIMARY KEY, 
    [Godzina_rozpoczecia] TIME NOT NULL, 
    [Id_Zgloszenia] INT NOT NULL, 
    [Id_Sali] INT NOT NULL, 
    CONSTRAINT [FK_Prelekcje_Zgloszenia] FOREIGN KEY ([Id_Zgloszenia]) REFERENCES [Zgloszenia]([Id_Zgloszenia]) ON DELETE CASCADE,
	CONSTRAINT [FK_Prelekcje_Sale] FOREIGN KEY ([Id_Sali]) REFERENCES [Sale]([Id_Sali]) ON DELETE CASCADE
)
