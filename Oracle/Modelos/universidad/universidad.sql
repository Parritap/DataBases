-create table BIBLIOTECA
(
    ID_BIBLIOTECA     VARCHAR2(10) not null
        constraint BIBLIOTECA_PK
            primary key,
    NOMBRE_BIBLIOTECA VARCHAR2(50)
)
/

create table DEPARTAMENTO
(
    ID_DEPARTAMENTO     VARCHAR2(10) not null
        constraint DEPARTAMENTO_PK
            primary key,
    NOMBRE_DEPARTAMENTO VARCHAR2(50)
)
/

create table AULA
(
    ID_AULA         VARCHAR2(10) not null
        constraint AULA_PK
            primary key,
    NOMBRE_AULA     VARCHAR2(50),
    CAPACIDAD_AULA  NUMBER,
    TIPO_AULA       VARCHAR2(50),
    DEPARTAMENTO_ID VARCHAR2(10) not null
        constraint AULA_DEPARTAMENTO_FK
            references DEPARTAMENTO
)
/

create table ESTUDIANTE
(
    ID_ESTUDIANTE               VARCHAR2(10) not null
        constraint ESTUDIANTE_PK
            primary key,
    NOMBRE_ESTUDIANTE           VARCHAR2(20),
    APELLIDO_ESTUDIANTE         VARCHAR2(20),
    CORREO_ESTUDIANTIL          VARCHAR2(50),
    FECHA_NACIMIENTO_ESTUDIANTE DATE,
    TELEFONO_ESTUDIANTE         VARCHAR2(10)
)
/

create table EVENTO
(
    ID_EVENTO     VARCHAR2(10) not null
        constraint EVENTO_PK
            primary key,
    NOMBRE_EVENTO VARCHAR2(50),
    TIPO_EVENTO   VARCHAR2(20),
    LUGAR_EVENTO  VARCHAR2(20),
    FECHA_EVENTO  DATE,
    AULA_ID       VARCHAR2(10) not null
        constraint EVENTO_AULA_FK
            references AULA
)
/

create table LIBRO
(
    ID_LIBRO     VARCHAR2(10) not null
        constraint LIBRO_PK
            primary key,
    NOMBRE_LIBRO VARCHAR2(50),
    GENERO_LIBRO VARCHAR2(100),
    AUTOR_LIBRO  VARCHAR2(50),
    NUM_PAGINAS  NUMBER
)
/

create table PRESTAMO
(
    PRESTAMO_ID      NUMBER       not null
        constraint PRESTAMO_PK
            primary key,
    ESTUDIANTE_ID    VARCHAR2(10) not null
        constraint PRESTAMO_ESTUDIANTE_FK
            references ESTUDIANTE,
    BIBLIOTECA_ID    VARCHAR2(10) not null
        constraint PRESTAMO_BIBLIOTECA_FK
            references BIBLIOTECA,
    FECHA_PRESTAMO   DATE,
    FECHA_DEVOLUCION DATE,
    LIBRO_ID         VARCHAR2(50)
        constraint PRESTAMO_LIBRO_FK
            references LIBRO
)
/

create table PROFESOR
(
    ID_PROFESOR              VARCHAR2(10) not null
        constraint PROFESOR_PK
            primary key,
    NOMBRE_PROFESOR          VARCHAR2(50),
    APELLIDO_PROFESOR        VARCHAR2(50),
    TELEFONO_PROFESOR        VARCHAR2(10),
    CORREO_INSTITUCIONAL     VARCHAR2(100),
    ESPECIALIZACION_PROFESOR VARCHAR2(50)
)
/

create table CURSO
(
    ID_CURSO        VARCHAR2(10) not null
        constraint CURSO_PK
            primary key,
    NOMBRE_CURSO    VARCHAR2(50),
    HORARIO_CURSO   DATE,
    PROFESOR_ID     VARCHAR2(10) not null
        constraint CURSO_PROFESOR_FK
            references PROFESOR,
    AULA_ID         VARCHAR2(10) not null
        constraint CURSO_AULA_FK
            references AULA,
    DEPARTAMENTO_ID VARCHAR2(10) not null
        constraint CURSO_DEPARTAMENTO_FK
            references DEPARTAMENTO
)
/

create table INSCRIPCION
(
    CURSO_ID      VARCHAR2(10) not null
        constraint INSCRIPCION_CURSO_FK
            references CURSO,
    ESTUDIANTE_ID VARCHAR2(10) not null
        constraint INSCRIPCION_ESTUDIANTE_FK
            references ESTUDIANTE
)
/



INSERT ALL
    INTO departamento (id_departamento, nombre_departamento) VALUES ('DPTO001', 'Matemáticas')
    INTO departamento (id_departamento, nombre_departamento) VALUES ('DPTO002', 'Ciencias de la Computación')
    INTO departamento (id_departamento, nombre_departamento) VALUES ('DPTO003', 'Literatura')
    INTO departamento (id_departamento, nombre_departamento) VALUES ('DPTO004', 'Historia')
    INTO departamento (id_departamento, nombre_departamento) VALUES ('DPTO005', 'Física')
SELECT 1 FROM dual;

-- Generación de aulas ---> 4 aulas por Dpto

