-- CUBE EMBARAZADA.
-- Contar cuantos neonatos hay por embarazada, por obstetra y por clase,
-- por embarazada y obstetra,
-- por obstetra y clase, etc..

select
    cm.clase_codigo as clase,
    o.cedula,
    e.segsocial,
    count(n.identificacion)
from
    NEONATO n
    join EMBARAZADA_MADRE e on e.segsocial = n.embarazada_madre_segsocial
    join OBSTETRA o on o.cedula = e.obstetra_cedula
    join clases_madres cm on cm.embarazada_madre_segsocial = e.segsocial
GROUP BY CUBE (
        cm.clase_codigo,
        e.segsocial,
        o.cedula
    );



