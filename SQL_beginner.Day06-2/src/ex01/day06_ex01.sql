-- Функция считает количество посещений конкретных пиццерий (amount_of_orders)

WITH
    order_sum
AS (
    SELECT
        person_id,
        pizzeria_id,
        COUNT(pizzeria_id) AS amount_of_orders
    FROM
        person_order
        JOIN menu ON menu_id = menu.id
    GROUP BY
        person_id, pizzeria_id
    ORDER BY
        person_id, pizzeria_id
)

-- Заполняем таблицу person_discounts

INSERT INTO
    person_discounts
SELECT
    ROW_NUMBER() OVER() AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN (amount_of_orders = 1) THEN 10.5
        WHEN (amount_of_orders = 2) THEN 22
        ELSE 30
    END AS discount
FROM order_sum;

select count(*) > 0 as check
from person_discounts