INSERT ALL
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A001', 'Aula 1', 50, 'Aula Normal', 'DPTO001')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A002', 'Aula 2', 40, 'Laboratorio', 'DPTO001')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A003', 'Aula 3', 60, 'Aula de Conferencias', 'DPTO001')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A004', 'Aula 4', 30, 'Sala de Estudio', 'DPTO001')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A101', 'Aula 101', 45, 'Aula Normal', 'DPTO002')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A102', 'Aula 102', 35, 'Laboratorio', 'DPTO002')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A103', 'Aula 103', 55, 'Aula de Conferencias', 'DPTO002')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A104', 'Aula 104', 25, 'Sala de Estudio', 'DPTO002')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A201', 'Aula 201', 40, 'Aula Normal', 'DPTO003')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A202', 'Aula 202', 30, 'Laboratorio', 'DPTO003')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A203', 'Aula 203', 50, 'Aula de Conferencias', 'DPTO003')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A204', 'Aula 204', 20, 'Sala de Estudio', 'DPTO003')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A301', 'Aula 301', 55, 'Aula Normal', 'DPTO004')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A302', 'Aula 302', 45, 'Laboratorio', 'DPTO004')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A303', 'Aula 303', 65, 'Aula de Conferencias', 'DPTO004')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A304', 'Aula 304', 35, 'Sala de Estudio', 'DPTO004')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A401', 'Aula 401', 60, 'Aula Normal', 'DPTO005')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A402', 'Aula 402', 50, 'Laboratorio', 'DPTO005')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A403', 'Aula 403', 70, 'Aula de Conferencias', 'DPTO005')
    INTO aula (id_aula, nombre_aula, capacidad_aula, tipo_aula, departamento_id) VALUES ('A404', 'Aula 404', 40, 'Sala de Estudio', 'DPTO005')
SELECT 1 FROM dual;


-- Generación de eventos


INSERT ALL
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT001', 'Conferencia de Matemáticas', 'Conferencia', 'Aula 1', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'A001')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT002', 'Taller de Ciencias de la Computación', 'Taller', 'Aula 101', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'A101')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT003', 'Presentación de Literatura Moderna', 'Presentación', 'Aula 201', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'A201')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT004', 'Charla de Historia Antigua', 'Charla', 'Aula 301', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'A301')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT005', 'Exhibición de Física Experimental', 'Exhibición', 'Aula 401', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A401')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT006', 'Seminario de Álgebra Lineal', 'Seminario', 'Aula 2', TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'A002')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT007', 'Hackatón de Programación', 'Hackatón', 'Aula 102', TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'A102')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT008', 'Recital de Poesía Contemporánea', 'Recital', 'Aula 202', TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'A202')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT009', 'Conferencia sobre la Edad Media', 'Conferencia', 'Aula 302', TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'A302')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT010', 'Experimentos de Óptica', 'Experimento', 'Aula 402', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'A402')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT011', 'Taller de Geometría', 'Taller', 'Aula 3', TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'A003')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT012', 'Charla de Ciberseguridad', 'Charla', 'Aula 103', TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'A103')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT013', 'Presentación de Novela Histórica', 'Presentación', 'Aula 203', TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'A203')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT014', 'Sesión de Historia del Arte', 'Sesión', 'Aula 303', TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'A303')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT015', 'Demostración de Experimentos Físicos', 'Demostración', 'Aula 403', TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'A403')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT016', 'Conferencia de Álgebra Abstracta', 'Conferencia', 'Aula 4', TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'A004')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT017', 'Taller de Desarrollo Web', 'Taller', 'Aula 104', TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'A104')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT018', 'Presentación de Poesía Clásica', 'Presentación', 'Aula 204', TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'A204')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT019', 'Charla de Historia Contemporánea', 'Charla', 'Aula 304', TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'A304')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT020', 'Experimentos de Mecánica Cuántica', 'Experimento', 'Aula 404', TO_DATE('2024-03-23', 'YYYY-MM-DD'), 'A404')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT021', 'Seminario de Ecuaciones Diferenciales', 'Seminario', 'Aula 1', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'A001')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT022', 'Hackatón de Inteligencia Artificial', 'Hackatón', 'Aula 101', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'A101')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT023', 'Recital de Poesía Moderna', 'Recital', 'Aula 201', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'A201')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT024', 'Charla de Historia Antigua', 'Charla', 'Aula 301', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A301')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT025', 'Exhibición de Óptica', 'Exhibición', 'Aula 401', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'A401')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT026', 'Seminario de Cálculo Avanzado', 'Seminario', 'Aula 2', TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'A002')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT027', 'Hackatón de Seguridad Informática', 'Hackatón', 'Aula 102', TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'A102')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT028', 'Presentación de Poesía Contemporánea', 'Presentación', 'Aula 202', TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'A202')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT029', 'Sesión de Historia del Arte', 'Sesión', 'Aula 302', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'A302')
    INTO evento (id_evento, nombre_evento, tipo_evento, lugar_evento, fecha_evento, aula_id) VALUES ('EVT030', 'Demostración de Experimentos Físicos', 'Demostración', 'Aula 402', TO_DATE('2024-03-26', 'YYYY-MM-DD'), 'A402')
SELECT 1 FROM dual;


-- Generacion de maestros

