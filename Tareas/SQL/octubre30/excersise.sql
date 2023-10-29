/*
 1 --------
 Mostrar los trabajos con la diferencia entre el salario mínimo y el máximo,
 mostrar el
 resultado en orden descendente.
 */
SELECT
    *,
    (max_salary - min_salary) as diff
FROM
    jobs
ORDER BY
    diff DESC;

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* 2. Mostrar sólo el trabajo con la mayor desnivelación salarial.*/
SELECT
    *,
    (max_salary - min_salary) as diff
FROM
    jobs
ORDER BY
    diff DESC
LIMIT
    1;

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* 3. Mostrar el máximo salario pagado por la empresa */
-- Forma simpĺe
SELECT
    MAX(max_salary)
FROM
    jobs;

-- Forma completa 1:
SELECT
    *
FROM
    jobs
    join (
        SELECT
            MAX(max_salary) as salary
        FROM
            jobs
    ) as sub
WHERE
    jobs.max_salary = sub.salary;

-- Forma completa 2:
SELECT
    *
FROM
    jobs
WHERE
    max_salary = (
        SELECT
            MAX(max_salary)
        FROM
            jobs
    );

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/*
 4.4. Generar una lista por orden alfabético (apellido y nombre), ordenarlos de acuerdo a su
 antigüedad
 
 */
-- Primero ordenamos por orden alfabetico la tabla employees;
SELECT
    *
FROM
    employees
ORDER BY
    first_name,
    last_name as