CREATE DATABASE  IF NOT EXISTS `bdproyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdproyecto`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdproyecto
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto` (
  `idboleto` int NOT NULL AUTO_INCREMENT,
  `idestadia` int DEFAULT NULL,
  `idempresa` int DEFAULT NULL,
  `numerobol` varchar(45) DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  PRIMARY KEY (`idboleto`),
  KEY `estadia_boleto_idx` (`idestadia`),
  KEY `empresa_boleto_idx` (`idempresa`),
  KEY `usuario_boleto_idx` (`idusuario`),
  CONSTRAINT `empresa_boleto` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estadia_boleto` FOREIGN KEY (`idestadia`) REFERENCES `estadia` (`idestadia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_boleto` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'72276974','Jhon Erick','Jara Cardenas','958047170'),(2,'65389017','Daniel Rodrigo','Jara Cardenas','995471370'),(3,'21144348','Felix Adrian','Jara Gonzales','959598279'),(4,'74159864','Florencio Renato','Castillo Grande','958412647'),(5,'45781565','Felipe Fabian','Portocarrero Soto','956845123');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cochera`
--

DROP TABLE IF EXISTS `cochera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cochera` (
  `idcochera` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `medidas` varchar(45) DEFAULT NULL,
  `disponibilidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcochera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cochera`
--

LOCK TABLES `cochera` WRITE;
/*!40000 ALTER TABLE `cochera` DISABLE KEYS */;
INSERT INTO `cochera` VALUES (1,'1','1.5*3.0','libre'),(2,'2','2.5*4.0','libre'),(3,'3','1.5*3.0','libre'),(4,'4','2.5*4.0','libre');
/*!40000 ALTER TABLE `cochera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idempresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `cochera` int DEFAULT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Hotel Los Gavilanes','jron Manco Capac 389','201546984513456',4);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadia`
--