INSERT ALL
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF001', 'Juan', 'González', '123456789', 'juan.gonzalez@universidad.com', 'Matemáticas')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF002', 'Ana', 'Martínez', '987654321', 'ana.martinez@universidad.com', 'Ciencias de la Computación')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF003', 'Carlos', 'López', '555555555', 'carlos.lopez@universidad.com', 'Literatura')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF004', 'María', 'Rodríguez', '666666666', 'maria.rodriguez@universidad.com', 'Historia')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF005', 'Pedro', 'Sánchez', '444444444', 'pedro.sanchez@universidad.com', 'Física')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF006', 'Laura', 'Fernández', '111111111', 'laura.fernandez@universidad.com', 'Matemáticas')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF007', 'Sergio', 'Hernández', '222222222', 'sergio.hernandez@universidad.com', 'Ciencias de la Computación')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF008', 'Elena', 'Díaz', '333333333', 'elena.diaz@universidad.com', 'Literatura')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF009', 'Francisco', 'Pérez', '777777777', 'francisco.perez@universidad.com', 'Historia')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF010', 'Isabel', 'López', '888888888', 'isabel.lopez@universidad.com', 'Física')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF011', 'Javier', 'Gómez', '999999999', 'javier.gomez@universidad.com', 'Matemáticas')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF012', 'Marta', 'García', '666666666', 'marta.garcia@universidad.com', 'Ciencias de la Computación')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF013', 'Roberto', 'Martínez', '555555555', 'roberto.martinez@universidad.com', 'Literatura')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF014', 'Carmen', 'Fernández', '444444444', 'carmen.fernandez@universidad.com', 'Historia')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF015', 'Alejandro', 'Sánchez', '333333333', 'alejandro.sanchez@universidad.com', 'Física')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF016', 'Patricia', 'López', '222222222', 'patricia.lopez@universidad.com', 'Matemáticas')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF017', 'Raúl', 'Hernández', '111111111', 'raul.hernandez@universidad.com', 'Ciencias de la Computación')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF018', 'Adela', 'Díaz', '777777777', 'adela.diaz@universidad.com', 'Literatura')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF019', 'Ricardo', 'Pérez', '888888888', 'ricardo.perez@universidad.com', 'Historia')
    INTO profesor (id_profesor, nombre_profesor, apellido_profesor, telefono_profesor, correo_institucional, especializacion_profesor) VALUES ('PROF020', 'Lucía', 'López', '999999999', 'lucia.lopez@universidad.com', 'Física')
SELECT 1 FROM dual;

