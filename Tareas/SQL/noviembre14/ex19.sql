USE enterprise;

-- Mostrar los departamentos donde hay empleado con salario mayor a 6000 
-- y que tengan en su nombre empiece y termine en la letra a
SELECT
    e.employee_id,
    e.first_name,
    d.department_id,
    d.department_name
FROM
    employees AS e NATURAL
    JOIN departments AS d
WHERE
    e.salary > 6000
    AND e.first_name REGEXP "^[aeiou].*[aeiou]$";