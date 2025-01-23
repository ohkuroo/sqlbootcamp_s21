DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons (IN pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
        id BIGINT,
        name VARCHAR,
        age INTEGER,
        gender VARCHAR,
        address VARCHAR
) AS
$BODY$
SELECT*
FROM person
WHERE gender = pgender;
$BODY$
LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
