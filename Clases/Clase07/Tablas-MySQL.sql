-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2021 a las 15:49:41
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clase7`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cervecerias`
--

CREATE TABLE `cervecerias` (
  `idcerveceria` int(11) NOT NULL,
  `cerveceria` varchar(30) NOT NULL,
  `idciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cervecerias`
--

INSERT INTO `cervecerias` (`idcerveceria`, `cerveceria`, `idciudad`) VALUES
(1, 'Antares', 1),
(2, 'Baum', 1),
(3, 'Cheverry', 1),
(4, 'BrewHouse', 1),
(5, 'Glück', 1),
(6, 'Lecker', 1),
(7, 'La Paloma', 1),
(8, 'Beerlin', 1),
(9, 'Ogham', 1),
(10, 'Bruder Beer Garden', 1),
(11, 'al fin Simón', 2),
(12, 'La Estación', 2),
(13, 'El Galpón', 2),
(14, 'FUTER ', 3),
(15, 'Media Pinta', 3),
(16, 'Amsterdam', 3),
(17, 'Bye Henry', 3),
(18, 'Vitto', 3),
(19, 'Berlina Patagonia Brewery', 3),
(20, 'Mollys', 3),
(21, 'Berlina Patagonia Brewery', 3),
(22, 'Mollys', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cervezas`
--

CREATE TABLE `cervezas` (
  `idcerveza` int(11) NOT NULL,
  `cerveza` varchar(30) NOT NULL,
  `graduacion` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cervezas`
--

INSERT INTO `cervezas` (`idcerveza`, `cerveza`, `graduacion`) VALUES
(1, 'Stout', '8.00'),
(2, 'Porter ale', '8.00'),
(3, 'Pale ale', '6.35'),
(4, 'Old ale', '9.10'),
(5, 'Mild ale', '8.70'),
(6, 'Brown ale', '6.80'),
(7, 'Bock', '6.00'),
(8, 'Dark', '7.00'),
(9, 'Pale lager', '8.70'),
(10, 'Pilsener', '8.00'),
(11, 'Porter', '6.90'),
(12, 'Lambic', '8.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idciudad` int(11) NOT NULL,
  `ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idciudad`, `ciudad`) VALUES
(1, 'Mar del Plata'),
(2, 'Balcarse'),
(3, 'La Plata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `apellido`) VALUES
(1, 'Bart', 'Simpson'),
(2, 'Pato', 'Lucas'),
(3, 'Gato', 'Tom'),
(4, 'Bugs', 'Bunny'),
(5, 'Bob', 'Esponja'),
(6, 'Jerry', 'Mouse'),
(7, 'Mickey', 'Mouse'),
(8, 'Scooby', 'Doo'),
(9, 'Lisa', 'Simpson'),
(10, 'Patricio', 'Estrella'),
(11, 'Pato', 'Donald'),
(12, 'Pedro', 'Picapiedra'),
(13, 'Johnny', 'Bravo'),
(14, 'Vilma', 'Picapiedra'),
(15, 'Hello', 'Kitty'),
(16, 'Lola', 'Boa'),
(17, 'Bugs', 'Bunny');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumiciones`
--

CREATE TABLE `consumiciones` (
  `idconsumicion` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idcerveza` int(11) NOT NULL,
  `idcerveceria` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consumiciones`
--

INSERT INTO `consumiciones` (`idconsumicion`, `idcliente`, `idcerveza`, `idcerveceria`, `fecha`) VALUES
(1, 1, 1, 1, '2018-10-03'),
(2, 1, 1, 1, '2017-10-03'),
(3, 10, 1, 1, '2017-10-03'),
(4, 9, 1, 1, '2018-09-03'),
(5, 8, 2, 1, '2015-10-03'),
(6, 7, 7, 1, '2018-10-05'),
(7, 6, 10, 2, '2017-10-03'),
(8, 5, 2, 3, '2018-11-03'),
(9, 4, 4, 2, '2018-10-03'),
(10, 3, 9, 2, '2017-10-03'),
(11, 1, 8, 1, '2018-10-03'),
(12, 1, 9, 1, '2018-10-03'),
(13, 1, 5, 2, '2018-10-03'),
(14, 1, 4, 2, '2018-10-03'),
(15, 6, 1, 1, '2018-10-03'),
(16, 7, 8, 1, '2018-10-03'),
(17, 9, 9, 2, '2018-10-03'),
(18, 8, 9, 1, '2017-10-03'),
(19, 1, 8, 1, '2017-05-03'),
(20, 7, 1, 1, '2018-03-03'),
(21, 7, 10, 3, '2018-02-03'),
(22, 3, 10, 2, '2018-06-03'),
(23, 5, 5, 2, '2017-09-03'),
(24, 4, 8, 1, '2017-10-03'),
(25, 9, 7, 1, '2018-05-03'),
(26, 2, 2, 1, '2018-10-03'),
(27, 10, 7, 3, '2018-10-03'),
(28, 7, 6, 3, '2018-10-03'),
(29, 2, 8, 3, '2018-10-03'),
(30, 3, 9, 3, '2017-10-03'),
(31, 4, 1, 2, '2017-10-03'),
(32, 6, 5, 1, '2015-10-03'),
(33, 8, 3, 1, '2017-10-03'),
(34, 11, 1, 1, '2018-10-03'),
(35, 13, 1, 1, '2018-10-03'),
(36, 11, 9, 1, '2018-06-03'),
(37, 8, 6, 3, '2017-10-03'),
(38, 2, 6, 19, '2021-05-01'),
(39, 16, 10, 5, '2021-05-20'),
(40, 7, 9, 3, '2021-05-27'),
(41, 7, 11, 4, '2021-05-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cervecerias`
--
ALTER TABLE `cervecerias`
  ADD PRIMARY KEY (`idcerveceria`);

--
-- Indices de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  ADD PRIMARY KEY (`idcerveza`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idciudad`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `consumiciones`
--
ALTER TABLE `consumiciones`
  ADD PRIMARY KEY (`idconsumicion`),
  ADD KEY `indice1` (`idcliente`),
  ADD KEY `indice2` (`idcerveza`),
  ADD KEY `indice3` (`idcerveceria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cervecerias`
--
ALTER TABLE `cervecerias`
  MODIFY `idcerveceria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  MODIFY `idcerveza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `consumiciones`
--
ALTER TABLE `consumiciones`
  MODIFY `idconsumicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- Restricciones para tablas volcadas
--


