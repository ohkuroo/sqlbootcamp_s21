-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Подождать пока в сессии #2 не обновится рейтинг
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

