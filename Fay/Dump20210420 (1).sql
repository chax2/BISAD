-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: fiction
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `e_book`
--

DROP TABLE IF EXISTS `e_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_book` (
  `ebook_id` int NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `year` int NOT NULL,
  `content` text NOT NULL,
  `authorName` char(32) NOT NULL,
  `price` float NOT NULL,
  `fk_user_id` int NOT NULL,
  PRIMARY KEY (`ebook_id`,`fk_user_id`),
  KEY `user_id_idx` (`fk_user_id`),
  CONSTRAINT `fkkk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_book`
--

LOCK TABLES `e_book` WRITE;
/*!40000 ALTER TABLE `e_book` DISABLE KEYS */;
INSERT INTO `e_book` VALUES (1,'ช้างๆๆๆ',2018,'กหฟดแหแห','ศรี',100.25,2),(2,'กกก',2015,'ดแำไำดกำไ','านนน',200.75,1);
/*!40000 ALTER TABLE `e_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiction`
--

DROP TABLE IF EXISTS `fiction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiction` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `year` int NOT NULL,
  `content` text NOT NULL,
  `authorName` char(32) NOT NULL,
  `history_read` date NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiction`
--

LOCK TABLES `fiction` WRITE;
/*!40000 ALTER TABLE `fiction` DISABLE KEYS */;
INSERT INTO `fiction` VALUES (1,'ช้างๆๆ',2015,'บลาๆๆๆ','กนกกก','2016-04-25'),(2,'สาวๆๆ',2014,'คริๆๆๆๆ','ศรีสยาม','2017-05-30');
/*!40000 ALTER TABLE `fiction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin` (
  `pin_id` int NOT NULL AUTO_INCREMENT,
  `fk_user_pid` int NOT NULL,
  `fk_book_pid` int NOT NULL,
  `pin_detail` text NOT NULL,
  PRIMARY KEY (`pin_id`),
  KEY `user_id_idx` (`fk_user_pid`),
  KEY `fkk_book_id_idx` (`fk_book_pid`),
  CONSTRAINT `fkk_book_id` FOREIGN KEY (`fk_book_pid`) REFERENCES `fiction` (`book_id`),
  CONSTRAINT `fkk_user_id` FOREIGN KEY (`fk_user_pid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
INSERT INTO `pin` VALUES (1,1,2,'fwgvsgvgve'),(2,1,1,'wwegesgdegg');
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `detail_payment` text NOT NULL,
  `bank_account` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Password_UNIQUE` (`Password`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  UNIQUE KEY `bank_account_UNIQUE` (`bank_account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Siri','123456','2000-12-25',NULL,'vtygygujmlhjnjkm','1234567891'),(2,'Bonk','tendoubonkshou','2003-11-23','HEHEHE','fqvbwhb3ehbrtdsgbwrg4weg4wewce','5556666888');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 22:35:45
