USE enterprise;

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
