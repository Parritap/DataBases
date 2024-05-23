-- Insertar datos en la tabla PRESENTACION_EXAMEN,
-- relacionando los exámenes especificados con los alumnos correspondientes.

-- Examen 2 (Imperio Romano Examen, Grupo 201)
INSERT INTO presentacion_examen (tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
SELECT NULL, 'N', NULL, NULL, NULL, 2, ag.id_alumno
FROM alumno_grupo ag
WHERE ag.id_grupo = 201;

-- Examen 3 (Evolución Examen, Grupo 200)
INSERT INTO presentacion_examen (tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
SELECT NULL, 'N', NULL, NULL, NULL, 3, ag.id_alumno
FROM alumno_grupo ag
WHERE ag.id_grupo = 200;

-- Examen 5 (Biología Celular Avanzado Examen, Grupo 214)
INSERT INTO presentacion_examen (tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
SELECT NULL, 'N', NULL, NULL, NULL, 5, ag.id_alumno
FROM alumno_grupo ag
WHERE ag.id_grupo = 214;

-- Examen 14 (Evolución y Revolución Industrial Examen, Grupo 213)
INSERT INTO presentacion_examen (tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
SELECT NULL, 'N', NULL, NULL, NULL, 14, ag.id_alumno
FROM alumno_grupo ag
WHERE ag.id_grupo = 213;

COMMIT;