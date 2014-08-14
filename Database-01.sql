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
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `start_time` time NOT NULL,
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `end_time` time NOT NULL,
  `starting_price` double NOT NULL,
  `buy_now_price` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `image1` text,
  `video` text,
  `image2` text,
  `image3` text,
  `image4` text,
  `image5` text,
  PRIMARY KEY (`auctionid`),
  KEY `category_id` (`category_id`),
  KEY `seller_id` (`seller_id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `title_2` (`title`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Smartphone','Smartphone for the smart.'),(2,'Real Estate','Properties, houses for sale or for lease.'),(3,'Computers','Computers and computer parts.');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (2,'1540475661',14,'2014-08-14 21:00:38',24),(3,'2088939545',14,'2014-08-14 21:01:47',24),(4,'1943447677',14,'2014-08-14 21:12:48',24),(5,'1697902493',14,'2014-08-14 21:15:54',24),(6,'1914479011',14,'2014-08-14 21:17:37',24),(7,'1102641335',14,'2014-08-14 21:32:20',24),(8,'2013436401',14,'2014-08-14 21:40:48',24),(9,'1916098580',14,'2014-08-14 21:41:02',24),(10,'1109535472',14,'2014-08-14 21:41:14',24),(11,'1502431788',14,'2014-08-14 21:54:04',24),(12,'2015745609',14,'2014-08-14 22:13:51',24),(13,'1004381654',14,'2014-08-14 22:16:25',24);
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
  `password` varchar(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `address` text,
  `role` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `salt` varchar(10) DEFAULT NULL,
  `balance` double DEFAULT '0',
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  FULLTEXT KEY `fullname` (`fullname`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'customer','807908e8af11eb3f416ae163762d4739','duccn01663@gmail.com','Customer','','',0,1,'1823378392',0,'2014-08-13 17:01:22'),(14,'admin','807908e8af11eb3f416ae163762d4739','ducchu@live.com','Chu Nhu Duc','097.847.9643','Hanoi HN',2,1,'1823378392',0,'2014-08-13 17:01:22'),(43,'staff','1393975c84ff83deba3f7050b910cf68','duccn01663@fpt.edu.vn','','','',1,1,'1168119770',0,'2014-08-14 13:17:39');
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

-- Dump completed on 2014-08-14 22:20:26
