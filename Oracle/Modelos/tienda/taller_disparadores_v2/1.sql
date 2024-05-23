-- Cuando un producto es agregado a la venta de un cliente, se debe verificar si
-- hay inventario suficiente en el almacén, en caso de no haberlo se debe anular
-- ese registro (en estado guardar un 0) y calcular el descuento ese producto.

/*
Pasos
*/
CREATE OR REPLACE TRIGGER corregir_factura
    BEFORE INSERT
    ON ITEMVENTA
    FOR EACH ROW
DECLARE
    v_inventario number;
    v_num_venta  NUMBER;
    v_producto   NUMBER;
    aux_cursor   SYS_REFCURSOR;
BEGIN
    --Abrimos el cursor y le ingresamos los datos de la consulta. En este caso solo debería ser una fila.
    OPEN aux_cursor FOR
        SELECT inv.CANTIDAD as cant_inv,
               v.NUMERO     as venta
        FROM ALMACEN A
                 JOIN EMPLEADO E ON (A.IDALMACEN = E.ALMACEN_IDALMACEN)
                 JOIN VENTA V ON (V.NUMERO = :NEW.VENTA_NUMERO)
                 JOIN INVENTARIOALMACEN inv
                      ON (inv.ALMACEN_IDALMACEN = A.IDALMACEN
                          AND inv.PRODUCTO_IDPRODUCTO = :NEW.PRODUCTO_IDPRODUCTO);
  --Como estoy seguro que solo es una fila solo tengo que hacer un fetch, por lo cual no uso loops
    FETCH aux_cursor INTO v_inventario, v_num_venta;
-- Cierro el disparador
    CLOSE aux_cursor;

    if (v_inventario < :NEW.cantidad) THEN
        UPDATE VENTA SET ESTADO = '0' WHERE NUMERO = :NEW.VENTA_NUMERO;
        DBMS_OUTPUT.PUT_LINE('La cantidad ingresada del producto es mayor que la cantidad en inventario, estado de la VENTA actualizado al valor "0" ');
    end if;

    -- Calculamos el descuento del producto

END;