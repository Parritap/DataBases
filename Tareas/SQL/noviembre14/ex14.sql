USE enterprise;

-- Mostrar las regiones que tienen los trabajos de Accountant y de Programmer.
SELECT
    DISTINCT (r.region_id)
FROM
    regions AS r
    JOIN countries AS c ON r.region_id = c.region_id
    JOIN locations AS l ON c.country_id = l.country_id
    JOIN departments AS d ON l.location_id = d.location_id
    JOIN jobs_history AS jh ON jh.department_id = d.department_id
    JOIN jobs AS j ON j.job_id = jh.job_id
WHERE
    j.job_title IN ("Accountant", "Programmer");