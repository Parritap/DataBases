-- Consulta para saber cuantas personas hay en los departamentos
select count(NOMBRE_DEPARTAMENTO)
from INSCRIPCION i
         INNER JOIN CURSO c on c.ID_CURSO = i.CURSO_ID
         INNER JOIN DEPARTAMENTO d on d.ID_DEPARTAMENTO = c.DEPARTAMENTO_ID
GROUP BY (NOMBRE_DEPARTAMENTO)


------------------------------------------------------------------------------------------------------------------------------


-- CUBE:
-- Contar la cantidad de personas inscritas en cada curso, y así mísmo, la cantidad de
-- personas que están adheridas a los departamentos, como tambien la cantidad total de personas
-- en la universidad.
create or replace view
    departamento_curso_cantEstudiantes (departamento, curso, cantidad_estudiantes) as
select d.nombre_departamento  departamento,
       c.nombre_curso         curso,
       count(i.ESTUDIANTE_ID) cantidad_estudiantes
from DEPARTAMENTO d
         INNER JOIN CURSO c ON c.DEPARTAMENTO_ID = d.ID_DEPARTAMENTO
         INNER JOIN INSCRIPCION i ON i.CURSO_ID = c.ID_CURSO
group by cube (d.nombre_departamento, c.nombre_curso)
order by departamento nulls last, curso nulls last;

-- SELECT CLAUSE
select *
FROM departamento_curso_cantEstudiantes;


------------------------------------------------------------------------------------------------------------------------------

-- PIVOT:
-- Mostrar cuantos estudiantes han solicitados libros por departamento en cada bibiblioteca.


-- Cremos una tabla de estudiantes_departamentos.
create or replace view
    estudiante_departamento (id_estudiante, id_dpto) as
select i.ESTUDIANTE_ID,
       c.DEPARTAMENTO_ID
from CURSO c
         JOIN INSCRIPCION i ON c.ID_CURSO = i.CURSO_ID;


select *
from (select p.ESTUDIANTE_ID       as estudiante,
             b.NOMBRE_BIBLIOTECA   as biblioteca,
             d.NOMBRE_DEPARTAMENTO as dpto
      from PRESTAMO p
               join estudiante_departamento ed on p.ESTUDIANTE_ID = ed.id_estudiante
               join BIBLIOTECA b on b.ID_BIBLIOTECA = p.BIBLIOTECA_ID
               join DEPARTAMENTO d on ed.id_dpto = d.ID_DEPARTAMENTO)
    pivot (
    COUNT(estudiante)
    for dpto in (
        'Matemáticas',
        'Ciencias de la Computación',
        'Literatura',
        'Historia',
        'Física')
    )


------------------------------------------------------------------------------------------------------------------------------

-- GROUPING SET
-- Listar la cantidad de eventos realizados por año, por salón, por salón y año. Por último, mostrar la
-- cantidad de eventos totales (todo dentro del mismo query).


create or replace view aula_evento_fecha (id_aula, aula, evento, fecha_evento, anio_evento, mes_evento) as
select a.ID_AULA,
       a.NOMBRE_AULA,
       e.NOMBRE_EVENTO,
       e.FECHA_EVENTO,
       extract(year from e.FECHA_EVENTO)  as anio_evento,
       extract(month from e.FECHA_EVENTO) as mes_evento
from EVENTO e
         JOIN AULA a ON e.AULA_ID = a.ID_AULA


select aula,
       anio_evento,
       count(evento) as cantidad_eventos,
       grouping(aula),
       grouping(anio_evento)
from aula_evento_fecha
group by grouping sets (
    (anio_evento),
    ( aula),
    ( aula, anio_evento ),
    ()
    );

------------------------------------------------------------------------------------------------------------------------------


