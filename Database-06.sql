CREATE DATABASE  IF NOT EXISTS `auction` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `auction`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: auction
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction` (
  `auctionid` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `starting_price` double NOT NULL DEFAULT '0',
  `buy_now_price` double NOT NULL DEFAULT '1',
  `increase_by` double NOT NULL DEFAULT '1',
  `moderate_status` tinyint(1) NOT NULL DEFAULT '0',
  `img_cover` text NOT NULL,
  `img_1` text,
  `img_2` text,
  `img_3` text,
  `img_4` text,
  `img_5` text,
  `v_youtube` text,
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`auctionid`),
  KEY `category_id` (`category_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,1,43,'ASUS Zenfone 5','','2014-08-18 15:27:18','2014-09-25 01:15:00',50,250,5,0,'http://fptshop.com.vn/Uploads/images/asus-zenfone-5-4.png','http://cache.media.techz.vn/upload/2014/04/23/image-1398248544-Zenfone5_07.jpg',NULL,NULL,NULL,NULL,'https://www.youtube.com/watch?v=ixhPTFdwHAM',1),(2,1,43,'Iphone 5S','','2014-08-18 23:54:25','2014-08-27 01:31:00',20,500,10,0,'http://cdn2.sbnation.com/assets/3256545/IMG_2909-1024.jpg',NULL,NULL,NULL,NULL,NULL,NULL,2),(3,10,43,'Honda Airblade 2010','','2014-08-18 23:54:25','2014-08-27 04:25:00',1200,5000,100,0,'http://dantri.vcmedia.vn/Uploaded/2010/05/16/3.jpg','http://1.bp.blogspot.com/_7G-rNqb-F4E/SqoAx1c9GyI/AAAAAAAAAZw/7Fe0wHvOhWw/s400/1209004801_Airblade_White.jpg','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSoqBPQlSrkisWOYBm9pY5jFv1Mzws18PiBxfuIyqKqx-LjAl_X','http://farm10.gox.vn/tinmoi/store/images/thumb/22122012/6/1083387/can_anh_honda_air_blade_125_do_xang_khong_can_xuong_xe_1.jpg',NULL,NULL,'https://www.youtube.com/watch?v=RP8XeWc-0h8',10),(4,10,43,'Mercedes C200 2011','','2014-08-18 15:27:18','2014-08-30 04:28:00',15000,35000,300,0,'http://www.thuexedulich.org/files/trangchu/mercedes_c200.8.jpg',NULL,NULL,NULL,NULL,NULL,'https://www.youtube.com/watch?v=qTc7OtSWr-M',5),(5,10,43,'Minsk 67','Minsk 67','2014-08-19 07:14:45','2014-09-06 07:14:00',50,356,2,0,'http://img.v3.news.zdn.vn/w660/Uploaded/pgi_xvauqbnau/2013_08_07/m1.JPG','http://i223.photobucket.com/albums/dd109/haineverlove/IMG_0530.jpg','http://ttvnol.vcmedia.vn/images/39/_MG_8004_1318818112.jpg','http://ttvnol.vcmedia.vn/images/56596/IMG_0027_1294138331.jpg','','','https://www.youtube.com/watch?v=GcyC5s7TMRw',0);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Smartphone','Smartphone for the smart. '),(9,'Home appliances',''),(10,'Vehicles','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateline` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lifetime` int(5) NOT NULL DEFAULT '24' COMMENT 'How long this token will live in hours.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fullname` text,
  `phonenumber` text,
  `address` text,
  `role` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `salt` varchar(10) DEFAULT NULL,
  `balance` double DEFAULT '0',
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username` (`username`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  FULLTEXT KEY `fullname` (`fullname`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'customer','807908e8af11eb3f416ae163762d4739','duccn01663@gmail.com','Customer1','1','1',0,0,'1823378392',0,'2014-08-13 17:01:22'),(14,'admin','807908e8af11eb3f416ae163762d4739','ducchu@live.com','Chu Nhu Duc1','097.847.9643','Hanoi HN',2,1,'1823378392',0,'2014-08-13 17:01:22'),(43,'staff','1393975c84ff83deba3f7050b910cf68','duccn01663@fpt.edu.vn','staff','','',1,1,'1168119770',0,'2014-08-14 13:17:39'),(44,'admin22','2d6ab00624c6257f7e57d0ec9bbbfed3','asdasdasd@asdasd.com','asdasdasd','asdasdasd','asdasdasd',1,0,'1862159749',0,'2014-08-15 10:20:37'),(45,'111111111111111','166dc49d526214932c8b780eaa92125c','22222222222222222222@.','3333','55555','44444',0,1,'1208191374',0,'2014-08-15 13:35:12'),(46,'','93b54aa30e37bdcbc1787d3e9bc9bd9c','','','','',0,1,'1611501300',0,'2014-08-18 14:52:18'),(47,'sdsdasdadasd','fb560ead98d96d3bb7dcb02e817bf5f4','asdasdasd','','','',0,1,'1573971205',0,'2014-08-18 14:52:36'),(50,'1111111111111','bb0dbe4e19beeab896f0e3b0f000f202','111111111','','','',0,1,'1842228419',0,'2014-08-19 00:35:43'),(53,'11111111','8848befacf0a2a94fbf7a26818cd9419','sdsd','','','',0,1,'1520336637',0,'2014-08-19 00:38:43'),(60,'111111112','5290b4a58898b4e925a68ce96a15c2b3','sdsd@.','Addasdasd','vsss','asdsd',0,1,'1950023030',0,'2014-08-19 00:39:42'),(79,'ssdsd','e836e502416a3d4e153e66f893374faf','asdasdsd@.sd','','','',0,1,'1200541485',0,'2014-08-19 00:48:44');
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

-- Dump completed on 2014-08-19 12:26:28
