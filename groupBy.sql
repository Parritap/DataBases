USE store_db;

/**
 GROUP BY : is used to get set SET (so no repetition is admited) of the elements specified. For example
 Lets imagine we have a table of customers with a column "country". Lets say that 5 of them are from Mexico, so 
 we have 5 records where customer is from Mexico.
 
 Now, the next clause will list the name of countries in the table Customers 
 
 SELECT  Country
 FROM Customers
 GROUP BY Country;
 
 Here, Mexico will only appear once along with all the countries that appear in the table.
 
 **/
-- FILTER THE NAME AND ID OF CUSTOMERS THAT HAVE BOUGTH SOMETHING AT LEAST ONCE.
-- FILTRAR EL NOMBRE Y EL ID DE LOS CLIENTES QUE HAN COMPRADO AL MENOS UNA VEZ EN LA TIENDA.
/*
 Note that when  using alias, both relations (customer and the join table) 
 most have, each, said alias, i.e, there are two "AS" usages.  
 */
SELECT
    c.first_name,
    c.customer_id
FROM
    customers AS c
    JOIN (
        SELECT
            customer_id
        FROM
            orders
        GROUP BY
            customer_id
    ) as subquery ON c.customer_id = subquery.customer_id;


-- How to count how many times does one column value repeats in a table? 
-- NOTE: COUNTY BY can be used along with other funtions like COUNT. 
-- LISTAR TODOS LOS PAÍSES DE LOS QUE HACEN PARTE LOS CLIENTES. 
SELECT
    Country
FROM
    customers
GROUP BY
    Country;



-- USING GROUP BY WITH AGGREGATE FUNCTIONS: 
-- MAX(COLUMN)
-- IMPRIMIR LAS COMPRAS CON EL VALOR MÁS ALTO DE CADA CLIENTE, JUNTO CON SU NOMBRE COMPLETO E ID. 

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    s.max
FROM
    customers as c
    JOIN (
        SELECT
            customer_id,
            MAX(total_amount) as max
        FROM
            orders
        GROUP BY
            customer_id
    ) AS s ON s.customer_id = c.customer_id;