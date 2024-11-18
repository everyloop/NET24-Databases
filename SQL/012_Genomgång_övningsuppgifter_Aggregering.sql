-- Ta ut (select) en rad f�r varje (unik) period i tabellen �Elements� med f�ljande kolumner: 
-- �period�, �from� med l�gsta atomnumret i perioden, �to� med h�gsta atomnumret i perioden, 
-- �average isotopes� med genomsnittligt antal isotoper visat med 2 decimaler, �symbols� med 
-- en kommaseparerad lista av alla �mnen i perioden.

select 
	Period,
	min(Number) as 'From',
	max(Number) as 'To',
	format(avg(cast(Stableisotopes as float)), 'F2') as 'Average isotopes',
	format(sum(cast(Stableisotopes as float)) / count(Stableisotopes), 'F2') as 'Average isotopes',
	string_agg(Symbol, ', ') as 'Symbols'
from 
	Elements
group by
	Period


-- Ta ut en lista �ver regioner i tabellen �Countries� d�r det f�r varje region framg�r regionens namn,
-- antal l�nder i regionen, totalt antal inv�nare, total area, befolkningst�theten med 2 decimaler, 
-- samt sp�dbarnsd�dligheten per 100.000 f�dslar avrundat till heltal.

select * from Countries


select 
	Region,
	count(*) as 'Number of countries',
	sum(cast(Population as bigint)) as 'Inhabitants',
--	sum(cast(Population as float)) as 'Inhabitants'
	sum(cast([Area (sq# mi#)] as bigint)) as 'Total area',
	format(avg(CAST(REPLACE([Pop# Density (per sq# mi#)], ',', '.') as float)), 'N2') as 'Population density'
from 
	Countries
group by
	Region
