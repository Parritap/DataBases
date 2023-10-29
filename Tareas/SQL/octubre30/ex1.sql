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
