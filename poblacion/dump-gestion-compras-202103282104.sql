-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gestion-compras
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analista`
--

DROP TABLE IF EXISTS `analista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analista`
--

LOCK TABLES `analista` WRITE;
/*!40000 ALTER TABLE `analista` DISABLE KEYS */;
INSERT INTO `analista` VALUES (1,'Andrea','Rocha'),(2,'Gladys','Vingelis'),(3,'Cintia','Ayude');
/*!40000 ALTER TABLE `analista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (1,'Fabian Eduardo','Sollazo'),(2,'Carlos','Dulbecco'),(3,'Pablo Augusto','Corbetta'),(4,'Julieta','Rentería'),(5,'Guillermo','Bethular');
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Primera vez'),(2,'Continuidad'),(3,'Renovación de tratamiento');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion`
--

DROP TABLE IF EXISTS `gestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsc` varchar(15) DEFAULT NULL,
  `ap` varchar(15) DEFAULT NULL,
  `socio` varchar(15) DEFAULT NULL,
  `id_medicamento` int(11) DEFAULT NULL,
  `id_protesis` int(11) DEFAULT NULL,
  `detalle` varchar(999) DEFAULT NULL,
  `id_prestador` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_analista` int(11) DEFAULT NULL,
  `id_auditor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gestion_FK` (`id_prestador`),
  KEY `gestion_FK_1` (`id_medicamento`),
  KEY `gestion_FK_2` (`id_protesis`),
  KEY `gestion_FK_3` (`id_analista`),
  KEY `gestion_FK_4` (`id_auditor`),
  CONSTRAINT `gestion_FK` FOREIGN KEY (`id_prestador`) REFERENCES `prestador` (`id`),
  CONSTRAINT `gestion_FK_1` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id`),
  CONSTRAINT `gestion_FK_2` FOREIGN KEY (`id_protesis`) REFERENCES `protesis` (`id`),
  CONSTRAINT `gestion_FK_3` FOREIGN KEY (`id_analista`) REFERENCES `analista` (`id`),
  CONSTRAINT `gestion_FK_4` FOREIGN KEY (`id_auditor`) REFERENCES `auditor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES (2,'1111111','1111111','1111111',NULL,NULL,'prueba',NULL,'2021-03-18',NULL,NULL),(3,'1111111','1111111','1111111',NULL,NULL,'prueba',NULL,'2021-03-18',NULL,NULL),(4,'212121','212121','212121',NULL,NULL,'TEXTO de prueba',NULL,'2021-03-18',NULL,NULL),(5,'212121','212121','212121',NULL,NULL,'TEXTO de prueba',NULL,'2021-03-18',NULL,NULL),(6,'202020','202020','202020',NULL,NULL,'TEXTO de prueba',NULL,'2021-03-18',NULL,NULL),(7,'01010101','01010101','01010101',NULL,NULL,'prueba de textarea',NULL,'2021-03-18',2,3),(8,'65465465','654654654','654654654',NULL,NULL,'kalksjhlskjhlkjhlakjdf',NULL,'2021-03-18',2,1),(9,'65465465','654654654','654654654',NULL,NULL,'kalksjhlskjhlkjhlakjdf',NULL,'2021-03-18',2,1),(10,'65465465','65465465','65465465',NULL,NULL,'65465465',NULL,'2021-03-19',3,3),(11,'65465465','65465465','65465465',NULL,NULL,'65465465',NULL,'2021-03-19',3,3),(14,'99999','99999','99999',NULL,NULL,'99999',NULL,'2021-03-25',1,1),(15,'99999','99999','99999',NULL,NULL,'99999',3,'2021-03-25',1,1),(16,'123456','123456','123456',3,2,'123456',5,'2021-03-27',1,1),(17,'123456','123456','123456',4,3,'123456',6,'2021-03-27',1,1),(18,'123456','123456','123456',5,4,'123456',7,'2021-03-27',1,1),(19,'123456','123456','123456',6,5,'123456',8,'2021-03-27',1,1),(20,'0909090909','0909090909','0909090909',7,6,'0909090909',9,'2021-03-27',2,3),(21,'0909090909','0909090909','0909090909',8,7,'0909090909',10,'2021-03-27',2,3),(22,'1111111111111','1111111111111','1111111111111',9,8,'Prueba de escritura en todas las tablas',11,'2021-03-27',3,4);
/*!40000 ALTER TABLE `gestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor_med` decimal(10,2) NOT NULL,
  `valor_prop` decimal(10,2) NOT NULL,
  `valor_noacep` decimal(10,2) NOT NULL,
  `valor_prop_sinstock` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `nom_med` varchar(100) DEFAULT NULL,
  `nom_gen_med` varchar(100) DEFAULT NULL,
  `autorizado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicamentos_FK` (`id_estado`),
  CONSTRAINT `medicamentos_FK` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,20.00,18.00,21.00,20.00,1,1,NULL,NULL,NULL),(3,0.00,0.00,0.00,0.00,123456,1,NULL,'123456',23),(4,0.00,0.00,0.00,0.00,123456,1,NULL,'123456',23),(5,0.00,0.00,0.00,0.00,123456,1,NULL,'123456',23),(6,0.00,0.00,0.00,0.00,123456,1,NULL,'123456',123456),(7,0.00,0.00,0.00,0.00,909090909,2,NULL,'0909090909',909090909),(8,99999999.99,99999999.99,99999999.99,99999999.99,909090909,2,'0909090909','0909090909',909090909),(9,1500.00,500.00,1000.00,1700.00,10,1,'Tafirol','Paracetamol',2);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestador`
