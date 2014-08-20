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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,1,43,'ASUS Zenfone 5','','2014-08-18 15:27:18','2014-09-25 01:15:00',50,250,5,0,'http://fptshop.com.vn/Uploads/images/asus-zenfone-5-4.png','http://cache.media.techz.vn/upload/2014/04/23/image-1398248544-Zenfone5_07.jpg',NULL,NULL,NULL,NULL,'https://www.youtube.com/watch?v=ixhPTFdwHAM',1),(2,1,43,'Iphone 5S','','2014-08-18 23:54:25','2014-08-27 01:31:00',20,500,10,0,'http://cdn2.sbnation.com/assets/3256545/IMG_2909-1024.jpg',NULL,NULL,NULL,NULL,NULL,NULL,2),(3,10,43,'Honda Airblade 2010','','2014-08-18 23:54:25','2014-08-27 04:25:00',1200,5000,100,0,'http://dantri.vcmedia.vn/Uploaded/2010/05/16/3.jpg','http://1.bp.blogspot.com/_7G-rNqb-F4E/SqoAx1c9GyI/AAAAAAAAAZw/7Fe0wHvOhWw/s400/1209004801_Airblade_White.jpg','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSoqBPQlSrkisWOYBm9pY5jFv1Mzws18PiBxfuIyqKqx-LjAl_X','http://farm10.gox.vn/tinmoi/store/images/thumb/22122012/6/1083387/can_anh_honda_air_blade_125_do_xang_khong_can_xuong_xe_1.jpg',NULL,NULL,'https://www.youtube.com/watch?v=RP8XeWc-0h8',10),(4,10,43,'Mercedes C200 2011','','2014-08-18 15:27:18','2014-08-30 04:28:00',15000,35000,300,0,'http://www.thuexedulich.org/files/trangchu/mercedes_c200.8.jpg',NULL,NULL,NULL,NULL,NULL,'https://www.youtube.com/watch?v=qTc7OtSWr-M',5),(5,10,43,'Minsk 67','Minsk 67','2014-08-19 07:14:45','2014-09-06 07:14:00',50,356,2,0,'http://img.v3.news.zdn.vn/w660/Uploaded/pgi_xvauqbnau/2013_08_07/m1.JPG','http://i223.photobucket.com/albums/dd109/haineverlove/IMG_0530.jpg','http://ttvnol.vcmedia.vn/images/39/_MG_8004_1318818112.jpg','http://ttvnol.vcmedia.vn/images/56596/IMG_0027_1294138331.jpg','','','https://www.youtube.com/watch?v=GcyC5s7TMRw',0),(6,9,43,'R-C6800S Refrigerator','','2014-08-21 01:12:57','2014-08-20 12:29:00',500,6500,50,0,'http://www.hitachiconsumer.com/data/resources/images/K_RC6700XK.jpg','http://www.hitachiconsumer.com/intelligent_fridge/image/page-1a.jpg','http://vault.starproperty.my.s3.amazonaws.com/wp-content/uploads/2013/05/Hitachi-refrigerators-m32.jpg','','','','',0),(7,9,43,'LG WM3570HVA','LG Washing Machine WM3570HVA','2014-08-21 01:24:10','2014-10-01 01:18:00',50,500,2,0,'http://img3.findthebest.com/sites/default/files/1964/media/images/t2/LG_WM3570HVA_2485123.jpg','http://www.ajmadison.com/ajmadison/images/large/WM3570HVA.jpg','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQQEhQUEhQUFRQUFBQUFBQUFRQUFRUVFhQWFhQUFRQYHCggGBolHBQUITEhJSksLi4uFx8zODMsNygtLisBCgoKDg0NFBAPFCwcFBwsLCwsLCwsLCwsLCwrLCwrLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCw3LCwsLP/AABEIAN0A5AMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAAECAwYEB//EAFIQAAIBAgIFBQgNCgMHBQAAAAECAwARBCEFEjFBUQYTYXGRIiMygaGxsrMWQlJTYnJzdIKSwdHSBxQzVIOTo9Ph8ENEohUkNGNkwvEltMPE4//EABcBAQEBAQAAAAAAAAAAAAAAAAABAgP/xAAdEQEBAQADAQADAAAAAAAAAAAAARECEjEhQWFx/9oADAMBAAIRAxEAPwDYaUxskYQqWJZFY7yWbaSTXMNIyG92YdmdS07OsYhZ2Cjmoxc8SMqAnlDhff4/rCtA5 ev7o1CTHSDYWPUR9pFZ9 UUN 5mjtuz89L2QxPZY5AXNxZUd75ZWA20B44t9Yd02w7 laZsVLrZSMBlvb7rVTE sEYbGW43bdU7KuOFcjnAO4GRbL/AM7x20FyaRZnMSyd2F1iXZtRQTYaxGdznb4p6wsTpB4iokkDKxCiSN2sGOxXVhcX2C179BsDmp8ZHhpJjOWVJxGUlALKkkesNR1GdmV9vHqNVS4 KdeZhk56R2TWZA3NxRqwcsWPhMSqgAdNQaySeQHwzY9J8e6nmxToCbk2BO3gKpw HkcEqLhAL57Lb7WqOJuUYbypHRciqAGK5bYiNFbUQ626z8L5d1XLiPyjYhM aZhe3ch 3aa5/wDZEt4jqK2owZlYrYgDO9mufJTroma4IhiNpzLbXNip9oe bPL01M/Y7MN UGZ9UlGUMwHdZHNrEi4N9my43cRWq5OacfESargCxXeDfW1uge5rByaDxRCjU7kSmQJzgKrcgmwLHO3jrXcj8C6T3kXVuU1c1NyNa wnjUn9BPDaWlfDmQsdYTzQjMt3EJKL4V8zq3J3k1VHpeY2uzC43hcvJVGCIXBsSbAYzFkk7ABK5Joe mIBtlj sK0DX 0pPdnsH3VB9JSjex6tX7bUEbT2GH MnbVL8pIL5SxEfGN/EADftoD50hKQO6YZjI2v4Q4UpsZLlaRxtva581cWFn5xb/CA2MN43MAd9dRwzSeCutYEnIGw7DQOdJuhjVpX1pGCqLnacybcALk9ANTxONniUu0iMqi7CORyygbWsyi4AuTbPLZQHSMghlhnk1miQSJLqZsqSoU5wAWvqkg2tXOmm8OLlJ1mezCKKMMXdyCE1riyDeb8Kg1UmkH1QRJkbEEtcEHgRVq4lyAdY5gUI0Ng3WKKIAMVRRt3gZ2BByFd6kgWIsRlbqyzyGfiqgVjeV08ReyqQhIz193Eg2oU35SZwCeaOQJt3Q7NtVaU0TK7S6q E5IzXME5Z62XZXPJoaY61oEGtEqDutjDa475tPTcZ7BUV2xflMmYZQsDl4RsMwTt1TwrQaM5VSzMgNhrgm4sbZXzutY4aCxIDgRqdZFXMxEgrbwWbNd YtRnQujJFaLXQrZSGzGXc22gkbeFQeo6JnYc6CSbSC1zewMUZsL7Bck26aVUYA2Mvx19TFSqoynKzBc9DEuuUPMxFXGZVgAQbbx99edxcjp3uVxUJAYgkGU57/adNek6SLc3hyx1tfDxtbVAUCwsLZnxk0LeU8PSHkBtVGO9gk524tPEkh89quwPIaVZA354e5NyEiOtboJfI9Nj1GtFJiG4j6q37bXrjxONIA13Y3NlXumLHaQiC5Y2zNtgzNhnQHNVUAGQCrq2LAEDIDIm52cKqbSoSPUDnmhuUEqN/dMQLdtYnSOnVW4Bz4JqO 7bIwaJOpVk OKA4nSrOdbVS42M4M7jqeYsV jYdFXKmttjOUeEIIaSNujXh8wka9VYLlJg0yUxp9KNfIzLWJbS05/xpeoSOB2A1EaUnGyaX94/306mvWdHafQgmOQ6pGZUBkI6WUsB212I6OO5dDf4QHZrWJrxtdItfWdY3I9syASdfPJqyA/So1o/T2fhEH3MxLKfi4hRzi77c4JBsuRtplNeiLgXS5YmxN/BIF8xtJ2ZnKoR4ci d757OkHsy2UCwOk7mylo31dbVJAbV92rISsifDQkcdXZRSPSEm9r/GAfysDWVdYGrtZbm5FxYbVJvnmMh20Q5PsGmj1WVsx4P25muHD4pnIWyEsQBcFcybZ6pFHsJgZI5IywVQZFW6620gkGzDMZUAvDQBsC6nYcXjAd2RkcHz157PyRxMjFkxMLqclYlwSBlmFQgHLia3uDeRcI sylRjMStlXVNy5JJLFhbPZbxmuczEC1hbqt6NqDDjkPi9 IgHUZj/8AHTjkLiMr4uMZ7lkPZcCtfJiWGyw8Wt6V64sTpNkBJcqACTYiNQN5a1go6TQFcDgzDEquxdhYtI9k1zcXIubAbrX2DbTppFYywjkIZs3WMa7nsUi3SDWKxumN Sgi4aQNcg7CkF1dvjSGMEHINQLGaW1siGkHCVu4vxEEYWLpzVj01YjfYzT2HTuXdV C7QobdTSg ShuE07gkYlTCp4h4AfWViV0pIoshEY4RKsQ7EtTjS0/v0n12  r1NeqYHTsT2MUhJGx4wrAeNGYV3xYpJMxIjX2nWAz la/iFeNnHFjd0ic8WjXX/eW1x4iKK4PTJv4bKeEhaaPq1yeeQfTYfBNMpr0yXCEHWNwOlbDbfI1UMOda9xbhbpvtvt6azeA0yQVBJRmyUhrq53COVQAzb9QhXzHcnbRyHSDn22t0sFY9rA1lXakZvmRu3cPHtqUcZFsxu2CxyFuNVJizvVT4iPRIqTYy2eqPEbee9BroDZpPjL6qOlXH cFJJQ fdIQQLZGGIgHM3O3PLqpUAzSA71hfmsXoihEwo9i0vFhvmsPo1ndLT82t7Ek2AAtckkKqi VyzKATkL3OQNUCdLY4RA7L2JzJAAvYsxGercgZZknVGdyMTjdJNJexI1smY2DOt7hTbJUG5BkNp1jdjfpbFGRjncXuSL2YgWDAHYgFwo3Lme6ZriMTMEHEnYPt6q1IzpnYLmTauZ8V7keM/dVDtc3bM amsd9NEzO3EDqApc6w3jsFRZKQSgtTEneOyr43DbOzf2VyFc8qYix4EVdBzB4sqNU3ZNYMF1ipVhseNxnG/wh1G4yrW6F0rraqubk5K1gNYgXKMoyWUDOwyYZrvFYTCYjWyO3z0Uwrbs7GwIBscjcFT7V1OatuI4XBlmkr0/AyBXRtoDK2W8Ag5Ue0U0IeFYhILSRjuwuarrbSu03bLgMuvF8nMeZBqubutgWtqhwwukqruDgNl7VldcrCtboZO/RfKJ5xWGlWGS Ecf9fifTNc0kVq78Al8NJ8 xXpmuPScojQsfFfIX6TuG8ncAaoAaax6wLntNgABrMSxsqqozZicgu/qBIxON0gzG5sWB1hmHWNtxU7Hk/wCZsGepbJj0aQxplYuTfWF0OwrG6jurbnkU3 DGUX2zWDTtVkS1VNIWJJJJJuScySdpqtwF8IgdHtuwbPHaqixbMHVUZX49A4mqQOH9a0i3nxuB7APvpCfoPkNQCU3N/wB3qauOmOS/Dxm1XDs6/s41whDVkMxGQOXA5qesHz1dQUwuJKXGRVsmRhdGHBlOR zbto9onTXNk65JjyzY3aMZAa7Hwo7kAOc1uA1xqtWUhxNzZhbzdXVRGA2OW3qB3WIIORBBIIORBIORqWaa9Qw5DC4/voNXSpkeo1k SmkObZYjkhHe7m rqjuornM6osVJ2oczeM1tnj7k9RrDQjpE9 k/Z pjpVXpY2mbqj9UlKg6XS8OH bQ jXm/KjGa7sBsHcjZtZO6PRaJ16xi29zXo Ma2FiI2/m0Kj4zKFXykV5DiZGMcZa sY1dr8ZRztvEJFTqQVqepQbEG1ydguT1UGlYkljtOwcOjxeeiWkmyAHtj5F2DtI7KHMcyeGQ  tVFcUefT5quaHuSc7Dz1ZDZRc5k5gf1pSOWGezhuqKpOdstwFOuR2bj5qtCZA04F6grw8NxfeOw1XMn9nzVdCxXZTuwYcDw 6g418oo9hVbUjc7HBII CxVh0G42dIqHJXQ/57iFh2XBJI4Cx  icr4cyYnD4XWMUGrLGzEksykRYgi xTrIf2d6sR16On5plkvYLk54ROyhyehJDHLbgJTvNeq6DzeI2t3a3HAhgCPEbivKdGqrWD Abq/xHBST/AEM9ej/k/mZ44tfw1ZFfjro5ilJ65YpT46nKfVgholb4d/nuL9YaxnLjFhmEW1cy4va6Lq6633a7SQRX4SvwrcaIsIJCdgxmMJ8UrV5hpiUvJIxvmwT6iCZx45MWR xHCpABxrm5JNySSTxJNybDpOyhuJwrF2RwVWL9J0HZq32XubW40XhcKzSHMQo01jvK2EY8bsldfKHQ/eYp4zcOqGX5TVGR4EE3 lXRGSma54AZAbgOFVCpybbcKdFrISrVmpUgtTK5UHLLVNq6GSq2WopIutlv9r18Oo0R0fLcWO0UOUUUK2MUo2S3R iRbBu0NG/0jViDGGRmySwe6lCdgkU3iJ6NYlT8GR69J0BixiMOji9mUGx2i4vY9I2HpBrzXCC R35H7a3HInFDnJoja578B8GQK726OebEjxVOUWNDpw9 PxY/VrSqPKE2l/Zx gtNWVR5VYgx6ODjauERx1xwNIvlQV5vpzKSQDYsjqOpWKgdgr0XldCX0ZYbTg1UdJbDOijtYV5vpk3kkPGSRvrSMR563x9SszjM5B0J5izfZQ8/3/fZRDFm0qdK27dYfbXB/fkpUWS F1ADsFWKtxUJEzHUCftpB6iugJ3PVUVXImrYSxFhnx6PHSa6ix7dooOa1U3z8dTZqiFuRQaz8m0wjxWIbemDxMg iF  s5yLzxCg/wCIksZ nC/25 KtD TSPXxcyb5MHikHSWUEeas9yLktiENvBSVz0BIZDfzUGkwIuOsfZXo/INwZZbfrLH940eJ8 KNec4E2F A8wr0T8n8dpJT/ANRb6iwwH/Vh37KvP8JBWNrYPEfOMcO2Vh9teX42S9zxfEt4zjcUPMq SvTv8nP86xp7Jia8txGwj3LTjsxmKH2VOPq3wJ0i1sHibbWfDp4tdnPoLRfROI1tHaRBN axSODwD9zl 6oLpM/7nP8ABlw7eK8inyle2i h4/8A07SjHLXxEUY6xzjeTXFaGNjFdKCuaM10oaiLAKsWoinvQVTJVLCuuSuRr8KCC0Vwil8LOPe3hkHRctG3brJ9UULRM/EfMaP6HQDB41j7nDqOkmbX80ZpBfg2vY8bHtzrZckCBiV FBn zllP/wBodlYvBDZ0ADsAFbDkgP8AelPCBv8AXKAP/bNTl4RqOUp76Pko/RFKocqG76vyUXo0qw0JYtNbCR5Xth4Gtx1FVreO1q8elfWiibuv0aodbbrQ94a54kxFvpV7TEe8w/N4fVivL U2C5tnW2Wcibfaqqyr 7WB/wBnOd1anypWLx8esOkG4obPtvuYX8e8UXlND8QocEeCQcx7ltxHwTWqinXuB/eVdEKe67PvrkAtt2jyV1CzDaFPTsPj3HyVB2QqLf1qUiC39a54QwGfiII/8GlKzEZDyjLsoKHUEZbao1rVa2W0i/AG/aa52NRRrkbpoYLFxzG5C3uBvG/7a0E FwqLPisKcsQTGikg6hZy8lsrgFRax 2sPDD/AF6BRvDOdRI8gqFiLDazkazNxNlUdSirEG9FRBiA2Sk92eCDOQ JQx8Vej/k iPMxuws0rrKw4GWQ4hh4mnZfo155o7D641M  kxG23mwA2JIO68ZEQ6cSu vXNEx6ojBtfWUm2zWLXa3Rcmpyv1Y5sFHrYeVfdYvGjtlavLcfGQ8oOVpS379A XRzseL8deqaNPeX eYz1xrB8r8JqTaw2Sd7PQXcNCSdwE10J3DFGpFZXA4cTO8DEAToYwTmA4ZZIzb4yAfSrs5S6Rghwa4SC5ZpedmYkHWcBFJIGSiyCw6aEYpipDKSCCGB2EEG4PQQa5pZBO7gqqM5LpbZfaQOjM9tdGQkHOuiNqodCpIIsQew8KmuW2sjqU0iagrUtagmXqt3pmaq2NAtaijS2w8cO WTnW KoKoOwyHx0Ow8VzdslGbH7Os11YZi7GQ78lHAVYDOE21uORWEPPzSXOqipCF3ayrzrnrD4mVfomsTo9gt2YFlQaxUbWsQAgHF2KoLb3Fen8lcGYYFDnWkN2kb3UjMXlbqMjyEdBFZ5VYhyrPfU Ri9GlTcq/wBKnyEXo0qyo8GtFD8hD6sVleUuD51bqQHUhlYi4DLexI3rmykb1dxvrR4l7Rw/IQ gKA4qW9UeWaRgKm qVUkjVJ1jG4trxM28rcWb2ylW32A2aLX32YbG w9FbjT jda7oASQA6E6okUX1Rre0dbnVfdcqbqSBkMThSo1luUvq3I1WRvcSL7R jYdoJGdalZsDXax1ZAQRsI4bvjLSEZGY7ocRn/UV1EgizAEcDu6jtFUHDWzR7dDX9JRn2CgXOAbyP78VIyg7yaWpJvsfGjfbTFZNwH gfbU1cRIJ2bOP9TUMhszPR9g31aYCfDcdQux 7y1YgC CLdJzPb91XESgjO0 IcOk8TRPAx6x2gAAszN4KKM2dugDtyAuSBXHhYS99gCi7Mx1UQXtrM24eU7ACcq1OhdHXsSCIwQyhhZpWGayyKfBQbUjO/um3CluEjRcksDnzrKy9yqojgBkjB1lVre3ZiZXG5mVf8ADreYFu6X4y cVmMC9qO6Nk7tPjL5xWGkcGbQyfPcZ640C5QYVZ42VhrAggjZdSLMt93QdxAO6jSNaGT57jPWmg2LkoPMtII12Dm7rbnDa2trGyTgcHO3hJrA EooNMM BGYPA8a3mndH853SWDrexIupDCzI6 2RhkR49tYzFYfNrAgqLvGTdoxxv7ePg/iaxtrblSwU0Nh4MYCs0vM4nIRMwHMyAbVY7bntGWRrj0toaTDHVmQp7knNG JKMvEaEsNxzB2g7DRXAcocRCuoH5yPfFN3a24BjcjqINaRwfmzbgSO3yimELHcexvuok2kMO bYVkPGF8j1KD9lQGLw3vOLboZio8ZqYOP83tmxA6zbyDM13DRQVRJO3Mx7iw77J0RRbfpGwqP 1WT/h4IYD74x52XrDG qfFXAYyzF5GaVztZzfyH7b0DW5w5ArEDdQdrDdc7z09ld0Q3DqAHmAqlASbC5JNgACSSdgAG00T0Zg2kbVQ2tlJMpBEfGOJtjSn3QuE25ta0twHOTGB5yQXHcRPcnIh51FgB0RXOe RsrhK9IwrZADZWV0ZGsSqiAKqgKoGwAbAP7zuTtNaHCSVhpRypHfI/kIvRpU/Kb9JH8hD6NKg6tKyWWEf8iH0BQGeSimnH/RfN4fQFA3agqlNB8fo4OdZDqSaurrAA3X3DqwKuvwWB8VFnqlhQYvHYLVJ10MR92gaSE9YF5I/9Y6q5BgXYXjAlXjERKPGEuV kBW8ZL0OxWhIZDdo1v7oZN9YZ1dqYxTgg2OR4HKoitmdEH2s JW24TyW7CTSGim34jFHo59wPJar2MZZcBKRrFCq 7e0afXey WrsLhVJ7m8x4RdzGNnhTsLcckDX4itHHoGENrMuu3upCZG7XJolHEBsFTtTAzR2ij3Jl1TqkMkai0UbW8IKbln G5J6qPQ5VSBVqVFEsPJRrRE3fI/jr5xWciaiuh377H8dPSFQEpGtC/z7GetNA8U1GMSe8v8APsb6ygWINUcUtC9I6MWWxzV1uUdDqup4q32bDRR6rIoMVj9FuhOuhI99gW43C8kAzXfcpl8G9D0wpf8ARkSj/lnWPWU8JR8YCvQytceN0XDNnLEjn3RFn utm8tXUxgiCDY7eFOK2j6EQ DLikHuVnJX6sitUf8AYa /YgdKtCp sIr1exjJQws/gKzW3KCx7BViRDW1S13z73EOeky29yhsM9oZlrWHQEJAEnOzAZ9 mkcdgKjyV3YfDLGNVFVF4IoUdZAGZqdqYz2B0G7/AKQc0hBBRW1pXB2rJKMlX4KWuNpNq0mGhCAKoAAFgALADgBUgKmoqK6oDRnCPQSGiWHag7uUQ7uL5vD6NNT6e8KL5vD6NKg59PNnF83g9WKDNRbT5zi bwerFAJHck6pUAZZqWOwHaGHGgsaoEVVIzgXyb4KrYnq1nA7TTKZCL9yt/astyOsq9r9VBbq02rTRBr90VItuBHnJq21BVq0gtW2pWoK9Wlq1bamtQQtUlFPanAqCxDRPRDd i UT0hQxaIaK/Sx/KJ6QoCeLPen fY71tBZqLYw96f59jvW0IkqjmYVWRVrVG1BC1Nq1ZamtQQ1abVqy1K1BDVpWqdqVqCFqcVK1OBQWRmu6Fq4UrqjNQF9ObYfm8Po0qWmf8H5vD6FNVHHp/wo/kIfVigYXM9f2CjGn5BrpmMoYRt3hACKD7zsP0lHnIoHtTU4B4D68f4qVjw/1J KqI7xVlQHZbpH2GlrjiKgnStVfOjiO2nEg4jtoJ2pWqOuOIp9bpFA9qcCmvSvUFi13aNPfY/lE9IUODjiO2uvR0gEseY8NN/whQEsWe9P8/x/rRQt678S943 fY8jq51bGhzGqIEVG1SpUEbUrU9K9BG1K1PelegVqVqQp6CNqcCnpCgktXxmqBVitQHdKC/M/N4fQFKrp49cREe8xD GKVAD5aRjEK0cllaUxzCWNEWRAwVubDWuRYAbc8 NZaLQIS2piZ1tu1Yzc2tc619wrU8pD3xPkIfVihNBwjQlxY4iVsybtHGcyR0gDZa3XXE3I1T/AJucfs0P/fR5TVgNBmH5Fj9cm8cKfzKg3Isn/OSfuE/m1qWNRBoMxFyNZL6uNkF7X/3dN2z/ABempLyQe2r ey2O3vC8b7edvWmvThqDLryJ/wCsl/cr/Mq1ORQ34yf90n8ytJenU0GfHIpf1zE/UQf99dcHJtI9k8pNiNYqmtne d8tvmozeqnagFnQosA2KxJAytaEAjYQbLc106E0SkMxZZJW5wGMq4iZV18rqGU2Oe6rSavwH6SP46ekKDkxXI6KFCFlmA/OcUnhBjdJCl7txB 3M50NfkmhFjicVtvcFAerLdW104e5PzzHeuoNegBx8kIx/mcSfjG/kDUz8ikbZi8SvQLHztR9TVoNBlzyGT9cxP1R/Mqo8hV/XMR9QfzK1jGoA0GVPIUfrk/1P/1pewYfrc/7sfzK1l6V6DKjkIv65iPqD ZVi8hE/W8T9UfzK0 tThqDNDkFH uYrsUf99Wx8iolH/EYlukkcLcfHWkDVW7UGbfkZDcn84xY6A62HberU5MxgkjEYogi2qXUjZY EDRljTCg9C5LscNh0iB1wqoVZgoazRowB1QAbXtfbkKalo7wF JF6iOlUGN5R HH8hD6AoTRblF4cfyMXoChdUIVKmp6oRNNT2pWoGpCntStQPTg01qe1QOWqDU9MaCNXYL9JH8dPSFUmrsF kj OnpCgL6a8FvnmO9dQe1GNMeC3z3HetoTQICpCmp6oRpqe1PaoI0qlalagYU9PSoHvUGqVRIoIEU1qmRUbUHoGjfAX4kXqI6VPozwB8WL1EVNQY/T/hp8jF6IoXRTT3hp8lH6NDaoa1OBSp6BWpWp6VA1K1PantQNantSpUDWprVKmoI2q3BjvifHX0hVdXYT9Inx184qAlpXwX e431ooZaiWkjlJ89xvrBQ6ga1PalTiqFalanp6BrU1qlSoGtT2pUqBrUxFSpqghalapWpWoN3ozwB8WL1EVKlosXT6MXqIqVBjdO GvySeah1HNKwq kUw1iAXVb32R3AsBt1tvdXt0GtWOQ2G91L9Zfw00ec0q3jcgI75TSgcCIz5dWl7AI/f5eyP7qaMJT1uvYBH7/L2R/hp/YDH7/L2R/hpowlPW69gMfv8vZH Gl7AY/fpuyP8NNGFpq3fsBj9/l7I/w0vYDH7/L2R/hpowlNW79gEfv8vZH Gl7AI/f5eyP8NNGEqzDeGvxl84r0CHkNhwLM0rH3RYDyAWrK8ttErgpMPzJ7ly2sHuxJWxFjcADbu4Z8WirSOyT55jPWCuCjfKeAIItQKDMOdOTFRNL4blda5UkKdUEb888tNHyNw5AJ5y9hfuv6UHn1PW7l5DQk3WSVRw7g Ureo wWL36X H GmjDU9bgchYvfpv4f4af2Cxe/Tfw/wU0YalW59g0Xvs38P8FL2DRe zfw/wAFNGHpVuPYNF77N/D/AAUvYNF79N/D/BTRhqat17BYvfpv4f4Kb2Cxe/S/w/w00YalXoGH5FQL4TSP1sBb6oFBuWfJ1MPh9eA6rc4oYuDJdM7hQGFmyGZvvy3gCuhh3Hii9RFSq7kwO8KXALHaRdbhQEXK5zsopqg//9k=','http://www.designerappliances.com/media/catalog/product/cache/1/thumbnail/500x/9df78eab33525d08d6e5fb8d27136e95/l/g/lg_wm3570hva_1.jpg','http://www.designerappliances.com/media/catalog/product/cache/1/thumbnail/500x/9df78eab33525d08d6e5fb8d27136e95/l/g/lg_wm3570hva.jpg','http://www.lg.com/us/images/washers/wm3570hva/gallery/medium03.jpg','https://www.youtube.com/watch?v=UsQRahZopvU',0),(8,10,43,'Honda SH','','2014-08-21 02:04:06','2014-09-24 02:04:00',300,5800,5,0,'http://media.tinmoi.vn/2012/10/08/3_49_1349655282_28_1349243467-HondaSH-3.jpg','','','','','','',0),(9,10,43,'Honda Civic 2014','The Honda Civic is a line of subcompact and subsequently compact cars manufactured by Honda. The Civic, along with the Accord and Prelude, comprised Honda\'s vehicles sold in North America until the 1990s, when the model lineup was expanded. Having gone through several generational changes, the Civic has become larger and more upmarket, and it currently slots between the Fit and Accord.','2014-08-21 02:18:33','2014-11-01 02:05:00',5800,45000,200,0,'http://cdn.paultan.org/image/2014/03/Honda-Civic-Facelift-Thailand-5.jpg','','','','','','',0),(10,10,43,'Honda dream 2013','','2014-08-21 02:07:29','2014-10-30 02:07:00',500,3500,50,0,'http://cdn.tinhte.vn/attachments/dream2013-2-jpg.1204986/','','','','','','',0),(11,10,43,'Honda Lead 2014','','2014-08-21 02:08:49','2014-10-22 02:08:00',600,2500,20,0,'http://hungchaua.net/upload/sanpham/9342941.jpg','','','','','','',0),(12,10,43,'Honda vision 2014','','2014-08-21 02:10:07','2014-09-05 02:10:00',1,2200,10,0,'https://photo.tinhte.vn/store/2014/04/2457074_BMS2014_Honda_CS01_Concept_Tinhte.vn-3.jpg','','','','','','',0),(13,10,43,'Honda msx 125','','2014-08-21 02:11:29','2014-09-02 05:02:00',1000,45000,50,0,'http://www.asphaltandrubber.com/wp-content/gallery/2013-honda-msx125/2013-honda-msx125-monkey-03.jpg','','','','','','',0);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `bidder_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bid_id`),
  KEY `bidder_id_idx` (`bidder_id`),
  KEY `auction_id_idx` (`auction_id`),
  CONSTRAINT `auction_id` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auctionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bidder_id` FOREIGN KEY (`bidder_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Smartphone','Smartphone for the smart. '),(9,'Home appliances',''),(10,'Search Auctions',''),(11,'Laptop','');
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
  `userid` int(11) NOT NULL,
  `dateline` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lifetime` int(5) NOT NULL DEFAULT '24' COMMENT 'How long this token will live in hours.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (5,'44',44,'2014-08-20 01:29:45',24);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'CURRENT_TIMESTAMP',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
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
INSERT INTO `user` VALUES (8,'customer','807908e8af11eb3f416ae163762d4739','duccn01663@gmail.com','Customer1','1','1',0,1,'1823378392',0,'2014-08-13 17:01:22'),(14,'admin','807908e8af11eb3f416ae163762d4739','ducchu@live.com','Chu Nhu Duc1','097.847.9643','Hanoi HN',2,1,'1823378392',0,'2014-08-13 17:01:22'),(43,'staff','1393975c84ff83deba3f7050b910cf68','duccn01663@fpt.edu.vn','staff','','',1,1,'1168119770',0,'2014-08-14 13:17:39'),(44,'admin22','2d6ab00624c6257f7e57d0ec9bbbfed3','asdasdasd@asdasd.com','asdasdasd','asdasdasd','asdasdasd',1,0,'1862159749',0,'2014-08-15 10:20:37'),(45,'111111111111111','166dc49d526214932c8b780eaa92125c','22222222222222222222@.','3333','55555','44444',0,1,'1208191374',0,'2014-08-15 13:35:12'),(46,'','93b54aa30e37bdcbc1787d3e9bc9bd9c','','','','',0,1,'1611501300',0,'2014-08-18 14:52:18'),(47,'sdsdasdadasd','fb560ead98d96d3bb7dcb02e817bf5f4','asdasdasd','','','',0,1,'1573971205',0,'2014-08-18 14:52:36'),(50,'1111111111111','bb0dbe4e19beeab896f0e3b0f000f202','111111111','','','',0,1,'1842228419',0,'2014-08-19 00:35:43'),(53,'11111111','8848befacf0a2a94fbf7a26818cd9419','sdsd','','','',0,1,'1520336637',0,'2014-08-19 00:38:43'),(60,'111111112','5290b4a58898b4e925a68ce96a15c2b3','sdsd@.','Addasdasd','vsss','asdsd',0,1,'1950023030',0,'2014-08-19 00:39:42'),(79,'ssdsd','e836e502416a3d4e153e66f893374faf','asdasdsd@.sd','','','',0,1,'1200541485',0,'2014-08-19 00:48:44');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `watchlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`watchlist_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `auction_id_idx` (`auction_id`),
  KEY `auction_watch_idx` (`auction_id`,`user_id`),
  CONSTRAINT `user_id_nb` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-21  3:31:47
