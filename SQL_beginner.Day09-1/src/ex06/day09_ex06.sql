CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date (
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
    )
RETURNS TABLE (name VARCHAR) AS 
$BODY$
BEGIN
    RETURN QUERY
        SELECT pi.name
            FROM pizzeria pi
            JOIN person_visits pv ON pv.pizzeria_id = pi.id
            JOIN menu m ON m.pizzeria_id = pi.id
            JOIN person p ON p.id = pv.person_id
            WHERE p.name = pperson AND price < pprice AND visit_date = pdate;
END;
$BODY$
LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date (pprice := 800);

select *
from fnc_person_visits_and_eats_on_date (pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
