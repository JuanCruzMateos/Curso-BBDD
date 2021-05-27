-- Insertar un dato en una tabla
-- INSERT INTO tabla (campo1, campo2, ...) VALUES (valor1, valor2, ...)

INSERT INTO `jugadores` (`idjugador`, `nombre`, `apellido`, `dni`, `idclub`) 
VALUES (NULL, 'Lionel', 'Messi', '22222222', '1');

-- En este caso idjugador es autoinclemental (por eso le paso null) 
-- Al ser autoincremental la puedo obviar

INSERT INTO `jugadores` (`nombre`, `apellido`, `dni`, `idclub`) 
VALUES ('Roman', 'Riquelme', '33333333', '5');

-- Puedo el orden de las columnas no necesariamente debe respetar el orden de la estructura de la tabla
INSERT INTO `jugadores` (`nombre`, `dni`, `idclub`, `apellido`) 
VALUES ('Martin', '55555555', '6', 'Palermo')

-- Las comillas de las columnas se pueden obviar
INSERT INTO `jugadores` (nombre, dni, idclub, apellido) 
VALUES ('Gonzalo', 4444444444, 4, 'Gonzalo')


-- Crear una tabla
CREATE TABLE `clase1`.`clubes` 
( `idclub` INT NOT NULL AUTO_INCREMENT , 
`club` VARCHAR(80) NOT NULL , 
PRIMARY KEY (`idclub`)) 
ENGINE = InnoDB;

-- Insertar
INSERT INTO `clubes` (`idclub`, `club`) 
VALUES (NULL, 'Barcelona');

-- arreglando:
INSERT INTO `clubes` (club) 
VALUES ('Barcelona');


-- Crear relacion entre tablas
ALTER TABLE `jugadores` 
ADD CONSTRAINT `jugador-club` FOREIGN KEY (`idclub`) REFERENCES `clubes`(`idclub`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;
