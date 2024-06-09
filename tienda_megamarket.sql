-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2024 a las 05:01:26
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
-- Base de datos: `tienda_megamarket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_empleado`
--

CREATE TABLE `cargo_empleado` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo_empleado`
--

INSERT INTO `cargo_empleado` (`id_cargo`, `nombre_cargo`) VALUES
(1, 'Administrador'),
(2, 'cajero'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `id_carrito` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `Precio_compra` double NOT NULL,
  `Sub_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Limpieza', 'Producto de limpieza'),
(2, 'Frutas', 'Productos frutas'),
(3, 'Verduras', 'Productos frutas'),
(4, 'Bebidas', 'Productos liquidos de primera necesidas'),
(6, 'Frescos', 'Alimentos  vacunos, etc'),
(7, 'Abarrotes', 'Productos de primera necesidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(80) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `Nombre`, `Apellido`, `Email`, `contraseña`, `telefono`) VALUES
(1, 'Marcos', 'Gutierrez Barrientos', 'gutierrez@hotmail.com', '123456789', '924400647'),
(45, 'Adrian ', 'Alejandro Sanchez', 'adrian23_as@hotmail.com', 'adrian', '924400647'),
(46, 'adrian', 'orlando', 'adriancito_mb@hotmail.com', '12345', '2538640'),
(47, 'jeremi', 'alejandro', 'adrian23@gmail.com', '123456789', '2538640');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_envio`
--

CREATE TABLE `detalle_envio` (
  `id_envio` int(11) NOT NULL,
  `costo_envio` float NOT NULL,
  `forma_envio` varchar(30) DEFAULT NULL,
  `direccion_envio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nombre_producto` varchar(60) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unit` float DEFAULT NULL,
  `costo_envio` float DEFAULT NULL,
  `metodo_entrega` varchar(30) DEFAULT NULL,
  `sub_total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `Apellido` varchar(80) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `Apellido`, `Nombre`, `dni`, `email`, `telefono`, `fecha_nacimiento`, `direccion`, `id_cargo`) VALUES
(4, 'Hinojoza Cardenas', 'Caleb', '12354654', 'veva_02_2012@hotmail.com', '2538640', '2023-02-07', 'san juan de lurigancho av. wiesse', 1),
(7, 'alejandro', 'jeremi', '123456789', 'gutierrez@hotmail.com', '2538640', '2024-01-10', 'las florez san juan de lurigancho', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `ruc` varchar(60) DEFAULT NULL,
  `proveedor` varchar(60) DEFAULT NULL,
  `codigo_producto` varchar(80) DEFAULT NULL,
  `producto` varchar(60) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` double NOT NULL,
  `precio_venta` double NOT NULL,
  `sub_total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id_ingreso`, `fecha`, `ruc`, `proveedor`, `codigo_producto`, `producto`, `cantidad`, `precio_compra`, `precio_venta`, `sub_total`) VALUES
