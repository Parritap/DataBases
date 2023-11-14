USE enterprise;

-- Mostrar los tres empleados del departamento ventas 
-- que tengan en su nombre dos vocales seguidas.
SELECT
    e.employee_id,
    e.first_name
FROM
    employees AS e NATURAL
    JOIN departments d
WHERE
    d.department_name = "Sales"
    AND e.first_name REGEXP ".*[aeiou][aeiou].*"
LIMIT
    3;