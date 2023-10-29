USE enterprise;

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


-- Forma completa 2, usando variables de usuario (usando la forma simple y la forma completa 1 juntas).

-- Guardamos la variable una variable en MySQL.
SELECT @maxSalary := MAX(max_salary) FROM jobs;
-- La usamos en la siguiente sentencia:
SELECT * FROM jobs WHERE max_salary = @maxSalary;



-- Forma completa 3:
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
