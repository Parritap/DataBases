use enterprise;

/* Mostrar el nombre y ciudad (location) de los departamentos que tienen un promedio de salario mayor a
 5000. Mostrar el resultado en orden alfabético según el nombre de la ciudad y del
 departamento */
SELECT
    d.department_id,
    d.department_name,
    d.location_id,
    l.city
FROM
    departments AS d
    JOIN locations AS l ON l.location_id = d.location_id
    JOIN (
        SELECT
            department_id,
            AVG(salary) as av
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            av > 5000
    ) AS sub ON sub.department_id = d.department_id
ORDER BY l.city DESC;  



/* 


    -- GPT VERSION 
    USE enterprise;

/* Mostrar el nombre y ciudad (location) de los departamentos que tienen un promedio de salario mayor a
 5000. Mostrar el resultado en orden alfabético según el nombre de la ciudad y del
 departamento */

 
/* SELECT
    d.department_id,
    d.department_name,
    l.city AS location
FROM
    departments AS d
    JOIN locations AS l ON d.location_id = l.location_id
    JOIN (
        SELECT
            department_id,
            AVG(salary) AS av
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            av > 5000
    ) AS sub ON sub.department_id = d.department_id
ORDER BY
    l.city,
    d.department_name;  */