CREATE PROCEDURE [dbo].[OkreslPrelegenta]
	@IdZ int
AS
BEGIN
	DECLARE @IdU int;
	DECLARE @IdF int;
	DECLARE @liczba_prelekcji int;

	/*Kursor zawierający Id_Uczestnika, który dodał zgłoszenie i jego aktualną funkcję*/
	DECLARE kursor CURSOR FOR
		SELECT Uczestnicy.Id_Uczestnika, Id_Funkcji 
		FROM [Zgloszenia] JOIN [Uczestnicy]
		ON Zgloszenia.Id_Uczestnika = Uczestnicy.Id_Uczestnika
		WHERE Id_Zgloszenia = @IdZ

	OPEN kursor;
	FETCH NEXT FROM kursor INTO @IdU, @IdF;

	WHILE @@FETCH_STATUS=0
	BEGIN
		IF @IdF NOT IN (1,2) /*Role, które nie ulegają zmianie pomimo zmiany liczby prelekcji: administrator i organizator */
		BEGIN
			/*Sprawdzenie liczby prelekcji danego uczestnika*/
			SELECT @liczba_prelekcji = COUNT(Id_Prelekcji)
				FROM Zgloszenia JOIN Prelekcje
				ON  Zgloszenia.Id_Zgloszenia = Prelekcje.Id_Zgloszenia
				WHERE Zgloszenia.Id_Uczestnika = @IdU;

			IF @liczba_prelekcji = 0 UPDATE Uczestnicy SET Id_Funkcji = 3 WHERE Id_Uczestnika = @IdU; /* Nowa rola: uczestnik */
			ELSE IF @liczba_prelekcji = 1 UPDATE Uczestnicy SET Id_Funkcji = 4 WHERE Id_Uczestnika = @IdU; /* Nowa rola: prelegent 50% */
			ELSE UPDATE Uczestnicy SET Id_Funkcji = 5 WHERE Id_Uczestnika = @IdU; /* Nowa rola: prelegent 100% */
		END
		FETCH NEXT FROM kursor INTO @IdU, @IdF;
	END

	CLOSE kursor;
	DEALLOCATE kursor;
END
