-- Session #1
BEGIN;

UPDATE pizzeria SET rating = 4 WHERE name = 'Dominos';

-- подождать пока 2 сеанс залочит Pizza Hut
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- Session #2
BEGIN;

UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
-- подождать пока 1 сеанс залочит Dominos
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';
COMMIT;

SELECT SUM(rating) FROM pizzeria;

