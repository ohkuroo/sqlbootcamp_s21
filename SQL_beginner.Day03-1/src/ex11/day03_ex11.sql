UPDATE menu
SET price = price - price * 0.1
WHERE pizza_name = 'greek pizza';


select (800-800*0.1) = price as check from menu where pizza_name ='greek pizza'