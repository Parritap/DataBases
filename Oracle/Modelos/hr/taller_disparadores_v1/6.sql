--PUNTO 6

-- Creamos una vista que nos ayude a guardar datos relevantes para el disparador
-- En este caso es una vista que nos muestra la cantidad de subordinados que tiene cada empleado, junto con su id, departamento y nombres.
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




-- Iniciamos con la creación del disparador
CREATE OR REPLACE TRIGGER max_4_subordinates
   FOR UPDATE OF MANAGER_id
   ON EMPLOYEES COMPOUND TRIGGER

    -- VARIABLES
    c_man_employees SYS_REFCURSOR;
    aux_record MANAGER_NUM_EMPLOYEES%ROWTYPE;


BEFORE STATEMENT IS
BEGIN
    open c_man_employees FOR SELECT * FROM MANAGER_NUM_EMPLOYEES;
END BEFORE STATEMENT;

BEFORE EACH ROW IS
BEGIN

    LOOP
        FETCH c_man_employees INTO aux_record;
        EXIT WHEN c_man_employees%NOTFOUND;

        IF aux_record.ID = :NEW.MANAGER_ID THEN
           EXIT;
        END IF;
    END LOOP;

   IF aux_record.NUM_SUBORDINATES >= 4 THEN
       RAISE_APPLICATION_ERROR(-20000, 'Es posible otorgar más de 4 subordinados al empleado' || :NEW.MANAGER_ID);
   end if;

   IF  aux_record.DEPARTMENT_ID != :OLD.DEPARTMENT_ID THEN
       RAISE_APPLICATION_ERROR(-20000, 'No es posible tener un jefe de distinto departamento');
   end if;

END BEFORE EACH ROW;
END;

