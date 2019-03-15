-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: IMDB
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB-0ubuntu0.18.04.1

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
  `Award_name` varchar(20) DEFAULT NULL,
  `Award_id` varchar(10) NOT NULL,
  PRIMARY KEY (`Award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Awards`
--

LOCK TABLES `Awards` WRITE;
/*!40000 ALTER TABLE `Awards` DISABLE KEYS */;
INSERT INTO `Awards` VALUES ('FilmFare','001'),('National','002'),('Ascar','003'),('Siima','004'),('Nandi','005');
/*!40000 ALTER TABLE `Awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Awards_received`
--

DROP TABLE IF EXISTS `Awards_received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Awards_received` (
  `Award_id` varchar(10) NOT NULL,
  `Movie_id` varchar(10) NOT NULL,
  KEY `Movie_id` (`Movie_id`),
  KEY `Award_id` (`Award_id`),
  CONSTRAINT `Awards_received_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`),
  CONSTRAINT `Awards_received_ibfk_2` FOREIGN KEY (`Award_id`) REFERENCES `Awards` (`Award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Awards_received`
--

LOCK TABLES `Awards_received` WRITE;
/*!40000 ALTER TABLE `Awards_received` DISABLE KEYS */;
INSERT INTO `Awards_received` VALUES ('001','0001'),('003','0002'),('001','0003');
/*!40000 ALTER TABLE `Awards_received` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cast_crew`
--

DROP TABLE IF EXISTS `Cast_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cast_crew` (
  `Cast_crew_id` varchar(10) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Renumeration` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cast_crew_id`,`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cast_crew`
--

LOCK TABLES `Cast_crew` WRITE;
/*!40000 ALTER TABLE `Cast_crew` DISABLE KEYS */;
INSERT INTO `Cast_crew` VALUES ('001','Actor',NULL),('001','Actress',NULL),('001','Director',NULL),('001','Producer',NULL),('002','Actor',NULL),('002','Actress',NULL),('002','Director',NULL),('002','Producer',NULL),('003','Actor',NULL),('003','Actress',NULL),('003','Director',NULL),('003','Producer',NULL),('004','Producer',NULL),('005','MusicDirector',NULL);
/*!40000 ALTER TABLE `Cast_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commented_by`
--

DROP TABLE IF EXISTS `Commented_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commented_by` (
  `People_id` varchar(10) NOT NULL,
  `Comment_id` varchar(10) DEFAULT NULL,
  `Movie_id` varchar(10) NOT NULL,
  PRIMARY KEY (`People_id`,`Movie_id`),
  CONSTRAINT `Commented_by_ibfk_1` FOREIGN KEY (`People_id`, `Movie_id`) REFERENCES `Purchased_by` (`People_id`, `Movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commented_by`
--

LOCK TABLES `Commented_by` WRITE;
/*!40000 ALTER TABLE `Commented_by` DISABLE KEYS */;
INSERT INTO `Commented_by` VALUES ('001','001','0001'),('002','002','0003');
/*!40000 ALTER TABLE `Commented_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `Comment_id` varchar(10) NOT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  `Upvotes` int(11) DEFAULT NULL,
  `Downvotes` int(11) DEFAULT NULL,
  PRIMARY KEY (`Comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES ('001','Interesting Movie',3,2),('002','Boring Movie',1,1);
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Critic`
--

DROP TABLE IF EXISTS `Critic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Critic` (
  `Critic_id` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Company` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Critic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Critic`
--

LOCK TABLES `Critic` WRITE;
/*!40000 ALTER TABLE `Critic` DISABLE KEYS */;
INSERT INTO `Critic` VALUES ('001','RajeevMasand','RMreviews'),('002','BARaju','SuperHit'),('003','RameshBala','Entertainment'),('004','TaranAdarsh','BollywoodHungama');
/*!40000 ALTER TABLE `Critic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie` (
  `Movie_id` varchar(10) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Language` varchar(15) NOT NULL,
  `Genre` varchar(10) DEFAULT NULL,
  `Film_Series` varchar(15) DEFAULT NULL,
  `Collection` int(11) DEFAULT NULL,
  `Rating` decimal(2,1) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `RunTime` time DEFAULT NULL,
  PRIMARY KEY (`Movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES ('0001','Baahubali-1','Telugu','Periodic','Baahubali',700,NULL,'2015-07-10',NULL),('0002','Baahubali-2','Telugu','Periodic','Baahubali',2000,NULL,'2017-04-28',NULL),('0003','3-Idiots','Hindi','Comedy','',400,NULL,'2009-12-25',NULL),('0004','Basha','Tamil','Action','',40,NULL,'1995-01-15',NULL),('0005','Simhadri','Telugu','Drama','',20,NULL,'2003-07-11',NULL),('0006','Magadheera','Telugu','Fantasy','',30,NULL,'2007-05-11',NULL),('0007','Mankatha','Tamil','Crime','',7,NULL,'2007-08-31',NULL),('0008','Chatrapathi','Telugu','Drama','',5,NULL,'2005-09-30',NULL);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie_songs`
--

DROP TABLE IF EXISTS `Movie_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie_songs` (
  `Movie_id` varchar(10) NOT NULL,
  `Song_id` varchar(10) NOT NULL,
  KEY `Song_id` (`Song_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `Movie_songs_ibfk_1` FOREIGN KEY (`Song_id`) REFERENCES `Songs` (`Song_id`),
  CONSTRAINT `Movie_songs_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie_songs`
--

LOCK TABLES `Movie_songs` WRITE;
/*!40000 ALTER TABLE `Movie_songs` DISABLE KEYS */;
INSERT INTO `Movie_songs` VALUES ('0001','001'),('0001','002'),('0002','003');
/*!40000 ALTER TABLE `Movie_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `News` varchar(100) DEFAULT NULL,
  `News_id` varchar(10) NOT NULL,
  PRIMARY KEY (`News_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES ('Our movie has been nominated for oscars','001'),('In the coming summer, We will be releasing Baahubali in Japan','002');
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsonMovie`
--

DROP TABLE IF EXISTS `NewsonMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsonMovie` (
  `News_id` varchar(10) NOT NULL,
  `Movie_id` varchar(10) NOT NULL,
  KEY `Movie_id` (`Movie_id`),
  KEY `News_id` (`News_id`),
  CONSTRAINT `NewsonMovie_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`),
  CONSTRAINT `NewsonMovie_ibfk_2` FOREIGN KEY (`News_id`) REFERENCES `News` (`News_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsonMovie`
--

LOCK TABLES `NewsonMovie` WRITE;
/*!40000 ALTER TABLE `NewsonMovie` DISABLE KEYS */;
INSERT INTO `NewsonMovie` VALUES ('001','0001'),('002','0003');
/*!40000 ALTER TABLE `NewsonMovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `People_id` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Account_type` varchar(20) DEFAULT NULL,
  `Purchase_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`People_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES ('001','Sriharsha',NULL,NULL),('002','VamsiPramod',NULL,NULL),('003','Sudheer',NULL,NULL),('004','Patrick',NULL,NULL),('005','Vinay',NULL,NULL);
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `Person_id` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES ('001','Prabhas'),('002','Anushka'),('003','Rajamouli'),('004','Prasad'),('005','Sathyaraj'),('006','RamyaKrishna'),('007','Keeravani'),('008','NTR'),('009','Sethupathi'),('010','Rajinikanth'),('011','SalamKhan'),('012','Mammootty'),('013','Mohanlal'),('014','AjithKumar'),('015','Vijay'),('016','RamCharan'),('017','Yash'),('018','AmirKhan'),('019','ShahrukhKhan');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posted_by`
--

DROP TABLE IF EXISTS `Posted_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posted_by` (
  `News_id` varchar(10) DEFAULT NULL,
  `Person_id` varchar(10) DEFAULT NULL,
  KEY `Person_id` (`Person_id`),
  KEY `News_id` (`News_id`),
  CONSTRAINT `Posted_by_ibfk_1` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`Person_id`),
  CONSTRAINT `Posted_by_ibfk_2` FOREIGN KEY (`News_id`) REFERENCES `News` (`News_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posted_by`
--

LOCK TABLES `Posted_by` WRITE;
/*!40000 ALTER TABLE `Posted_by` DISABLE KEYS */;
INSERT INTO `Posted_by` VALUES ('001','001'),('002','003');
/*!40000 ALTER TABLE `Posted_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchased_by`
--

DROP TABLE IF EXISTS `Purchased_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchased_by` (
  `People_id` varchar(10) NOT NULL,
  `Movie_id` varchar(10) NOT NULL,
  PRIMARY KEY (`People_id`,`Movie_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `Purchased_by_ibfk_1` FOREIGN KEY (`People_id`) REFERENCES `People` (`People_id`),
  CONSTRAINT `Purchased_by_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchased_by`
--

LOCK TABLES `Purchased_by` WRITE;
/*!40000 ALTER TABLE `Purchased_by` DISABLE KEYS */;
INSERT INTO `Purchased_by` VALUES ('001','0001'),('002','0003');
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
  `Critic_id` varchar(10) NOT NULL,
  `Movie_id` varchar(10) NOT NULL,
  KEY `Movie_id` (`Movie_id`),
  KEY `Critic_id` (`Critic_id`),
  CONSTRAINT `Reviews_Ratings_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`),
  CONSTRAINT `Reviews_Ratings_ibfk_2` FOREIGN KEY (`Critic_id`) REFERENCES `Critic` (`Critic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews_Ratings`
--

LOCK TABLES `Reviews_Ratings` WRITE;
/*!40000 ALTER TABLE `Reviews_Ratings` DISABLE KEYS */;
INSERT INTO `Reviews_Ratings` VALUES ('SS Rajamouli delivered a mindblowing movie to the Indian cinema',5.0,'002','0001'),('SS Rajamouli has taken Indian cinema to International level with his movie Baahubali-2. Trade analys',5.0,'004','0002');
/*!40000 ALTER TABLE `Reviews_Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role_Playedby`
--

DROP TABLE IF EXISTS `Role_Playedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role_Playedby` (
  `Cast_crew_id` varchar(10) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL,
  `Person_id` varchar(10) DEFAULT NULL,
  KEY `Person_id` (`Person_id`),
  KEY `Cast_crew_id` (`Cast_crew_id`,`Role`),
  CONSTRAINT `Role_Playedby_ibfk_1` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`Person_id`),
  CONSTRAINT `Role_Playedby_ibfk_2` FOREIGN KEY (`Cast_crew_id`, `Role`) REFERENCES `Cast_crew` (`Cast_crew_id`, `Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role_Playedby`
--

LOCK TABLES `Role_Playedby` WRITE;
/*!40000 ALTER TABLE `Role_Playedby` DISABLE KEYS */;
INSERT INTO `Role_Playedby` VALUES ('001','Actor','001'),('003','Director','003'),('001','Actress','002'),('001','Director','003'),('001','Producer','004'),('002','Actor','001'),('002','Actress','002'),('002','Director','003'),('002','Producer','004'),('003','Actor','001'),('003','Actress','002'),('003','Producer','004');
/*!40000 ALTER TABLE `Role_Playedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `Cast_crew_id` varchar(10) NOT NULL,
  `Movie_id` varchar(10) NOT NULL,
  KEY `Movie_id` (`Movie_id`),
  KEY `Cast_crew_id` (`Cast_crew_id`),
  CONSTRAINT `Roles_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`),
  CONSTRAINT `Roles_ibfk_2` FOREIGN KEY (`Cast_crew_id`) REFERENCES `Cast_crew` (`Cast_crew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES ('001','0001'),('002','0003');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Songs` (
  `Song_id` varchar(10) NOT NULL,
  `Song_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES ('001','BaliBaliRa'),('002','KaalaChasma'),('003','AdchiThooku'),('004','RowdyBaby'),('005','InkemInkemKavale'),('006','Deevara'),('007','SivuniAna'),('008','Dandalayya'),('009','Singamalai'),('010','AalIzzWell'),('011','ZoobiZoobi'),('012','NuvvuWhistlesthe'),('013','GalaGalaGala'),('014','AgniSklani'),('015','DheeraDheera'),('016','PanchadhaaraBomma'),('017','AutoWaala'),('018','SuperStyle');
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sung_by`
--

DROP TABLE IF EXISTS `Sung_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sung_by` (
  `Song_id` varchar(10) NOT NULL,
  `Person_id` varchar(10) NOT NULL,
  KEY `Song_id` (`Song_id`),
  KEY `Person_id` (`Person_id`),
  CONSTRAINT `Sung_by_ibfk_1` FOREIGN KEY (`Song_id`) REFERENCES `Songs` (`Song_id`),
  CONSTRAINT `Sung_by_ibfk_2` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`Person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sung_by`
--

LOCK TABLES `Sung_by` WRITE;
/*!40000 ALTER TABLE `Sung_by` DISABLE KEYS */;
INSERT INTO `Sung_by` VALUES ('001','001'),('001','001'),('002','003');
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

-- Dump completed on 2019-02-05 16:01:44
