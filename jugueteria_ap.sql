-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2022 a las 20:45:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jugueteria_ap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `pk_codigo` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `fk_codigo_tbl_departamentos` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`pk_codigo`, `nombre`, `fk_codigo_tbl_departamentos`) VALUES
(101, 'Barranquilla', 10),
(102, 'Cartagena', 20),
(103, 'Santa Marta', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `pk_id` int(12) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `fk_codigo_tbl_ciudades` int(10) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`pk_id`, `nombre`, `direccion`, `telefono`, `fk_codigo_tbl_ciudades`, `sexo`) VALUES
(123, 'Natalia Bermudez', 'Cll 45 No 34-56', 321474836, 101, 'F'),
(348, 'Cecilia Ortiz', 'Cra 43 No 75-89', 3435789, 103, 'F'),
(456, 'Camilo Miranda', 'Cll 71B No 45-67', 30024568, 101, 'M'),
(593, 'Jose Luis', 'calle 9 #10 -17', 33261118, 102, 'f'),
(1001, 'Carlos Jose', 'Cra 11 #10 - 10', 33261118, 103, 'f');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `pk_codigo` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`pk_codigo`, `nombre`) VALUES
(10, 'Atlantico'),
(20, 'Bolivar'),
(30, 'Magdalena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juguetes`
--

CREATE TABLE `juguetes` (
  `pk_codigo` int(10) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `valor` int(10) DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juguetes`
--

INSERT INTO `juguetes` (`pk_codigo`, `descripcion`, `valor`, `cantidad`, `tipo`) VALUES
(1, 'parques', 2000, 50, 'mesa'),
(2, 'movil ', 7000, 16, 'didactico'),
(3, 'barbie', 10000, 25, 'didactico'),
(4, 'avion', 10000, 30, 'didactico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `pk_id` int(12) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` int(10) NOT NULL,
  `fk_codigo_tbl_ciudades` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`pk_id`, `nombre`, `direccion`, `telefono`, `fk_codigo_tbl_ciudades`) VALUES
(54, 'Luis Mercado', 'Cra 34 No 56-87', 8934567, 102),
(55, 'Carla Gonzalez', 'Cll 56 No 24-68', 3245678, 103),
(56, 'Andrea Ruiz', 'Cra 78 No 34-23', 356789, 101),
(57, 'Maria Josefa', 'Cra 22 No 35-31', 2552697, 101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `pk_codigo` int(10) NOT NULL,
  `fk_id_tbl_clientes` int(12) DEFAULT NULL,
  `fk_id_tbl_vendedores` int(10) DEFAULT NULL,
  `fk_codigo_tbl_juguetes` int(10) DEFAULT NULL,
  `cant_vendidos` int(10) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`pk_codigo`, `fk_id_tbl_clientes`, `fk_id_tbl_vendedores`, `fk_codigo_tbl_juguetes`, `cant_vendidos`, `valor`, `fecha`) VALUES
(1, 123, 54, 2, 10, 7000, '2022-06-23'),
(2, 456, 55, 1, 3, 5000, '2022-06-01'),
(3, 348, 57, 1, 4, 8000, '2022-12-05'),
(4, 1001, 57, 2, 5, 14, '2022-12-02'),
(5, 593, 56, 4, 8, 80000, '2022-12-24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`pk_codigo`),
  ADD UNIQUE KEY `fk_codigo_tbl_departamentos` (`fk_codigo_tbl_departamentos`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_codigo_tbl_ciudades` (`fk_codigo_tbl_ciudades`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`pk_codigo`);

--
-- Indices de la tabla `juguetes`
--
ALTER TABLE `juguetes`
  ADD PRIMARY KEY (`pk_codigo`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_codigo_tbl_ciudades` (`fk_codigo_tbl_ciudades`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`pk_codigo`),
  ADD KEY `fk_id_tbl_clientes` (`fk_id_tbl_clientes`,`fk_id_tbl_vendedores`,`fk_codigo_tbl_juguetes`),
  ADD KEY `fk_id_tbl_vendedores` (`fk_id_tbl_vendedores`),
  ADD KEY `fk_codigo_tbl_juguetes` (`fk_codigo_tbl_juguetes`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`fk_codigo_tbl_departamentos`) REFERENCES `departamentos` (`pk_codigo`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`fk_codigo_tbl_ciudades`) REFERENCES `ciudades` (`pk_codigo`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`fk_codigo_tbl_ciudades`) REFERENCES `ciudades` (`pk_codigo`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`fk_id_tbl_vendedores`) REFERENCES `vendedores` (`pk_id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`fk_id_tbl_clientes`) REFERENCES `clientes` (`pk_id`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`fk_codigo_tbl_juguetes`) REFERENCES `juguetes` (`pk_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
