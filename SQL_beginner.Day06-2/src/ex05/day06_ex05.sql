-- Комментарий к таблице

COMMENT ON
    TABLE person_discounts
    IS 'personal discount for buyers';

-- Комментарии к столбцам

COMMENT ON
    COLUMN person_discounts.id
    IS 'discount identification number';

COMMENT ON
    COLUMN person_discounts.person_id
    IS 'buyer identification number';

COMMENT ON
    COLUMN person_discounts.pizzeria_id
    IS 'pizzeria identification number';

COMMENT ON
    COLUMN person_discounts.discount
    IS 'discount amount in percent';