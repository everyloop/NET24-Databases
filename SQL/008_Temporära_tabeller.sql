
-- Tempor�ra tabeller skapas i systemdatabasen 'tempdb' (d.v.s ej i den databas man jobbar mot)
-- De har #(local, g�r endast att komma �t fr�n sessionen som skapade dem),
-- eller ##(global, g�r att komma �t mellan sessioner) framf�r namnet tabellnamnet

SELECT id, FirstName, LastName INTO #myTempTable FROM Users WHERE FirstName like '[a-d]%'

SELECT id, FirstName, LastName INTO ##myGlobalTempTable FROM Users WHERE FirstName like '[a-d]%'
 
SELECT * from ##myGlobalTempTable;
