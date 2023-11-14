use enterprise;

-- Listar el nombre, jefe y localización de los departamentos que tengan empleados que han sido
-- contratados en octubre del 2016.
SELECT
    d.department_name,
    d.manager_id,
    d.location_id
FROM
    departments AS d
    JOIN jobs_history AS jh ON jh.department_id = d.department_id
WHERE
    MONTH (jh.start_date) = 8
    AND YEAR (jh.start_date) = 2016;