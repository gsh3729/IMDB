-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: imdb
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB-6ubuntu2

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
-- Table structure for table `Awards`
--

DROP TABLE IF EXISTS `Awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Awards` (
  `Award_id` int(11) NOT NULL AUTO_INCREMENT,
  `Award_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Awards`
--

LOCK TABLES `Awards` WRITE;
/*!40000 ALTER TABLE `Awards` DISABLE KEYS */;
INSERT INTO `Awards` VALUES (1,'FilmFare'),(2,'National'),(3,'Ascar'),(4,'Siima'),(5,'Nandi');
/*!40000 ALTER TABLE `Awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Awards_received`
--

DROP TABLE IF EXISTS `Awards_received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Awards_received` (
  `Award_id` int(11) NOT NULL,
  `Movie_id` int(11) NOT NULL,
  PRIMARY KEY (`Movie_id`,`Award_id`),
  KEY `Award_id` (`Award_id`),
  CONSTRAINT `Awards_received_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`) ON DELETE CASCADE,
  CONSTRAINT `Awards_received_ibfk_2` FOREIGN KEY (`Award_id`) REFERENCES `Awards` (`Award_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Awards_received`
--

LOCK TABLES `Awards_received` WRITE;
/*!40000 ALTER TABLE `Awards_received` DISABLE KEYS */;
INSERT INTO `Awards_received` VALUES (1,1),(2,1),(2,2);
/*!40000 ALTER TABLE `Awards_received` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cast_crew`
--

DROP TABLE IF EXISTS `Cast_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cast_crew` (
  `Cast_crew_id` int(11) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Renumeration` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cast_crew_id`,`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cast_crew`
--

LOCK TABLES `Cast_crew` WRITE;
/*!40000 ALTER TABLE `Cast_crew` DISABLE KEYS */;
INSERT INTO `Cast_crew` VALUES (1,'Actor',NULL),(1,'Actress',NULL),(1,'Director',NULL),(1,'Music Director',NULL);
/*!40000 ALTER TABLE `Cast_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commented_by`
--

DROP TABLE IF EXISTS `Commented_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commented_by` (
  `People_id` int(11) NOT NULL,
  `Comment_id` int(11) NOT NULL,
  `Movie_id` int(11) NOT NULL,
  PRIMARY KEY (`People_id`,`Movie_id`),
  CONSTRAINT `Commented_by_ibfk_1` FOREIGN KEY (`People_id`, `Movie_id`) REFERENCES `Purchased_by` (`People_id`, `Movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commented_by`
--

LOCK TABLES `Commented_by` WRITE;
/*!40000 ALTER TABLE `Commented_by` DISABLE KEYS */;
INSERT INTO `Commented_by` VALUES (1,1,1),(4,2,2);
/*!40000 ALTER TABLE `Commented_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `Comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` varchar(100) DEFAULT NULL,
  `Upvotes` int(11) DEFAULT NULL,
  `Downvotes` int(11) DEFAULT NULL,
  PRIMARY KEY (`Comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,'Interesting Movie',3,2),(2,'Fascinating Movie',1,1);
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Critic`
--

DROP TABLE IF EXISTS `Critic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Critic` (
  `Critic_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Company` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Critic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Critic`
--

LOCK TABLES `Critic` WRITE;
/*!40000 ALTER TABLE `Critic` DISABLE KEYS */;
INSERT INTO `Critic` VALUES (1,'RajeevMasand','RMreviews'),(2,'BARaju','SuperHit'),(3,'RameshBala','Entertainment'),(4,'TaranAdarsh','BollywoodHungama');
/*!40000 ALTER TABLE `Critic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie` (
  `Movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(20) NOT NULL,
  `Language` varchar(15) DEFAULT NULL,
  `Genre` varchar(10) DEFAULT NULL,
  `Film_Series` varchar(15) DEFAULT NULL,
  `Collection` int(11) DEFAULT NULL,
  `Rating` decimal(2,1) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `RunTime` time DEFAULT NULL,
  PRIMARY KEY (`Movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'Baahubali-1','Telugu','Drama','Baahubali',700,9.4,'2015-07-10','02:35:06'),(2,'Baahubali-2','Telugu','Drama','Baahubali',2000,9.7,'2017-04-28','02:42:36'),(3,'3-Idiots','Hindi','Comedy',' ',400,8.5,'2009-12-25','02:15:25'),(4,'Basha','Tamil','Action','',40,7.9,'1995-01-15','03:04:06'),(5,'Simhadri','Telugu','Drama','',20,6.5,'2003-07-11','02:49:06'),(6,'Magadheera','Telugu','Fantasy','',30,8.2,'2007-05-11','02:24:06');
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie_songs`
--

DROP TABLE IF EXISTS `Movie_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie_songs` (
  `Movie_id` int(11) NOT NULL,
  `Song_id` int(11) NOT NULL,
  PRIMARY KEY (`Movie_id`,`Song_id`),
  KEY `Song_id` (`Song_id`),
  CONSTRAINT `Movie_songs_ibfk_1` FOREIGN KEY (`Song_id`) REFERENCES `Songs` (`Song_id`) ON DELETE CASCADE,
  CONSTRAINT `Movie_songs_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie_songs`
--

LOCK TABLES `Movie_songs` WRITE;
/*!40000 ALTER TABLE `Movie_songs` DISABLE KEYS */;
INSERT INTO `Movie_songs` VALUES (1,1),(1,2),(2,3);
/*!40000 ALTER TABLE `Movie_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `News_id` int(11) NOT NULL AUTO_INCREMENT,
  `News` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`News_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES (1,'Our movie has been nominated for oscars'),(2,'In the coming summer, We will be releasing Baahubali in Japan');
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsonMovie`
--

DROP TABLE IF EXISTS `NewsonMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsonMovie` (
  `News_id` int(11) NOT NULL,
  `Movie_id` int(11) NOT NULL,
  PRIMARY KEY (`News_id`,`Movie_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `NewsonMovie_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`) ON DELETE CASCADE,
  CONSTRAINT `NewsonMovie_ibfk_2` FOREIGN KEY (`News_id`) REFERENCES `News` (`News_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsonMovie`
--

LOCK TABLES `NewsonMovie` WRITE;
/*!40000 ALTER TABLE `NewsonMovie` DISABLE KEYS */;
INSERT INTO `NewsonMovie` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `NewsonMovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `People_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Account_type` varchar(20) DEFAULT NULL,
  `Purchase_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`People_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (1,'Sriharsha',NULL,NULL),(2,'VamsiPramod',NULL,NULL),(3,'Sudheer',NULL,NULL),(4,'Patrick',NULL,NULL),(5,'Vinay',NULL,NULL);
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `Person_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Prabhas'),(2,'Anushka'),(3,'Rajamouli'),(4,'Keeravani'),(5,'NTR'),(6,'deepu'),(7,'kaala bhairava');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posted_by`
--

DROP TABLE IF EXISTS `Posted_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posted_by` (
  `News_id` int(11) NOT NULL,
  `Person_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`News_id`,`Person_id`),
  KEY `Person_id` (`Person_id`),
  CONSTRAINT `Posted_by_ibfk_1` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`Person_id`) ON DELETE CASCADE,
  CONSTRAINT `Posted_by_ibfk_2` FOREIGN KEY (`News_id`) REFERENCES `News` (`News_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posted_by`
--

LOCK TABLES `Posted_by` WRITE;
/*!40000 ALTER TABLE `Posted_by` DISABLE KEYS */;
INSERT INTO `Posted_by` VALUES (1,1),(2,3);
/*!40000 ALTER TABLE `Posted_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchased_by`
--

DROP TABLE IF EXISTS `Purchased_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchased_by` (
  `People_id` int(11) NOT NULL,
  `Movie_id` int(11) NOT NULL,
  PRIMARY KEY (`People_id`,`Movie_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `Purchased_by_ibfk_1` FOREIGN KEY (`People_id`) REFERENCES `People` (`People_id`) ON DELETE CASCADE,
  CONSTRAINT `Purchased_by_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchased_by`
--

LOCK TABLES `Purchased_by` WRITE;
/*!40000 ALTER TABLE `Purchased_by` DISABLE KEYS */;
INSERT INTO `Purchased_by` VALUES (1,1),(4,2);
/*!40000 ALTER TABLE `Purchased_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews_Ratings`
--

DROP TABLE IF EXISTS `Reviews_Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews_Ratings` (
  `Review` varchar(100) NOT NULL,
  `Rating` decimal(2,1) NOT NULL,
  `Critic_id` int(11) NOT NULL DEFAULT '0',
  `Movie_id` int(11) NOT NULL,
  PRIMARY KEY (`Critic_id`,`Movie_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `Reviews_Ratings_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`) ON DELETE CASCADE,
  CONSTRAINT `Reviews_Ratings_ibfk_2` FOREIGN KEY (`Critic_id`) REFERENCES `Critic` (`Critic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews_Ratings`
--

LOCK TABLES `Reviews_Ratings` WRITE;
/*!40000 ALTER TABLE `Reviews_Ratings` DISABLE KEYS */;
INSERT INTO `Reviews_Ratings` VALUES ('SS Rajamouli delivered a mindblowing movie to the Indian cinema',5.0,1,1),('SS Rajamouli has taken Indian cinema to International level with his movie Baahubali-2. Trade analys',5.0,1,2);
/*!40000 ALTER TABLE `Reviews_Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role_Playedby`
--

DROP TABLE IF EXISTS `Role_Playedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role_Playedby` (
  `Cast_crew_id` int(11) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Person_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Cast_crew_id`,`Person_id`,`Role`),
  KEY `Person_id` (`Person_id`),
  KEY `Cast_crew_id` (`Cast_crew_id`,`Role`),
  CONSTRAINT `Role_Playedby_ibfk_1` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`Person_id`) ON DELETE CASCADE,
  CONSTRAINT `Role_Playedby_ibfk_2` FOREIGN KEY (`Cast_crew_id`, `Role`) REFERENCES `Cast_crew` (`Cast_crew_id`, `Role`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role_Playedby`
--

LOCK TABLES `Role_Playedby` WRITE;
/*!40000 ALTER TABLE `Role_Playedby` DISABLE KEYS */;
INSERT INTO `Role_Playedby` VALUES (1,'Actor',1),(1,'Actress',2),(1,'Director',3),(1,'Music Director',4);
/*!40000 ALTER TABLE `Role_Playedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `Cast_crew_id` int(11) NOT NULL DEFAULT '0',
  `Movie_id` int(11) NOT NULL,
  PRIMARY KEY (`Cast_crew_id`,`Movie_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `Roles_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`) ON DELETE CASCADE,
  CONSTRAINT `Roles_ibfk_2` FOREIGN KEY (`Cast_crew_id`) REFERENCES `Cast_crew` (`Cast_crew_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Songs` (
  `Song_id` int(11) NOT NULL AUTO_INCREMENT,
  `Song_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES (1,'Deevara'),(2,'SivuniAna'),(3,'Dandalayya');
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sung_by`
--

DROP TABLE IF EXISTS `Sung_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sung_by` (
  `Song_id` int(11) NOT NULL,
  `Person_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Song_id`),
  KEY `Person_id` (`Person_id`),
  CONSTRAINT `Sung_by_ibfk_1` FOREIGN KEY (`Song_id`) REFERENCES `Songs` (`Song_id`) ON DELETE CASCADE,
  CONSTRAINT `Sung_by_ibfk_2` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`Person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sung_by`
--

LOCK TABLES `Sung_by` WRITE;
/*!40000 ALTER TABLE `Sung_by` DISABLE KEYS */;
INSERT INTO `Sung_by` VALUES (2,4),(1,6),(3,7);
/*!40000 ALTER TABLE `Sung_by` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 19:02:52
