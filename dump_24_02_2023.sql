-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: VKR
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CLAUSE`
--

DROP TABLE IF EXISTS `CLAUSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLAUSE` (
  `ID_CLAUSE` int NOT NULL,
  `ID_PREDICAT` int NOT NULL,
  PRIMARY KEY (`ID_CLAUSE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLAUSE`
--

LOCK TABLES `CLAUSE` WRITE;
/*!40000 ALTER TABLE `CLAUSE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLAUSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAMETR`
--

DROP TABLE IF EXISTS `PARAMETR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAMETR` (
  `ID_PARAMETR` int NOT NULL AUTO_INCREMENT,
  `NAME_PARAMETR` char(50) NOT NULL,
  PRIMARY KEY (`ID_PARAMETR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETR`
--

LOCK TABLES `PARAMETR` WRITE;
/*!40000 ALTER TABLE `PARAMETR` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARAMETR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAMETR_VALUE`
--

DROP TABLE IF EXISTS `PARAMETR_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAMETR_VALUE` (
  `ID_PARAMETR` int NOT NULL,
  `VALUE` int NOT NULL,
  PRIMARY KEY (`ID_PARAMETR`,`VALUE`),
  CONSTRAINT `PARAMETR_VALUE_ibfk_1` FOREIGN KEY (`ID_PARAMETR`) REFERENCES `PARAMETR` (`ID_PARAMETR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETR_VALUE`
--

LOCK TABLES `PARAMETR_VALUE` WRITE;
/*!40000 ALTER TABLE `PARAMETR_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARAMETR_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREDICAT`
--

DROP TABLE IF EXISTS `PREDICAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PREDICAT` (
  `OPERATION` enum('=','<','>','<=','>=') DEFAULT NULL,
  `ID_PARAMETR` int NOT NULL,
  `ID_VAL` int NOT NULL,
  `ID_PREDICAT` int NOT NULL,
  PRIMARY KEY (`ID_PREDICAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREDICAT`
--

LOCK TABLES `PREDICAT` WRITE;
/*!40000 ALTER TABLE `PREDICAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PREDICAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULES`
--

DROP TABLE IF EXISTS `RULES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RULES` (
  `ID_RULES` int NOT NULL,
  `ID_CLAUSE` int NOT NULL,
  `ACCESS_RATE` int NOT NULL,
  PRIMARY KEY (`ID_RULES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULES`
--

LOCK TABLES `RULES` WRITE;
/*!40000 ALTER TABLE `RULES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RULES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE`
--

DROP TABLE IF EXISTS `SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVICE` (
  `ID_SEVICE` int NOT NULL AUTO_INCREMENT,
  `NAME_SERVICE` char(30) NOT NULL,
  `PARAMETR` int DEFAULT NULL,
  PRIMARY KEY (`ID_SEVICE`),
  KEY `PARAMETR` (`PARAMETR`),
  CONSTRAINT `SERVICE_ibfk_1` FOREIGN KEY (`PARAMETR`) REFERENCES `PARAMETR` (`ID_PARAMETR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE`
--

LOCK TABLES `SERVICE` WRITE;
/*!40000 ALTER TABLE `SERVICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'VKR'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-25 17:15:04
