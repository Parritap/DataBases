CREATE OR REPLACE VIEW manager_num_employees AS
SELECT e.EMPLOYEE_ID id,
       e.first_name,
       e.last_name,
       COUNT(s.employee_id) num_subordinates,
       e.DEPARTMENT_ID
FROM employees e
LEFT JOIN employees s ON e.employee_id = s.manager_id
GROUP BY e.employee_id, e.first_name, e.last_name, e.DEPARTMENT_ID
ORDER BY num_subordinates DESC;

