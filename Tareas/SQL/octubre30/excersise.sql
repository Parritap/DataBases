USE enterprise;

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


-- Forma completa 2, usando variables de usuario (usando el primer y segundo ejemplo juntos).

-- Guardamos la variable una variable en MySQL.
SELECT @maxSalary := MAX(max_salary) FROM jobs;
-- La usamos en la siguiente sentencia:
SELECT * FROM jobs WHERE max_salary = @maxSalary;




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
