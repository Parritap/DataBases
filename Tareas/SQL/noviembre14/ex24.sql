use enterprise;

-- Mostrar los empleados cuyo salario es mayor al promedio general de salarios.

SELECT @avg_salary:= (AVG(salary)) FROM employees;


SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > @avg_salary;