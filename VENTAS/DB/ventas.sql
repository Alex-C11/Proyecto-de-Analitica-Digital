-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2025 a las 05:16:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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

CREATE TABLE `caja` (
  `caja_id` int(11) NOT NULL,
  `caja_numero` int(11) NOT NULL,
  `caja_nombre` varchar(100) NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`) VALUES
(1, 1, 'Caja Principal', 1000.00),
(2, 2, 'Caja Secundaria', 1902.46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nombre` varchar(50) NOT NULL,
  `categoria_ubicacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `cliente_tipo_documento` varchar(20) NOT NULL,
  `cliente_numero_documento` varchar(35) NOT NULL,
  `cliente_nombre` varchar(50) NOT NULL,
  `cliente_apellido` varchar(50) NOT NULL,
  `cliente_provincia` varchar(30) NOT NULL,
  `cliente_ciudad` varchar(30) NOT NULL,
  `cliente_direccion` varchar(70) NOT NULL,
  `cliente_telefono` varchar(20) NOT NULL,
  `cliente_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) NOT NULL,
  `empresa_telefono` varchar(20) NOT NULL,
  `empresa_email` varchar(50) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(1, 'Dep.AutoPartes Alex S.A.', '910668541', 'AutoPartesAlex@hotmail.com', 'Av.Circunvalacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL,
  `producto_codigo` varchar(77) NOT NULL,
  `producto_nombre` varchar(100) NOT NULL,
  `producto_stock_total` int(11) NOT NULL,
  `producto_tipo_unidad` varchar(20) NOT NULL,
  `producto_precio_compra` decimal(30,2) NOT NULL,
  `producto_precio_venta` decimal(30,2) NOT NULL,
  `producto_marca` varchar(35) NOT NULL,
  `producto_modelo` varchar(35) NOT NULL,
  `producto_estado` varchar(20) NOT NULL,
  `producto_foto` varchar(500) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_tipo_unidad`, `producto_precio_compra`, `producto_precio_venta`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_foto`, `categoria_id`) VALUES
