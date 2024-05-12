--create or replace view info_productos_trimestre as
SELECT *
FROM (SELECT TO_CHAR(FECHA, 'YYYY') AS ANIO,
             TO_CHAR(FECHA, 'Q')    AS TRIMESTRE,
             P.NOMBREPRODUCTO,
             DV.CANTIDAD
      FROM FACTURAVENTA F
               JOIN DETALLEVENTA DV ON F.NUMEROORDEN = DV.NUMEROORDEN
               JOIN PRODUCTO P ON DV.IDPRODUCTO = P.IDPRODUCTO)
    PIVOT (
    SUM(CANTIDAD)
    FOR (TRIMESTRE) IN
        ('1' AS TRIMESTRE_1,
        '2' AS TRIMESTRE_2,
        '3' AS TRIMESTRE_3,
        '4' AS TRIMESTRE_4)
    )
ORDER BY ANIO, NOMBREPRODUCTO;



-- 2. Genere una consulta que permita mostrar, dado un id Categoría especificado (select c1 from table where id = X)
-- por el usuario, el nombre de los producto, el rango de utilidad
-- ( alta si tiene una utilidad >1000000, media si es menor o igual a 1000000
-- y mayor a 300000 o baja si es menor o igual a 300000),
-- su nivel de composición (si tiene LEVEL 3 o mayor alto,
-- si tiene LEVEL menor que 3 y mayor a 1 medio y si su LEVEL es 1 bajo)

-- niveles de composición

select p.IDPRODUCTO,
       p.NOMBREPRODUCTO,
       level
from PRODUCTO p
start with p.IDPRODUCTO = 205
connect by prior p.ID_PRODUCTO_COMPUESTO = p.IDPRODUCTO;

-- Tabla de utilidad por producto

select id,
       producto,
       ganancia,
       case
           when ganancia > 1000000 THEN 'alta'
           when ganancia >= 300000 THEN 'media'
           else 'baja'
           end prioridad
from (select p.IDPRODUCTO                           id,
             p.NOMBREPRODUCTO                       producto,
             SUM(p.PRECIOVENTA - p.PRECIOCOMPRA) as ganancia
      FROM FACTURAVENTA f
               JOIN DETALLEVENTA d ON F.NUMEROORDEN = d.NUMEROORDEN
               RIGHT JOIN PRODUCTO p ON d.IDPRODUCTO = P.IDPRODUCTO
      group by p.NOMBREPRODUCTO, p.IDPRODUCTO) sub


select *
from PRODUCTO;



select *
from FACTURAVENTA f
         JOIN DETALLEVENTA d ON F.NUMEROORDEN = d.NUMEROORDEN
         RIGHT JOIN PRODUCTO p ON d.IDPRODUCTO = P.IDPRODUCTO
where p.IDPRODUCTO = 6

------------------------------------------------------------------------------------

select p.IDPRODUCTO,
       p.NOMBREPRODUCTO
from PRODUCTO p
where CATEGORIA_IDCATEGORIA = '1'
connect by prior p.IDPRODUCTO = p.ID_PRODUCTO_COMPUESTO


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PUNTO 2 --> CORRECTO.
select sub.IDPRODUCTO             id,
       sub.NOMBREPRODUCTO,
       sub.lvl,
       SUM(GANANCIA * d.CANTIDAD) ganancias
from (select p.IDPRODUCTO,
             p.NOMBREPRODUCTO,
             level as                         lvl,
             (P.PRECIOVENTA - P.PRECIOCOMPRA) ganancia
      from PRODUCTO p
      connect by prior p.IDPRODUCTO = p.ID_PRODUCTO_COMPUESTO
      start with (p.CATEGORIA_IDCATEGORIA = '1')) sub
         left join DETALLEVENTA d on (sub.IDPRODUCTO = d.IDPRODUCTO)
group by sub.IDPRODUCTO, sub.NOMBREPRODUCTO, sub.lvl;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Punto 3 --->

/* Genere una consulta en la cual por cada cliente se muestre su nombre, si su dirección
(mostrar la tipo domicilio, si no existe la del trabajo, sino indicar ninguna),
si es un cliente confiable o no (un cliente no confiable es aquel que ha cancelado alguna factura),
solo debe tener en cuenta los clientes que estén activos.  */

