-- Создаём индекс для таблицы person_discounts

CREATE UNIQUE INDEX
    idx_person_discounts_unique
ON
    person_discounts(person_id, pizzeria_id);

-- Отключаем последовательный поиск

SET enable_seqscan = off;

-- Запрос для проверки работы индекса

EXPLAIN ANALYZE
SELECT
    person_id,
    pizzeria_id
FROM
    person_discounts;

