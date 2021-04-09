-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: gestion-compras
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
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
  `autorizado` varchar(100) DEFAULT NULL,
  `nom_med_ofr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicamentos_FK` (`id_estado`),
  CONSTRAINT `medicamentos_FK` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestador`
--

LOCK TABLES `prestador` WRITE;
/*!40000 ALTER TABLE `prestador` DISABLE KEYS */;
INSERT INTO `prestador` VALUES (1,'Fulano','Dulbecco',123456,65999,7.0,'Clínica',123456789),(2,'Javier','Mendez',123159,65456,5.0,'Traumatología',654987123),(3,'Mengano','Corbetta',789321,65333,7.0,'Clínica',159357456),(4,'Elaisa','Rentería',123789,65788,3.0,'Nuctrición',159753456),(5,'Guillermo','Bethular',123654,65125,8.0,'Pediatria',321654789),(6,'Agustina','Vericat',987456,65489,7.0,'Neurología',456789321),(7,'Javier','Solari Paz',654789,65123,3.0,'Sistemas',654789123),(14,'Guillermo','Seijo',123655,65488,0.0,'Analista',654789321);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protesis`
--

LOCK TABLES `protesis` WRITE;
/*!40000 ALTER TABLE `protesis` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Ortopedia Capital',NULL,NULL),(2,'Dok',NULL,NULL),(3,'Imation Ty',NULL,NULL),(4,'Biolap',NULL,NULL),(5,'Caruso',NULL,NULL),(6,'Medical Implant',NULL,NULL),(7,'Justo a Tiempo',NULL,NULL),(8,'Genzyme',NULL,NULL),(9,'Movistar',NULL,NULL),(10,'Cirugia Universal',NULL,NULL),(11,'Crosmed',NULL,NULL);
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

-- Dump completed on 2021-04-09  8:13:18
