CREATE TABLE [dbo].[Prelekcje]
(
	[Id_Prelekcji] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Godzina] SMALLDATETIME NOT NULL, 
    [Id_Zgloszenia] INT NOT NULL, 
    [Id_Sali] INT NOT NULL, 
	CONSTRAINT [Unikatowosc_prelekcji] UNIQUE ([Godzina],[Id_Sali]),
	CONSTRAINT [Unikatowosc_prelekcji2] UNIQUE ([Id_zgloszenia]),
	CONSTRAINT [Prawidlowosc_godziny] CHECK (DATEPART(n,[Godzina])=0),
    CONSTRAINT [FK_Prelekcje_Zgloszenia] FOREIGN KEY ([Id_Zgloszenia]) REFERENCES [Zgloszenia]([Id_Zgloszenia]) ON DELETE CASCADE,
	CONSTRAINT [FK_Prelekcje_Sale] FOREIGN KEY ([Id_Sali]) REFERENCES [Sale]([Id_Sali]) ON DELETE CASCADE
)
