CREATE FUNCTION [dbo].[LiczbaMiejsc]
(
	@prelekcjaId int
)
RETURNS INT
AS
BEGIN
	DECLARE @pojemnosc int;
	DECLARE @liczba_rezerwacji int;

	/* znalezienie pojemnosci sali, w ktorej odbywa się prelekcja */
	SELECT @pojemnosc = [Pojemnosc]   
		FROM [Prelekcje] JOIN [Sale]
		ON Prelekcje.Id_Sali = Sale.Id_Sali
		WHERE Id_Prelekcji = @prelekcjaId;

	/* Policzenie liczyby istniejących rezerwacji na daną prelekcję */
	SELECT @liczba_rezerwacji = COUNT([Id_Uczestnika])
		FROM [Rezerwacje_prelekcji]
		WHERE [Id_Prelekcji] = @prelekcjaId;

	RETURN @pojemnosc - @liczba_rezerwacji
END
