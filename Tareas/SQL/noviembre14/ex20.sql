use enterprise;

-- Mostrar las regiones en las cuales no hay ningún
-- empleado que gane más de 8000
SELECT
    r.region_name,
    d.department_name
FROM
    regions AS r
    JOIN countries AS c ON r.region_id = c.region_id
    JOIN locations AS l ON l.country_id = c.country_id
    JOIN departments AS d ON d.location_id = l.location_id
WHERE
    d.department_id NOT IN (
        SELECT
            d.department_id
        FROM
            departments AS d
            JOIN employees AS e ON e.department_id = d.department_id
        WHERE
            e.salary > 8000
    );