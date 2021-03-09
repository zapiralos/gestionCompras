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
INSERT INTO `estado` VALUES (1,'1° vez'),(2,'continuidad'),(3,'renovación de tratamiento');
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
  `gsc` int(11) NOT NULL,
  `ap` int(11) NOT NULL,
  `socio` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `id_protesis` int(11) NOT NULL,
  `detalle` varchar(999) NOT NULL,
  `id_prestador` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_analista` int(11) NOT NULL,
  `id_auditor` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  PRIMARY KEY (`id`),
  KEY `medicamentos_FK` (`id_estado`),
  CONSTRAINT `medicamentos_FK` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestador`
--

LOCK TABLES `prestador` WRITE;
/*!40000 ALTER TABLE `prestador` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `protesis_FK` (`id_proveedor`),
  CONSTRAINT `protesis_FK` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Ortopedia Capital'),(2,'Dok'),(3,'Imation Ty'),(4,'Biolap'),(5,'Caruso'),(6,'Medical Implant'),(7,'Justo a Tiempo'),(8,'GENZYME'),(9,'Movistar'),(10,'Cirugia Universal'),(11,'Crosmed');
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

-- Dump completed on 2021-03-08  9:00:17
