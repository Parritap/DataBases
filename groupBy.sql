USE store_db;

/**
GROUṔ BY : is used to get set SET (so no repetition is admited) of the elements specified. For example
Lets imagine we have a table of customers with a column "country". Lets say that 5 of them are from Mexico, so 
we have 5 records where customer is from Mexico.

Now, the next clause will list the name of countries in the table Customers 

SELECT  Country
FROM Customers
GROUP BY Country;

Here, Mexico will only appear once along with all the countries that appear in the table.

**/



-- Filter the name and id of customers that have bougth something at least onces.
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
-- COUNTY BY can be used along with other funtions like COUNT. 

SELECT  Country
FROM Customers
GROUP BY Country;

        
