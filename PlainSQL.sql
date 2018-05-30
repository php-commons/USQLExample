USE [BigDataTest]
GO

-- This is a bit of SQL magic to very quickly create a table with as many numbers as you want. 
DROP TABLE #firstNames

CREATE TABLE #firstNames
(
	FirstNames varchar(128) 
)

INSERT INTO #firstNames (FirstNames)
VALUES 
	('Amber'), ('Alton'), ('Autumn'), ('Andy'), ('Becky'), ('Bill'), ('Bambi'), ('Bob'), ('Christine'), ('Chris'), ('Candice'), ('Chase'), ('Dew'), ('Dell'), ('Dryad'), ('Dapper'), ('Ember'), ('Everett'), ('Esther'), ('Earnest'), ('Echo'), ('Faith'), ('Farley'), ('Fawn'), ('Felix'), ('Gabrielle'), ('Gabe'), ('Garnet'), ('Garth'), ('Hope'), ('Hans'), ('Hailey'), ('Han'), ('Iris'), ('Indigo'), ('Ian'), ('Ike'), ('Jewel'), ('Jason'), ('Jill'), ('Jack'), ('Kacey'), ('Kasion'), ('Kaitlan'), ('Kasier'), ('Laura'), ('Larry'), ('Laurel'), ('Lot'), ('Michelle'), ('Mark'), ('Mandy'), ('Mindy'), ('Nancy'), ('Newt'), ('Nadine'), ('Nat'), ('Ola'), ('Olaf'), ('Olena'), ('Olly'), ('Pam'), ('Peter'), ('Polly'), ('Page'), ('Rachel'), ('Ralph'), ('Rochelle'), ('Roland'), ('Sarah'), ('Stan'), ('Serena'), ('Steve'), ('Tammy'), ('Tipper'), ('Tabitha'), ('Tad'), ('Uma'), ('Uli'), ('Valerie'), ('Victor'), ('Victoria'), ('Vesta'), ('Willow'), ('Wally'), ('Wade'), ('Walden'), ('Yasmine'), ('Yeva'), ('Zander')
	
DROP TABLE #lastNames

CREATE TABLE #lastNames
(
	LastNames varchar(128) 
)

INSERT INTO #lastNames (LastNames)
VALUES 
	('Alderman'), ('Automan'), ('Anderson'), ('Barrowman'), ('Bailman'), ('Bitters'), ('Canders'), ('Clobbers'), ('Cower'), ('Dandies'), ('Dillers'), ('Downing'), ('Earing'), ('Elmherd'), ('Eown'), ('Fibbert'), ('Felter'), ('Fall'), ('Gally'), ('Goalman'), ('Gutterman'), ('Handsmith'), ('Helms'), ('Hollowing'), ('Intermen'), ('Icker'), ('Jailbird'), ('Jabber'), ('Jefferson'), ('Kotter'), ('Kilter'), ('Kloper'), ('Macmillan'), ('Moller'), ('Mayview'), ('Nacker'), ('Nilly'), ('Newtons'), ('Osterly'), ('Outset'), ('Packman'), ('Pewter'), ('Pollter'), ('Quilting'), ('Quarryman'), ('Rampson'), ('Ritter'), ('Router'), ('Samson'), ('Spillson'), ('Sounding'), ('Tillman'), ('Tanner'), ('Tinman'), ('Urak'), ('Upperson'), ('Wilson'), (' Walling'), (' Winter'), ('Yawlson'), ('Yanker'), ('Zarling'), ('Zarbeck');


WITH
 E1(N) AS (SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
           SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
           SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
           SELECT 1),                 --10E1  or 10 rows
 E2(N) AS (SELECT 1 FROM E1 a, E1 b), --10E2  or 100 rows
 E4(N) AS (SELECT 1 FROM E2 a, E2 b), --10E3  or 10000 rows
 E8(N) AS (SELECT 1 FROM E4 a, E4 b), --10E4  or 100000000 rows
E16(N) AS (SELECT 1 FROM E8 a, E8 b),  --10E16 or more rows than you can shake a stick at
Names AS (SELECT FirstNames, LastNames FROM #firstNames CROSS JOIN #lastNames)
SELECT TOP(1000) 
	ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) as [Counter],
	FirstNames,
	LastNames
FROM E16
CROSS JOIN Names
	 
