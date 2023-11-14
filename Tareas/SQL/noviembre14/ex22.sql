USE enterprise;
-- Mostrar la cantidad de empleados que no han cambiado de trabajo
SELECT
    employee_id, COUNT (employee_id) AS n
FROM
    jobs_history
GROUP BY
    employee_id
HAVING
    n = 1;