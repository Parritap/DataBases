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


-- ------------------------------------------------------------------
-- PUNTO 2 --> CORRECTO.
select sub.IDPRODUCTO id,
       sub.NOMBREPRODUCTO,
       sub.lvl,
       SUM (GANANCIA * d.CANTIDAD) ganancias
from (select p.IDPRODUCTO,
             p.NOMBREPRODUCTO,
             level as lvl,
             (P.PRECIOVENTA - P.PRECIOCOMPRA ) ganancia
      from PRODUCTO p
      connect by prior p.IDPRODUCTO = p.ID_PRODUCTO_COMPUESTO
      start with (p.CATEGORIA_IDCATEGORIA = '1')) sub
left join DETALLEVENTA d on (sub.IDPRODUCTO = d.IDPRODUCTO)
group by sub.IDPRODUCTO, sub.NOMBREPRODUCTO, sub.lvl;


-------------------------------------------------------------------------------
-- Punto 3 --->

select  c.IDCLIENTE id,
        c.NOMBRE cliente,
        -- TODO Poner la primera dirección no nula del cliente
       --(coalesce(
       --    (select DIRECCIÓN from d where d.IDTIPO = (select IDTIPO from TIPODIRECCION where DESCRIPCION = 'Tipo 1 - Trabajo')),
       --    (select DIRECCIÓN from d where d.IDTIPO = (select IDTIPO from TIPODIRECCION where DESCRIPCION = 'Tipo 2 - Domicilio'))
       -- )) as domicilio
        from CLIENTE c JOIN (
    (select distinct c.IDCLIENTE from CLIENTE c join FACTURAVENTA f on c.IDCLIENTE = f.IDCLIENTE )
    MINUS
    (select c.idcliente from cliente c join FACTURAVENTA f on c.IDCLIENTE = f.IDCLIENTE
    where f.IDESTADO != (select idestado from ESTADOVENTA where DESCRIPCION = 'Anulada')
)) sub on sub.IDCLIENTE = c.IDCLIENTE
join DIRECCION d on c.IDCLIENTE = d.IDCLIENTE


