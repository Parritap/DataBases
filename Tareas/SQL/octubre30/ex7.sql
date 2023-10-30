USE enterprise;

/*
 7.
 Listar el código de los departamentos que tienen empleados que tengan en su nombre una
 vocal seguida de un espacio, o que ganen más de 6000
 */
/*
 The "LIKE" keyword in SQL is not based on regular expressions (regex); 
 it uses a simpler pattern matching syntax that is specific to SQL databases. 
 While both "LIKE" and regular expressions are used for pattern matching,
 they have different syntax and capabilities.
 "LIKE" in SQL uses two common wildcards:
 
 '%' (percent sign): Matches any sequence of characters (including zero characters).
 It's equivalent to the ".*" in regular expressions, which matches any characters.
 
 '_' (underscore): Matches any single character. 
 It's equivalent to the "." (dot) in regular expressions, which matches any single character.
 */
SELECT
    DISTINCT department_id
FROM
    employees
WHERE
    (
        first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
    )
    OR salary > 6000;

-- Más completo, junto con el nombre de los empleados
SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees
WHERE
    (
        first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
        OR first_name REGEXP '[*aeiou] \\s*'
    )
    OR salary > 6000;

-- SIN REGEX 
SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees
WHERE
    (
        first_name LIKE '%a %'
        OR first_name LIKE '%e %'
        OR first_name LIKE '%i %'
        OR first_name LIKE '%o %'
        OR first_name LIKE '%u %'
    );

OR salary > 6000;