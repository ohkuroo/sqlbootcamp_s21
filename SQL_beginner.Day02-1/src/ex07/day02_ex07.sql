SELECT p.name
FROM pizzeria p
         JOIN person_visits pv ON p.id = pv.pizzeria_id
         JOIN menu m ON p.id = m.pizzeria_id
WHERE pv.person_id = 9
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800;
