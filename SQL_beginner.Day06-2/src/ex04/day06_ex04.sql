-- команда 'ALTER TABLE <table_name>' - вносит изменения в таблицу

ALTER TABLE person_discounts

    -- команда 'ADD CONSTRAINT <constraint_name>' - добавляет ограничение

    ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK (person_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_discount CHECK (person_id IS NOT NULL),
    ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100),

    -- команда 'ALTER COLUMN <column_name>' - вносит изменения в столбец

    ALTER COLUMN discount SET DEFAULT 0;

