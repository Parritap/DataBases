USE enterprise;

/*
Listar el código de los trabajos que están asignados a empleados en la compañía
*/

SELECT job_id FROM employees GROUP BY job_id;