INSERT ALL
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR001', 'Álgebra Lineal', TO_DATE('2024-03-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF001', 'A001', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR002', 'Programación Avanzada', TO_DATE('2024-03-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF002', 'A101', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR003', 'Literatura Clásica', TO_DATE('2024-03-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF003', 'A201', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR004', 'Historia Antigua', TO_DATE('2024-03-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF004', 'A301', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR005', 'Física Cuántica', TO_DATE('2024-03-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF005', 'A401', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR006', 'Geometría Analítica', TO_DATE('2024-03-06 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF006', 'A002', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR007', 'Desarrollo Web', TO_DATE('2024-03-07 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF007', 'A102', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR008', 'Poesía Contemporánea', TO_DATE('2024-03-08 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF008', 'A202', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR009', 'Historia Contemporánea', TO_DATE('2024-03-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF009', 'A302', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR010', 'Óptica Experimental', TO_DATE('2024-03-10 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF010', 'A402', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR011', 'Álgebra Abstracta', TO_DATE('2024-03-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF011', 'A003', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR012', 'Inteligencia Artificial', TO_DATE('2024-03-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF012', 'A103', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR013', 'Novela Histórica', TO_DATE('2024-03-13 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF013', 'A203', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR014', 'Historia del Arte', TO_DATE('2024-03-14 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF014', 'A303', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR015', 'Mecánica Cuántica', TO_DATE('2024-03-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF015', 'A403', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR016', 'Ecuaciones Diferenciales', TO_DATE('2024-03-16 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF016', 'A004', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR017', 'Seminario de Cálculo Avanzado', TO_DATE('2024-03-17 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF017', 'A104', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR018', 'Hackatón de Seguridad Informática', TO_DATE('2024-03-18 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF018', 'A204', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR019', 'Poesía Moderna', TO_DATE('2024-03-19 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF019', 'A304', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR020', 'Experimentos Físicos', TO_DATE('2024-03-20 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF020', 'A404', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR021', 'Matemáticas Avanzadas', TO_DATE('2024-03-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF001', 'A001', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR022', 'Desarrollo de Software', TO_DATE('2024-03-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF002', 'A101', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR023', 'Presentación de Poesía Clásica', TO_DATE('2024-03-23 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF003', 'A201', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR024', 'Historia Medieval', TO_DATE('2024-03-24 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF004', 'A301', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR025', 'Química Experimental', TO_DATE('2024-03-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF005', 'A401', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR026', 'Álgebra Lineal Avanzada', TO_DATE('2024-03-26 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF006', 'A002', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR027', 'Introducción a la Inteligencia Artificial', TO_DATE('2024-03-27 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF007', 'A102', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR028', 'Poesía Contemporánea II', TO_DATE('2024-03-28 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF008', 'A202', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR029', 'Historia del Siglo XX', TO_DATE('2024-03-29 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF009', 'A302', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR030', 'Física Moderna', TO_DATE('2024-03-30 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF010', 'A402', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR031', 'Geometría Descriptiva', TO_DATE('2024-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF011', 'A003', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR032', 'Desarrollo de Aplicaciones Web', TO_DATE('2024-04-02 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF012', 'A103', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR033', 'Presentación de Novela Histórica', TO_DATE('2024-04-03 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF013', 'A203', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR034', 'Historia del Arte Medieval', TO_DATE('2024-04-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF014', 'A303', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR035', 'Óptica Cuántica', TO_DATE('2024-04-05 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF015', 'A403', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR036', 'Álgebra Multilineal', TO_DATE('2024-04-06 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF016', 'A004', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR037', 'Inteligencia Artificial Avanzada', TO_DATE('2024-04-07 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF017', 'A104', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR038', 'Hackatón de Desarrollo Web', TO_DATE('2024-04-08 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF018', 'A204', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR039', 'Poesía Romántica', TO_DATE('2024-04-09 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF019', 'A304', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR040', 'Experimentos Químicos', TO_DATE('2024-04-10 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF020', 'A404', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR041', 'Cálculo Diferencial', TO_DATE('2024-04-11 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF001', 'A001', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR042', 'Introducción a la Robótica', TO_DATE('2024-04-12 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF002', 'A101', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR043', 'Presentación de Poesía Moderna', TO_DATE('2024-04-13 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF003', 'A201', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR044', 'Historia del Renacimiento', TO_DATE('2024-04-14 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF004', 'A301', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR045', 'Física Cuántica Avanzada', TO_DATE('2024-04-15 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF005', 'A401', 'DPTO005')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR046', 'Topología', TO_DATE('2024-04-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF006', 'A002', 'DPTO001')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR047', 'Inteligencia Artificial para Sistemas Autónomos', TO_DATE('2024-04-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF007', 'A102', 'DPTO002')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR048', 'Hackatón de Seguridad en Redes', TO_DATE('2024-04-18 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF008', 'A202', 'DPTO003')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR049', 'Sesión de Poesía Romántica', TO_DATE('2024-04-19 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF009', 'A302', 'DPTO004')
    INTO curso (id_curso, nombre_curso, horario_curso, profesor_id, aula_id, departamento_id) VALUES ('CUR050', 'Mecánica Cuántica Avanzada', TO_DATE('2024-04-20 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PROF010', 'A402', 'DPTO005')
SELECT 1 FROM dual;




-- Generacion de estudiantes:

INSERT ALL
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST001', 'Juan', 'González', 'juan.gonzalez@email.com', TO_DATE('2000-01-15', 'YYYY-MM-DD'), '1234567890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST002', 'Ana', 'Martínez', 'ana.martinez@email.com', TO_DATE('1999-05-20', 'YYYY-MM-DD'), '9876543210')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST003', 'Carlos', 'Sánchez', 'carlos.sanchez@email.com', TO_DATE('2001-02-10', 'YYYY-MM-DD'), '5647382910')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST004', 'Laura', 'Rodríguez', 'laura.rodriguez@email.com', TO_DATE('2000-08-03', 'YYYY-MM-DD'), '1092837465')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST005', 'Martín', 'Fernández', 'martin.fernandez@email.com', TO_DATE('1999-11-25', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST006', 'Sofía', 'López', 'sofia.lopez@email.com', TO_DATE('2001-03-18', 'YYYY-MM-DD'), '2345678901')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST007', 'Pedro', 'Díaz', 'pedro.diaz@email.com', TO_DATE('2000-07-12', 'YYYY-MM-DD'), '8901234567')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST008', 'Isabel', 'Pérez', 'isabel.perez@email.com', TO_DATE('1998-09-29', 'YYYY-MM-DD'), '3456789012')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST009', 'Alejandro', 'Hernández', 'alejandro.hernandez@email.com', TO_DATE('2000-04-05', 'YYYY-MM-DD'), '6789012345')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST010', 'María', 'Gómez', 'maria.gomez@email.com', TO_DATE('1999-12-08', 'YYYY-MM-DD'), '1230987654')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST011', 'Hugo', 'Vargas', 'hugo.vargas@email.com', TO_DATE('2001-06-14', 'YYYY-MM-DD'), '5678901234')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST012', 'Carmen', 'Torres', 'carmen.torres@email.com', TO_DATE('2000-10-30', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST013', 'Diego', 'Fuentes', 'diego.fuentes@email.com', TO_DATE('1998-02-22', 'YYYY-MM-DD'), '8907654321')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST014', 'Gabriela', 'Santos', 'gabriela.santos@email.com', TO_DATE('2000-09-17', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST015', 'Javier', 'Molina', 'javier.molina@email.com', TO_DATE('1999-01-03', 'YYYY-MM-DD'), '6789012345')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST016', 'Luisa', 'Ramírez', 'luisa.ramirez@email.com', TO_DATE('2001-04-28', 'YYYY-MM-DD'), '3456789012')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST017', 'Manuel', 'Gutierrez', 'manuel.gutierrez@email.com', TO_DATE('1999-08-11', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST018', 'Silvia', 'Alvarez', 'silvia.alvarez@email.com', TO_DATE('2000-11-26', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST019', 'Raúl', 'Cabrera', 'raul.cabrera@email.com', TO_DATE('1998-12-04', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST020', 'Elena', 'Luna', 'elena.luna@email.com', TO_DATE('2000-05-19', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST021', 'Andrés', 'Castillo', 'andres.castillo@email.com', TO_DATE('2001-07-22', 'YYYY-MM-DD'), '5678901234')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST022', 'Natalia', 'Orozco', 'natalia.orozco@email.com', TO_DATE('2000-09-12', 'YYYY-MM-DD'), '2345678901')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST023', 'Francisco', 'Chávez', 'francisco.chavez@email.com', TO_DATE('1999-01-28', 'YYYY-MM-DD'), '8901234567')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST024', 'Lucía', 'García', 'lucia.garcia@email.com', TO_DATE('2000-04-15', 'YYYY-MM-DD'), '3456789012')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST025', 'Fernando', 'Mendez', 'fernando.mendez@email.com', TO_DATE('1998-11-08', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST026', 'Valentina', 'Herrera', 'valentina.herrera@email.com', TO_DATE('2001-02-14', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST027', 'Jorge', 'Romero', 'jorge.romero@email.com', TO_DATE('2000-05-30', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST028', 'Camila', 'Paredes', 'camila.paredes@email.com', TO_DATE('1999-03-22', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST029', 'Ricardo', 'Vega', 'ricardo.vega@email.com', TO_DATE('2000-10-05', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST030', 'Gabriela', 'Navarro', 'gabriela.navarro@email.com', TO_DATE('1998-12-19', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST031', 'Santiago', 'Guzmán', 'santiago.guzman@email.com', TO_DATE('2001-05-24', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST032', 'Paula', 'Serrano', 'paula.serrano@email.com', TO_DATE('2000-08-09', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST033', 'Eduardo', 'Cabrera', 'eduardo.cabrera@email.com', TO_DATE('1999-01-25', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST034', 'Marina', 'Flores', 'marina.flores@email.com', TO_DATE('2000-09-10', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST035', 'Martín', 'Mendoza', 'martin.mendoza@email.com', TO_DATE('1998-11-02', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST036', 'Valeria', 'Guerrero', 'valeria.guerrero@email.com', TO_DATE('2001-03-17', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST037', 'Adrián', 'Rojas', 'adrian.rojas@email.com', TO_DATE('2000-06-02', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST038', 'Mariana', 'Hernández', 'mariana.hernandez@email.com', TO_DATE('1999-02-15', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST039', 'Alejandro', 'López', 'alejandro.lopez@email.com', TO_DATE('2000-10-30', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST040', 'Daniela', 'Soto', 'daniela.soto@email.com', TO_DATE('1998-12-15', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST041', 'Rosa', 'Pérez', 'rosa.perez@email.com', TO_DATE('2001-04-18', 'YYYY-MM-DD'), '5678901234')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST042', 'Javier', 'Martínez', 'javier.martinez@email.com', TO_DATE('2000-08-05', 'YYYY-MM-DD'), '2345678901')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST043', 'Catalina', 'Molina', 'catalina.molina@email.com', TO_DATE('1999-02-20', 'YYYY-MM-DD'), '8901234567')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST044', 'Andrés', 'Gómez', 'andres.gomez@email.com', TO_DATE('2000-05-15', 'YYYY-MM-DD'), '3456789012')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST045', 'Laura', 'Fernández', 'laura.fernandez@email.com', TO_DATE('1998-12-28', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST046', 'Diego', 'Herrera', 'diego.herrera@email.com', TO_DATE('2001-01-14', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST047', 'Carolina', 'Sánchez', 'carolina.sanchez@email.com', TO_DATE('2000-04-30', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST048', 'Federico', 'Ortega', 'federico.ortega@email.com', TO_DATE('1999-03-22', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST049', 'Isabella', 'Gutiérrez', 'isabella.gutierrez@email.com', TO_DATE('2000-11-05', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST050', 'Mateo', 'Navarro', 'mateo.navarro@email.com', TO_DATE('1998-10-19', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST051', 'Valeria', 'Vargas', 'valeria.vargas@email.com', TO_DATE('2001-07-24', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST052', 'Andrés', 'Díaz', 'andres.diaz@email.com', TO_DATE('2000-09-09', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST053', 'Mariana', 'Torres', 'mariana.torres@email.com', TO_DATE('1999-02-26', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST054', 'Juan', 'Mendez', 'juan.mendez@email.com', TO_DATE('2000-10-11', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST055', 'Lucía', 'Romero', 'lucia.romero@email.com', TO_DATE('1998-11-25', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST056', 'Gabriel', 'Serrano', 'gabriel.serrano@email.com', TO_DATE('2001-03-20', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST057', 'Daniela', 'Gómez', 'daniela.gomez@email.com', TO_DATE('2000-06-05', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST058', 'Sebastián', 'Herrera', 'sebastian.herrera@email.com', TO_DATE('1999-02-18', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST059', 'Valentina', 'Rojas', 'valentina.rojas@email.com', TO_DATE('2000-09-02', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST060', 'Martín', 'Cabrera', 'martin.cabrera@email.com', TO_DATE('1998-12-16', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST061', 'Camilo', 'Soto', 'camilo.soto@email.com', TO_DATE('2001-04-08', 'YYYY-MM-DD'), '5678901234')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST062', 'Valeria', 'Orozco', 'valeria.orozco@email.com', TO_DATE('2000-08-25', 'YYYY-MM-DD'), '2345678901')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST063', 'Joaquín', 'Chávez', 'joaquin.chavez@email.com', TO_DATE('1999-02-10', 'YYYY-MM-DD'), '8901234567')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST064', 'Luciana', 'García', 'luciana.garcia@email.com', TO_DATE('2000-05-27', 'YYYY-MM-DD'), '3456789012')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST065', 'Fernando', 'Molina', 'fernando.molina@email.com', TO_DATE('1998-12-10', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST066', 'Valentina', 'Herrera', 'valentina.herrera@email.com', TO_DATE('2001-01-14', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST067', 'Jorge', 'Romero', 'jorge.romero@email.com', TO_DATE('2000-04-30', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST068', 'Camila', 'Paredes', 'camila.paredes@email.com', TO_DATE('1999-03-22', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST069', 'Ricardo', 'Vega', 'ricardo.vega@email.com', TO_DATE('2000-10-05', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST070', 'Gabriela', 'Navarro', 'gabriela.navarro@email.com', TO_DATE('1998-12-19', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST071', 'Santiago', 'Guzmán', 'santiago.guzman@email.com', TO_DATE('2001-05-24', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST072', 'Paula', 'Serrano', 'paula.serrano@email.com', TO_DATE('2000-08-09', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST073', 'Eduardo', 'Cabrera', 'eduardo.cabrera@email.com', TO_DATE('1999-01-25', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST074', 'Marina', 'Flores', 'marina.flores@email.com', TO_DATE('2000-09-10', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST075', 'Martín', 'Mendoza', 'martin.mendoza@email.com', TO_DATE('1998-11-02', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST076', 'Valeria', 'Guerrero', 'valeria.guerrero@email.com', TO_DATE('2001-03-17', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST077', 'Adrián', 'Rojas', 'adrian.rojas@email.com', TO_DATE('2000-06-02', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST078', 'Mariana', 'Hernández', 'mariana.hernandez@email.com', TO_DATE('1999-02-15', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST079', 'Alejandro', 'López', 'alejandro.lopez@email.com', TO_DATE('2000-10-30', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST080', 'Daniela', 'Soto', 'daniela.soto@email.com', TO_DATE('1998-12-15', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST081', 'Rosa', 'Pérez', 'rosa.perez@email.com', TO_DATE('2001-04-18', 'YYYY-MM-DD'), '5678901234')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST082', 'Javier', 'Martínez', 'javier.martinez@email.com', TO_DATE('2000-08-05', 'YYYY-MM-DD'), '2345678901')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST083', 'Catalina', 'Molina', 'catalina.molina@email.com', TO_DATE('1999-02-20', 'YYYY-MM-DD'), '8901234567')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST084', 'Andrés', 'Gómez', 'andres.gomez@email.com', TO_DATE('2000-05-15', 'YYYY-MM-DD'), '3456789012')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST085', 'Laura', 'Fernández', 'laura.fernandez@email.com', TO_DATE('1998-12-28', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST086', 'Diego', 'Herrera', 'diego.herrera@email.com', TO_DATE('2001-01-14', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST087', 'Carolina', 'Sánchez', 'carolina.sanchez@email.com', TO_DATE('2000-04-30', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST088', 'Federico', 'Ortega', 'federico.ortega@email.com', TO_DATE('1999-03-22', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST089', 'Isabella', 'Gutiérrez', 'isabella.gutierrez@email.com', TO_DATE('2000-11-05', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST090', 'Mateo', 'Navarro', 'mateo.navarro@email.com', TO_DATE('1998-10-19', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST091', 'Valeria', 'Vargas', 'valeria.vargas@email.com', TO_DATE('2001-07-24', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST092', 'Andrés', 'Díaz', 'andres.diaz@email.com', TO_DATE('2000-09-09', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST093', 'Mariana', 'Torres', 'mariana.torres@email.com', TO_DATE('1999-02-26', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST094', 'Juan', 'Mendez', 'juan.mendez@email.com', TO_DATE('2000-10-11', 'YYYY-MM-DD'), '2109876543')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST095', 'Lucía', 'Romero', 'lucia.romero@email.com', TO_DATE('1998-11-25', 'YYYY-MM-DD'), '7654321098')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST096', 'Gabriel', 'Serrano', 'gabriel.serrano@email.com', TO_DATE('2001-03-20', 'YYYY-MM-DD'), '4321098765')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST097', 'Daniela', 'Gómez', 'daniela.gomez@email.com', TO_DATE('2000-06-05', 'YYYY-MM-DD'), '1098765432')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST098', 'Sebastián', 'Herrera', 'sebastian.herrera@email.com', TO_DATE('1999-02-18', 'YYYY-MM-DD'), '8765432109')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST099', 'Valentina', 'Rojas', 'valentina.rojas@email.com', TO_DATE('2000-09-02', 'YYYY-MM-DD'), '5432167890')
    INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST100', 'Martín', 'Cabrera', 'martin.cabrera@email.com', TO_DATE('1998-12-16', 'YYYY-MM-DD'), '2109876543')
SELECT 1 FROM dual;

-- Los siguientes serán los estudiantes sin curso, estos servirán para hacer uso de la función NVL().
INSERT ALL
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST101', 'Gabriela', 'Martínez', 'gabriela.martinez@email.com', TO_DATE('1999-04-02', 'YYYY-MM-DD'), '9876543210')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST102', 'Ricardo', 'González', 'ricardo.gonzalez@email.com', TO_DATE('2000-07-18', 'YYYY-MM-DD'), '5647382910')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST103', 'Elena', 'Sánchez', 'elena.sanchez@email.com', TO_DATE('1999-09-05', 'YYYY-MM-DD'), '1092837465')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST104', 'Diego', 'Rodríguez', 'diego.rodriguez@email.com', TO_DATE('2001-01-30', 'YYYY-MM-DD'), '8765432109')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST105', 'María', 'Fernández', 'maria.fernandez@email.com', TO_DATE('2000-04-14', 'YYYY-MM-DD'), '2345678901')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST106', 'Pablo', 'López', 'pablo.lopez@email.com', TO_DATE('1998-08-27', 'YYYY-MM-DD'), '8901234567')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST107', 'Sara', 'Díaz', 'sara.diaz@email.com', TO_DATE('2000-12-22', 'YYYY-MM-DD'), '3456789012')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST108', 'Rafael', 'Pérez', 'rafael.perez@email.com', TO_DATE('1999-05-09', 'YYYY-MM-DD'), '6789012345')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST109', 'Isabel', 'Hernández', 'isabel.hernandez@email.com', TO_DATE('2001-09-02', 'YYYY-MM-DD'), '1230987654')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST110', 'Alejandro', 'Gómez', 'alejandro.gomez@email.com', TO_DATE('1998-11-15', 'YYYY-MM-DD'), '5678901234')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST111', 'Laura', 'Torres', 'laura.torres@email.com', TO_DATE('2000-03-08', 'YYYY-MM-DD'), '2109876543')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST112', 'Carlos', 'Fuentes', 'carlos.fuentes@email.com', TO_DATE('1999-06-24', 'YYYY-MM-DD'), '8907654321')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST113', 'Gabriela', 'Santos', 'gabriela.santos@email.com', TO_DATE('2001-11-17', 'YYYY-MM-DD'), '5432167890')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST114', 'Javier', 'Molina', 'javier.molina@email.com', TO_DATE('2000-02-03', 'YYYY-MM-DD'), '6789012345')
INTO estudiante (id_estudiante, nombre_estudiante, apellido_estudiante, correo_estudiantil, fecha_nacimiento_estudiante, telefono_estudiante) VALUES ('EST115', 'Luisa', 'Ramírez', 'luisa.ramirez@email.com', TO_DATE('1998-10-28', 'YYYY-MM-DD'), '3456789012')
SELECT 1 FROM dual;


INSERT ALL
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR037', 'EST001')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR036', 'EST002')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR027', 'EST003')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR030', 'EST004')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR037', 'EST005')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR028', 'EST006')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR008', 'EST007')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR034', 'EST008')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR044', 'EST009')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR031', 'EST010')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR020', 'EST011')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR038', 'EST012')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR035', 'EST013')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR003', 'EST014')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR044', 'EST015')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR044', 'EST016')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR012', 'EST017')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR035', 'EST018')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR042', 'EST019')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR003', 'EST020')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR033', 'EST021')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR049', 'EST022')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR016', 'EST023')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR042', 'EST024')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR022', 'EST025')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR026', 'EST026')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR021', 'EST027')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR040', 'EST028')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR010', 'EST029')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR035', 'EST030')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR047', 'EST031')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR037', 'EST032')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR022', 'EST033')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR038', 'EST034')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR041', 'EST035')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR012', 'EST036')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR030', 'EST037')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR023', 'EST038')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR014', 'EST039')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR007', 'EST040')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR020', 'EST041')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR005', 'EST042')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR021', 'EST043')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR009', 'EST044')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR010', 'EST045')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR007', 'EST046')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR045', 'EST047')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR050', 'EST048')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR016', 'EST049')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR018', 'EST050')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR041', 'EST051')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR037', 'EST052')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR033', 'EST053')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR001', 'EST054')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR002', 'EST055')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR050', 'EST056')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR024', 'EST057')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR044', 'EST058')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR030', 'EST059')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR050', 'EST060')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR036', 'EST061')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR002', 'EST062')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR022', 'EST063')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR004', 'EST064')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR001', 'EST065')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR006', 'EST066')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR012', 'EST067')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR011', 'EST068')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR042', 'EST069')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR042', 'EST070')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR018', 'EST071')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR001', 'EST072')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR022', 'EST073')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR010', 'EST074')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR010', 'EST075')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR025', 'EST076')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR023', 'EST077')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR002', 'EST078')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR039', 'EST079')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR028', 'EST080')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR010', 'EST081')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR008', 'EST082')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR043', 'EST083')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR034', 'EST084')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR033', 'EST085')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR043', 'EST086')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR022', 'EST087')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR017', 'EST088')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR042', 'EST089')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR021', 'EST090')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR011', 'EST091')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR040', 'EST092')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR002', 'EST093')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR020', 'EST094')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR019', 'EST095')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR049', 'EST096')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR013', 'EST097')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR004', 'EST098')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR019', 'EST099')
    INTO inscripcion (curso_id, estudiante_id) VALUES ('CUR050', 'EST100')
