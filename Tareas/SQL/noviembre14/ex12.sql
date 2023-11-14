USE enterprise;

SELECT e.employee_id, e.first_name, b.employee_id, b.first_name  FROM (employees as e JOIN employees as b) WHERE e.manager_id = b.employee_id;