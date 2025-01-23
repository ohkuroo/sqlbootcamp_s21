SELECT
    m.pizza_name,
    p.name AS pizzeria_name
FROM
    person per
        JOIN
    person_order po ON per.id = po.person_id
        JOIN
    menu m ON po.menu_id = m.id
        JOIN
    pizzeria p ON m.pizzeria_id = p.id
WHERE
    per.name IN ('Denis', 'Anna')
ORDER BY
    m.pizza_name,
    p.name;

