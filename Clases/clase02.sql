-- Crear tabla
CREATE TABLE `ciudades` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `ciudad` varchar(50) NOT NULL ,
   PRIMARY KEY (`idciudad`))

-- INSERT: Agregar datos
INSERT INTO ciudades (ciudad) VALUES ('Mar del Plata');
INSERT INTO ciudades (ciudad) VALUES ('Santa Clara');
INSERT INTO ciudades (ciudad) VALUES ('Necochea');

-- SELECT: seleccionar campos
-- SELECT campo1, campo2, ... FROM tabla
SELECT idciudad, ciudad FROM ciudades

-- El orden afecta solo como se muestran, no la bbdd en si
SELECT ciudad, idciudad FROM ciudades

-- Mostrar todas las columnas: *
SELECT * FROM ciudades

-- UPDATE
UPDATE ciudades SET ciudad = "Santa Clara 2"    -- Todos los registros se llamaran Santa Clara 2
UPDATE ciudades SET ciudad = "Santa Clara 2" WHERE idciudad > 1   -- Todos los registros co id >= 2 se llamaran Santa Clara 2
UPDATE ciudades SET ciudad = "Santa Clara 2" WHERE idciudad = 2


--DELETE
DELETE FROM ciudades WHERE ciudad = 'Necochea'
-- Borra todo
DELETE FROM ciudades


-- BBDD -> PERSONAS
CREATE TABLE personas (
	idpersona INTEGER PRIMARY KEY AUTO_INCREMENT, 
	nombre TEXT, 
	apellido TEXT, 
	fecha_nac DATE, 
	dni INTEGER, 
	idciudad INTEGER, 
	sexo TEXT, 
	foreign key(idciudad) references ciudades(idciudad) 
)
-- OBS: si la tabla ciudades no exista da error -> hace referencia a esa tabla como fk

INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Diego','Garcia','15/11/2000',27148525,1, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Federico', 'Alvarez','15/10/2010',36525845,1, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Diego', 'Aguero', '05/10/2003',35845965,1, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Tomas', 'Palacios', '23/10/2002',42584545,2, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Diego', 'Castro','15/11/2019',56895656,1, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Liliana','Garcia', '25/01/2008',25963696,1, 'f');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Debora', 'Alcara', '05/10/1988',12568945,1, 'f');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Alfredo', 'Casero','15/12/2012',454585326,2, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Esteban', 'Palacios', '05/01/189',37275689,1, 'm');
INSERT INTO personas (nombre,apellido,fecha_nac,dni,idciudad,sexo) values ('Camila', 'Suarez', '14/11/2014',27148458,2, 'f')

INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`, `fecha_nac`, `dni`, `idciudad`, `sexo`) VALUES (NULL, 'Fernando', 'Genin', '1979-12-15', '27272727', '4', 'M');
INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`, `fecha_nac`, `dni`, `idciudad`, `sexo`) VALUES (NULL, 'Fernando', 'Acosta', '1980-11-05', '23232323', '4', 'M');
INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`, `fecha_nac`, `dni`, `idciudad`, `sexo`) VALUES (NULL, 'Debora', 'Garcia', '1979-11-05', '34343434', '5', 'F');
INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`, `fecha_nac`, `dni`, `idciudad`, `sexo`) VALUES (NULL, 'Fernando', 'Llorenzo', '1979-12-15', '45454545', '6', 'M');
INSERT INTO `personas` (`idpersona`, `nombre`, `apellido`, `fecha_nac`, `dni`, `idciudad`, `sexo`) VALUES (NULL, 'Fernando', 'Messi', '1980-11-15', '56565656', '4', 'M');


-- mostrar todas las columnas de la tabla personas
SELECT * FROM personas

-- mostrar appelido y nombre
-- esta consulta es mas rapida -> estoy transladando menos datos a mi buffer
-- degrada mucho la performance
SELECT apellido, nombre FROM personas 

-- mostrar nombre y apellido
SELECT nombre, apellido FROM persona


-- Sentencia AS -> renombrar columna en salida, en la tabla no se modifica la estructura
SELECT nombre AS n, apellido AS m FROM personas


-- Sentencia WHERE -> filtro de las consutlas
SELECT nombre, apellido FROM personas WHERE sexo = 'F'


-- > RESUMEN
-- SELECT hace filtro de las columnas
-- WHERE ha un filtro de las filas


-- WHERE
-- Comparaciones
-- >
-- >=
-- <
-- <=
-- =
-- <>
-- IS NULL  --->  NULO no es lo mismo que CERO o una CADENA en BLANCO
-- LIKE     --->  Comparacion, generalmente para caracteres, usado para hacer BUSQUEDAS
-- NOT

SELECT * FROM personas WHERE dni IS NULL
SELECT * FROM personas WHERE dni IS NOT NULL

SELECT * FROM personas WHERE apellido LIKE ("%ss%")
SELECT * FROM personas WHERE apellido LIKE ("%ss%") WHERE dni > 10000000

SELECT * FROM personas WHERE apellido LIKE "A%"  -- empieza con A
SELECT * FROM personas WHERE apellido LIKE "%A"  -- temina con A
SELECT * FROM personas WHERE apellido LIKE "%A%" --  contiene una A


-- BETWEEN ' ' and ' '
-- generalmente se utiliza mucho para busquedas por fechas
SELECT * FROM personas WHERE dni > 3000000 and dni < 100000       -- condicional doble
SELECT * FROM personas WHERE dni BETWEEN '3000000' and '100000'   


-- IN (valores, )
SELECT * FROM personas WHERE idpersona in (3, 4, 5, 6)


-- ORDER BY
SELECT * FROM personas ORDER BY dni      -- por defecto ascendente
SELECT * FROM personas ORDER BY dni DESC  -- aclaro que sea desenente


-- ordenar por
SELECT * FROM personas ORDER BY dni, idpersona DESC   -- 


-- TRUNCATE -> borro tabla manteniendo la estructura
--   DROP   -> borro tabla y estructura 


-- EJEMPLO:
-- 1. se realiza la coneccion ala BD
-- 2. se realiza SELECT con usuario y contraseña
SELECT * FROM usuarios WHERE usuario = "valor ingresado" and clave = "clave ingresda"
-- 3. buscar peliculas
SELECT titulo
FROM peliculas
WHERE genero = "suspenso"

SELECT titulo
FROM peliculas
