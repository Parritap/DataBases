-- PREGUNTA_EXAMEN

--examen 1
-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 2, 1);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (30, NULL, 'f', 6, 1);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (50, NULL, 'f', 9, 1);


--pregunta adicional con su respuesta para que cuadre :V

INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (999, '¿la célula es la unidad mínima de vida?', 'S', 'falso_verdadero', NULL, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (999, 'verdadero', 't', 999);
---COntinuamos el viaje ;)

-- EXAMEN 2
-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 3, 2);

-- Pregunta 7 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 7, 2);

-- Pregunta 15 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 15, 2);

-- Pregunta 18 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 18, 2);

-- Pregunta 23 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 23, 2);

-- EXAMEN 3
-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 6, 3);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 9, 3);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 14, 3);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 29, 3);

--EXAMEN 4

-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 4, 4);

-- Pregunta 10 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 10, 4);

-- Pregunta 16 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 'f', 16, 4);

--Examen 5

-- Pregunta 1 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 1, 5);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 'f', 5, 5);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 11, 5);

--Examen 6

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 2, 6);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 5, 6);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 11, 6);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 16, 6);

--Examen 7

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 2, 7);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 9, 7);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 14, 7);

-- Pregunta 19 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 19, 7);

-- Pregunta 24 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 25, 7);

--Examen 8

--Pregunta 7 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 7, 8);

-- Pregunta 10 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 11, 8);

-- Pregunta 15 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 'f', 15, 8);

--Examen 9

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 2, 9);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 6, 9);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 9, 9);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 20, 9);

--Examen 10
-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 4, 10);

-- Pregunta 10 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 10, 10);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 13, 10);

--Examen 11

-- Pregunta 1 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 1, 11);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 5, 11);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 11, 11);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 16, 11);

-- Pregunta 21 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 21, 11);

--Examen 12

-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 3, 12);

-- Pregunta 8 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 8, 12);

-- Pregunta 15 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 15, 12);

-- Pregunta 23 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 23, 12);
--Examen 13

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 2, 13);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 6, 13);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 29, 13);

--EXAMEN 14

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 5, 14);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 11, 14);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 16, 14);

-- Pregunta 21 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 21, 14);

--Examen 15

-- Pregunta 3 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 3, 15);

-- Pregunta 8 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 8, 15);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 13, 15);

--Examen 16

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 16);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 16);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 29, 16);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 9, 16);

--Examen 17

-- Pregunta 1 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 1, 17);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 5, 17);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 11, 17);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 16, 17);

-- Pregunta 21 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 21, 17);

--Examen 18

-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 3, 18);

-- Pregunta 8 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 8, 18);

-- Pregunta 13 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 13, 18);

--Examen 19
-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 19);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 19);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 9, 19);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 29, 19);

--Examen 20

-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 4, 20);

-- Pregunta 8 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 8, 20);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 13, 20);

--Examen 21

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 21);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 21);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 9, 21);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 29, 21);

--Examen 22

-- Pregunta 3 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 3, 22);

-- Pregunta 8 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 8, 22);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 13, 22);

-- Pregunta 18 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 18, 22);

-- Pregunta 24 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 24, 22);

--Examen 23

-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 3, 23);

-- Pregunta 12 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 12, 23);

-- Pregunta 18 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 18, 23);

--Examen 24

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 24);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 24);

-- Pregunta 10 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 10, 24);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 14, 24);

---Examen 25

-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 4, 25);

-- Pregunta 9 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 9, 25);

-- Pregunta 19 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 19, 25);

