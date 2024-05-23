/*
PUNTO 4

Cree un procedimiento que reciba código del país, el nombre del país y el nombre de la región.
El procedimiento debe permitir insertar un país, si el nombre de la región no existe
debe crear la región y el país.

Pasos:
-->Insertar país: tarea principal.
*/

CREATE OR REPLACE PROCEDURE insertar_pais(p_country_id CHAR(2), p_country_name VARCHAR(40),
                                          p_region_name VARCHAR(25)) IS
-- Variables
    v_num_regions number;
    new_region    REGIONS%rowtype;
BEGIN
    -- Verificamos que la región exista mediante un contador. No usamos curores para que no genere exceptiones.
    select count(*) into v_num_regions from REGIONS where REGION_NAME = p_region_name;

    IF v_num_regions = 0 THEN
        INSERT INTO REGIONS (REGION_NAME) VALUES (p_region_name);
    END IF;

    SELECT * INTO new_region FROM REGIONS WHERE REGION_NAME = p_region_name;
    INSERT INTO COUNTRIES (COUNTRY_NAME, REGION_ID) VALUES (p_country_id, p_COUNTRY_NAME, new_region.REGION_ID);


END;


