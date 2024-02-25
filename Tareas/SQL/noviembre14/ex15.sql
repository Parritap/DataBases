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



@/opt/oracle/demo_databases/human_resources/hr_cre.sql
@/opt/oracle/demo_databases/human_resources/hr_popul.sql
@/opt/oracle/demo_databases/human_resources/hr_idx.sql
@/opt/oracle/demo_databases/human_resources/hr_code.sql
@/opt/oracle/demo_databases/human_resources/hr_comnt.sql
@/opt/oracle/demo_databases/human_resources/hr_analz.sql