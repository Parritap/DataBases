-- PUNTO 6

-- Cree un disparador que permita modificar un jefe de un empleado, debe validar que una
-- persona puede tenar máximo 4 subordinados y que estos deben estar en el mismo
-- departamento que él.



-- Creamos una vista que cuente la cantidad de subordinados que tiene cada empleado.

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

-- Empezamos con el disparador


CREATE OR REPLACE TRIGGER max_4_subordinates
    FOR UPDATE OF manager_id
    ON EMPLOYEES COMPOUND TRIGGER
    -- VARIABLES
    -- Declare a cursor named "c_man_employees"

    row_manger MANAGER_NUM_EMPLOYEES%ROWTYPE;

BEFORE STATEMENT  IS
BEGIN

END BEFORE STATEMENT;


BEFORE EACH ROW IS
BEGIN

FOR REG IN c_man_employees LOOP
    IF REG.id = :NEW.MANAGER_ID THEN
        row_manger := reg;
    end if;
    end loop;

IF row_manger.num_subordinates >=4  THEN
    RAISE_APPLICATION_ERROR(-20000, 'Un jefe no puede tener más de 4 subordinados');
end if;

IF  row_manger.DEPARTMENT_ID != :OLD.DEPARTMENT_ID THEN
        RAISE_APPLICATION_ERROR(-20000, 'Un jefe y sus subordinados no pueden pertencera a deparamentos distintos.');
end if;

END BEFORE EACH ROW;

END;

