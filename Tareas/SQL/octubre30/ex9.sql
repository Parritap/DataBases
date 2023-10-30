USE enterprise;

/*
 9. Mostrar los distintos países que aparecen en la tabla localidad
 */
SELECT
    c.country_name,
    c.country_id
FROM
    (
        SELECT
            country_id
        FROM
            locations
        GROUP BY
            country_id
    ) AS subquery NATURAL
    JOIN countries AS c;