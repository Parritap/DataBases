USE enterprise;

/*
 Listar el código de los empleados que fueron contratados en el primer semestre,
 que en su nombre y apellido no empiecen en vocal 
 y que además hayan cambiado de trabajo (los que
 cambian de trabajo están en job_history).
 */
-- Como no se especifica el año, asumo cualquier año .
SELECT
    sub1.employee_id,
    sub1.first_name,
    sub1.last_name
FROM
    (
        SELECT
            employee_id,
            first_name,
            last_name,
            hire_date
        FROM
            employees
        WHERE
            MONTH(hire_date) BETWEEN 01
            AND 06
    ) AS sub1 NATURAL
    JOIN -- Tabla de  los empleados que han cambiado de trabajo, i.e los que se encuentran en más de un registro en jobs_history.
    (
        SELECT
            employee_id,
            COUNT(employee_id) AS c
        from
            jobs_history
        GROUP BY
            employee_id
        HAVING
            c > 1
    ) AS sub2
WHERE
    sub1.first_name REGEXP '^[^aeiouAEIOU].*'
    AND sub1.last_name REGEXP '^[^aeiouAEIOU].*';