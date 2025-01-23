SELECT
    COALESCE(p.name, '-') AS person_name,
    v.visit_date,
    COALESCE(z.name, '-') AS pizzeria_name
FROM
    (SELECT DISTINCT name FROM person
     UNION
     SELECT '-' AS name) p
        LEFT JOIN
    person_visits v ON p.name = (SELECT name FROM person WHERE id = v.person_id) AND v.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
        FULL OUTER JOIN
    (SELECT DISTINCT name FROM pizzeria
     UNION
     SELECT '-' AS name) z
    ON v.pizzeria_id = (SELECT id FROM pizzeria WHERE name = z.name)
ORDER BY
    person_name, visit_date, pizzeria_name;