/*
 4.4. Generar una lista por orden alfabético (apellido y nombre), ordenarlos de acuerdo a su
 antigüedad
 
 NOTA: Si aplico los dos ordenamientos(alfabetico y por antigüeda), uno altera el orden del otro!
 
 */
USE enterprise;

-- Por orden alfabetico. 
SELE
    *CT
FROM
    employees
ORDER BY
    first_name,
    last_name;

-- Por orden de antiguedad.
SELECT
    *
FROM
    employees
ORDER BY
    hire_date;