DROP TABLE IF EXISTS `estadia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadia` (
  `idestadia` int NOT NULL AUTO_INCREMENT,
  `idvehiculo` int DEFAULT NULL,
  `idcochera` int DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  `horaingreso` time DEFAULT NULL,
  `fechasalida` datetime DEFAULT NULL,
  `horasalida` time DEFAULT NULL,
  `tipocobro` varchar(45) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestadia`),
  KEY `vehiculo_cochera_idx` (`idvehiculo`),
  KEY `cochera_estadia_idx` (`idcochera`),
  CONSTRAINT `cochera_estadia` FOREIGN KEY (`idcochera`) REFERENCES `cochera` (`idcochera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_estadia` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculo` (`idvehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadia`
--

LOCK TABLES `estadia` WRITE;
/*!40000 ALTER TABLE `estadia` DISABLE KEYS */;
INSERT INTO `estadia` VALUES (1,1,1,'2025-01-01 00:00:00','05:05:00','2025-01-01 00:00:00','07:15:00','hora',3.00,'ocupado');
/*!40000 ALTER TABLE `estadia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifa`
--

DROP TABLE IF EXISTS `tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifa` (
  `idtarifa` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  `valdia` decimal(10,2) DEFAULT NULL,
  `valnoche` decimal(10,2) DEFAULT NULL,
  `valmes` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idtarifa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifa`
--

LOCK TABLES `tarifa` WRITE;
/*!40000 ALTER TABLE `tarifa` DISABLE KEYS */;
INSERT INTO `tarifa` VALUES (1,'MOTO',3.00,5.00,200.00),(2,'CAMIONETA',5.00,8.00,350.00),(3,'CAMION',7.00,10.00,500.00);
/*!40000 ALTER TABLE `tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `nomusuario` varchar(45) DEFAULT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'jaime','white','administrador','jaime35','@1234'),(2,'beto','suarez','empleado','betz08','@0000');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `idvehiculo` int NOT NULL AUTO_INCREMENT,
  `tipo_vehiculo` varchar(100) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  PRIMARY KEY (`idvehiculo`),
  KEY `vehiculo_cliente_idx` (`idcliente`),
  CONSTRAINT `vehiculo_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'Moto','AWG-124','HONDA','XR-150','ROJO',1),(2,'Camioneta','ATS-14U','MERCEDES BENZ','ZGEN25','NEGRO',1),(3,'Camion','GTZ-45F','VOLVO','FRT15','BLANCO',2);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bdproyecto'
--
/*!50003 DROP PROCEDURE IF EXISTS `speliminarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `speliminarClientes`(IN p_idcliente INT)
BEGIN

 DELETE FROM cliente
    WHERE idcliente = p_idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spinsertarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spinsertarClientes`(IN p_dni VARCHAR(20),
    IN p_nombres VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(20))
BEGIN

INSERT INTO cliente (dni, nombres, apellidos, telefono)
    VALUES (p_dni, p_nombres, p_apellidos, p_telefono);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `splistarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `splistarClientes`()
BEGIN

select * from cliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spmodificarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spmodificarClientes`(IN p_idcliente INT, IN p_dni VARCHAR(20),
    IN p_nombres VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(20))
BEGIN

 UPDATE cliente
    SET dni = p_dni,
        nombres = p_nombres,
        apellidos = p_apellidos,
        telefono = p_telefono
    WHERE idcliente = p_idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spobtenerClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spobtenerClientes`(IN p_idcliente INT)
BEGIN

 select * FROM cliente
    WHERE idcliente = p_idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


DELIMITER $$
CREATE PROCEDURE `spinsertar_boleto`(
    IN `p_idestadia` INT,
    IN `p_idempresa` INT,
    IN `p_numerobol` VARCHAR(45),
    IN `p_idusuario` INT
)
BEGIN
    INSERT INTO `boleto` (`idestadia`, `idempresa`, `numerobol`, `idusuario`)
    VALUES (p_idestadia, p_idempresa, p_numerobol, p_idusuario);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spobtener_id_boleto(IN boleto_id INT)
BEGIN
    SELECT * FROM `boleto` WHERE `idboleto` = boleto_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spmodificar_boleto(IN boleto_id INT, IN nuevo_numero VARCHAR(50), IN nueva_id_estadia INT, IN nueva_id_empresa INT, IN nueva_id_usuario INT)
BEGIN
    UPDATE `boleto`
    SET `numerobol` = nuevo_numero, `idestadia` = nueva_id_estadia, `idempresa` = nueva_id_empresa, `idusuario` = nueva_id_usuario
    WHERE `idboleto` = boleto_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE speliminar_boleto(IN boleto_id INT)
BEGIN
    DELETE FROM `boleto` WHERE `idboleto` = boleto_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `spinsertar_cochera`(
    IN `p_numero` VARCHAR(45),
    IN `p_medidas` VARCHAR(45),
    IN `p_disponibilidad` VARCHAR(45)
)
BEGIN
    INSERT INTO `cochera` (`numero`, `medidas`, `disponibilidad`)
    VALUES (p_numero, p_medidas, p_disponibilidad);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `spinsertar_empresa`(
    IN `p_nombre` VARCHAR(100),
    IN `p_direccion` VARCHAR(45),
    IN `p_ruc` VARCHAR(45),
    IN `p_cochera` INT
)
BEGIN
    INSERT INTO `empresa` (`nombre`, `direccion`, `ruc`, `cochera`)
    VALUES (p_nombre, p_direccion, p_ruc, p_cochera);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `spinsertar_estadia`(
    IN `p_idvehiculo` INT,
    IN `p_idcochera` INT,
    IN `p_fechaingreso` DATETIME,
    IN `p_horaingreso` TIME,
    IN `p_fechasalida` DATETIME,
    IN `p_horasalida` TIME,
    IN `p_tipocobro` VARCHAR(45),
    IN `p_total` DECIMAL(10,2),
    IN `p_estado` VARCHAR(45)
)
BEGIN
    INSERT INTO `estadia` (`idvehiculo`, `idcochera`, `fechaingreso`, `horaingreso`, `fechasalida`, `horasalida`, `tipocobro`, `total`, `estado`)
    VALUES (p_idvehiculo, p_idcochera, p_fechaingreso, p_horaingreso, p_fechasalida, p_horasalida, p_tipocobro, p_total, p_estado);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `spinsertar_tarifa`(
    IN `p_tipo` VARCHAR(100),
    IN `p_valdia` DECIMAL(10,2),
    IN `p_valnoche` DECIMAL(10,2),
    IN `p_valmes` DECIMAL(10,2)
)
BEGIN
    INSERT INTO `tarifa` (`tipo`, `valdia`, `valnoche`, `valmes`)
    VALUES (p_tipo, p_valdia, p_valnoche, p_valmes);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `spinsertar_usuario`(
    IN `p_nombres` VARCHAR(45),
    IN `p_apellidos` VARCHAR(45),
    IN `p_tipo` VARCHAR(45),
    IN `p_nomusuario` VARCHAR(45),
    IN `p_contrasenia` VARCHAR(45)
)
BEGIN
    INSERT INTO `usuario` (`nombres`, `apellidos`, `tipo`, `nomusuario`, `contrasenia`)
    VALUES (p_nombres, p_apellidos, p_tipo, p_nomusuario, p_contrasenia);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `spinsertar_vehiculo`(
    IN `p_tipo_vehiculo` VARCHAR(100),
    IN `p_placa` VARCHAR(45),
    IN `p_marca` VARCHAR(45),
    IN `p_modelo` VARCHAR(45),
    IN `p_color` VARCHAR(45),
    IN `p_idcliente` INT
)
BEGIN
    INSERT INTO `vehiculo` (`tipo_vehiculo`, `placa`, `marca`, `modelo`, `color`, `idcliente`)
    VALUES (p_tipo_vehiculo, p_placa, p_marca, p_modelo, p_color, p_idcliente);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spobtener_id_cochera(IN cochera_id INT)
BEGIN
    SELECT * FROM `cochera` WHERE `idcochera` = cochera_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spmodificar_cochera(IN cochera_id INT, IN nuevo_numero INT, IN nuevas_medidas VARCHAR(50), IN nueva_disponibilidad VARCHAR(20))
BEGIN
    UPDATE `cochera`
    SET `numero` = nuevo_numero, `medidas` = nuevas_medidas, `disponibilidad` = nueva_disponibilidad
    WHERE `idcochera` = cochera_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE speliminar_cochera(IN cochera_id INT)
BEGIN
    DELETE FROM `cochera` WHERE `idcochera` = cochera_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spobtener_id_empresa(IN empresa_id INT)
BEGIN
    SELECT * FROM `empresa` WHERE `idempresa` = empresa_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spmodificar_empresa(IN empresa_id INT, IN nuevo_nombre VARCHAR(100), IN nueva_direccion VARCHAR(150), IN nuevo_ruc VARCHAR(20))
BEGIN
    UPDATE `empresa`
    SET `nombre` = nuevo_nombre, `direccion` = nueva_direccion, `ruc` = nuevo_ruc
    WHERE `idempresa` = empresa_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE speliminar_empresa(IN empresa_id INT)
BEGIN
    DELETE FROM `empresa` WHERE `idempresa` = empresa_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spobtener_id_estadia(IN estadia_id INT)
BEGIN
    SELECT * FROM `estadia` WHERE `idestadia` = estadia_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spmodificar_estadia(IN estadia_id INT, IN nueva_fecha_ingreso DATETIME, IN nueva_fecha_salida DATETIME)
BEGIN
    UPDATE `estadia`
    SET `fechaingreso` = nueva_fecha_ingreso, `fechasalida` = nueva_fecha_salida
    WHERE `idestadia` = estadia_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE speliminar_estadia(IN estadia_id INT)
BEGIN
    DELETE FROM `estadia` WHERE `idestadia` = estadia_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spobtener_id_tarifa(IN tarifa_id INT)
BEGIN
    SELECT * FROM `tarifa` WHERE `idtarifa` = tarifa_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spmodificar_tarifa(IN tarifa_id INT, IN nuevo_tipo VARCHAR(50), IN nuevo_valdia DECIMAL(10,2), IN nuevo_valnoche DECIMAL(10,2), IN nuevo_valmes DECIMAL(10,2))
BEGIN
    UPDATE `tarifa`
    SET `tipo` = nuevo_tipo, `valdia` = nuevo_valdia, `valnoche` = nuevo_valnoche, `valmes` = nuevo_valmes
    WHERE `idtarifa` = tarifa_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE speliminar_tarifa(IN tarifa_id INT)
BEGIN
    DELETE FROM `tarifa` WHERE `idtarifa` = tarifa_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spobtener_id_usuario(IN usuario_id INT)
BEGIN
    SELECT * FROM `usuario` WHERE `idusuario` = usuario_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spmodificar_usuario(IN usuario_id INT, IN nuevo_nombre VARCHAR(100), IN nuevo_apellido VARCHAR(100), IN nuevo_nomusuario VARCHAR(50), IN nueva_contrasenia VARCHAR(100))
BEGIN
    UPDATE `usuario`
    SET `nombres` = nuevo_nombre, `apellidos` = nuevo_apellido, `nomusuario` = nuevo_nomusuario, `contrasenia` = nueva_contrasenia
    WHERE `idusuario` = usuario_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE speliminar_usuario(IN usuario_id INT)
BEGIN
    DELETE FROM `usuario` WHERE `idusuario` = usuario_id;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE spobtener_id_vehiculo(IN vehiculo_id INT)
BEGIN
    SELECT * FROM `vehiculo` WHERE `idvehiculo` = vehiculo_id;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE spmodificar_vehiculo(IN vehiculo_id INT, IN nueva_placa VARCHAR(20), IN nueva_marca VARCHAR(50), IN nuevo_modelo VARCHAR(50), IN nuevo_color VARCHAR(50))
BEGIN
    UPDATE `vehiculo`
    SET `placa` = nueva_placa, `marca` = nueva_marca, `modelo` = nuevo_modelo, `color` = nuevo_color
    WHERE `idvehiculo` = vehiculo_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE eliminar_vehiculo(IN vehiculo_id INT)
BEGIN
    DELETE FROM `vehiculo` WHERE `idvehiculo` = vehiculo_id;
END$$
DELIMITER ;

-- Dump completed on 2025-01-08 12:43:57