SELECT 1 FROM dual;

INSERT ALL
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB001', 'The Great Gatsby', 'Fiction', 'F. Scott Fitzgerald', 250)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB002', 'To Kill a Mockingbird', 'Classics', 'Harper Lee', 320)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB003', '1984', 'Science Fiction', 'George Orwell', 300)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB004', 'Pride and Prejudice', 'Romance', 'Jane Austen', 400)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB005', 'The Catcher in the Rye', 'Coming-of-age', 'J.D. Salinger', 230)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB006', 'The Hobbit', 'Fantasy', 'J.R.R. Tolkien', 320)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB007', 'Moby-Dick', 'Adventure', 'Herman Melville', 450)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB008', 'The Lord of the Rings', 'Fantasy', 'J.R.R. Tolkien', 1100)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB009', 'Crime and Punishment', 'Drama', 'Fyodor Dostoevsky', 500)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB010', 'The Odyssey', 'Epic', 'Homer', 350)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB011', 'Brave New World', 'Dystopian', 'Aldous Huxley', 320)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB012', 'The Great Expectations', 'Classics', 'Charles Dickens', 480)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB013', 'The Alchemist', 'Adventure', 'Paulo Coelho', 200)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB014', 'The Road', 'Post-apocalyptic', 'Cormac McCarthy', 240)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB015', 'One Hundred Years of Solitude', 'Magical Realism', 'Gabriel Garcia Marquez', 420)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB016', 'The Sun Also Rises', 'Modernist', 'Ernest Hemingway', 300)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB017', 'Anna Karenina', 'Romance', 'Leo Tolstoy', 600)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB018', 'Wuthering Heights', 'Gothic', 'Emily Brontë', 340)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB019', 'The Count of Monte Cristo', 'Adventure', 'Alexandre Dumas', 600)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB020', 'Frankenstein', 'Gothic', 'Mary Shelley', 280)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB021', 'The Picture of Dorian Gray', 'Gothic', 'Oscar Wilde', 250)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB022', 'Les Misérables', 'Historical Fiction', 'Victor Hugo', 900)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB023', 'The Shining', 'Horror', 'Stephen King', 400)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB024', 'A Tale of Two Cities', 'Historical Fiction', 'Charles Dickens', 350)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB025', 'The Hitchhikers Guide to the Galaxy', 'Science Fiction', 'Douglas Adams', 200)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB026', 'The Grapes of Wrath', 'Classic', 'John Steinbeck', 450)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB027', 'The Da Vinci Code', 'Mystery', 'Dan Brown', 500)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB028', 'The Girl with the Dragon Tattoo', 'Mystery', 'Stieg Larsson', 600)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB029', 'The Chronicles of Narnia', 'Fantasy', 'C.S. Lewis', 400)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB030', 'The Silence of the Lambs', 'Thriller', 'Thomas Harris', 350)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB031', 'The War of the Worlds', 'Science Fiction', 'H.G. Wells', 250)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB032', 'The Color Purple', 'Drama', 'Alice Walker', 300)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB033', 'The Wind in the Willows', 'Childrens Literature', 'Kenneth Grahame', 180)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB034', 'The Martian', 'Science Fiction', 'Andy Weir', 370)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB035', 'The Hound of the Baskervilles', 'Mystery', 'Arthur Conan Doyle', 320)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB036', 'The Road Less Traveled', 'Self-help', 'M. Scott Peck', 250)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB037', 'The Fountainhead', 'Philosophical Fiction', 'Ayn Rand', 700)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB038', 'The Old Man and the Sea', 'Novella', 'Ernest Hemingway', 100)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB039', 'The Jungle Book', 'Childrens Literature', 'Rudyard Kipling', 200)
    INTO libro (id_libro, nombre_libro, genero_libro, autor_libro, num_paginas) VALUES ('LIB040', 'The Brothers Karamazov', 'Philosophical Fiction', 'Fyodor Dostoevsky', 800)
