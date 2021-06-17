-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: otdel_kadrov
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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idemployee` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(45) NOT NULL,
  `dateup` date NOT NULL,
  `datedown` date DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `salary` float NOT NULL,
  `head` int NOT NULL,
  PRIMARY KEY (`idemployee`),
  KEY `head_idx` (`head`),
  CONSTRAINT `head` FOREIGN KEY (`head`) REFERENCES `heads` (`idHeads`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (3,'Безруков Александр Артёмович','2021-01-20',NULL,NULL,25000,1),(4,'Ушакова Софья Николаевна','2021-01-22','2021-01-28','По собсвенному',30000,1),(5,'Соловьева Ольга Константиновна','2021-01-23',NULL,NULL,35000,3),(6,'Симонов Сергей Юрьевич','2021-04-24',NULL,NULL,27000,2),(7,'Ильин Александр Семёнович','2021-04-24',NULL,NULL,35000,1),(8,'Трошина Алисия Кирилловна','2021-04-25','2021-04-30','По собсвенному',35000,2),(9,'Беляев Тимур Ярославович','2021-05-01',NULL,NULL,30000,3),(10,'Никольская Алия Ивановна','2021-05-02',NULL,NULL,25000,2),(11,'Смирнова Анастасия Михайловна','2021-05-07','2021-06-02','По собсвенному',25000,3),(12,'Родин Даниил Максимович','2021-02-22',NULL,NULL,27000,1),(13,'Иванов Данила Егорович','2021-02-10',NULL,NULL,25000,2),(14,'Черепанова Анна Дмитриевна','2021-03-28',NULL,NULL,25000,1),(15,'Зотова Виктория Семёновна','2021-03-04',NULL,NULL,35000,3),(16,'Бородин Матвей Рустамович','2021-04-21',NULL,NULL,35000,1),(17,'Абрамова Валерия Марковна','2021-03-05','2021-04-05','По собсвенному',10000,2),(18,'Белова Виктория Александровна','2021-04-21',NULL,NULL,25000,1),(19,'Максимова Виктория Тимуровна','2021-04-15',NULL,NULL,27000,3),(20,'Филиппов Алексей Артёмович','2021-03-15',NULL,NULL,16000,1),(21,'Седова Ксения Арсентьевна','2021-05-18',NULL,NULL,16000,1),(22,'Попов Ярослав Дмитриевич','2021-02-14','2021-04-05','По собсвенному',10000,1),(23,'Степанова Екатерина Тимуровна','2021-04-28',NULL,NULL,50000,3),(24,'Моисеев Роман Камильевич','2021-01-15',NULL,NULL,43000,2),(25,'Моисеева Мария Адамовна','2021-02-11',NULL,NULL,36000,1),(26,'Андреев Семён Германович','2021-03-08',NULL,NULL,10000,3),(27,'Сидоров Даниил Константинович','2021-05-27','2021-05-29','По собсвенному',16000,2),(28,'Жуков Георгий Александрович','2021-04-07',NULL,NULL,35000,2),(29,'Попов Даниил Алексеевич','2021-03-16',NULL,NULL,36000,2),(30,'Ильин Кирилл Матвеевич','2021-03-12',NULL,NULL,43000,2),(31,'Гусева София Ильинична','2021-02-26','2021-04-26','По собсвенному',36500,1),(32,'Бирюкова Марина Данииловна','2021-05-11',NULL,NULL,10000,3),(33,'Ильин Артём Давидович','2021-04-14',NULL,NULL,25000,2),(34,'Быкова Таисия Дмитриевна','2021-01-15',NULL,NULL,10000,3),(35,'Соболев Илья Андреевич','2021-05-20',NULL,NULL,36500,1),(36,'Титов Марк Ярославович','2021-05-11',NULL,NULL,23000,1),(37,'Озерова Татьяна Ярославовна','2021-02-17',NULL,NULL,43000,3),(38,'Белов Артём Давидович','2021-02-19',NULL,NULL,23500,2),(39,'Киселева Алиса Яновна','2021-01-05',NULL,NULL,36500,1),(40,'Некрасов Максим Иванович','2021-03-02','2021-03-15','По собсвенному',29500,2),(41,'Смирнова Татьяна Артёмовна','2021-04-01',NULL,NULL,25000,2),(42,'Зуева Валерия Юрьевна','2021-06-04',NULL,NULL,29500,3),(43,'Бородин Ян Ильич','2021-02-10',NULL,NULL,50000,1),(44,'Ефимова София Владимировна','2021-04-25',NULL,NULL,60000,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heads`
--

DROP TABLE IF EXISTS `heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heads` (
  `idHeads` int NOT NULL AUTO_INCREMENT,
  `FIO1` varchar(45) NOT NULL,
  PRIMARY KEY (`idHeads`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heads`
--

LOCK TABLES `heads` WRITE;
/*!40000 ALTER TABLE `heads` DISABLE KEYS */;
INSERT INTO `heads` VALUES (1,'Зырянов Кирилл Михайлович'),(2,'Маславков Иван Анатольевич'),(3,'Маркин Анатолий Константинович');
/*!40000 ALTER TABLE `heads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-17  9:41:58
