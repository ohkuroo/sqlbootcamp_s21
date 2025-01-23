SELECT
    person.name AS name,
    pizza_name,
    price,
    ROUND(price - price * (discount / 100)) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM
    person_order po
    JOIN person ON po.person_id = person.id
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_discounts pd ON pd.person_id = person.id AND pd.pizzeria_id = menu.pizzeria_id 
ORDER BY
    name,
    pizza_name;