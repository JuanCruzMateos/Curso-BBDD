-- 1.  Crear las siguientes tablas:
CREATE TABLE `practico2`.`ciudades` ( 
    `idciudad` INT NOT NULL AUTO_INCREMENT , 
    `ciudad` VARCHAR(30) NOT NULL , 
    PRIMARY KEY (`idciudad`)
) ENGINE = InnoDB;


CREATE TABLE `practico2`.`personas` (
    idpersona INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(30) NOT NULL, 
    apellido VARCHAR(30) NOT NULL, 
    fecha_nac DATE NOT NULL, 
    dni INT NOT NULL, 
    idciudad INT NOT NULL, 
    sexo  CHAR(1) NOT NULL, 
    PRIMARY KEY (idpersona)
) ENGINE = InnoDB;


CREATE TABLE `practico2`.`productos` ( 
    `idproducto` INT NOT NULL AUTO_INCREMENT , 
    `producto` VARCHAR(30) NOT NULL , 
    `precio` DOUBLE NOT NULL , 
    PRIMARY KEY (`idproducto`)
) ENGINE = InnoDB;


CREATE TABLE `practico2`.`ventas` ( 
    `idventa` INT NOT NULL AUTO_INCREMENT , 
    `fecha` DATE NOT NULL , 
    `idpersona` INT NOT NULL , 
    `idproducto` INT NOT NULL , 
    `cantidad` INT NOT NULL , 
    PRIMARY KEY (`idventa`)
) ENGINE = InnoDB;

-- 2.Crear las siguientes relaciones
-- FK
ALTER TABLE `ventas` ADD CONSTRAINT `personas` 
FOREIGN KEY (`idpersona`) REFERENCES `personas`(`idpersona`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;

-- FK
ALTER TABLE `ventas` ADD CONSTRAINT `productos` 
FOREIGN KEY (`idproducto`) REFERENCES `productos`(`idproducto`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;

-- FK
ALTER TABLE `personas` ADD CONSTRAINT `ciudades` 
FOREIGN KEY (`idciudad`) REFERENCES `ciudades`(`idciudad`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 3. Insertar 10 registros en cada tabla. En la tabla productos, ingresar 5 productos con precio>100 y 5 productos con precio<100
INSERT INTO productos (producto, precio) VALUES ('Manzana', 85.3);
INSERT INTO productos (producto, precio) VALUES ('Banana', 95.2);
INSERT INTO productos (producto, precio) VALUES ('Pera', 73.9);
INSERT INTO productos (producto, precio) VALUES ('Uva', 98.3);
INSERT INTO productos (producto, precio) VALUES ('Durazno', 68.7);
INSERT INTO productos (producto, precio) VALUES ('Desodorante', 120.3);
INSERT INTO productos (producto, precio) VALUES ('Hamburguesas', 105.3);
INSERT INTO productos (producto, precio) VALUES ('Queso', 125.8);
INSERT INTO productos (producto, precio) VALUES ('Cerveza', 130.9);
INSERT INTO productos (producto, precio) VALUES ('Asado', 114.7);


INSERT INTO ciudades (ciudad) VALUES ('Mar del Plata');
INSERT INTO ciudades (ciudad) VALUES ('Buenos Aires');
INSERT INTO ciudades (ciudad) VALUES ('La Plata');
INSERT INTO ciudades (ciudad) VALUES ('Cordoba');
INSERT INTO ciudades (ciudad) VALUES ('Mendoza');
INSERT INTO ciudades (ciudad) VALUES ('Trelew');
INSERT INTO ciudades (ciudad) VALUES ('Balcarce');
INSERT INTO ciudades (ciudad) VALUES ('Salta');
INSERT INTO ciudades (ciudad) VALUES ('Miramar');
INSERT INTO ciudades (ciudad) VALUES ('Pinamar');


INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Carlos', 'Perez', '1990-04-08', 36258147, 1, 'M');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Marcos', 'Sanchez', '1991-08-28', 36258140, 5, 'M');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Maria', 'Lopez', '1990-04-08', 36258141, 3, 'F');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Florencia', 'Suarez', '1990-04-08', 36258142, 7, 'F');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Gustavo', 'Gimenez', '1990-04-08', 36258143, 2, 'M');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Pamela', 'Gonzalez', '1990-04-08', 36258144, 4, 'F');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Rosario', 'Gutierrez', '1990-04-08', 36258145, 8, 'F');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Juan', 'Sanchez', '1990-04-08', 36258146, 1, 'M');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('Hugo', 'Fernandez', '1990-04-08', 36258148, 2, 'M');
INSERT INTO personas (nombre, apellido, fecha_nac, dni, idciudad, sexo) VALUES ('ALberto', 'Rojas', '1990-04-08', 36258149, 6, 'M');


INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-18', 1, 1, 3);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-17', 9, 5, 7);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-19', 3, 7, 4);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-15', 8, 9, 5);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-13', 7, 4, 7);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-03-21', 4, 2, 8);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-03-25', 5, 3, 6);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-01', 9, 7, 3);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-07', 8, 4, 2);
INSERT INTO ventas (fecha, idpersona, idproducto, cantidad) VALUES ('2021-04-22', 3, 2, 5);


-- 4. Que sucede si tratas de ingresar el siguiente registro:
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo)
values ('Federico', 'Garcia','15/11/1890',27624489,15, 'm');

-- #1452 - Cannot add or update a child row: a foreign key constraint fails (`practico2`.`personas`, CONSTRAINT `ciudades` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`idciudad`))
-- es decir, no existe la ciudad con clave 15

-- 5. Realizar las siguientes consultas
-- a. Mostrar los productos con precio mayor a $100
SELECT producto, precio FROM productos WHERE precio > 100;
-- b. A los productos con precio mayor a $100 aumentarles un 10% el precio

-- modificando a mano:
UPDATE productos SET precio = 75.4 WHERE productos.idproducto = 3;
-- luego
UPDATE productos SET precio = precio * 1.1 WHERE productos.precio > 100;  -- OK

-- c. Mostrar las ventas comprendidas entre el 01/01/2020 al 31/02/2020 (existen 3 formas de realizar esta consulta)
SELECT * FROM ventas WHERE fecha <= '2021-04-01' AND fecha >= '2021-04-30';
SELECT * FROM ventas WHERE year(fecha) = 2021 and month(fecha) = 4;
SELECT * FROM ventas WHERE fecha BETWEEN '2021-04-01' and '2021-04-30';

