-- 1. Crear una BD y agregar las siguientes tablas:
-- PERSONAS(pk_persona, nombre, apellido, dni, fk_barrio, fk_ciudad)
-- BARRIOS (pk_barrio, barrio)
-- CIUDADES(pk_ciudad, ciudad)

CREATE TABLE `practico1`.`personas` 
( `idpersona` INT NOT NULL AUTO_INCREMENT , 
`nombre` VARCHAR(30) NOT NULL , 
`apellido` VARCHAR(30) NOT NULL , 
`dni` INT NOT NULL , `ciudad` VARCHAR(60) NOT NULL , 
`barrio` VARCHAR(60) NOT NULL , 
PRIMARY KEY (`idpersona`)) 
ENGINE = InnoDB;

-- OBS -> fk_barrio y fk_ciudad deben ser foreing key -> no pueden ser varchar
ALTER TABLE `personas` CHANGE `ciudad` `ciudad` INT NOT NULL;
ALTER TABLE `personas` CHANGE `barrio` `barrio` INT NOT NULL;

CREATE TABLE `practico1`.`barrios` 
( `idbarrio` INT NOT NULL AUTO_INCREMENT , 
`barrio` VARCHAR(60) NOT NULL , 
PRIMARY KEY (`idbarrio`)) 
ENGINE = InnoDB;

-- CREATE TABLE `practico1`.`barrio` 
-- ( `idbarrio` INT NOT NULL AUTO_INCREMENT , 
-- `barrio` VARCHAR(60) NOT NULL ,
-- PRIMARY KEY (`idbarrio`)) 
-- ENGINE = InnoDB;

-- cambiar el nombre de la tabla
-- ALTER TABLE barrio RENAME TO barrios;

CREATE TABLE `practico1`.`ciudades` 
( `idciudad` INT NOT NULL AUTO_INCREMENT , 
`ciudad` VARCHAR(60) NOT NULL , 
PRIMARY KEY (`idciudad`)) 
ENGINE = InnoDB;


-- 2. Crear las relaciones entre las tablas:
ALTER TABLE `personas` ADD CONSTRAINT `persona-ciudad` 
FOREIGN KEY (`ciudad`) REFERENCES `ciudades`(`idciudad`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `personas` ADD CONSTRAINT `persona-barrio` 
FOREIGN KEY (`barrio`) REFERENCES `barrios`(`idbarrio`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;


-- 3. Insertar 10 registros en la tabla personas, y 5 registros en las tablas barrios y ciudades
-- ciudades
INSERT INTO ciudades (ciudad) VALUES ('Mar del Plata');
INSERT INTO ciudades (ciudad) VALUES ('Buenos Aires');
INSERT INTO ciudades (ciudad) VALUES ('La Plata');
INSERT INTO ciudades (ciudad) VALUES ('Cordoba');
INSERT INTO ciudades (ciudad) VALUES ('Pinamar');

-- barrios
INSERT INTO barrios (barrio) VALUES ('Recoleta');
INSERT INTO barrios (barrio) VALUES ('Congreso');
INSERT INTO barrios (barrio) VALUES ('San Carlos');
INSERT INTO barrios (barrio) VALUES ('Plaza Mitre');
INSERT INTO barrios (barrio) VALUES ('Belgrano');

--personas
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio)  VALUES ('Pedro', 'Perez', 14258369, 2, 5);
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio)  VALUES ('Juan', 'Gomez', 25789456, 2, 5);
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Maria', 'Sanchez', '36258789', '1', '4');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Sofia', 'Rodriguez', '44589236', '4', '3');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Ivan', 'Gimenez', '36459826', '2', '2');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Lautaro', 'Alvarez', '40123596', '2', '2');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Carlos', 'Rios', '12123456', '1', '3');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Migue', 'Gutierrez', '20179328', '4', '3');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Tomas', 'Gonzales', '36258914', '2', '2');
INSERT INTO personas (nombre, apellido, dni, ciudad, barrio) VALUES ('Micaela', 'Lopez', '42456789', '1', '4');

-- 4. Mostrar todos los registros de las personas cargadas
SELECT * FROM personas


-- 5. Mostrar las personas con dni mayor a 30.000.000
SELECT * FROM personas 
WHERE dni > 30000000


-- 6- Mostrar el total de personas cargadas
SELECT COUNT(*) FROM personas


-- 7- Mostrar la cantidad de personas con dni mayor a 20.000.000
SELECT COUNT(*) FROM personas 
WHERE dni > 20000000


-- 8- Mostrar las personas con dni mayor a 10.000.000 ordenados por apellido
SELECT * FROM personas 
WHERE dni > 10000000 
ORDER BY apellido ASC


-- 9- Mostrar los campos de apellido, nombre y barrio de todas las personas
SELECT apellido, nombre, barrio FROM personas;


-- 10-Mostrar la cantidad de personas por barrio
-- TODO

-- 11-Mostrar la cantidad de personas por ciudades, y ordenar las ciudades alfabéticamente.
-- TODO