select  c.IDCLIENTE id,
        c.NOMBRE cliente,
      coalesce(d1.DIRECCIÓN,d2.DIRECCIÓN) direccion,
      coalesce (d1.IDTIPO, d2.IDTIPO) tipo_dir
        from CLIENTE c join
        (
    (select distinct c.IDCLIENTE from CLIENTE c join FACTURAVENTA f on c.IDCLIENTE = f.IDCLIENTE )
    MINUS
    ((select distinct c.idcliente from cliente c join FACTURAVENTA f on c.IDCLIENTE = f.IDCLIENTE
    where f.IDESTADO = (select idestado from ESTADOVENTA where DESCRIPCION = 'Anulada'))
)) sub on sub.IDCLIENTE = c.IDCLIENTE
left join DIRECCION d1 on (c.IDCLIENTE = d1.IDCLIENTE and d1.IDTIPO = (select IDTIPO from TIPODIRECCION where DESCRIPCION=' Tipo 1 - Trabajo'))
left join DIRECCION d2 on (c.IDCLIENTE = d2.IDCLIENTE and d2.IDTIPO = (select IDTIPO from TIPODIRECCION where DESCRIPCION=' Tipo 2 - Dimicilio'))

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    SELECT
    c.NOMBRE AS nombre_cliente,
    COALESCE(dt.DIRECCIÓN, dw.DIRECCIÓN, 'Ninguna') AS direccion,
    CASE
        WHEN EXISTS (SELECT 1 FROM FACTURAVENTA f WHERE f.IDCLIENTE = c.IDCLIENTE AND f.IDESTADO = 'Cancelada') THEN 'No Confiable'
        ELSE 'Confiable'
    END AS confiable
FROM
    CLIENTE c
    LEFT JOIN DIRECCION dt ON c.IDCLIENTE = dt.IDCLIENTE AND dt.IDTIPO = (SELECT IDTIPO FROM TIPODIRECCION WHERE DESCRIPCION = 'Tipo 2 - Domicilio')
    LEFT JOIN DIRECCION dw ON c.IDCLIENTE = dw.IDCLIENTE AND dw.IDTIPO = (SELECT IDTIPO FROM TIPODIRECCION WHERE DESCRIPCION = 'Tipo 1 - Trabajo')
    LEFT JOIN FACTURAVENTA f on c.IDCLIENTE = f.IDCLIENTE.
WHERE
    EXISTS (SELECT 1 FROM FACTURAVENTA f WHERE f.IDCLIENTE = c.IDCLIENTE);



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Punto 4.

/*
Pensando en optimización, Cree una vista que permita conocer:
por color,
por nombre de producto y categoría,
por categoría y color,
por tipo; el total de unidades vendidas y la cantidad de clientes que han comprado,
debe mostrar siempre el id y descripción de cada uno de los conceptos solicitados.

Realice luego una consulta que permita conocer el total de clientes y cantidad de unidades vendidas por categoría, especificando el color.

select
id_producto
nombre_producto
idcolor,
color,
id_categoria
categoria

*/



select p.IDPRODUCTO id_producto,
       --p.NOMBREPRODUCTO producto,
       col.IDCOLOR id_color,
       col.DESCRIPCION color,
       cat.IDCATEGORIA id_categoria,
       cat.DESCRIPCION categoria,
       SUM (d.CANTIDAD) cantidad_vendida,
       COUNT ( distinct f.IDCLIENTE)
from PRODUCTO p
         left join COLOR col on (p.COLOR_IDCOLOR = col.IDCOLOR)
         left join CATEGORIA cat on (p.CATEGORIA_IDCATEGORIA = cat.IDCATEGORIA)
         left join DETALLEVENTA d on (p.IDPRODUCTO = d.IDPRODUCTO)
        left join FACTURAVENTA f on (d.NUMEROORDEN = f.NUMEROORDEN)
group by grouping sets (
    (col.DESCRIPCION,col.IDCOLOR),
    --((p.NOMBREPRODUCTO, p.IDPRODUCTO),(cat.IDCATEGORIA, cat.IDCATEGORIA)),
    (p.IDPRODUCTO, CAT.IDCATEGORIA),
    --((cat.IDCATEGORIA, cat.DESCRIPCION), (col.DESCRIPCION,col.IDCOLOR)),
    (cat.IDCATEGORIA,col.IDCOLOR),
    (cat.IDCATEGORIA, cat.DESCRIPCION)
    );


select p.IDPRODUCTO, p.COLOR_IDCOLOR, count (distinct f.IDCLIENTE) as cantidad_clientes_compraron
from FACTURAVENTA f
         join DETALLEVENTA d on d.NUMEROORDEN = f.NUMEROORDEN
         right join PRODUCTO p on p.IDPRODUCTO = d.IDPRODUCTO
group by p.IDPRODUCTO, p.COLOR_IDCOLOR;
