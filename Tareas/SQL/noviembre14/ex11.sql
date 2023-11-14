USE enterprise;

-- Mostrar de cada empleado los siguientes datos: código, nombre y apellido, descripción del
-- trabajo (job_title) y departamento en el que trabajan.

SELECT e.employee_id, e.first_name, e.last_name, j.job_title, e.department_id
FROM (employees AS e NATURAL JOIN jobs AS j);

