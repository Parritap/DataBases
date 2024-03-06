/*
1)
El jefe de la compañía requiere un reporte que le permita analizar la cantidad de
unidades vendidas y el dinero ganado de cada producto, permitiendo, en caso de
quererlo, totalizar por cada uno la categoría y la sub-categoría del producto, así como
conocer el total general de la empresa. Cree una vista usando las cláusulas del ‘group
by’ que le permita consultar todo lo anterior.
*/

-- Total ganancias por
--      Categoria
--      Subcategoria
--      General (all).


-- Todos los productos unidos con sus detalles.
create or replace view producto_detalles as
select p.IDPRODUCTO, p.NOMBREPRODUCTO, p.CATEGORIA_IDCATEGORIA, d.CANTIDAD
from PRODUCTO p
         join DETALLEVENTA d on (p.IDPRODUCTO = d.IDPRODUCTO);

create or replace view info_financiera_producto as
select subquery.IDPRODUCTO,
       p.NOMBREPRODUCTO,
       subquery.unidades_vendidas,
       (subquery.unidades_vendidas * (p.PRECIOVENTA - p.PRECIOCOMPRA)) ganancia_total
from (
         (select IDPRODUCTO, SUM(CANTIDAD) unidades_vendidas
          from producto_detalles
          group by IDPRODUCTO) subquery
             join PRODUCTO p on (subquery.IDPRODUCTO = p.IDPRODUCTO));

select *
from info_financiera_producto;




select p.IDPRODUCTO,
       p.NOMBREPRODUCTO,
       p.CATEGORIA_IDCATEGORIA,
       SUM(d.CANTIDAD)                                    as cantidad_vendidas,
       SUM(d.CANTIDAD * (p.PRECIOVENTA - p.PRECIOCOMPRA)) as ganancia_total
from PRODUCTO p
         left join DETALLEVENTA d on (p.IDPRODUCTO = d.IDPRODUCTO)
group by (p.NOMBREPRODUCTO, p.IDPRODUCTO, CATEGORIA_IDCATEGORIA)





--Punto 1. Osma
create or replace view reporte_producto (producto, subcategoria, categoria, cantidad_vendida, ganancia, bool_cat, bool_sub_cat) as
select p.IDPRODUCTO producto,
       sub_cat.IDCATEGORIA subcategoria,
       cat.IDCATEGORIA categoria,
       SUM(d.CANTIDAD) as cantidad_vendida,
       SUM(d.CANTIDAD * (p.PRECIOVENTA - p.PRECIOCOMPRA)) as ganancia,
       grouping (sub_cat.IDCATEGORIA) bool_subcategoria,
       grouping (cat.IDCATEGORIA) bool_categoria
from
PRODUCTO p
left join CATEGORIA sub_cat on (p.CATEGORIA_IDCATEGORIA = sub_cat.IDCATEGORIA)
left join CATEGORIA cat on (sub_cat.IDCATEGORIAPADRE = cat.IDCATEGORIA)
left join DETALLEVENTA d on (d.IDPRODUCTO = p.IDPRODUCTO)
group by rollup  (p.IDPRODUCTO,cat.IDCATEGORIA,sub_cat.IDCATEGORIA)


-- Punto 2
/*
Basados en la vista anterior genere una consulta en la cual muestre la categoría
(categoría padre), subcategoría y el total de unidades vendidos de cada una tenga
presente que en caso de que la categoría del producto no tenga una categoría padre se
debe mostrar en el resultado el mismo nombre de la categoría (NVL).
 */


select NVL2(categoria, ''||categoria, 'Es categoria padre') as categoria,
       subcategoria,
       SUM(cantidad_vendida)
from reporte_producto
group by rollup ( categoria, subcategoria)

-- Punto 3