--

DROP TABLE IF EXISTS `prestador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `matricula` int(11) NOT NULL,
  `num_prestador_osde` int(11) NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `cuil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestador`
--

LOCK TABLES `prestador` WRITE;
/*!40000 ALTER TABLE `prestador` DISABLE KEYS */;
INSERT INTO `prestador` VALUES (2,'99999','99999',99999,0,0.0,'99999',NULL),(3,'99999','99999',99999,0,0.0,'99999',NULL),(4,'','',0,0,0.0,'',0),(5,'123456','123456',123456,0,0.0,'123456',123456),(6,'123456','123456',123456,0,0.0,'123456',123456),(7,'123456','123456',123456,0,0.0,'123456',123456),(8,'123456','123456',123456,0,0.0,'123456',123456),(9,'0909090909','0909090909',909090909,0,0.0,'0909090909',909090909),(10,'0909090909','0909090909',909090909,0,0.0,'0909090909',909090909),(11,'Javier','Solari Paz',2147483647,0,0.0,'técnico en sistemas',2147483647);
/*!40000 ALTER TABLE `prestador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protesis`
--

DROP TABLE IF EXISTS `protesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protesis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gestion_proveedor` decimal(10,2) DEFAULT NULL,
  `gestion_medico` decimal(10,2) DEFAULT NULL,
  `gestion_prop_noaceptada` decimal(10,2) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `protesis` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `protesis_FK` (`id_proveedor`),
  CONSTRAINT `protesis_FK` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protesis`
--

LOCK TABLES `protesis` WRITE;
/*!40000 ALTER TABLE `protesis` DISABLE KEYS */;
INSERT INTO `protesis` VALUES (1,21.00,20.00,19.00,1,NULL),(2,0.00,NULL,NULL,12,''),(3,0.00,NULL,NULL,13,''),(4,0.00,NULL,NULL,14,''),(5,1.00,NULL,NULL,15,'123456'),(6,6.00,NULL,NULL,16,'0909090909'),(7,6.00,NULL,NULL,17,'0909090909'),(8,11.00,NULL,NULL,18,'pata de palo');
/*!40000 ALTER TABLE `protesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Ortopedia Capital',NULL,NULL),(2,'Dok',NULL,NULL),(3,'Imation Ty',NULL,NULL),(4,'Biolap',NULL,NULL),(5,'Caruso',NULL,NULL),(6,'Medical Implant',NULL,NULL),(7,'Justo a Tiempo',NULL,NULL),(8,'Genzyme',NULL,NULL),(9,'Movistar',NULL,NULL),(10,'Cirugia Universal',NULL,NULL),(11,'Crosmed',NULL,NULL),(12,'',NULL,NULL),(13,'',NULL,NULL),(14,'',NULL,NULL),(15,'',NULL,NULL),(16,'',NULL,NULL),(17,'',NULL,NULL),(18,'',NULL,NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestion-compras'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-28 21:04:30