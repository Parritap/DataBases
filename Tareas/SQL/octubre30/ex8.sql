USE enterprise;

/*
 Mostrar las localidades a las cuales no aplica el atributo de estado o provincia y cuya ciudad
 tenga dos vocales igual es.
 
 \w*([aeiou])\w*\1+\w*
 */
SELECT
    location_id,
    street_address,
    city
FROM
    locations
WHERE
    state_province IS NULL
    AND city REGEXP '\\w*([aeiou])\\w*\\1+\\w*';
