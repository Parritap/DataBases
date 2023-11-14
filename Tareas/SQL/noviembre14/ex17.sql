-- Mostrar los departmentos en los cuales trabajen empleados que ganen más de 5000, además
-- que en él se realicen los trabajos de Stock Manager pero no se realice el trabajo Stock Clerk
USE enterprise;

SELECT
    e.employee_id,
    e.first_name,
    d.department_id,
    d.department_name
FROM
    employees AS e
    JOIN jobs AS j ON e.job_id = j.job_id
    JOIN departments AS d ON d.department_id = e.department_id
WHERE
    e.salary > 1000
    AND j.job_title = "Programmer"
    AND j.job_title != "Stock Clerk";