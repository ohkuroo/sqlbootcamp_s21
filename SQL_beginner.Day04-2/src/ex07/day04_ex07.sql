INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
values(
	(SELECT MAX(id)+1 FROM person_visits),
	(SELECT id FROM person where name = 'Dmitriy'),
	(SELECT DISTINCT
		pizzeria.id
	from 
		pizzeria
		inner join menu on pizzeria.id = menu.pizzeria_id
		join mv_dmitriy_visits_and_eats AS mv on mv.pizzeria_name != pizzeria.name
	where menu.price < 800 LIMIT 1),
	'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

select *
from mv_dmitriy_visits_and_eats