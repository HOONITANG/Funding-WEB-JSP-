-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: funding
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item_funding`
--

DROP TABLE IF EXISTS `item_funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item_funding` (
  `funding_picture_name` char(20) NOT NULL,
  `funding_title` char(20) DEFAULT NULL,
  `funding_peple` int(10) DEFAULT NULL,
  `funding_money` int(20) DEFAULT NULL,
  `funding_goal_money` int(20) DEFAULT NULL,
  `funding_remain_time` date DEFAULT NULL,
  `funding_content` text NOT NULL,
  `funding_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(10) DEFAULT NULL,
  `funding_enroll_date` date DEFAULT NULL,
  PRIMARY KEY (`funding_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_funding`
--

LOCK TABLES `item_funding` WRITE;
/*!40000 ALTER TABLE `item_funding` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_join`
--

DROP TABLE IF EXISTS `user_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_join` (
  `userId` char(10) NOT NULL,
  `userPasswd` char(20) NOT NULL,
  `userEmail` char(40) NOT NULL,
  `userCheck` int(11) DEFAULT '0',
  `userEmailCheck` int(11) DEFAULT '0',
  `userEmailHash` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_join`
--

LOCK TABLES `user_join` WRITE;
/*!40000 ALTER TABLE `user_join` DISABLE KEYS */;
INSERT INTO `user_join` VALUES ('aaaa','1234','dnlssjtm@naver.com',0,1,'24acc0f2b048663193ac1dcaf19ce4628f4a8fb3cdc9871b297c08873049908d');
/*!40000 ALTER TABLE `user_join` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-06 11:28:09
