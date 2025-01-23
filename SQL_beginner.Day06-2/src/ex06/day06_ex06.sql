-- Создаём последовательность

CREATE SEQUENCE seq_person_discounts
AS bigint
INCREMENT 1
START 1;

-- Установим значение по умолчанию для атрибута id

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

-- Установим фактическое значение для последовательности

SELECT setval('seq_person_discounts', (SELECT MAX(id) FROM person_discounts), true);