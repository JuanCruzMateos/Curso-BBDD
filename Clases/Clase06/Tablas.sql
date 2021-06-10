-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2021 a las 17:06:10
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clase5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `pk_empleado` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `dni` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `sueldo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`pk_empleado`, `nombre`, `apellido`, `dni`, `categoria`, `sueldo`) VALUES
(1, 'Ramiro', 'Garcia', 27456789, 1, '15000.00'),
(2, 'Florencio', 'Ramirez', 28293654, 5, '18000.00'),
(3, 'Armando', 'Coco', 48162486, 5, '19000.00'),
(4, 'Liliana', 'Gigena', 15264895, 4, '20000.00'),
(5, 'Pedro', 'Acosta', 45127896, 5, '21000.00'),
(6, 'Pedro', 'Leiva', 15489562, 5, '7000.00'),
(7, 'Muleta', 'Susula', 24859622, 4, '35000.00'),
(8, 'Jonas', 'Rane', 15486259, 3, '36000.00'),
(9, 'Judas', 'Scariote', 45829367, 2, '22000.00'),
(10, 'Jesus', 'Nazaret', 26598451, 2, '48000.00'),
(11, 'Juan', 'Cusovich', 78152695, 5, '7000.00'),
(12, 'Leonardo', 'Cacarulo', 47852695, 3, '150.00'),
(13, 'Diego', 'Tar', 26598169, 5, '18000.00'),
(14, 'Leonel', 'Rico', 36258965, 1, '56000.00'),
(15, 'Fernando', 'Gonzalez', 26594815, 1, '150000.00'),
(16, 'Debora', 'Aguilar', 15269584, 2, '65000.00'),
(17, 'Diego', 'Suarez', 15481559, 3, '89000.00'),
(18, 'Alberto', 'Zarate', 36524587, 3, '23000.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`pk_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `pk_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
