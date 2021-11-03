-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2021 a las 22:49:08
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `CliCed` bigint(20) NOT NULL,
  `CliDir` varchar(255) NOT NULL,
  `CliEmail` varchar(255) NOT NULL,
  `CliNom` varchar(255) NOT NULL,
  `CliTel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `DetCod` bigint(20) NOT NULL,
  `DetCant` int(11) NOT NULL,
  `DetCodProd` bigint(20) NOT NULL,
  `VenCod` bigint(20) NOT NULL,
  `DetTotal` double NOT NULL,
  `DetValVen` double NOT NULL,
  `DetIva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProdCod` bigint(20) NOT NULL,
  `ProdIvaCom` double NOT NULL,
  `ProveNit` bigint(20) NOT NULL,
  `ProdNom` varchar(255) NOT NULL,
  `ProdPreCom` double NOT NULL,
  `ProdPreVen` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProvNit` bigint(20) NOT NULL,
  `ProvCiud` varchar(255) NOT NULL,
  `ProvDir` varchar(255) NOT NULL,
  `ProvNom` varchar(255) NOT NULL,
  `ProvTel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuCed` bigint(20) NOT NULL,
  `UsuEma` varchar(255) NOT NULL,
  `UsuNom` varchar(255) NOT NULL,
  `UsuPass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VenCod` bigint(20) NOT NULL,
  `CliCed` bigint(20) NOT NULL,
  `UsuCed` bigint(20) NOT NULL,
  `VenIva` double NOT NULL,
  `VenTotal` double NOT NULL,
  `VenValor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CliCed`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`DetCod`) USING BTREE,
  ADD KEY `codigo_producto_det` (`DetCodProd`),
  ADD KEY `codigo_venta` (`VenCod`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProdCod`),
  ADD KEY `nitproveedor_product` (`ProveNit`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProvNit`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuCed`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VenCod`),
  ADD KEY `cedula_cliente` (`CliCed`),
  ADD KEY `cedula_usuario` (`UsuCed`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `CliCed` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `DetCod` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProdCod` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProvNit` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuCed` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VenCod` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`DetCodProd`) REFERENCES `productos` (`ProdCod`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`VenCod`) REFERENCES `ventas` (`VenCod`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ProveNit`) REFERENCES `proveedores` (`ProvNit`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`CliCed`) REFERENCES `clientes` (`CliCed`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`UsuCed`) REFERENCES `usuarios` (`UsuCed`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
