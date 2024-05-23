-- Almacen data
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (1, 'Almacen Principal', 'Calle 123 # 45-67');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (2, 'Almacen Secundario', 'Carrera 56 # 78-90');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (3, 'Centro de Distribucion', 'Avenida 10 # 11-12');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (4, 'Bodega Norte', 'Calle 14 # 15-16');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (5, 'Bodega Sur', 'Carrera 17 # 18-19');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (6, 'Almacen Temporal', 'Avenida 20 # 21-22');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (7, 'Centro Logistico', 'Calle 23 # 24-25');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (8, 'Almacen Regional', 'Carrera 26 # 27-28');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (9, 'Deposito Central', 'Avenida 29 # 30-31');
INSERT INTO Almacen (idAlmacen, nombre, direccion) VALUES (10, 'Almacen Express', 'Calle 32 # 33-34');

-- Cliente data
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1001, 150);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1002, 50);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1003, 200);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1004, 100);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1005, 300);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1006, 0);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1007, 75);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1008, 250);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1009, 120);
INSERT INTO tarjetaCliente (numero, puntos) VALUES (1010, 500);

INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (1, 'Ana Maria Perez', 1001);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (2, 'Juan Carlos Lopez', 1002);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (3, 'Luisa Fernanda Garcia', 1003);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (4, 'Carlos Alberto Rodriguez', 1004);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (5, 'Sofia Hernandez', 1005);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (6, 'David Jimenez', 1006);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (7, 'Laura Milena Torres', 1007);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (8, 'Andres Felipe Diaz', 1008);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (9, 'Maria Camila Vargas', 1009);
INSERT INTO Cliente (idCliente, nombre, tarjetaCliente) VALUES (10, 'Daniel Fernando Sanchez', 1010);

-- Empleado data
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (101, 'Pedro Gomez', 25, 1);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (102, 'Maria Rojas', 30, 2);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (103, 'Juan Perez', 28, 3);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (104, 'Ana Diaz', 35, 4);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (105, 'Luis Castro', 27, 5);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (106, 'Carolina Sanchez', 32, 1);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (107, 'David Morales', 29, 2);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (108, 'Laura Torres', 31, 3);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (109, 'Andres Ramirez', 26, 4);
INSERT INTO Empleado (idEmpleado, nombre, edad, Almacen_idAlmacen) VALUES (110, 'Sofia Fernandez', 34, 5);


-- Producto data
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2001, 'Camiseta', 25.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2002, 'Pantalon', 49.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2003, 'Zapatos', 79.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2004, 'Chaqueta', 99.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2005, 'Blusa', 35.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2006, 'Falda', 45.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2007, 'Vestido', 89.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2008, 'Jeans', 59.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2009, 'Suéter', 69.99);
INSERT INTO Producto (idProducto, nombre, precio) VALUES (2010, 'Camisa', 39.99);

-- Venta data
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3001, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.50, 101, 'C', 1);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3002, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 89.99, 102, 'C', 2);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3003, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 230.78, 103, 'C', 3);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3004, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 50.00, 104, 'A', 4);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3005, TO_DATE('2023-05-12', 'YYYY-MM-DD'), 300.25, 105, 'C', 5);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3006, TO_DATE('2023-06-28', 'YYYY-MM-DD'), 75.80, 106, 'C', 6);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3007, TO_DATE('2023-07-18', 'YYYY-MM-DD'), 120.99, 107, 'A', 7);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3008, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 450.60, 108, 'C', 8);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3009, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 90.50, 109, 'C', 9);
INSERT INTO Venta (numero, fecha, totalVenta, Empleado_idEmpleado, estado, Cliente_idCliente) VALUES (3010, TO_DATE('2023-10-11', 'YYYY-MM-DD'), 210.80, 110, 'C', 10);


-- auditoria data
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (1, 101, TO_DATE('2023-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Insertar', 2001);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (2, 102, TO_DATE('2023-02-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Actualizar', 1);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (3, 103, TO_DATE('2023-03-10 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Borrar', 1001);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (4, 104, TO_DATE('2023-04-05 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Insertar', 3001);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (5, 105, TO_DATE('2023-05-12 09:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Actualizar', 2);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (6, 106, TO_DATE('2023-06-28 17:55:00', 'YYYY-MM-DD HH24:MI:SS'), 'Borrar', 1002);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (7, 107, TO_DATE('2023-07-18 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Insertar', 2002);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (8, 108, TO_DATE('2023-08-02 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Actualizar', 3);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (9, 109, TO_DATE('2023-09-20 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Borrar', 1003);
INSERT INTO auditoria (nro, idEmpleado, fechaHora, accion, idRegistro) VALUES (10, 110, TO_DATE('2023-10-11 18:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Insertar', 3002);


-- inventarioAlmacen data
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2001, 1, 50);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2002, 2, 30);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2003, 3, 25);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2004, 4, 40);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2005, 5, 60);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2006, 1, 20);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2007, 2, 45);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2008, 3, 15);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2009, 4, 35);
INSERT INTO inventarioAlmacen (Producto_idProducto, Almacen_idAlmacen, cantidad) VALUES (2010, 5, 55);

-- itemVenta data
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3001, 2001, 2, 0, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3002, 2003, 1, 10, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3003, 2005, 3, 0, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3004, 2007, 1, 5, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3005, 2009, 2, 0, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3006, 2002, 1, 15, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3007, 2004, 1, 0, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3008, 2006, 2, 10, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3009, 2008, 1, 5, 'E');
INSERT INTO itemVenta (Venta_numero, Producto_idProducto, cantidad, descuento, estado) VALUES (3010, 2010, 2, 0, 'E');