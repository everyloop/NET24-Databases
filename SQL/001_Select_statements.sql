/*
	Blockkommentar
*/

-- Radkommentar

select 
	-- Projection:
	[id], 
	"name", 
	id, 10 + id as 'idPlus10', 
	'hej ' + name as 'greeting' 
from 
	students
where
	-- Selection:
	/*
	< mindre �n
	> st�rre �n
	<= mindre eller lika med
	>= st�rre eller lika med
	= lika med (ist�llet f�r == som i c#)
	<> inte lika med (men T-SQL till�ter �ven != )
	and (motsvarar c# &&)
	or  (motsvarar c# ||)
	not (motsvarar c# !)
	*/
	id > 1 and id < 3;

-- Begr�nsa antal rader som skickas tillbaks
select top 2 * from students;


-- select * from students where id between 2 and 3
-- select * from students where id >= 2 and id <= 3

select * from students where name = 'A%';

-- Byter databas
use everyloop;

-- Order by anv�nds f�r sortering (ASC = ascending, DESC = descending)
select * from Users where len(FirstName) = 5 order by FirstName;

select top 5 * from users order by LastName desc, FirstName asc






