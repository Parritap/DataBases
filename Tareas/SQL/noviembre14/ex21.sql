use enterprise;

-- Mostrar las regiones que tienen menos de 3 departamentos
SELECT
    r.region_name,
    COUNT (d.department_id) AS num_dep
FROM
    regions AS r
    LEFT JOIN countries AS c ON r.region_id = c.region_id
    LEFT JOIN locations AS l ON l.country_id = c.country_id
    LEFT JOIN departments AS d ON d.location_id = l.location_id
GROUP BY
    r.region_id
HAVING
    num_dep <= 4;
-- ------------------------------------------------ 