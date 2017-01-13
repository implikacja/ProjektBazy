/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Funkcje AS Target 
USING (VALUES 
        (1, 'Administrator', 0.0), 
		(2, 'Organizator', 0.0),
		(3, 'Uczestnik', 90.0),
		(4, 'Program 50%', 45.0),
		(5, 'Program 100%', 0.0)
) 
AS Source (Id_Funkcji, Nazwa, Cena_biletu) 
ON Target.Id_Funkcji = Source.Id_Funkcji
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Nazwa, Cena_biletu) 
VALUES (Nazwa, Cena_biletu);


MERGE INTO Uczestnicy AS Target 
USING (VALUES 
        (1000, 'admin', 'ConCon', 100, 'admin@concon.pl', 'e9119da765c2fd4081f814f180718be4', 'admin', 1)
) 
AS Source (Id_Uczestnika,Imie, Nazwisko, Wiek, Email, Hasło, Nick, Id_Funkcji)
ON Target.Id_Uczestnika = Source.Id_Uczestnika
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Imie, Nazwisko, Wiek, Email, Hasło, Nick, Id_Funkcji) 
VALUES (Imie, Nazwisko, Wiek, Email, Hasło, Nick, Id_Funkcji);

