INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);

-- SELECT * FROM menu
-- WHERE id = 19;

select count(*)=1 as check from menu where id = 19 and pizzeria_id=2 and pizza_name = 'greek pizza' and price=800