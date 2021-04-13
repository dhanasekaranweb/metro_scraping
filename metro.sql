-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: metro
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `sea_level`
--

DROP TABLE IF EXISTS `sea_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sea_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_date` date DEFAULT NULL,
  `reservoir` varchar(255) DEFAULT NULL,
  `full_tank` varchar(255) DEFAULT NULL,
  `full_capacity` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  `inflow` varchar(255) DEFAULT NULL,
  `outflow` varchar(255) DEFAULT NULL,
  `rainfall` varchar(255) DEFAULT NULL,
  `last_year_storage` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sea_level`
--

LOCK TABLES `sea_level` WRITE;
/*!40000 ALTER TABLE `sea_level` DISABLE KEYS */;
INSERT INTO `sea_level` VALUES (1,'2021-04-12','POONDI','140.00','3231','134.77','1687.00','20','417','0.0','1218.00','2021-04-13 16:30:44'),(2,'2021-04-12','CHOLAVARAM','65.50','1081','62.73','746.00','0','10','0.0','72.00','2021-04-13 16:32:33'),(3,'2021-04-12','REDHILLS','50.20','3300','49.02','3016.00','130','143','0.0','2884.00','2021-04-13 16:32:33'),(4,'2021-04-12','KANNANKOTTAI THERVOYKANDIGAI','115.35','500','114.58','476.00','0','15','0.0','0','2021-04-13 16:32:33'),(5,'2021-04-12','SUB TOTAL',' -',' 8112 ','-','5,925.00',' -','-','- ','4,174.00','2021-04-13 16:32:33'),(6,'2021-04-12','CHEMBARAMBAKKAM','85.40','3645','82.95','2999.00','150','178','0.0','2055.00','2021-04-13 16:32:33'),(7,'2021-04-12','TOTAL','-','11757','-','8,924.00','-','-','-','6,229.00','2021-04-13 16:32:33'),(8,'2021-04-12','ENTRY POINT','-','-','-','-','37.61','-','0.0','-','2021-04-13 16:32:33'),(9,'2021-04-12','KORATTUR ANICUT','-','-','-','-','-','-','0.0','-','2021-04-13 16:32:33'),(10,'2021-04-12','TAMARAIPAKKAM','-','-','-','-','-','','0.0','-','2021-04-13 16:32:33');
/*!40000 ALTER TABLE `sea_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 17:02:36