SELECT 1 FROM dual;




INSERT ALL
    INTO biblioteca (id_biblioteca, nombre_biblioteca) VALUES ('BIB001', 'Biblioteca Escolar')
    INTO biblioteca (id_biblioteca, nombre_biblioteca) VALUES ('BIB002', 'Biblioteca Comunitaria')
    INTO biblioteca (id_biblioteca, nombre_biblioteca) VALUES ('BIB003', 'Biblioteca Pública')
    INTO biblioteca (id_biblioteca, nombre_biblioteca) VALUES ('BIB004', 'Biblioteca Infantil')
SELECT 1 FROM dual;


INSERT ALL
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (1, 'EST001', 'BIB001', TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'LIB040')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (2, 'EST002', 'BIB002', TO_DATE('2024-02-25', 'YYYY-MM-DD'), TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'LIB019')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (3, 'EST003', 'BIB003', TO_DATE('2024-02-26', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'LIB020')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (4, 'EST004', 'BIB004', TO_DATE('2024-02-27', 'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'LIB027')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (5, 'EST005', 'BIB001', TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'LIB029')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (6, 'EST006', 'BIB002', TO_DATE('2024-02-29', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'LIB019')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (7, 'EST007', 'BIB003', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'LIB017')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (8, 'EST008', 'BIB004', TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'LIB034')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (9, 'EST009', 'BIB001', TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'LIB027')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (10, 'EST010', 'BIB002', TO_DATE('2024-03-04', 'YYYY-MM-DD'), TO_DATE('2024-04-02', 'YYYY-MM-DD'), 'LIB039')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (11, 'EST011', 'BIB003', TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'LIB034')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (12, 'EST012', 'BIB004', TO_DATE('2024-03-06', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), 'LIB029')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (13, 'EST013', 'BIB001', TO_DATE('2024-03-07', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'LIB022')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (14, 'EST014', 'BIB002', TO_DATE('2024-03-08', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'), 'LIB021')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (15, 'EST015', 'BIB003', TO_DATE('2024-03-09', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'LIB040')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (16, 'EST016', 'BIB004', TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'LIB040')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (17, 'EST017', 'BIB001', TO_DATE('2024-03-11', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'LIB030')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (18, 'EST018', 'BIB002', TO_DATE('2024-03-12', 'YYYY-MM-DD'), TO_DATE('2024-04-22', 'YYYY-MM-DD'), 'LIB029')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (19, 'EST019', 'BIB003', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'LIB014')
    INTO prestamo (prestamo_id, estudiante_id, biblioteca_id, fecha_prestamo, fecha_devolucion, libro_id) VALUES (20, 'EST020', 'BIB004', TO_DATE('2024-03-14', 'YYYY-MM-DD'), TO_DATE('2024-04-28', 'YYYY-MM-DD'), 'LIB035')
SELECT 1 FROM dual;

SELECT * FROM PRESTAMO;