(1, 'LL001', 'ADVAN SPORT V107B 305/30ZR21 104Y', 22, 'Unidad', 2986.50, 3524.07, 'YAKOHAMA', '305 30ZR21', 'Habilitado', 'P001_1.jpg', 1),
(2, 'A001', 'ARO 17X8.0', 0, 'Unidad', 527.00, 621.86, 'OSSO', 'GUNMETAL POLISHED FACE', 'Habilitado', 'B001_57.jpg', 2),
(3, 'LL002', 'Continental EcoContact 6 185/55 R15 86H', 30, 'Unidad', 689.05, 813.08, 'Continental', 'EcoContact', 'Habilitado', 'LL002_0.jpg', 1),
(4, 'LL003', 'Bridgestone Turanza T001 215/50 R18 92W', 30, 'Unidad', 605.35, 714.31, 'Bridgestone', 'Turanza', 'Habilitado', 'LL003_97.jpg', 1),
(5, 'LL004', 'Michelin E Primacy 195/65 R15 91V', 30, 'Unidad', 1153.76, 1361.43, 'Michelin', 'E Primacy', 'Habilitado', 'LL004_50.jpg', 1),
(6, 'LL005', 'Pirelli Cinturato P7 205/55 R16 91V', 30, 'Unidad', 288.54, 340.48, 'Pirelli', 'Cinturato', 'Habilitado', 'LL005_50.jpg', 1),
(7, 'LL006', 'Bridgestone Potenza Sport 205/40 R18 86H', 29, 'Unidad', 604.59, 713.42, 'Bridgestone', 'Potenza Sport', 'Habilitado', 'LL006_79.jpg', 1),
(8, 'A002', 'ARO 16X7 RENNEN 8 100/114.3 MATT BLACK WITH RED LIP (AUTO)', 13, 'Unidad', 353.50, 417.13, 'RENNEN', 'MATT', 'Habilitado', 'A002_31.jpg', 2),
(9, 'A003', 'ARO 16X7 RENNEN 8 100/114.3 GREY (AUTO)', 15, 'Unidad', 373.00, 440.14, 'RENNEN', 'GREY', 'Habilitado', 'A003_11.jpg', 2),
(10, 'A004', 'ARO 15X6.5 RENNEN 8 100/114.3 BLACK FULL POLISHED (AUTO)', 1, 'Unidad', 293.50, 346.33, 'RENNEN', 'POLISHED', 'Habilitado', 'A004_42.jpg', 2),
(11, 'A005', 'ARO 17X7.5 RENNEN 5 114.3 FULL MATT BLACK (AUTO)', 11, 'Unidad', 376.50, 444.27, 'RENNEN', 'MATT BLACK', 'Habilitado', 'A005_31.jpg', 2),
(12, 'PR001', 'Parachoque Delantero Nissan Frontier 2015 4x4', 2, 'Unidad', 365.00, 430.70, 'Nissan', 'Frontier', 'Habilitado', 'PR001_29.jpg', 3),
(13, 'PR002', 'Parachoque Delantero Toyota Hilux / Vigo 2012 4x4', 1, 'Unidad', 350.00, 413.00, 'Toyota', 'Hilux', 'Habilitado', 'PR002_66.jpg', 3),
(14, 'PR003', 'PARACHOQUE DELANTERO TOYOTA YARIS 14/16 C/REJILLA', 3, 'Unidad', 260.00, 306.80, 'Toyota', 'Yaris', 'Habilitado', 'PR003_53.jpg', 3),
(15, 'F001', 'Faro Posterior Toyota Yaris ECHO 03/05(R)212.19', 1, 'Unidad', 165.30, 195.00, 'Toyota', 'Yaris ECHO', 'Habilitado', 'F001_67.jpg', 4),
(16, 'F002', 'Faro Posterior Toy Yaris 14(L)', 1, 'Unidad', 190.00, 224.20, 'Toyota', 'Yaris', 'Habilitado', 'F002_38.png', 4),
(17, 'L001', 'G3 INTERMITENTE DIRECCIONAL', 2, 'Unidad', 140.00, 165.20, 'Universal', 'INTERMITENTE', 'Habilitado', 'L001_80.png', 5),
(18, 'L002', 'FOCOS LED T10', 10, 'Unidad', 15.00, 17.70, 'Universal', 'T10', 'Habilitado', 'L002_56.jpg', 5),
(19, 'F003', 'HYUNDAI ACCENT 2011-2020 HB V1 REFLECTOR LED', 4, 'Unidad', 260.00, 306.80, 'HYUNDAI', 'Accent', 'Habilitado', 'F003_23.jpg', 4),
(20, 'F004', 'HYUNDAI ACCENT 2011-2020 NEBLINEROS CON TIRA LED', 2, 'Unidad', 507.00, 598.26, 'HYUNDAI', 'Accent', 'Habilitado', 'F004_67.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nombre` varchar(50) NOT NULL,
  `usuario_apellido` varchar(50) NOT NULL,
  `usuario_email` varchar(50) NOT NULL,
  `usuario_usuario` varchar(30) NOT NULL,
  `usuario_clave` varchar(535) NOT NULL,
  `usuario_foto` varchar(200) NOT NULL,
  `caja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`) VALUES
