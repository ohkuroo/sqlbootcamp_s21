SELECT p.name, p.rating
FROM pizzeria p
WHERE p.id NOT IN (SELECT pizzeria_id FROM person_visits);