(1, '2023-02-08', '123456879', 'gloria S.A.C', '123456789', 'Lejia Sapolio 2lt ', 40, 7, 8, 280),
(2, '2023-01-31', '1654897544', 'Peru SAC', '0123546', 'Lejia Sapolio', 110, 3.5, 4, 385),
(3, '2023-08-23', '123456879', 'gloria S.A.C', '2165489', 'Limpieza', 110, 20, 40, 2200),
(4, '2023-12-06', '123456879', 'gloria S.A.C', '555555555', 'Papel Higienico', 110, 1.5, 5, 165),
(5, '2024-01-10', '123456879', 'gloria S.A.C', '2165489', 'Limpieza', 30, 3.5, 4, 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_venta` int(11) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `forma_pago` varchar(30) DEFAULT NULL,
  `estado_pedido` varchar(30) DEFAULT NULL,
  `metodo_entrega` varchar(30) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `telefono` varchar(12) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `productos` text DEFAULT NULL,
  `codigo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_venta`, `fecha_pedido`, `forma_pago`, `estado_pedido`, `metodo_entrega`, `total`, `id_cliente`, `nombre`, `apellido`, `telefono`, `Direccion`, `productos`, `codigo`) VALUES
(80, '2024-01-12 01:57:19', 'tarjeta', 'Entregado', 'delivery', 34.9, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xDowny]', '[540216578]'),
(81, '2023-02-21 02:13:37', 'contra entrega', 'por entregar', 'delivery', 69.8, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[2xDowny]', '[540216578]'),
(82, '2023-02-22 19:20:58', 'contra entrega', 'Por entregar', 'delivery', 69.8, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[2xDowny]', '[540216578]'),
(83, '2023-02-21 02:21:46', 'contra entrega', 'por entregar', 'delivery', 69.8, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(84, '2023-02-21 02:24:31', 'contra entrega', 'por entregar', 'delivery', 69.8, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(85, '2023-02-21 02:27:16', 'contra entrega', 'por entregar', 'delivery', 2500, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(86, '2023-06-08 01:45:08', 'contra entrega', 'Entregado', 'delivery', 69.8, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(87, '2023-02-21 02:27:59', 'contra entrega', 'por entregar', 'delivery', 69.8, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(88, '2023-02-21 02:28:10', 'tarjeta', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(89, '2023-02-21 02:31:49', 'contra entrega', 'por entregar', 'delivery', 45.75, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella]', '[12540210021]'),
(90, '2023-12-12 04:25:27', 'contra entrega', 'Entregado', 'delivery', 45.75, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(91, '2023-02-21 02:32:41', 'contra entrega', 'por entregar', 'delivery', 45.75, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[]', '[]'),
(92, '2023-02-21 02:33:08', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(93, '2023-02-21 02:33:45', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(94, '2023-02-21 02:33:49', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(95, '2023-02-21 02:34:46', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(96, '2023-02-21 02:35:46', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(97, '2023-02-21 02:36:02', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(98, '2023-02-21 02:36:30', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(99, '2023-02-21 02:37:18', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(100, '2023-02-21 02:37:38', 'contra entrega', 'por entregar', 'delivery', 80.65, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xMarsella, 1xDowny]', '[12540210021, 540216578]'),
(101, '2023-04-17 22:17:04', 'contra entrega', 'por entregar', 'delivery', 93.15, 45, 'Adrian ', 'Alejandro Sanchez', '2538640', 'Alejandro Sanchez', '[1xMarsella, 1xDowny, 1xSapolio]', '[12540210021, 540216578, 54787921]'),
(102, '2023-06-08 01:11:33', 'contra entrega', 'por entregar', 'delivery', 34.9, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xDowny]', '[540216578]'),
(103, '2023-06-24 04:44:03', 'contra entrega', 'por entregar', 'delivery', 9.5, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xRopa de HYM]', '[12345789754]'),
(104, '2023-08-04 03:44:23', 'tarjeta', 'por entregar', 'delivery', 62.36, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[2xSandia, 1xHigienol, 1xBolivar, 1xSapolio]', '[9898874554, 2248791454, 785100231, 54787921]'),
(105, '2023-08-04 05:03:22', 'tarjeta', 'por entregar', 'delivery', 70.19, 46, 'adrian', 'orlando', '2538640', 'orlando', '[1xPapaya, 2xBolivar, 1xHigienol, 1xSapolio]', '[00456789, 785100231, 2248791454, 54787921]'),
(106, '2023-10-28 05:20:03', 'tarjeta', 'por entregar', 'delivery', 6, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xBolivar]', '[785100231]'),
(107, '2023-11-27 04:58:03', 'contra entrega', 'por entregar', 'delivery', 10.17, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xBolivar, 1xSandia, 1xPlatano de Seda]', '[785100231, 9898874554, 7988754621]'),
(108, '2023-12-12 04:24:24', 'contra entrega', 'por entregar', 'delivery', 7.48, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xBolivar, 1xSandia]', '[785100231, 9898874554]'),
(109, '2024-01-12 01:56:02', 'contra entrega', 'por entregar', 'delivery', 15.439999999999998, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xPlatano de Seda, 1xPapel Higienico, 2xSandia, 1xPapaya]', '[7988754621, 5555555, 9898874554, 00456789]'),
(110, '2024-01-12 01:56:17', 'tarjeta', 'por entregar', 'delivery', 15.439999999999998, 1, 'Marcos', 'Gutierrez Barrientos', '2538640', 'Gutierrez Barrientos', '[1xPlatano de Seda, 1xPapel Higienico, 2xSandia, 1xPapaya]', '[7988754621, 5555555, 9898874554, 00456789]'),
(111, '2024-01-23 03:33:31', 'contra entrega', 'Entregado', 'delivery', 45.2, 47, 'jeremi', 'alejandro', '2538640', 'alejandro', '[1xSan Carlos, 2xPescado Bonito, 1xAlacena]', '[696967445, 0323156, 12354978]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `codigo` varchar(80) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` double NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `codigo`, `descripcion`, `stock`, `precio`, `id_categoria`, `imagen`) VALUES
(6, 'Sandia', '9898874554', 'PresentaciÃ³n 2.5 kg aprox.', 22, 1.48, 2, 'https://plazavea.vteximg.com.br/arquivos/ids/214684-450-450/sandia-1un-12-sandia.jpg'),
(7, 'Platano de Seda', '7988754621', 'Presentacion 1 kg aprox.', 32, 2.69, 2, 'https://plazavea.vteximg.com.br/arquivos/ids/646256-450-450/772631.jpg'),
(8, 'Papaya', '00456789', 'Presentacion 1.5 kg aprox.', 57, 4.79, 2, 'https://plazavea.vteximg.com.br/arquivos/ids/182396-450-450/papaya-extra-kg.jpg'),
(11, 'Limon ', '783215400', 'Presentacion 0.5 kg aprox.', 200, 3.49, 3, 'https://plazavea.vteximg.com.br/arquivos/ids/177076-450-450/limon-acido-kg.jpg'),
(12, 'Tomate ', '0021858787', 'Presentacion 0.5 kg aprox.', 30, 3.99, 3, 'https://plazavea.vteximg.com.br/arquivos/ids/518590-450-450/60769.jpg'),
(13, 'Zapallo Macre', '457874411', 'PresentaciÃ³n 1.5 kg aprox.', 60, 3.3, 3, 'https://plazavea.vteximg.com.br/arquivos/ids/178669-450-450/zapallo-macre-kg.jpg'),
(14, 'Inka kola', '78945688', 'Gaseosa INCA KOLA Paquete 2Un Botella 3L', 19, 19.2, 4, 'https://plazavea.vteximg.com.br/arquivos/ids/24844288-450-450/109850.jpg'),
(15, 'San Carlos', '696967445', 'Agua de Mesa SAN CARLOS Sin Gas Caja 20L', 9, 21.9, 4, 'https://plazavea.vteximg.com.br/arquivos/ids/410178-450-450/20189389.jpg'),
(16, 'San Carlos', '4567895421', 'Agua SAN CARLOS Botella 3L Paquete 2un', 13, 4.5, 4, 'https://plazavea.vteximg.com.br/arquivos/ids/8558702-450-450/20206044.jpg'),
(17, 'Seven Up', '69985445', 'Gaseosa SEVEN UP Lima LimÃ³n Botella 3L', 58, 6.5, 4, 'https://plazavea.vteximg.com.br/arquivos/ids/318907-450-450/gaseosa-seven-up-botella-3l.jpg'),
(18, 'Pollo Fresco ', '698754521', 'PresentaciÃ³n 2.5 kg aprox.', 5, 8.9, 6, 'https://plazavea.vteximg.com.br/arquivos/ids/170588-450-450/pollo-fresco-entero-bolsa-1un.jpg'),
(19, 'Pescado Bonito', '0323156', 'PresentaciÃ³n 3 kg aprox.', 28, 6.9, 6, 'https://plazavea.vteximg.com.br/arquivos/ids/19995923-450-450/287623.jpg'),
(21, 'Alacena', '696968741', 'Mayonesa ALACENA Doypack 850g', 39, 16.9, 7, 'https://plazavea.vteximg.com.br/arquivos/ids/19529889-450-450/20314552.jpg'),
(22, 'Emsal', '69698754212', 'Sal Marina EMSAL Mesa Bolsa 1Kg', 60, 2.09, 7, 'https://plazavea.vteximg.com.br/arquivos/ids/561008-450-450/20130448.jpg'),
(23, 'Alacena', '12354978', 'Ketchup ALACENA Doypack 380g', 68, 9.5, 7, 'https://plazavea.vteximg.com.br/arquivos/ids/17161047-450-450/90415.jpg'),
(24, 'CosteÃ±o', '00021548', 'Arroz Extra COSTEÃO Bolsa 5Kg', 20, 22.5, 7, 'https://plazavea.vteximg.com.br/arquivos/ids/554165-450-450/641425.jpg'),
(25, 'Don Vittorio', '00000156', 'Fideo Spaghetti DON VITTORIO Bolsa 950g', 60, 5.7, 7, 'https://plazavea.vteximg.com.br/arquivos/ids/10051149-450-450/20277768.jpg'),
(26, 'Florida', '00000013', 'Filete de Atun FLORIDA en Agua 110kcal Lata 150g', 30, 5.9, 7, 'https://plazavea.vteximg.com.br/arquivos/ids/1087859-450-450/20191578.jpg'),
(28, 'Papel Higienico', '5555555', 'Papel higienico para limpiarze y quedar limpio', 108, 5, 1, 'https://daryza.com/wp-content/uploads/2022/09/30591.png'),
(29, 'Limpieza', '21454541454', 'Producto de limpieza', 30, 9.8, 1, 'https://promart.vteximg.com.br/arquivos/ids/570967-1000-1000/30310.jpg?v=637401128378600000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `nombre_proveedor` varchar(60) DEFAULT NULL,
  `ruc` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `direccion`, `email`, `telefono`, `nombre_proveedor`, `ruc`) VALUES
(1, 'lurin-lima ', 'gloria@gmail.comz', '959871136', 'gloria S.A.C', '123456879'),
(2, 'san juan de lurigancho av. wiesse', 'peru@gmail.com', '2538640', 'Peru SAC', '1654897544');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `rol_usuario` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `rol_usuario`) VALUES
(1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Apellido` varchar(80) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `id_tipo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `Nombre`, `Apellido`, `correo`, `contraseña`, `id_tipo_usuario`) VALUES
(1, 'Adrian ', 'Alejandro Sanchez', 'Adrian23_as@hotmail.com', '123456789', 1),
(3, 'Caleb', 'Hinojoza Cardenas', 'veva_02_2012@hotmail.com', '123456789', 1),
(4, 'jeremi', 'alejandro', 'gutierrez@hotmail.com', '456789', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo_empleado`
--
ALTER TABLE `cargo_empleado`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `detalle_envio`
--
ALTER TABLE `detalle_envio`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo_empleado`
--
ALTER TABLE `cargo_empleado`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `detalle_envio`
--
ALTER TABLE `detalle_envio`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `carrito_compras_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_venta`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo_empleado` (`id_cargo`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
