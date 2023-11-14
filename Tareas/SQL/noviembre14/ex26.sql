use enterprise;

--  Mostrar el departamento con mayor cantidad de empleados
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) as n
FROM
    departments AS d
    JOIN employees AS e ON e.department_id = d.department_id
GROUP BY
    department_id
ORDER BY
    n DESC
LIMIT 1;