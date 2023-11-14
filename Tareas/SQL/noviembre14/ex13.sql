USE enterprise;

-- Listar los empleos que no tiene empleados asignados
SELECT
    j.job_id,
    j.job_title
FROM
    jobs AS j
WHERE
    j.job_id NOT IN (
        SELECT
            job_id
        FROM
            employees
    );

SELECT
    e.job_id,
    j.job_title
FROM
    employees AS e INNER
    JOIN jobs AS j ON e.job_id = j.job_id;