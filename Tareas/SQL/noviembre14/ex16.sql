use enterprise;

-- Mostrar el código, nombre y departamento de los empleados que no han cambiado de
-- trabajo.
SELECT job_id, COUNT(*) AS n FROM jobs_history GROUP BY job_id HAVING n=1;