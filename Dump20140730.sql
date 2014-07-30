CREATE DATABASE  IF NOT EXISTS `auction` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `auction`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: auction
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
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `starting_price` double NOT NULL,
  `reserve_price` double NOT NULL,
  `buy_now_price` double NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`auctionid`),
  KEY `category_id` (`category_id`),
  KEY `seller_id` (`seller_id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `title_2` (`title`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (2,1,1,'Camera canon','Like new','2014-07-21 17:00:00','2014-07-22 17:00:00',100,400,500,'Future'),(3,2,1,'Laptop ','used 2 year','2014-07-29 17:00:00','2014-07-30 17:00:00',100,400,500,'Active');
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
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Camera'),(3,'Computer'),(5,'Headphone'),(2,'Laptop'),(1,'Mobile');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital`
--

DROP TABLE IF EXISTS `digital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digital` (
  `auction_id` int(11) NOT NULL,
  `image1` text,
  `image2` text,
  `image3` text,
  `image4` text,
  `image5` text,
  `video` text,
  PRIMARY KEY (`auction_id`),
  CONSTRAINT `digital_ibfk_1` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auctionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital`
--

LOCK TABLES `digital` WRITE;
/*!40000 ALTER TABLE `digital` DISABLE KEYS */;
INSERT INTO `digital` VALUES (2,'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg','http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg','http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg','http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg','http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg','http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg'),(3,'http://4.bp.blogspot.com/-OBLot1xL88o/UYyWbs57aoI/AAAAAAAAAZQ/EJE4oLi1bZg/s1600/laptop.png','http://www.idc.com.vn/img/idc/news/100_425.jpg','http://tanthaibinh.vn/media/category/cat_c70f072f9a6954ac74491a15149c06ec.jpg','http://4.bp.blogspot.com/-OBLot1xL88o/UYyWbs57aoI/AAAAAAAAAZQ/EJE4oLi1bZg/s1600/laptop.png','','http://www.youtube.com/watch?v=c8J2C27qO7I');
/*!40000 ALTER TABLE `digital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `role` enum('Admin','Staff','Customer') DEFAULT 'Customer',
  `status` enum('Active','Deactive') DEFAULT 'Deactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`),
  FULLTEXT KEY `fullname` (`fullname`,`username`),
  FULLTEXT KEY `fullname_2` (`fullname`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyen Van Nam','nguyennam','123','09867','namnv@fpt.vn','Ha Noi','Customer','Deactive'),(2,'Pham Van Tu','phamtu','123','09867','tupvse02404@fpt.vn','Hai Duong','Customer','Active'),(3,'Chu Nhu Duc','chuduc','123','09867','chuduc@fpt.vn','Ha Noi','Admin','Active'),(4,'Nguyen Dinh Hieu','nguyenhieu','123','09867','hieund@fpt.vn','Bac Ninh','Customer','Deactive');
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

-- Dump completed on 2014-07-30 17:31:53
