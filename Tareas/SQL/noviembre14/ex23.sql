use enterprise;

-- Mostrar por departamento la cantidad de empleados que hay.
SELECT
    department_id,
    COUNT(*)
FROM
    employees
GROUP BY
    (department_id);


SELECT department_id FROM employees ORDER BY department_id; 