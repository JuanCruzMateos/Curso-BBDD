-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2021 a las 11:54:50
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clase4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automotores`
--

CREATE TABLE `automotores` (
  `pk_automotor` int(11) NOT NULL,
  `patente` varchar(7) NOT NULL,
  `fk_marca` int(11) NOT NULL,
  `fk_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `automotores`
--

INSERT INTO `automotores` (`pk_automotor`, `patente`, `fk_marca`, `fk_tipo`) VALUES
(1, 'ABC123', 1, 1),
(2, 'QWE789', 2, 2),
(3, 'BNM456', 3, 3),
(4, 'RTY789', 4, 4),
(5, 'FGH789', 2, 3),
(6, 'IOP456', 2, 1),
(7, 'SFG785', 3, 2),
(8, 'POI456', 2, 3),
(9, 'ASD123', 5, 6),
(10, 'AA369CF', 6, 6),
(11, 'TT236SD', 5, 2),
(12, 'AB362RT', 4, 2),
(13, 'AA154UI', 1, 2),
(14, 'AD635TT', 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `pk_marca` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`pk_marca`, `marca`) VALUES
(1, 'BMW'),
(2, 'Audi'),
(3, 'Peugeot'),
(4, 'Citroen'),
(5, '\'Renault\''),
(6, 'Mazda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanicos`
--

CREATE TABLE `mecanicos` (
  `pk_mecanico` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mecanicos`
--

INSERT INTO `mecanicos` (`pk_mecanico`, `nombre`, `apellido`, `dni`) VALUES
(1, 'Fernando', 'Aguero', 22222222),
(2, 'Yesica', 'Acosta', 33333333),
(3, 'David', 'Garcia', 44444444),
(4, 'Rodolfo', 'Gonzalez', 55555555),
(5, 'Daniel', 'Prato', 78787878),
(6, 'Alberto', 'Rico', 28282828);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE `reparaciones` (
  `pk_reparacion` int(11) NOT NULL,
  `fk_automotor` int(11) NOT NULL,
  `fk_mecanico` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `descripcion` text NOT NULL,
  `importe` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reparaciones`
--

INSERT INTO `reparaciones` (`pk_reparacion`, `fk_automotor`, `fk_mecanico`, `fecha_entrada`, `fecha_salida`, `descripcion`, `importe`) VALUES
(1, 1, 2, '2017-08-01', '2017-08-09', 'Cambio de caja', '9166.58'),
(2, 2, 2, '2017-08-16', '2017-08-31', 'Cambio de bateria', '1500.00'),
(3, 1, 4, '2017-05-06', '2017-06-06', 'Cambio de gomas', '10999.89'),
(4, 4, 4, '2017-08-08', '2017-08-18', 'Reparacion motor', '25000.00'),
(5, 4, 1, '2017-06-06', '2017-06-09', 'Cambio bujias', '5000.00'),
(6, 2, 3, '2017-08-08', '2017-08-10', 'Reparacion radio', '6000.00'),
(7, 3, 4, '2017-05-05', '2017-06-05', 'Ajuste tapa', '2580.00'),
(8, 2, 3, '2017-08-08', '2017-08-09', 'Ajuste ruedas', '1200.00'),
(9, 1, 2, '2018-05-01', '2018-05-05', 'zararaza', '1500.00'),
(10, 1, 1, '2018-08-07', '2018-09-03', '', '600.00'),
(11, 1, 1, '2018-03-03', '2018-04-04', '', '9000.00'),
(12, 1, 1, '2018-05-05', '2018-05-16', '', '580.00'),
(13, 1, 2, '2019-09-03', '2019-09-19', 'no arranca', '600.00'),
(14, 1, 5, '2018-03-03', '2018-04-04', 'no tiene bateria', '250.00'),
(15, 14, 6, '2019-04-04', '2019-05-05', 'Valvula rota', '400.00'),
(16, 13, 5, '2019-05-04', '2019-08-05', 'Valvula rota', '4500.00'),
(17, 11, 3, '2020-04-04', '2020-05-05', 'tapa rota', '4560.00'),
(18, 13, 2, '2020-04-04', '2020-05-05', 'Rueda con falla', '3600.00'),
(19, 11, 2, '2021-11-04', '2021-11-05', 'Tapa de cilindro hace ruido', '10600.00'),
(20, 10, 2, '2021-04-04', '2021-05-05', 'Valvula rota', '690.00'),
(21, 12, 6, '2019-04-04', '2019-05-05', 'Valvula rota', '4000.00'),
(22, 10, 3, '2019-06-04', '2019-06-05', 'Valvula rota', '900.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `pk_tipo` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`pk_tipo`, `tipo`) VALUES
(1, 'Camion'),
(2, 'Vehiculo'),
(3, 'Deportivo'),
(4, 'Turismo'),
(5, 'SUV'),
(6, 'Utilitario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `automotores`
--
ALTER TABLE `automotores`
  ADD PRIMARY KEY (`pk_automotor`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`pk_marca`);

--
-- Indices de la tabla `mecanicos`
--
ALTER TABLE `mecanicos`
  ADD PRIMARY KEY (`pk_mecanico`);

--
-- Indices de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD PRIMARY KEY (`pk_reparacion`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`pk_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `automotores`
--
ALTER TABLE `automotores`
  MODIFY `pk_automotor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `pk_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `mecanicos`
--
ALTER TABLE `mecanicos`
  MODIFY `pk_mecanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  MODIFY `pk_reparacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `pk_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
