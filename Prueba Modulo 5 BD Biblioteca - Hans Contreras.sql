--Prueba Modulo 5 BD - Biblioteca - Hans Contreras

--Requerimientos

--Parte 1 - Creación del modelo conceptual, lógico y físico
--1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas.(1 Punto)
--2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre
--ellas, los atributos, normalización y creación de tablas intermedias de ser necesario.(2 Puntos)
--3. Realizar el modelo físico, considerando la especificación de tablas y columnas,
--además de las claves externas.(2 Puntos)

--Todos los modelos estan completados en los archivos adjuntos.


--Parte 2 - Creando el modelo en la base de datos
--1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas
--definidas y sus atributos. (2 puntos).
CREATE DATABASE biblioteca;
\c biblioteca

--Creacion tabla autor
CREATE TABLE autor(
    codigo_autor VARCHAR(100) NOT NULL,
    nombre_autor VARCHAR(100) NOT NULL,
    apellido_autor VARCHAR(100) NOT NULL,
    fecha_nacimiento_autor INT,
    fecha_muerte_autor INT,
    PRIMARY KEY (codigo_autor)
);

SELECT * FROM autor;


--Creacion tabla socio
CREATE TABLE socio(
    rut VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    PRIMARY KEY (rut)
);

SELECT * FROM socio;


--Creacion tabla libro
CREATE TABLE libro(
    ISBN VARCHAR(100) NOT NULL,
    titulo VARCHAR(100),
    num_paginas INT,
    PRIMARY KEY (ISBN)
);

SELECT * FROM libro;


--Creacion tabla libro_autor
CREATE TABLE libro_autor(
    id_libro_autor Serial PRIMARY KEY,
    id_libro VARCHAR(100),
    id_autor VARCHAR(100),
    tipo_autor VARCHAR(20),
    FOREIGN KEY (id_libro) REFERENCES libro(ISBN),
    FOREIGN KEY (id_autor) REFERENCES autor(codigo_autor)
);

SELECT * FROM libro_autor;


--Creacion tabla prestamo
CREATE TABLE prestamo(
    fecha_inicio DATE,
    fecha_esperada_devolucion DATE,
    fecha_real_devolucion DATE,
    id_prestamo INT,
    libro_prestado VARCHAR(100) NOT NULL,
    socio_libro VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_prestamo),
    FOREIGN KEY (libro_prestado) REFERENCES libro(ISBN),
    FOREIGN KEY (socio_libro) REFERENCES socio(rut)
);

SELECT * FROM prestamo;


--2. Se deben insertar los registros en las tablas correspondientes (1 punto).

--Inserción en tabla autor

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(3, 'José', 'Salgado',1968, 2020);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(4, 'Ana', 'Salgado',1972, 0);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(1, 'Andrés', 'Ulloa',1982, 0);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(2, 'Sergio', 'Mardones',1950, 2012);

INSERT INTO autor(codigo_autor,nombre_autor, apellido_autor,  fecha_nacimiento_autor, fecha_muerte_autor)
VALUES(5, 'Martín', 'Porta', 1976, 0);

--Inserción en tabla socio
INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('1111111-1', 'Juan', 'Soto', 'Avenida 1, Santiago', 91111111);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('2222222-2', 'Ana', 'Pérez', 'Pasaje 2, Santiago', 92222222);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('3333333-3', 'Sandra', 'Aguilar', 'Avenida 2, Santiago', 933333333);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('4444444-4', 'Esteban', 'Jerez', 'Avenida 3, Santiago', 944444444);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono)
VALUES('5555555-5', 'Silvana', 'Muñoz', 'Pasaje 3, Santiago', 95555555);

--Inserción en tabla libro
INSERT INTO libro(ISBN, titulo, num_paginas)
VALUES('111-1111111-111', 'Cuentos de terror',344);

INSERT INTO libro(ISBN, titulo, num_paginas)
VALUES('222-2222222-222', 'Poesías contemporáneas', 167);

INSERT INTO libro(ISBN, titulo, num_paginas)
VALUES('333-3333333-333', 'Historia de Asia', 511);

INSERT INTO libro(ISBN, titulo, num_paginas)
VALUES('444-4444444-444', 'Manual de mecánica', 298);

INSERT INTO libro_autor(id_libro, id_autor, tipo_autor)
VALUES ('111-1111111-111', 3, 'Principal');

INSERT INTO libro_autor(id_libro, id_autor, tipo_autor)
VALUES ('111-1111111-111', 4, 'Co-Autor');

--Inserción en tabla préstamo
INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('20-01-2020', '25-01-2020', '27-01-2020', '123123', '111-1111111-111', '1111111-1');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('20-01-2020', '25-01-2020', '30-01-2020', '345345', '222-2222222-222','5555555-5' );

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('30-01-2020', '07-02-2020', '12-02-2020', '124124', '444-4444444-444', '1111111-1');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('22-01-2020', '28-01-2020', '30-01-2020', '353535', '333-3333333-333','3333333-3' );

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('23-01-2020', '28-01-2020', '30-01-2020', '789789','444-4444444-444', '4444444-4');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('23-01-2020', '28-01-2020', '04-02-2020', '654654', '111-1111111-111', '2222222-2');

INSERT INTO prestamo(fecha_inicio, fecha_esperada_devolucion, fecha_real_devolucion, id_prestamo, libro_prestado,socio_libro)
VALUES('30-01-2020', '06-02-2020', '12-02-2020', '363636', '222-2222222-222','3333333-3' );


--3. Realizar las siguientes consultas:
--a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)

SELECT titulo FROM libro WHERE num_paginas < 300 ORDER BY titulo;

--b. Mostrar todos los autores que hayan nacido después del 01-01-1970.(0.5 puntos)

SELECT nombre_autor, apellido_autor FROM autor WHERE fecha_nacimiento_autor > 1970;

--c. ¿Cuál es el libro más solicitado? (0.5 puntos).

SELECT libro.titulo, COUNT (libro.titulo) as libros_mas_solicitados
FROM prestamo INNER JOIN libro ON prestamo.libro_prestado=libro.ISBN GROUP BY libro.titulo ORDER BY libros_mas_solicitados;

--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
--debería pagar cada usuario que entregue el préstamo después de 7 días.(0.5 puntos)

SELECT socio.nombre, socio.apellido, socio.rut, SUM (fecha_real_devolucion-fecha_esperada_devolucion)*100 AS deuda 
FROM prestamo INNER JOIN socio ON socio.rut=prestamo.socio_libro GROUP BY socio.rut ORDER BY deuda;


--FIN--