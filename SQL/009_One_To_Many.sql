drop table countries;
drop table cities;

create table countries
(
	id int,
	name nvarchar(max)
);


insert into countries values(1, 'Sweden');
insert into countries values(2, 'Norway');
insert into countries values(3, 'Denmark');
insert into countries values(4, 'Finland');


create table cities
(
	id int,
	name nvarchar(max),
	countryId int
)

insert into cities values(1, 'Stockholm', 1);
insert into cities values(2, 'Gothenburg', 1);
insert into cities values(3, 'Malm�', 1);
insert into cities values(4, 'Oslo', 2);
insert into cities values(5, 'Bergen', 2);
insert into cities values(6, 'Copenhagen', 3);
insert into cities values(7, 'London', 8);

select * from countries;
select * from cities;

select 
	ci.id,
	ci.name as 'City',
	co.name as 'Country'
from 
	countries co 
	join cities ci on co.id = ci.countryId

-- Uppgift: Skriv en select som tar ut alla l�nder med kolumnerna id, landsnamn, 
-- och en tredje kolumn med antal st�der, en fj�rde kolumn med namnen kommaseparerade.

select
	co.id,
	co.name as 'Country',
	count(ci.id) as 'Citites',
	isnull(string_agg(ci.name, ', '), '-') as 'City names'
from
	countries co
	left join cities ci on co.id = ci.countryId
group by
	co.id, co.name


-- Detta �r ett �ldre f�rlegat s�tt att g�ra join, innan keyword join inf�rdes p� 90-talet.
-- Innan dess s� skrev man en komma separerad lista med tabeller efter "from" vilket den d� gjorde cross join p�.
-- D�refter filtrerade man ut raderna man vill se med where f�r att f�r samma resultat som fr�n inner join.
-- Undvik att anv�nda detta s�ttet i er kod, d� det "nya" s�tter �r tydligare.

select * from countries, cities where countries.id = cities.countryId


