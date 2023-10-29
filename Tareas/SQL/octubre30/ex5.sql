USE enterprise;

/* 
 5.
 Mostrar los nombres de empleados que están en el departamento 50 que no estén en los
 demás departamentos
 */
-- Un empleado unicamente puede estar en un departamento, por lo tanto la consulta sería la siguiente.
SELECT
    *
FROM
    employees
WHERE
    department_id = 50;
