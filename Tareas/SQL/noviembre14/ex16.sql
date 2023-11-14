USE enterprise;

-- Mostrar el código, nombre y departamento de los empleados que no han cambiado de
-- trabajo.
SELECT
    d.department_id,
    d.department_name
FROM
    departments AS d
    JOIN jobs_history AS jh ON jh.department_id = d.department_id
WHERE
    jh.employee_id NOT IN (
        SELECT
            employee_id
        FROM
            jobs_history
        GROUP BY
            employee_id
        HAVING
            COUNT(*) > 1
    )
ORDER BY
    d.department_id;