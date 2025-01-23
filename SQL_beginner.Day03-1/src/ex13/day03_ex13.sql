DELETE FROM person_order
WHERE order_date='2022-02-25';

DELETE FROM menu
WHERE pizza_name='greek pizza';

select count(*)=0 as check from menu where pizza_name = 'greek pizza'