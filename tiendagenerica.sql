-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2021 a las 01:11:52
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendagenerica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cedula_cliente` bigint(20) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cedula_cliente`, `direccion_cliente`, `email_cliente`, `nombre_cliente`, `telefono_cliente`) VALUES
(41712863, 'calle 1 #2-20', 'cliente1@email.com', 'Cliente Numero uno', '6012334455'),
(45678980, 'Avenida 1 # 2-40', 'cliente2@email.com', 'Jimmy Salcedo', '6017654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `codigo_detalle_venta` bigint(20) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `codigo_producto` bigint(20) NOT NULL,
  `codigo_venta` bigint(20) NOT NULL,
  `valor_total` double NOT NULL,
  `valor_venta` double NOT NULL,
  `valoriva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`codigo_detalle_venta`, `cantidad_producto`, `codigo_producto`, `codigo_venta`, `valor_total`, `valor_venta`, `valoriva`) VALUES
(1, 1, 1234, 1, 119000, 100000, 19000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo_producto` bigint(20) NOT NULL,
  `ivacompra` double NOT NULL,
  `nitproveedor` bigint(20) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio_compra` double NOT NULL,
  `precio_venta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo_producto`, `ivacompra`, `nitproveedor`, `nombre_producto`, `precio_compra`, `precio_venta`) VALUES
(1234, 19000, 9007759573, 'Primer Producto', 80000, 100000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `nitproveedor` bigint(20) NOT NULL,
  `ciudad_proveedor` varchar(255) NOT NULL,
  `direccion_proveedor` varchar(255) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL,
  `telefono_proveedor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`nitproveedor`, `ciudad_proveedor`, `direccion_proveedor`, `nombre_proveedor`, `telefono_proveedor`) VALUES
(8300447881, 'Bogota', 'Carrera 3 #4-56', 'Segundo Proveedor', '6017668899'),
(9007759573, 'Bogotá', 'Avenida principal # 1-10', 'Primer Proveedor', '6011223344');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cedula_usuario` bigint(20) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cedula_usuario`, `email_usuario`, `nombre_usuario`, `password`, `usuario`) VALUES
(45678980, 'usuario2@email.com', 'Segundo Cabezas', 'SuClave', 'SeCas'),
(79346912, 'usuario1@email.com', 'Diego Bernal', 'MiClave', 'Diber');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `codigo_venta` bigint(20) NOT NULL,
  `cedula_cliente` bigint(20) NOT NULL,
  `cedula_usuario` bigint(20) NOT NULL,
  `ivaventa` double NOT NULL,
  `total_venta` double NOT NULL,
  `valor_venta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`codigo_venta`, `cedula_cliente`, `cedula_usuario`, `ivaventa`, `total_venta`, `valor_venta`) VALUES
(1, 41712863, 79346912, 19000, 119000, 100000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cedula_cliente`),
  ADD KEY `FK_cc_cliente` (`cedula_cliente`),
  ADD KEY `cedula_cliente` (`cedula_cliente`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`codigo_detalle_venta`),
  ADD KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `codigo_detalle_venta` (`codigo_detalle_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `FK_cd_producto` (`codigo_producto`),
  ADD KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `nitproveedor` (`nitproveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`nitproveedor`),
  ADD KEY `FK_nit_proveedor` (`nitproveedor`),
  ADD KEY `nitproveedor` (`nitproveedor`),
  ADD KEY `nitproveedor_2` (`nitproveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cedula_usuario`),
  ADD KEY `FK_cc_usuario` (`cedula_usuario`),
  ADD KEY `cedula_usuario` (`cedula_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`codigo_venta`),
  ADD KEY `FK_cod_venta` (`codigo_venta`),
  ADD KEY `codigo_venta` (`codigo_venta`),
  ADD KEY `cedula_cliente` (`cedula_cliente`),
  ADD KEY `cedula_usuario` (`cedula_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`codigo_detalle_venta`) REFERENCES `ventas` (`codigo_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`nitproveedor`) REFERENCES `proveedores` (`nitproveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cedula_cliente`) REFERENCES `clientes` (`cedula_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
