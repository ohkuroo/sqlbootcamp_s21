WITH date_range AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
),
     visits_data AS (
         SELECT DISTINCT visit_date
         FROM person_visits
         WHERE person_id IN (1, 2)
     )

SELECT dr.missing_date
FROM date_range dr
         LEFT JOIN visits_data vd ON dr.missing_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY dr.missing_date ASC;