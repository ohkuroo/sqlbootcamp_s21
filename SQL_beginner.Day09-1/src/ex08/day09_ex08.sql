CREATE OR REPLACE FUNCTION fnc_fibonacci (IN pstop INTEGER DEFAULT 10)
RETURNS TABLE(num INTEGER) AS
$BODY$
BEGIN
    RETURN QUERY
    WITH RECURSIVE fib(num_1, num_2) AS (
        VALUES (0, 1)
        UNION ALL
        SELECT
            num_2, num_1 + num_2
        FROM fib
        WHERE num_2 < pstop
    )
    SELECT num_1 FROM fib;
END;
$BODY$
LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();