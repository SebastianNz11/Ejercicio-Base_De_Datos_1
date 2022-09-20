-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2022 a las 23:23:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividadesrealizadas`
--

CREATE TABLE `actividadesrealizadas` (
  `id_servicio` int(11) DEFAULT NULL,
  `id_soldado` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

CREATE TABLE `compañia` (
  `id_compañia` int(11) NOT NULL,
  `actividad` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuartel`
--

CREATE TABLE `cuartel` (
  `id_cuartel` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpoejercito`
--

CREATE TABLE `cuerpoejercito` (
  `id_cuerpo` int(11) NOT NULL,
  `denominacion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `actividad` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `id_soldado` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `id_cuerpo` int(11) DEFAULT NULL,
  `id_compañia` int(11) DEFAULT NULL,
  `id_cuartel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id_cuartel` int(11) DEFAULT NULL,
  `id_compañia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividadesrealizadas`
--
ALTER TABLE `actividadesrealizadas`
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_soldado` (`id_soldado`);

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`id_compañia`);

--
-- Indices de la tabla `cuartel`
--
ALTER TABLE `cuartel`
  ADD PRIMARY KEY (`id_cuartel`);

--
-- Indices de la tabla `cuerpoejercito`
--
ALTER TABLE `cuerpoejercito`
  ADD PRIMARY KEY (`id_cuerpo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`id_soldado`),
  ADD KEY `id_cuerpo` (`id_cuerpo`),
  ADD KEY `id_compañia` (`id_compañia`),
  ADD KEY `id_cuartel` (`id_cuartel`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD KEY `id_cuartel` (`id_cuartel`),
  ADD KEY `id_compañia` (`id_compañia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañia`
--
ALTER TABLE `compañia`
  MODIFY `id_compañia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuartel`
--
ALTER TABLE `cuartel`
  MODIFY `id_cuartel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpoejercito`
--
ALTER TABLE `cuerpoejercito`
  MODIFY `id_cuerpo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `id_soldado` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividadesrealizadas`
--
ALTER TABLE `actividadesrealizadas`
  ADD CONSTRAINT `actividadesrealizadas_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `actividadesrealizadas_ibfk_2` FOREIGN KEY (`id_soldado`) REFERENCES `soldado` (`id_soldado`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `soldado_ibfk_1` FOREIGN KEY (`id_cuerpo`) REFERENCES `cuerpoejercito` (`id_cuerpo`),
  ADD CONSTRAINT `soldado_ibfk_2` FOREIGN KEY (`id_compañia`) REFERENCES `compañia` (`id_compañia`),
  ADD CONSTRAINT `soldado_ibfk_3` FOREIGN KEY (`id_cuartel`) REFERENCES `cuartel` (`id_cuartel`);

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `ubicaciones_ibfk_1` FOREIGN KEY (`id_cuartel`) REFERENCES `cuartel` (`id_cuartel`),
  ADD CONSTRAINT `ubicaciones_ibfk_2` FOREIGN KEY (`id_compañia`) REFERENCES `compañia` (`id_compañia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
