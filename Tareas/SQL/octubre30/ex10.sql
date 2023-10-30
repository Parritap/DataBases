USE enterprise;

/*
Listar el código de los empleados que fueron contratados en el primer semestre,
 que en su nombre y apellido no empiecen en vocal 
 y que además hayan cambiado de trabajo (los que
cambian de trabajo están en job_history).
*/

-- Como no se especifica el año, se asume que es el año actual
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