(1, 'Alexander', 'Chucuya', '', 'Alexander', '$2y$10$DsgKEHA4/NON8WeJZsX3wO0CSKJ7arKRV6CBMwTQYO8b/CQL6Rk3W', 'Administrador_88.png', 1),
(2, 'Juan', 'Pérez', 'juan.perez@example.com', 'juanperez123', '$2y$10$ZOIo25oxx5QABY.el/bbfu5uMLatgKS9IqPfskD3.algFT7yOvmya', 'Juan_9.png', 2),
(3, 'Alex', 'Chu', 'a_chucu@upeu.edu.ep', 'Alex123', '$2y$10$YwYPSLJ.D4rOePrJMeGk0uq351SyecdFHJUuWTrxd/82vB/3aOQvC', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL,
  `venta_codigo` varchar(200) NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_cambio` decimal(30,2) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `caja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_codigo`, `venta_fecha`, `venta_hora`, `venta_total`, `venta_pagado`, `venta_cambio`, `usuario_id`, `cliente_id`, `caja_id`) VALUES
(2, 'S4V0J3N3F3-1', '2024-07-01', '03:47 am', 908.42, 1000.00, 91.58, 1, 1, 1),
(3, 'B6H2R6A0L5-2', '2025-04-15', '05:44 pm', 4094.60, 6000.00, 1905.40, 1, 1, 1),
(4, 'T4T1C4H5A6-3', '2025-05-09', '11:18 pm', 1211.86, 2000.00, 788.14, 1, 1, 1),
(5, 'A1Q8Y3L5N2-4', '2025-05-13', '07:18 pm', 541.33, 1000.00, 458.67, 1, 1, 1),
(6, 'I9Y8Q2D2A3-5', '2025-05-13', '07:23 pm', 346.33, 500.00, 153.67, 1, 1, 1),
(7, 'R9L3D0E2K0-6', '2025-06-13', '11:13 pm', 621.86, 700.00, 78.14, 1, 1, 2),
(8, 'J0L7G2Z1I7-7', '2025-06-15', '10:42 pm', 413.00, 1000.00, 587.00, 1, 1, 1),
(9, 'P2E1B3G3K5-8', '2025-06-15', '10:44 pm', 641.33, 700.00, 58.67, 1, 1, 2),
(10, 'R3W0K5G8I9-9', '2025-06-15', '10:55 pm', 639.27, 750.00, 110.73, 3, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `venta_detalle_id` int(11) NOT NULL,
  `venta_detalle_cantidad` int(11) NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) NOT NULL,
  `venta_codigo` varchar(200) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`venta_detalle_id`, `venta_detalle_cantidad`, `venta_detalle_precio_compra`, `venta_detalle_precio_venta`, `venta_detalle_total`, `venta_detalle_descripcion`, `venta_codigo`, `producto_id`) VALUES
(3, 1, 165.30, 195.00, 195.00, 'Faro Posterior Toyota Yaris ECHO 03/05(R)212.19', 'S4V0J3N3F3-1', 15),
(4, 1, 604.59, 713.42, 713.42, 'Bridgestone Potenza Sport 205/40 R18 86H', 'S4V0J3N3F3-1', 7),
(5, 1, 2986.50, 3524.07, 3524.07, 'ADVAN SPORT V107B 305/30ZR21 104Y', 'B6H2R6A0L5-2', 1),
(6, 1, 293.50, 346.33, 346.33, 'ARO 15X6.5 RENNEN 8 100/114.3 BLACK FULL POLISHED (AUTO)', 'B6H2R6A0L5-2', 10),
(7, 1, 190.00, 224.20, 224.20, 'Faro Posterior Toy Yaris 14(L)', 'B6H2R6A0L5-2', 16),
(8, 1, 293.50, 346.33, 346.33, 'ARO 15X6.5 RENNEN 8 100/114.3 BLACK FULL POLISHED (AUTO)', 'T4T1C4H5A6-3', 10),
(9, 2, 190.00, 224.20, 448.40, 'Faro Posterior Toy Yaris 14(L)', 'T4T1C4H5A6-3', 16),
(10, 1, 353.50, 417.13, 417.13, 'ARO 16X7 RENNEN 8 100/114.3 MATT BLACK WITH RED LIP (AUTO)', 'T4T1C4H5A6-3', 8),
(11, 1, 293.50, 346.33, 346.33, 'ARO 15X6.5 RENNEN 8 100/114.3 BLACK FULL POLISHED (AUTO)', 'A1Q8Y3L5N2-4', 10),
(12, 1, 165.30, 195.00, 195.00, 'Faro Posterior Toyota Yaris ECHO 03/05(R)212.19', 'A1Q8Y3L5N2-4', 15),
(13, 1, 293.50, 346.33, 346.33, 'ARO 15X6.5 RENNEN 8 100/114.3 BLACK FULL POLISHED (AUTO)', 'I9Y8Q2D2A3-5', 10),
(14, 1, 527.00, 621.86, 621.86, 'ARO 17X8.0', 'R9L3D0E2K0-6', 2),
(15, 1, 350.00, 413.00, 413.00, 'Parachoque Delantero Toyota Hilux / Vigo 2012 4x4', 'J0L7G2Z1I7-7', 13),
(16, 1, 190.00, 224.20, 224.20, 'Faro Posterior Toy Yaris 14(L)', 'P2E1B3G3K5-8', 16),
(17, 1, 353.50, 417.13, 417.13, 'ARO 16X7 RENNEN 8 100/114.3 MATT BLACK WITH RED LIP (AUTO)', 'P2E1B3G3K5-8', 8),
(18, 1, 165.30, 195.00, 195.00, 'Faro Posterior Toyota Yaris ECHO 03/05(R)212.19', 'R3W0K5G8I9-9', 15),
(19, 1, 376.50, 444.27, 444.27, 'ARO 17X7.5 RENNEN 5 114.3 FULL MATT BLACK (AUTO)', 'R3W0K5G8I9-9', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `venta_codigo` (`venta_codigo`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venta_detalle_id`),
  ADD KEY `venta_id` (`venta_codigo`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `caja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
