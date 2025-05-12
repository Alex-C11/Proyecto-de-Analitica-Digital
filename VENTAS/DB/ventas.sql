-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-07-2024 a las 08:51:28
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

DROP TABLE IF EXISTS `caja`;
CREATE TABLE IF NOT EXISTS `caja` (
  `caja_id` int NOT NULL AUTO_INCREMENT,
  `caja_numero` int NOT NULL,
  `caja_nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL,
  PRIMARY KEY (`caja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`) VALUES
(1, 1, 'Caja Principal', 5054.35),
(2, 2, 'Caja Secundaria', 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_ubicacion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_ubicacion`) VALUES
(1, 'Llantas', ''),
(2, 'Aros', ''),
(3, 'Parachoques', ''),
(4, 'Faros', ''),
(5, 'Luces', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_tipo_documento` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_numero_documento` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_apellido` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_provincia` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_ciudad` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_direccion` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_telefono` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_tipo_documento`, `cliente_numero_documento`, `cliente_nombre`, `cliente_apellido`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_telefono`, `cliente_email`) VALUES
(1, 'Otro', 'N/A', 'Publico', 'General', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(2, 'DNI', '71046725', 'Alexander', 'Chucuya', 'San Roman', 'Juliaca', 'Av.Circunvalacion', '910668541', 'a_alexander2002@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `empresa_id` int NOT NULL AUTO_INCREMENT,
  `empresa_nombre` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_telefono` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_direccion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(1, 'Dep.AutoPartes Alex S.A.C', '910668541', 'AutoPartesAlex@hotmail.com', 'Av.Circunvalacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(77) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_stock_total` int NOT NULL,
  `producto_tipo_unidad` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_precio_compra` decimal(30,2) NOT NULL,
  `producto_precio_venta` decimal(30,2) NOT NULL,
  `producto_marca` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_modelo` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_estado` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_foto` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_tipo_unidad`, `producto_precio_compra`, `producto_precio_venta`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_foto`, `categoria_id`) VALUES
(1, 'LL001', 'ADVAN SPORT V107B 305/30ZR21 104Y', 23, 'Unidad', 2986.50, 3524.07, 'YAKOHAMA', '305 30ZR21', 'Habilitado', 'P001_1.jpg', 1),
(2, 'A001', 'ARO 17X8.0', 7, 'Unidad', 527.00, 621.86, 'OSSO', 'GUNMETAL POLISHED FACE', 'Habilitado', 'B001_57.jpg', 2),
(3, 'LL002', 'Continental EcoContact 6 185/55 R15 86H', 30, 'Unidad', 689.05, 813.08, 'Continental', 'EcoContact', 'Habilitado', 'LL002_0.jpg', 1),
(4, 'LL003', 'Bridgestone Turanza T001 215/50 R18 92W', 30, 'Unidad', 605.35, 714.31, 'Bridgestone', 'Turanza', 'Habilitado', 'LL003_97.jpg', 1),
(5, 'LL004', 'Michelin E Primacy 195/65 R15 91V', 30, 'Unidad', 1153.76, 1361.43, 'Michelin', 'E Primacy', 'Habilitado', 'LL004_50.jpg', 1),
(6, 'LL005', 'Pirelli Cinturato P7 205/55 R16 91V', 30, 'Unidad', 288.54, 340.48, 'Pirelli', 'Cinturato', 'Habilitado', 'LL005_50.jpg', 1),
(7, 'LL006', 'Bridgestone Potenza Sport 205/40 R18 86H', 29, 'Unidad', 604.59, 713.42, 'Bridgestone', 'Potenza Sport', 'Habilitado', 'LL006_79.jpg', 1),
(8, 'A002', 'ARO 16X7 RENNEN 8 100/114.3 MATT BLACK WITH RED LIP (AUTO)', 15, 'Unidad', 353.50, 417.13, 'RENNEN', 'MATT', 'Habilitado', 'A002_31.jpg', 2),
(9, 'A003', 'ARO 16X7 RENNEN 8 100/114.3 GREY (AUTO)', 15, 'Unidad', 373.00, 440.14, 'RENNEN', 'GREY', 'Habilitado', 'A003_11.jpg', 2),
(10, 'A004', 'ARO 15X6.5 RENNEN 8 100/114.3 BLACK FULL POLISHED (AUTO)', 8, 'Unidad', 293.50, 346.33, 'RENNEN', 'POLISHED', 'Habilitado', 'A004_42.jpg', 2),
(11, 'A005', 'ARO 17X7.5 RENNEN 5 114.3 FULL MATT BLACK (AUTO)', 12, 'Unidad', 376.50, 444.27, 'RENNEN', 'MATT BLACK', 'Habilitado', 'A005_31.jpg', 2),
(12, 'PR001', 'Parachoque Delantero Nissan Frontier 2015 4x4', 2, 'Unidad', 365.00, 430.70, 'Nissan', 'Frontier', 'Habilitado', 'PR001_29.jpg', 3),
(13, 'PR002', 'Parachoque Delantero Toyota Hilux / Vigo 2012 4x4', 2, 'Unidad', 350.00, 413.00, 'Toyota', 'Hilux', 'Habilitado', 'PR002_66.jpg', 3),
(14, 'PR003', 'PARACHOQUE DELANTERO TOYOTA YARIS 14/16 C/REJILLA', 1, 'Unidad', 260.00, 306.80, 'Toyota', 'Yaris', 'Habilitado', 'PR003_53.jpg', 3),
(15, 'F001', 'Faro Posterior Toyota Yaris ECHO 03/05(R)212.19', 3, 'Unidad', 165.30, 195.00, 'Toyota', 'Yaris ECHO', 'Habilitado', 'F001_67.jpg', 4),
(16, 'F002', 'Faro Posterior Toy Yaris 14(L)', 4, 'Unidad', 190.00, 224.20, 'Toyota', 'Yaris', 'Habilitado', 'F002_38.png', 4),
(17, 'L001', 'G3 INTERMITENTE DIRECCIONAL', 2, 'Unidad', 140.00, 165.20, 'Universal', 'INTERMITENTE', 'Habilitado', 'L001_80.png', 5),
(18, 'L002', 'FOCOS LED T10', 10, 'Unidad', 15.00, 17.70, 'Universal', 'T10', 'Habilitado', 'L002_56.jpg', 5),
(19, 'F003', 'HYUNDAI ACCENT 2011-2020 HB V1 REFLECTOR LED', 4, 'Unidad', 260.00, 306.80, 'HYUNDAI', 'Accent', 'Habilitado', 'F003_23.jpg', 4),
(20, 'F004', 'HYUNDAI ACCENT 2011-2020 NEBLINEROS CON TIRA LED', 2, 'Unidad', 507.00, 598.26, 'HYUNDAI', 'Accent', 'Habilitado', 'F004_67.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_apellido` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_usuario` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_clave` varchar(535) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_foto` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `caja_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `caja_id` (`caja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`) VALUES
(1, 'Alexander', 'Chucuya', '', 'Alexander', '$2y$10$DsgKEHA4/NON8WeJZsX3wO0CSKJ7arKRV6CBMwTQYO8b/CQL6Rk3W', 'Administrador_88.png', 1),
(2, 'Juan', 'Pérez', 'juan.perez@example.com', 'juanperez123', '$2y$10$ZOIo25oxx5QABY.el/bbfu5uMLatgKS9IqPfskD3.algFT7yOvmya', 'Juan_9.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `venta_codigo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_cambio` decimal(30,2) NOT NULL,
  `usuario_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `caja_id` int NOT NULL,
  PRIMARY KEY (`venta_id`),
  UNIQUE KEY `venta_codigo` (`venta_codigo`),
  KEY `usuario_id` (`usuario_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `caja_id` (`caja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_codigo`, `venta_fecha`, `venta_hora`, `venta_total`, `venta_pagado`, `venta_cambio`, `usuario_id`, `cliente_id`, `caja_id`) VALUES
(2, 'S4V0J3N3F3-1', '2024-07-01', '03:47 am', 908.42, 1000.00, 91.58, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
CREATE TABLE IF NOT EXISTS `venta_detalle` (
  `venta_detalle_id` int NOT NULL AUTO_INCREMENT,
  `venta_detalle_cantidad` int NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_codigo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`venta_detalle_id`),
  KEY `venta_id` (`venta_codigo`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`venta_detalle_id`, `venta_detalle_cantidad`, `venta_detalle_precio_compra`, `venta_detalle_precio_venta`, `venta_detalle_total`, `venta_detalle_descripcion`, `venta_codigo`, `producto_id`) VALUES
(3, 1, 165.30, 195.00, 195.00, 'Faro Posterior Toyota Yaris ECHO 03/05(R)212.19', 'S4V0J3N3F3-1', 15),
(4, 1, 604.59, 713.42, 713.42, 'Bridgestone Potenza Sport 205/40 R18 86H', 'S4V0J3N3F3-1', 7);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
