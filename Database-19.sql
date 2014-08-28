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
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `buyer_confirm` text,
  `close_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auctionid`),
  KEY `category_id` (`category_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,1,83,'ASUS Zenfone 5','Disclaimer: This summary is not a part of the Privacy Policy and is not a legal document. It is simply a handy reference for understanding the full Privacy Policy. Think of it as the user-friendly interface to our Privacy Policy.','2014-08-28 21:41:17','2014-09-25 01:15:12',50,250,5,0,'http://fptshop.com.vn/Uploads/images/asus-zenfone-5-4.png','http://cache.media.techz.vn/upload/2014/04/23/image-1398248544-Zenfone5_07.jpg',NULL,NULL,NULL,NULL,'https://www.youtube.com/watch?v=ixhPTFdwHAM',14,'',NULL),(2,1,83,'Iphone 5S','','2014-08-28 21:41:17','2014-08-30 01:31:44',20,500,10,0,'http://cdn2.sbnation.com/assets/3256545/IMG_2909-1024.jpg',NULL,NULL,NULL,NULL,NULL,NULL,22,'',NULL),(3,10,83,'Honda Airblade 2010','','2014-08-30 21:41:17','2014-09-26 03:25:34',1200,5000,100,0,'http://dantri.vcmedia.vn/Uploaded/2010/05/16/3.jpg','http://1.bp.blogspot.com/_7G-rNqb-F4E/SqoAx1c9GyI/AAAAAAAAAZw/7Fe0wHvOhWw/s400/1209004801_Airblade_White.jpg','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSoqBPQlSrkisWOYBm9pY5jFv1Mzws18PiBxfuIyqKqx-LjAl_X','http://farm10.gox.vn/tinmoi/store/images/thumb/22122012/6/1083387/can_anh_honda_air_blade_125_do_xang_khong_can_xuong_xe_1.jpg',NULL,NULL,'https://www.youtube.com/watch?v=RP8XeWc-0h8',38,'',NULL),(4,10,83,'Mercedes C200 2011','','2014-09-01 21:41:17','2014-09-05 04:28:11',15000,35000,300,0,'http://www.thuexedulich.org/files/trangchu/mercedes_c200.8.jpg',NULL,NULL,NULL,NULL,NULL,'https://www.youtube.com/watch?v=qTc7OtSWr-M',55,'',NULL),(5,10,83,'Minsk 67','Minsk 67','2014-08-28 21:41:17','2014-09-06 07:14:02',50,356,2,0,'http://img.v3.news.zdn.vn/w660/Uploaded/pgi_xvauqbnau/2013_08_07/m1.JPG','http://i223.photobucket.com/albums/dd109/haineverlove/IMG_0530.jpg','http://ttvnol.vcmedia.vn/images/39/_MG_8004_1318818112.jpg','http://ttvnol.vcmedia.vn/images/56596/IMG_0027_1294138331.jpg','','','https://www.youtube.com/watch?v=GcyC5s7TMRw',31,'','1970-01-01 07:00:00'),(6,9,83,'R-C6800S Refrigerator','','2014-08-28 21:41:17','2014-09-20 12:29:52',500,6500,50,0,'http://www.hitachiconsumer.com/data/resources/images/K_RC6700XK.jpg','http://www.hitachiconsumer.com/intelligent_fridge/image/page-1a.jpg','http://vault.starproperty.my.s3.amazonaws.com/wp-content/uploads/2013/05/Hitachi-refrigerators-m32.jpg','','','','',3,'',NULL),(7,9,83,'LG WM3570HVA','LG Washing Machine WM3570HVA','2014-08-28 21:41:17','2014-10-01 01:18:34',50,500,2,0,'http://img3.findthebest.com/sites/default/files/1964/media/images/t2/LG_WM3570HVA_2485123.jpg','http://www.ajmadison.com/ajmadison/images/large/WM3570HVA.jpg','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQQEhQUEhQUFRQUFBQUFBQUFRQUFRUVFhQWFhQUFRQYHCggGBolHBQUITEhJSksLi4uFx8zODMsNygtLisBCgoKDg0NFBAPFCwcFBwsLCwsLCwsLCwsLCwrLCwrLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCw3LCwsLP/AABEIAN0A5AMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAAECAwYEB//EAFIQAAIBAgIFBQgNCgMHBQAAAAECAwARBCEFEjFBUQYTYXGRIiMygaGxsrMWQlJTYnJzdIKSwdHSBxQzVIOTo9Ph8ENEohUkNGNkwvEltMPE4//EABcBAQEBAQAAAAAAAAAAAAAAAAABAgP/xAAdEQEBAQADAQADAAAAAAAAAAAAARECEjEhQWFx/9oADAMBAAIRAxEAPwDYaUxskYQqWJZFY7yWbaSTXMNIyG92YdmdS07OsYhZ2Cjmoxc8SMqAnlDhff4/rCtA5 ev7o1CTHSDYWPUR9pFZ9 UUN 5mjtuz89L2QxPZY5AXNxZUd75ZWA20B44t9Yd02w7 laZsVLrZSMBlvb7rVTE sEYbGW43bdU7KuOFcjnAO4GRbL/AM7x20FyaRZnMSyd2F1iXZtRQTYaxGdznb4p6wsTpB4iokkDKxCiSN2sGOxXVhcX2C179BsDmp8ZHhpJjOWVJxGUlALKkkesNR1GdmV9vHqNVS4 KdeZhk56R2TWZA3NxRqwcsWPhMSqgAdNQaySeQHwzY9J8e6nmxToCbk2BO3gKpw HkcEqLhAL57Lb7WqOJuUYbypHRciqAGK5bYiNFbUQ626z8L5d1XLiPyjYhM aZhe3ch 3aa5/wDZEt4jqK2owZlYrYgDO9mufJTroma4IhiNpzLbXNip9oe bPL01M/Y7MN UGZ9UlGUMwHdZHNrEi4N9my43cRWq5OacfESargCxXeDfW1uge5rByaDxRCjU7kSmQJzgKrcgmwLHO3jrXcj8C6T3kXVuU1c1NyNa wnjUn9BPDaWlfDmQsdYTzQjMt3EJKL4V8zq3J3k1VHpeY2uzC43hcvJVGCIXBsSbAYzFkk7ABK5Joe mIBtlj sK0DX 0pPdnsH3VB9JSjex6tX7bUEbT2GH MnbVL8pIL5SxEfGN/EADftoD50hKQO6YZjI2v4Q4UpsZLlaRxtva581cWFn5xb/CA2MN43MAd9dRwzSeCutYEnIGw7DQOdJuhjVpX1pGCqLnacybcALk9ANTxONniUu0iMqi7CORyygbWsyi4AuTbPLZQHSMghlhnk1miQSJLqZsqSoU5wAWvqkg2tXOmm8OLlJ1mezCKKMMXdyCE1riyDeb8Kg1UmkH1QRJkbEEtcEHgRVq4lyAdY5gUI0Ng3WKKIAMVRRt3gZ2BByFd6kgWIsRlbqyzyGfiqgVjeV08ReyqQhIz193Eg2oU35SZwCeaOQJt3Q7NtVaU0TK7S6q E5IzXME5Z62XZXPJoaY61oEGtEqDutjDa475tPTcZ7BUV2xflMmYZQsDl4RsMwTt1TwrQaM5VSzMgNhrgm4sbZXzutY4aCxIDgRqdZFXMxEgrbwWbNd YtRnQujJFaLXQrZSGzGXc22gkbeFQeo6JnYc6CSbSC1zewMUZsL7Bck26aVUYA2Mvx19TFSqoynKzBc9DEuuUPMxFXGZVgAQbbx99edxcjp3uVxUJAYgkGU57/adNek6SLc3hyx1tfDxtbVAUCwsLZnxk0LeU8PSHkBtVGO9gk524tPEkh89quwPIaVZA354e5NyEiOtboJfI9Nj1GtFJiG4j6q37bXrjxONIA13Y3NlXumLHaQiC5Y2zNtgzNhnQHNVUAGQCrq2LAEDIDIm52cKqbSoSPUDnmhuUEqN/dMQLdtYnSOnVW4Bz4JqO 7bIwaJOpVk OKA4nSrOdbVS42M4M7jqeYsV jYdFXKmttjOUeEIIaSNujXh8wka9VYLlJg0yUxp9KNfIzLWJbS05/xpeoSOB2A1EaUnGyaX94/306mvWdHafQgmOQ6pGZUBkI6WUsB212I6OO5dDf4QHZrWJrxtdItfWdY3I9syASdfPJqyA/So1o/T2fhEH3MxLKfi4hRzi77c4JBsuRtplNeiLgXS5YmxN/BIF8xtJ2ZnKoR4ci d757OkHsy2UCwOk7mylo31dbVJAbV92rISsifDQkcdXZRSPSEm9r/GAfysDWVdYGrtZbm5FxYbVJvnmMh20Q5PsGmj1WVsx4P25muHD4pnIWyEsQBcFcybZ6pFHsJgZI5IywVQZFW6620gkGzDMZUAvDQBsC6nYcXjAd2RkcHz157PyRxMjFkxMLqclYlwSBlmFQgHLia3uDeRcI sylRjMStlXVNy5JJLFhbPZbxmuczEC1hbqt6NqDDjkPi9 IgHUZj/8AHTjkLiMr4uMZ7lkPZcCtfJiWGyw8Wt6V64sTpNkBJcqACTYiNQN5a1go6TQFcDgzDEquxdhYtI9k1zcXIubAbrX2DbTppFYywjkIZs3WMa7nsUi3SDWKxumN Sgi4aQNcg7CkF1dvjSGMEHINQLGaW1siGkHCVu4vxEEYWLpzVj01YjfYzT2HTuXdV C7QobdTSg ShuE07gkYlTCp4h4AfWViV0pIoshEY4RKsQ7EtTjS0/v0n12  r1NeqYHTsT2MUhJGx4wrAeNGYV3xYpJMxIjX2nWAz la/iFeNnHFjd0ic8WjXX/eW1x4iKK4PTJv4bKeEhaaPq1yeeQfTYfBNMpr0yXCEHWNwOlbDbfI1UMOda9xbhbpvtvt6azeA0yQVBJRmyUhrq53COVQAzb9QhXzHcnbRyHSDn22t0sFY9rA1lXakZvmRu3cPHtqUcZFsxu2CxyFuNVJizvVT4iPRIqTYy2eqPEbee9BroDZpPjL6qOlXH cFJJQ fdIQQLZGGIgHM3O3PLqpUAzSA71hfmsXoihEwo9i0vFhvmsPo1ndLT82t7Ek2AAtckkKqi VyzKATkL3OQNUCdLY4RA7L2JzJAAvYsxGercgZZknVGdyMTjdJNJexI1smY2DOt7hTbJUG5BkNp1jdjfpbFGRjncXuSL2YgWDAHYgFwo3Lme6ZriMTMEHEnYPt6q1IzpnYLmTauZ8V7keM/dVDtc3bM amsd9NEzO3EDqApc6w3jsFRZKQSgtTEneOyr43DbOzf2VyFc8qYix4EVdBzB4sqNU3ZNYMF1ipVhseNxnG/wh1G4yrW6F0rraqubk5K1gNYgXKMoyWUDOwyYZrvFYTCYjWyO3z0Uwrbs7GwIBscjcFT7V1OatuI4XBlmkr0/AyBXRtoDK2W8Ag5Ue0U0IeFYhILSRjuwuarrbSu03bLgMuvF8nMeZBqubutgWtqhwwukqruDgNl7VldcrCtboZO/RfKJ5xWGlWGS Ecf9fifTNc0kVq78Al8NJ8 xXpmuPScojQsfFfIX6TuG8ncAaoAaax6wLntNgABrMSxsqqozZicgu/qBIxON0gzG5sWB1hmHWNtxU7Hk/wCZsGepbJj0aQxplYuTfWF0OwrG6jurbnkU3 DGUX2zWDTtVkS1VNIWJJJJJuScySdpqtwF8IgdHtuwbPHaqixbMHVUZX49A4mqQOH9a0i3nxuB7APvpCfoPkNQCU3N/wB3qauOmOS/Dxm1XDs6/s41whDVkMxGQOXA5qesHz1dQUwuJKXGRVsmRhdGHBlOR zbto9onTXNk65JjyzY3aMZAa7Hwo7kAOc1uA1xqtWUhxNzZhbzdXVRGA2OW3qB3WIIORBBIIORBIORqWaa9Qw5DC4/voNXSpkeo1k SmkObZYjkhHe7m rqjuornM6osVJ2oczeM1tnj7k9RrDQjpE9 k/Z pjpVXpY2mbqj9UlKg6XS8OH bQ jXm/KjGa7sBsHcjZtZO6PRaJ16xi29zXo Ma2FiI2/m0Kj4zKFXykV5DiZGMcZa sY1dr8ZRztvEJFTqQVqepQbEG1ydguT1UGlYkljtOwcOjxeeiWkmyAHtj5F2DtI7KHMcyeGQ  tVFcUefT5quaHuSc7Dz1ZDZRc5k5gf1pSOWGezhuqKpOdstwFOuR2bj5qtCZA04F6grw8NxfeOw1XMn9nzVdCxXZTuwYcDw 6g418oo9hVbUjc7HBII CxVh0G42dIqHJXQ/57iFh2XBJI4Cx  icr4cyYnD4XWMUGrLGzEksykRYgi xTrIf2d6sR16On5plkvYLk54ROyhyehJDHLbgJTvNeq6DzeI2t3a3HAhgCPEbivKdGqrWD Abq/xHBST/AEM9ej/k/mZ44tfw1ZFfjro5ilJ65YpT46nKfVgholb4d/nuL9YaxnLjFhmEW1cy4va6Lq6633a7SQRX4SvwrcaIsIJCdgxmMJ8UrV5hpiUvJIxvmwT6iCZx45MWR xHCpABxrm5JNySSTxJNybDpOyhuJwrF2RwVWL9J0HZq32XubW40XhcKzSHMQo01jvK2EY8bsldfKHQ/eYp4zcOqGX5TVGR4EE3 lXRGSma54AZAbgOFVCpybbcKdFrISrVmpUgtTK5UHLLVNq6GSq2WopIutlv9r18Oo0R0fLcWO0UOUUUK2MUo2S3R iRbBu0NG/0jViDGGRmySwe6lCdgkU3iJ6NYlT8GR69J0BixiMOji9mUGx2i4vY9I2HpBrzXCC R35H7a3HInFDnJoja578B8GQK726OebEjxVOUWNDpw9 PxY/VrSqPKE2l/Zx gtNWVR5VYgx6ODjauERx1xwNIvlQV5vpzKSQDYsjqOpWKgdgr0XldCX0ZYbTg1UdJbDOijtYV5vpk3kkPGSRvrSMR563x9SszjM5B0J5izfZQ8/3/fZRDFm0qdK27dYfbXB/fkpUWS F1ADsFWKtxUJEzHUCftpB6iugJ3PVUVXImrYSxFhnx6PHSa6ix7dooOa1U3z8dTZqiFuRQaz8m0wjxWIbemDxMg iF  s5yLzxCg/wCIksZ nC/25 KtD TSPXxcyb5MHikHSWUEeas9yLktiENvBSVz0BIZDfzUGkwIuOsfZXo/INwZZbfrLH940eJ8 KNec4E2F A8wr0T8n8dpJT/ANRb6iwwH/Vh37KvP8JBWNrYPEfOMcO2Vh9teX42S9zxfEt4zjcUPMq SvTv8nP86xp7Jia8txGwj3LTjsxmKH2VOPq3wJ0i1sHibbWfDp4tdnPoLRfROI1tHaRBN axSODwD9zl 6oLpM/7nP8ABlw7eK8inyle2i h4/8A07SjHLXxEUY6xzjeTXFaGNjFdKCuaM10oaiLAKsWoinvQVTJVLCuuSuRr8KCC0Vwil8LOPe3hkHRctG3brJ9UULRM/EfMaP6HQDB41j7nDqOkmbX80ZpBfg2vY8bHtzrZckCBiV FBn zllP/wBodlYvBDZ0ADsAFbDkgP8AelPCBv8AXKAP/bNTl4RqOUp76Pko/RFKocqG76vyUXo0qw0JYtNbCR5Xth4Gtx1FVreO1q8elfWiibuv0aodbbrQ94a54kxFvpV7TEe8w/N4fVivL U2C5tnW2Wcibfaqqyr 7WB/wBnOd1anypWLx8esOkG4obPtvuYX8e8UXlND8QocEeCQcx7ltxHwTWqinXuB/eVdEKe67PvrkAtt2jyV1CzDaFPTsPj3HyVB2QqLf1qUiC39a54QwGfiII/8GlKzEZDyjLsoKHUEZbao1rVa2W0i/AG/aa52NRRrkbpoYLFxzG5C3uBvG/7a0E FwqLPisKcsQTGikg6hZy8lsrgFRax 2sPDD/AF6BRvDOdRI8gqFiLDazkazNxNlUdSirEG9FRBiA2Sk92eCDOQ JQx8Vej/k iPMxuws0rrKw4GWQ4hh4mnZfo155o7D641M  kxG23mwA2JIO68ZEQ6cSu vXNEx6ojBtfWUm2zWLXa3Rcmpyv1Y5sFHrYeVfdYvGjtlavLcfGQ8oOVpS379A XRzseL8deqaNPeX eYz1xrB8r8JqTaw2Sd7PQXcNCSdwE10J3DFGpFZXA4cTO8DEAToYwTmA4ZZIzb4yAfSrs5S6Rghwa4SC5ZpedmYkHWcBFJIGSiyCw6aEYpipDKSCCGB2EEG4PQQa5pZBO7gqqM5LpbZfaQOjM9tdGQkHOuiNqodCpIIsQew8KmuW2sjqU0iagrUtagmXqt3pmaq2NAtaijS2w8cO WTnW KoKoOwyHx0Ow8VzdslGbH7Os11YZi7GQ78lHAVYDOE21uORWEPPzSXOqipCF3ayrzrnrD4mVfomsTo9gt2YFlQaxUbWsQAgHF2KoLb3Fen8lcGYYFDnWkN2kb3UjMXlbqMjyEdBFZ5VYhyrPfU Ri9GlTcq/wBKnyEXo0qyo8GtFD8hD6sVleUuD51bqQHUhlYi4DLexI3rmykb1dxvrR4l7Rw/IQ gKA4qW9UeWaRgKm qVUkjVJ1jG4trxM28rcWb2ylW32A2aLX32YbG w9FbjT jda7oASQA6E6okUX1Rre0dbnVfdcqbqSBkMThSo1luUvq3I1WRvcSL7R jYdoJGdalZsDXax1ZAQRsI4bvjLSEZGY7ocRn/UV1EgizAEcDu6jtFUHDWzR7dDX9JRn2CgXOAbyP78VIyg7yaWpJvsfGjfbTFZNwH gfbU1cRIJ2bOP9TUMhszPR9g31aYCfDcdQux 7y1YgC CLdJzPb91XESgjO0 IcOk8TRPAx6x2gAAszN4KKM2dugDtyAuSBXHhYS99gCi7Mx1UQXtrM24eU7ACcq1OhdHXsSCIwQyhhZpWGayyKfBQbUjO/um3CluEjRcksDnzrKy9yqojgBkjB1lVre3ZiZXG5mVf8ADreYFu6X4y cVmMC9qO6Nk7tPjL5xWGkcGbQyfPcZ640C5QYVZ42VhrAggjZdSLMt93QdxAO6jSNaGT57jPWmg2LkoPMtII12Dm7rbnDa2trGyTgcHO3hJrA EooNMM BGYPA8a3mndH853SWDrexIupDCzI6 2RhkR49tYzFYfNrAgqLvGTdoxxv7ePg/iaxtrblSwU0Nh4MYCs0vM4nIRMwHMyAbVY7bntGWRrj0toaTDHVmQp7knNG JKMvEaEsNxzB2g7DRXAcocRCuoH5yPfFN3a24BjcjqINaRwfmzbgSO3yimELHcexvuok2kMO bYVkPGF8j1KD9lQGLw3vOLboZio8ZqYOP83tmxA6zbyDM13DRQVRJO3Mx7iw77J0RRbfpGwqP 1WT/h4IYD74x52XrDG qfFXAYyzF5GaVztZzfyH7b0DW5w5ArEDdQdrDdc7z09ld0Q3DqAHmAqlASbC5JNgACSSdgAG00T0Zg2kbVQ2tlJMpBEfGOJtjSn3QuE25ta0twHOTGB5yQXHcRPcnIh51FgB0RXOe RsrhK9IwrZADZWV0ZGsSqiAKqgKoGwAbAP7zuTtNaHCSVhpRypHfI/kIvRpU/Kb9JH8hD6NKg6tKyWWEf8iH0BQGeSimnH/RfN4fQFA3agqlNB8fo4OdZDqSaurrAA3X3DqwKuvwWB8VFnqlhQYvHYLVJ10MR92gaSE9YF5I/9Y6q5BgXYXjAlXjERKPGEuV kBW8ZL0OxWhIZDdo1v7oZN9YZ1dqYxTgg2OR4HKoitmdEH2s JW24TyW7CTSGim34jFHo59wPJar2MZZcBKRrFCq 7e0afXey WrsLhVJ7m8x4RdzGNnhTsLcckDX4itHHoGENrMuu3upCZG7XJolHEBsFTtTAzR2ij3Jl1TqkMkai0UbW8IKbln G5J6qPQ5VSBVqVFEsPJRrRE3fI/jr5xWciaiuh377H8dPSFQEpGtC/z7GetNA8U1GMSe8v8APsb6ygWINUcUtC9I6MWWxzV1uUdDqup4q32bDRR6rIoMVj9FuhOuhI99gW43C8kAzXfcpl8G9D0wpf8ARkSj/lnWPWU8JR8YCvQytceN0XDNnLEjn3RFn utm8tXUxgiCDY7eFOK2j6EQ DLikHuVnJX6sitUf8AYa /YgdKtCp sIr1exjJQws/gKzW3KCx7BViRDW1S13z73EOeky29yhsM9oZlrWHQEJAEnOzAZ9 mkcdgKjyV3YfDLGNVFVF4IoUdZAGZqdqYz2B0G7/AKQc0hBBRW1pXB2rJKMlX4KWuNpNq0mGhCAKoAAFgALADgBUgKmoqK6oDRnCPQSGiWHag7uUQ7uL5vD6NNT6e8KL5vD6NKg59PNnF83g9WKDNRbT5zi bwerFAJHck6pUAZZqWOwHaGHGgsaoEVVIzgXyb4KrYnq1nA7TTKZCL9yt/astyOsq9r9VBbq02rTRBr90VItuBHnJq21BVq0gtW2pWoK9Wlq1bamtQQtUlFPanAqCxDRPRDd i UT0hQxaIaK/Sx/KJ6QoCeLPen fY71tBZqLYw96f59jvW0IkqjmYVWRVrVG1BC1Nq1ZamtQQ1abVqy1K1BDVpWqdqVqCFqcVK1OBQWRmu6Fq4UrqjNQF9ObYfm8Po0qWmf8H5vD6FNVHHp/wo/kIfVigYXM9f2CjGn5BrpmMoYRt3hACKD7zsP0lHnIoHtTU4B4D68f4qVjw/1J KqI7xVlQHZbpH2GlrjiKgnStVfOjiO2nEg4jtoJ2pWqOuOIp9bpFA9qcCmvSvUFi13aNPfY/lE9IUODjiO2uvR0gEseY8NN/whQEsWe9P8/x/rRQt678S943 fY8jq51bGhzGqIEVG1SpUEbUrU9K9BG1K1PelegVqVqQp6CNqcCnpCgktXxmqBVitQHdKC/M/N4fQFKrp49cREe8xD GKVAD5aRjEK0cllaUxzCWNEWRAwVubDWuRYAbc8 NZaLQIS2piZ1tu1Yzc2tc619wrU8pD3xPkIfVihNBwjQlxY4iVsybtHGcyR0gDZa3XXE3I1T/AJucfs0P/fR5TVgNBmH5Fj9cm8cKfzKg3Isn/OSfuE/m1qWNRBoMxFyNZL6uNkF7X/3dN2z/ABempLyQe2r ey2O3vC8b7edvWmvThqDLryJ/wCsl/cr/Mq1ORQ34yf90n8ytJenU0GfHIpf1zE/UQf99dcHJtI9k8pNiNYqmtne d8tvmozeqnagFnQosA2KxJAytaEAjYQbLc106E0SkMxZZJW5wGMq4iZV18rqGU2Oe6rSavwH6SP46ekKDkxXI6KFCFlmA/OcUnhBjdJCl7txB 3M50NfkmhFjicVtvcFAerLdW104e5PzzHeuoNegBx8kIx/mcSfjG/kDUz8ikbZi8SvQLHztR9TVoNBlzyGT9cxP1R/Mqo8hV/XMR9QfzK1jGoA0GVPIUfrk/1P/1pewYfrc/7sfzK1l6V6DKjkIv65iPqD ZVi8hE/W8T9UfzK0 tThqDNDkFH uYrsUf99Wx8iolH/EYlukkcLcfHWkDVW7UGbfkZDcn84xY6A62HberU5MxgkjEYogi2qXUjZY EDRljTCg9C5LscNh0iB1wqoVZgoazRowB1QAbXtfbkKalo7wF JF6iOlUGN5R HH8hD6AoTRblF4cfyMXoChdUIVKmp6oRNNT2pWoGpCntStQPTg01qe1QOWqDU9MaCNXYL9JH8dPSFUmrsF kj OnpCgL6a8FvnmO9dQe1GNMeC3z3HetoTQICpCmp6oRpqe1PaoI0qlalagYU9PSoHvUGqVRIoIEU1qmRUbUHoGjfAX4kXqI6VPozwB8WL1EVNQY/T/hp8jF6IoXRTT3hp8lH6NDaoa1OBSp6BWpWp6VA1K1PantQNantSpUDWprVKmoI2q3BjvifHX0hVdXYT9Inx184qAlpXwX e431ooZaiWkjlJ89xvrBQ6ga1PalTiqFalanp6BrU1qlSoGtT2pUqBrUxFSpqghalapWpWoN3ozwB8WL1EVKlosXT6MXqIqVBjdO GvySeah1HNKwq kUw1iAXVb32R3AsBt1tvdXt0GtWOQ2G91L9Zfw00ec0q3jcgI75TSgcCIz5dWl7AI/f5eyP7qaMJT1uvYBH7/L2R/hp/YDH7/L2R/hpowlPW69gMfv8vZH Gl7AY/fpuyP8NNGFpq3fsBj9/l7I/w0vYDH7/L2R/hpowlNW79gEfv8vZH Gl7AI/f5eyP8NNGEqzDeGvxl84r0CHkNhwLM0rH3RYDyAWrK8ttErgpMPzJ7ly2sHuxJWxFjcADbu4Z8WirSOyT55jPWCuCjfKeAIItQKDMOdOTFRNL4blda5UkKdUEb888tNHyNw5AJ5y9hfuv6UHn1PW7l5DQk3WSVRw7g Ureo wWL36X H GmjDU9bgchYvfpv4f4af2Cxe/Tfw/wU0YalW59g0Xvs38P8FL2DRe zfw/wAFNGHpVuPYNF77N/D/AAUvYNF79N/D/BTRhqat17BYvfpv4f4Kb2Cxe/S/w/w00YalXoGH5FQL4TSP1sBb6oFBuWfJ1MPh9eA6rc4oYuDJdM7hQGFmyGZvvy3gCuhh3Hii9RFSq7kwO8KXALHaRdbhQEXK5zsopqg//9k=','http://www.designerappliances.com/media/catalog/product/cache/1/thumbnail/500x/9df78eab33525d08d6e5fb8d27136e95/l/g/lg_wm3570hva_1.jpg','http://www.designerappliances.com/media/catalog/product/cache/1/thumbnail/500x/9df78eab33525d08d6e5fb8d27136e95/l/g/lg_wm3570hva.jpg','http://www.lg.com/us/images/washers/wm3570hva/gallery/medium03.jpg','https://www.youtube.com/watch?v=UsQRahZopvU',7,'',NULL),(8,10,83,'Honda SH','','2014-08-28 21:41:17','2014-09-24 02:04:43',300,5800,5,0,'http://media.tinmoi.vn/2012/10/08/3_49_1349655282_28_1349243467-HondaSH-3.jpg','','','','','','',40,'',NULL),(9,10,83,'Honda Civic 2014','The Honda Civic is a line of subcompact and subsequently compact cars manufactured by Honda. The Civic, along with the Accord and Prelude, comprised Honda\'s vehicles sold in North America until the 1990s, when the model lineup was expanded. Having gone through several generational changes, the Civic has become larger and more upmarket, and it currently slots between the Fit and Accord.','2014-09-05 21:41:17','2014-11-01 02:05:23',5800,45000,200,0,'http://cdn.paultan.org/image/2014/03/Honda-Civic-Facelift-Thailand-5.jpg','','','','','','',18,'',NULL),(10,10,83,'Honda dream 2013','','2014-10-01 21:41:17','2014-10-30 02:07:32',500,3500,50,0,'http://cdn.tinhte.vn/attachments/dream2013-2-jpg.1204986/','','','','','','',19,'',NULL),(11,10,83,'Honda Lead 2014','','2014-08-28 21:41:17','2014-10-22 02:08:11',600,2500,20,0,'http://hungchaua.net/upload/sanpham/9342941.jpg','','','','','','',14,'',NULL),(12,10,83,'Honda vision 2014','','2014-08-28 21:41:17','2014-09-25 02:10:56',1,2200,10,0,'https://photo.tinhte.vn/store/2014/04/2457074_BMS2014_Honda_CS01_Concept_Tinhte.vn-3.jpg','','','','','','',85,'','1970-01-01 07:00:00'),(13,10,83,'Honda msx 125','','2014-08-28 21:41:17','2014-08-30 04:51:35',1000,45000,50,0,'http://www.asphaltandrubber.com/wp-content/gallery/2013-honda-msx125/2013-honda-msx125-monkey-03.jpg','','','','','','',13,'',NULL),(15,11,83,'Asus X550LB','CPU	Intel, Core i7 Haswell, 4500U, 1.80 GHz RAM	DDR3L(On board 1Khe), 4 GB ÃÂÃÂ©a cÃ¡Â»Â©ng	HDD, 750 GB MÃÂ n hÃÂ¬nh rÃ¡Â»Âng	15.6 inch, HD (1366 x 768 pixels) CÃ¡ÂºÂ£m Ã¡Â»Â©ng	KhÃÂ´ng ÃÂÃ¡Â»Â hÃ¡Â»Âa	NVIDIAÃÂ® GeForceÃÂ® GT 740M, 2 GB ÃÂÃÂ©a quang	DVD Super Multi Double Layer HÃÂH theo mÃÂ¡y	Linux PIN/Battery	Li-Ion 4 cell (2900mAh) TrÃ¡Â»Âng lÃÂ°Ã¡Â»Â£ng (Kg)	2.26','2014-08-24 21:41:17','2014-08-28 01:23:45',250,750,5,0,'http://cdn.tgdd.vn/Products/Images/44/69501/Slider/Asus-X550LB-sound.jpg','http://cdn.tgdd.vn/Products/Images/44/69501/Slider/Asus-X550LB-performance.jpg','','','','','',3,'',NULL),(16,9,83,'Steeless Shelf GS02','','2014-08-28 21:41:17','2014-09-01 01:23:45',150,350,5,0,'http://noithat190.com.vn/vn/images/nt190_products/GIA_SACH/GS02-2-400x510.jpg','','','','','','',9,'',NULL),(17,13,83,'Bikini SNM2641','','2014-08-28 21:41:17','2014-09-01 01:23:25',1,10,1,0,'http://media3.sendo.vn//img/2014/7_2/140418955763sieunhommuadoboibikinidangsh_2j84anf0nne08_simg_b1cf6e_351-351-99-0_cropf.jpg','','','','','','',3,'',NULL),(18,13,83,'Female Office Vest','','2014-08-28 21:41:17','2014-10-25 22:02:00',5,181,2,0,'http://media3.sendo.vn/img/2014/8_22/akt0002aokhoacdgfffhjykui806256128_2jfkegsb1r5ne.jpg','','','','','','',10,'',NULL),(19,1,83,' iPhone 5S 16GB','','2014-08-28 21:41:17','2014-08-29 13:02:00',300,600,20,0,'http://cdn2.tgdd.vn/Products/Images/42/60546/Slider/iphone-5s-slider.jpg','http://cdn3.tgdd.vn/Products/Images/42/60546/Slider/iphone-5s-apple-touch-id.jpg','http://cdn3.tgdd.vn/Products/Images/42/60546/Slider/iphone-5s-apple-touch-id.jpg','http://cdn4.tgdd.vn/Products/Images/42/60546/Slider/iphone-5s-gold-3.jpg','http://cdn.tgdd.vn/Products/Images/42/60546/Slider/iphone-5s-gold-4.jpg','http://cdn1.tgdd.vn/Products/Images/42/60546/Slider/iphone-5s-gold-5.jpg','https://www.youtube.com/watch?v=HhCnbVWB_vY',4,'',NULL),(20,1,83,'LG G3 D855 32GB','','2014-09-02 21:41:17','2014-09-10 18:02:00',350,600,10,0,'http://cdn2.tgdd.vn/Products/Images/42/68648/Slider/lg-mobile-G3-feature-display-1.jpg','http://cdn1.tgdd.vn/Products/Images/42/68648/Slider/lg-g3-d850-slider-design.jpg','http://cdn3.tgdd.vn/Products/Images/42/68648/Slider/lg-g3-d850-slider-cauhinh.jpg','http://cdn4.tgdd.vn/Products/Images/42/68648/Slider/lg-g3-d850-slider-camera.jpg','http://cdn1.tgdd.vn/Products/Images/42/68648/lg-g3_clip_image002.jpg','','https://www.youtube.com/watch?v=zwpSJGVeibw',1,'',NULL),(21,1,83,'Sony Xperia Z2','','2014-09-04 21:41:17','2014-09-15 13:06:00',400,700,10,0,'http://cdn1.tgdd.vn/Products/Images/42/61386/Slider/sony-xpreia-z2-slider-manhinh.jpg','http://cdn2.tgdd.vn/Products/Images/42/61386/Slider/sony-xpreia-z2-slider-camera-new.jpg','http://cdn3.tgdd.vn/Products/Images/42/61386/Slider/sony-xpreia-z2-slider-chongnuoc.jpg','http://cdn.tgdd.vn/Products/Images/42/61386/Slider/sony-xpreia-z2-slider-thietke.jpg','http://cdn3.tgdd.vn/Products/Images/42/61386/sony-xperia-z2_clip_image002.jpg','','https://www.youtube.com/watch?v=0_wKaSxtdM4',5,'',NULL),(22,1,83,'HTC One M8','','2014-08-28 21:41:17','2014-09-02 13:10:00',300,600,10,0,'http://cdn3.tgdd.vn/Products/Images/42/61385/Slider/htc-one-m8-slider-blinkfeed.jpg','http://cdn2.tgdd.vn/Products/Images/42/61385/Slider/htc-one-m8-slider-sound.jpg','http://cdn1.tgdd.vn/Products/Images/42/61385/Slider/htc-one-m8-camera-ultrapixel-twice.jpg','http://cdn.tgdd.vn/Products/Images/42/61385/Slider/htc-one-m8-slider-design.jpg','http://cdn4.tgdd.vn/Products/Images/42/61385/htc-one-m8_clip_image002.jpg','','https://www.youtube.com/watch?v=WFxxI-rxGws',5,'',NULL),(23,1,83,'Samsung Galaxy S5 ','','2014-08-28 21:41:17','2014-09-05 13:12:00',300,550,10,0,'http://cdn1.tgdd.vn/Products/Images/42/60809/Slider/samsung-galaxy-s5-slider-heart-rate.jpg','http://cdn2.tgdd.vn/Products/Images/42/60809/Slider/samsung-galaxy-s5-slider-ip67.jpg','http://cdn.tgdd.vn/Products/Images/42/60809/Slider/samsung-galaxy-s5-slider-camera-new.jpg','http://cdn4.tgdd.vn/Products/Images/42/60809/Slider/samsung-galaxy-s5-slider-design.jpg','','','https://www.youtube.com/watch?v=3TTwRvi2SQU',3,'',NULL),(24,1,83,'Samsung Galaxy S4','','2014-08-28 21:41:17','2014-09-12 13:17:00',200,450,5,0,'http://cdn1.tgdd.vn/Products/Images/42/58077/GALAXYS4ProductImage4.jpg','http://cdn1.tgdd.vn/Products/Images/42/58077/Slider/SmartScreen-galaxy-S4.jpg','http://cdn3.tgdd.vn/Products/Images/42/58077/Slider/camera-galaxy-s4.jpg','http://cdn4.tgdd.vn/Products/Images/42/58077/Slider/camera-chup-anh-galaxy-s4.jpg','http://cdn2.tgdd.vn/Products/Images/42/58077/Slider/man-hinh-galaxy-s4.jpg','','https://www.youtube.com/watch?v=84TqrfCb-ps',1,'',NULL),(25,1,83,'HTC One Mini 2','','2014-09-01 21:41:17','2014-09-10 13:19:00',220,400,5,0,'http://cdn1.tgdd.vn/Products/Images/42/68534/Slider/HTC-One-Mini-2-1.jpg','http://cdn3.tgdd.vn/Products/Images/42/68534/Slider/HTC-One-Mini-2-9.jpg','http://cdn2.tgdd.vn/Products/Images/42/68534/Slider/HTC-One-Mini-2-11.jpg','http://cdn4.tgdd.vn/Products/Images/42/68534/Slider/HTC-One-Mini-2-7.jpg','','','https://www.youtube.com/watch?v=e_fTPBhjGDA',3,'',NULL),(26,1,83,'HTC One E8','','2014-09-01 21:41:17','2014-09-06 13:22:00',270,500,5,0,'http://cdn3.tgdd.vn/Products/Images/42/68116/Slider/htc-e8_slide_01.png','http://cdn4.tgdd.vn/Products/Images/42/68116/Slider/htc-one-e8-cn-f01-01.png','http://cdn.tgdd.vn/Products/Images/42/68116/Slider/htc-one-e8-cn-f03-01.png','http://cdn1.tgdd.vn/Products/Images/42/68116/Slider/htc-one-e8-cn-f05-01.png','http://cdn1.tgdd.vn/Products/Images/42/68116/htc-one-e8-01.jpg','','https://www.youtube.com/watch?v=xHeoIqG8sKU',0,'',NULL),(27,1,83,'LG G Pro 2 D838','','2014-09-08 21:41:17','2014-09-18 13:26:00',200,450,5,0,'http://cdn1.tgdd.vn/Products/Images/42/61381/Slider/lg-g-pro-2-slider-screen.jpg','http://cdn2.tgdd.vn/Products/Images/42/61381/Slider/lg-g-pro-2-slider-design-1.jpg','http://cdn3.tgdd.vn/Products/Images/42/61381/Slider/lg-g-pro-2-slider-camera.jpg','http://cdn4.tgdd.vn/Products/Images/42/61381/Slider/lg-g-pro-2-slider-entertainment.jpg','http://cdn.tgdd.vn/Products/Images/42/61381/lg-g-pro-2_clip_image001.jpg','','https://www.youtube.com/watch?v=44V1Gcbh00Q',0,'',NULL),(28,1,83,'iPhone 4S 8GB','','2014-08-28 21:41:17','2014-08-29 13:28:00',200,400,5,0,'http://cdn4.tgdd.vn/Products/Images/42/60686/Slider/iphone-4s-retina-04.jpg','http://cdn.tgdd.vn/Products/Images/42/60686/Slider/iphone-4s-camera-02.jpg','http://cdn1.tgdd.vn/Products/Images/42/60686/Slider/iphone-4s-gaming.jpg','http://cdn2.tgdd.vn/Products/Images/42/60686/Slider/iphone-4s-black-01.jpg','http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image002.jpg','','https://www.youtube.com/watch?v=DU-S9pVnlgg',2,'',NULL),(29,1,83,'Nokia Lumia 925','','2014-09-10 21:41:17','2014-09-12 13:33:00',200,350,5,0,'http://cdn3.tgdd.vn/Products/Images/42/59532/Slider/Nokia-Lumia-925-trang-org-11.jpg','http://cdn4.tgdd.vn/Products/Images/42/59532/Slider/Nokia-Lumia-925-trang-org-14.jpg','http://cdn2.tgdd.vn/Products/Images/42/59532/Slider/Nokia-Lumia-925-den-org-8.jpg','http://cdn1.tgdd.vn/Products/Images/42/59532/Slider/lumia-925-smart-cam-000.jpg','http://cdn.tgdd.vn/Products/Images/42/59532/Slider/lumia-925-chup-hinh.jpg','','https://www.youtube.com/watch?v=i7Dj4lseLqI',0,'',NULL),(30,1,83,'Asus Zenfone 6 ','','2014-09-10 21:41:17','2014-09-25 13:36:00',150,300,5,0,'http://cdn4.tgdd.vn/Products/Images/42/68098/Slider/Asus-Zenfone-6-1.jpg','http://cdn.tgdd.vn/Products/Images/42/68098/Slider/Asus-Zenfone-6-7.jpg','http://cdn1.tgdd.vn/Products/Images/42/68098/Slider/Asus-Zenfone-6-9.jpg','http://cdn2.tgdd.vn/Products/Images/42/68098/Slider/Asus-Zenfone-6-11.jpg','http://cdn.tgdd.vn/Products/Images/42/68098/asus-zenfone-6_clip_image002.jpg','','https://www.youtube.com/watch?v=T82SEh3P3jM',0,'',NULL),(31,11,83,'Asus X551MAV','','2014-09-11 21:41:17','2014-09-15 13:39:00',200,400,5,0,'http://cdn.tgdd.vn/Products/Images/44/69327/Slider/Asus-X551MAV.jpg','http://cdn1.tgdd.vn/Products/Images/44/69327/Slider/Asus-X551MAV-sonicmaster.jpg','http://cdn2.tgdd.vn/Products/Images/44/69327/Slider/Asus-X551MAV-keyboard.jpg','http://cdn.tgdd.vn/Products/Images/44/69327/Asus-X551-windows-thiet-ke.jpg','','','https://www.youtube.com/watch?v=o5xKEnYCuMY',2,'',NULL),(32,11,83,'Asus X450CA','','2014-08-28 21:41:17','2014-10-04 13:41:00',300,500,5,0,'http://cdn1.tgdd.vn/Products/Images/44/60895/Slider/Asus-X450CA-4.jpg','http://cdn2.tgdd.vn/Products/Images/44/60895/Slider/Asus-X450CA-3.jpg','http://cdn4.tgdd.vn/Products/Images/44/60895/Slider/Asus-X450CA-2.jpg','http://cdn.tgdd.vn/Products/Images/44/60895/Slider/Asus-X450CA-1.jpg','http://cdn1.tgdd.vn/Products/Images/44/60895/asus-x450ca_clip_image002.jpg','','https://www.youtube.com/watch?v=bBNNJNFlDAE',0,'',NULL),(33,11,83,'Asus P450LA','','2014-09-03 21:41:17','2014-09-05 13:46:00',320,500,5,0,'http://cdn2.tgdd.vn/Products/Images/44/68813/Slider/Asus-P450LA-2.jpg','http://cdn1.tgdd.vn/Products/Images/44/68813/Slider/Asus-P450LA-1.jpg','http://cdn3.tgdd.vn/Products/Images/44/68813/Slider/Asus-P450LA-3.jpg','http://cdn4.tgdd.vn/Products/Images/44/68813/Slider/Asus-P450LA-4a.jpg','http://cdn.tgdd.vn/Products/Images/44/68813/Slider/Asus-P450LA-5.jpg','http://cdn1.tgdd.vn/Products/Images/44/68813/asus-p450la-2.jpg','https://www.youtube.com/watch?v=95a4DmJkxR4',0,'',NULL),(34,11,83,'Acer Aspire V3','','2014-08-28 21:41:17','2014-09-05 13:49:00',300,600,10,0,'http://cdn.tgdd.vn/Products/Images/44/69445/Slider/Acer-Aspire-V3-371-designs-tgdd.jpg','http://cdn1.tgdd.vn/Products/Images/44/69445/Slider/Acer-Aspire-V3-371-wifi-tgdd.jpg','http://cdn2.tgdd.vn/Products/Images/44/69445/Slider/Acer-Aspire-V3-371-battery-tgdd.jpg','http://cdn3.tgdd.vn/Products/Images/44/69445/Slider/Acer-Aspire-V3-371-sound-tgdd.jpg','http://cdn.tgdd.vn/Products/Images/44/69445/Acer-Aspire-V3-371-2-1.jpg','','https://www.youtube.com/watch?v=E6_yZuZgfCk',1,'',NULL),(35,11,83,'Asus PU301LA ','','2014-08-28 21:41:17','2014-08-30 13:53:00',350,700,10,0,'http://cdn.tgdd.vn/Products/Images/44/68865/Slider/asus-pu301la-ro108d-slider01.jpg','http://cdn1.tgdd.vn/Products/Images/44/68865/Slider/asus-pu301la-ro108d-slider03a.jpg','http://cdn2.tgdd.vn/Products/Images/44/68865/Slider/asus-pu301la-ro108d-slider04.jpg','http://cdn3.tgdd.vn/Products/Images/44/68865/Slider/asus-pu301la-ro108d-slider02.jpg','','','https://www.youtube.com/watch?v=iDVJ4ZbmTpA',0,'',NULL),(36,11,83,'Dell Vostro 5560','','2014-09-05 21:41:17','2014-09-10 13:56:00',400,700,10,0,'http://cdn.tgdd.vn/Products/Images/44/67799/Slider/Dell-Vostro-5560-.jpg','http://cdn1.tgdd.vn/Products/Images/44/67799/Slider/Dell-Vostro-5560-1.jpg','http://cdn2.tgdd.vn/Products/Images/44/67799/Slider/Dell-Vostro-5560-2.jpg','http://cdn3.tgdd.vn/Products/Images/44/67799/Slider/Dell-Vostro-5560-5jpg.jpg','http://cdn3.tgdd.vn/Products/Images/44/67799/dell-vostro-5560_clip_image002.jpg','','https://www.youtube.com/watch?v=B9FSAFKwtTg',0,'',NULL),(37,11,83,'Lenovo G5070','','2014-09-01 21:41:17','2014-09-05 13:58:00',350,600,10,0,'http://cdn2.tgdd.vn/Products/Images/44/68590/Slider/Lenovo-G5070-desing.jpg','http://cdn3.tgdd.vn/Products/Images/44/68590/Slider/Lenovo-G5070-ban-phim.jpg','http://cdn4.tgdd.vn/Products/Images/44/68590/Slider/Lenovo-G5070-suond.jpg','http://cdn.tgdd.vn/Products/Images/44/68590/Slider/Lenovo-G5070-pin.jpg','http://cdn2.tgdd.vn/Products/Images/44/68590/lenovo-g5070_clip_image002.jpg','','https://www.youtube.com/watch?v=nnW4TNWaN40',0,'',NULL),(38,11,83,'Macbook Pro ME866','','2014-08-28 21:41:17','2014-09-04 14:01:00',1200,1800,20,0,'http://cdn4.tgdd.vn/Products/Images/44/67606/Slider/1.jpg','http://cdn.tgdd.vn/Products/Images/44/67606/Slider/2.jpg','http://cdn1.tgdd.vn/Products/Images/44/67606/Slider/3.jpg','http://cdn2.tgdd.vn/Products/Images/44/67606/Slider/4.jpg','http://cdn3.tgdd.vn/Products/Images/44/67606/Slider/5.jpg','http://cdn4.tgdd.vn/Products/Images/44/67606/Slider/7.jpg','https://www.youtube.com/watch?v=sZRDAI0L0Fk',0,'',NULL),(39,11,83,'Macbook Air 2014 ','','2014-09-10 21:41:17','2014-09-17 14:06:00',800,1300,30,0,'http://cdn1.tgdd.vn/Products/Images/44/68577/Slider/0-macbook-air-2014-md-11inch-04a.jpg','http://cdn2.tgdd.vn/Products/Images/44/68577/Slider/macbook-air-2014-md-11inch-05f.jpg','http://cdn3.tgdd.vn/Products/Images/44/68577/Slider/macbook-air-2014-md-11inch-03a.jpg','http://cdn4.tgdd.vn/Products/Images/44/68577/Slider/macbook-air-2014-md-11inch-02b.jpg','http://cdn.tgdd.vn/Products/Images/44/68577/Slider/macbook-air-2014-md-11inch-07a.jpg','http://cdn2.tgdd.vn/Products/Images/44/68577/apple-macbook-air-2014-md712zpb_clip_image002.jpg','https://www.youtube.com/watch?v=UnST_fWhM2o',0,'',NULL),(40,11,83,'Asus X451CA','','2014-08-28 21:41:17','2014-09-04 14:11:00',250,400,10,0,'http://cdn.tgdd.vn/Products/Images/44/60835/Slider/asus-x451ca-instant-on-2s.jpg','http://cdn.tgdd.vn/Products/Images/44/60835/asus-x451ca_clip_image002.jpg','http://cdn2.tgdd.vn/Products/Images/44/60835/asus-x451ca_clip_image004.jpg','http://cdn4.tgdd.vn/Products/Images/44/60835/asus-x451ca_clip_image006.jpg','http://cdn1.tgdd.vn/Products/Images/44/60835/asus-x451ca_clip_image008.jpg','http://cdn3.tgdd.vn/Products/Images/44/60835/asus-x451ca_clip_image010.jpg','https://www.youtube.com/watch?v=d4CTUPq-RUU',0,'',NULL),(41,11,83,'Dell Inspiron 5447','','2014-08-28 21:41:17','2014-09-06 14:13:00',500,900,20,0,'http://cdn3.tgdd.vn/Products/Images/44/68890/Dell-Inspiron-544-14ich.jpg','http://cdn.tgdd.vn/Products/Images/44/68890/Dell-Inspiron-5447-van-xuoc-kim-loai.jpg','http://cdn1.tgdd.vn/Products/Images/44/68890/Dell-Inspiron-5447-thiet-ke-vo-nhom.jpg','http://cdn3.tgdd.vn/Products/Images/44/68890/Dell-Inspiron-5447-ban-phim-chiclet.jpg','http://cdn4.tgdd.vn/Products/Images/44/68890/Dell-Inspiron-5447-cong-nghe-max-audio.jpg','','https://www.youtube.com/watch?v=hZYA6inT_aA',1,'',NULL),(42,9,83,'TV OLED LG 55\"','','2014-08-28 21:41:17','2014-09-06 14:21:00',3000,4500,50,0,'http://img.trananh.vn/trananh/2014/06/04/55EA970T.jpg','http://img.trananh.vn/trananh/2014/06/04/55EA970Td.jpg','http://img.trananh.vn/trananh/2014/06/04/55EA970Te.jpg','','','','https://www.youtube.com/watch?v=dlPz4yoYrkM',1,'',NULL),(43,9,83,'ARIRANG DVD AR 36','','2014-09-01 21:41:17','2014-09-04 14:22:00',110,200,5,0,'http://img.trananh.vn/trananh/2011/11/28/dau-dia-karaoke-arirang-dvd-ar-36-cn-22506-2.jpg','http://img.trananh.vn/trananh/2011/11/28/dau-dia-karaoke-arirang-dvd-ar-36-cn-22506-1.jpg','','','','','https://www.youtube.com/watch?v=N1G_Ya5GmGs',1,'',NULL),(44,9,83,'BLU-RAY 3D SONY','','2014-09-02 21:41:17','2014-09-06 14:27:00',650,1000,20,0,'http://img.trananh.vn/trananh/2014/06/23/N9200W(1).jpg','','','','','','https://www.youtube.com/watch?v=1XO_R3pVSEg',3,'',NULL),(45,9,83,'TIVI LED SONY 48\"','','2014-08-28 21:41:17','2014-09-18 14:30:00',700,1000,30,0,'http://img.trananh.vn/trananh/2014/05/09/KDL-48W600B.jpg','','','','','','https://www.youtube.com/watch?v=zYGYONH1yLk',0,'',NULL),(46,9,83,'TIVI SAMSUNG 55\'\'','','2014-08-28 21:41:17','2014-09-05 14:31:00',1500,2000,40,0,'http://img.trananh.vn/trananh/2014/05/05/01.jpg','','','','','','https://www.youtube.com/watch?v=5YVskjvyoG4',0,'',NULL),(47,9,83,'nonan KD-06','','2014-09-10 21:41:17','2014-09-15 14:35:00',75,125,2,0,'http://img.trananh.vn/trananh/2009/10/04/may-tao-ozone-khu-doc-rauqua-nonan-kd-06-cs-60w-8lit-8331-1.jpg','','','','','','https://www.youtube.com/watch?v=kgzaWmEXj0s',0,'',NULL),(49,9,83,'Daikin Inverter ','','2014-08-28 21:41:17','2014-09-06 14:41:00',750,1100,40,0,'http://img.trananh.vn/trananh/2014/07/11/FTXD50HVMV1.JPG','','','','','','https://www.youtube.com/watch?v=M4fKIce1PCM',2,'',NULL),(50,9,83,'LG WD-18600','','2014-09-02 21:41:17','2014-09-18 14:50:00',550,800,10,0,'http://img.trananh.vn/trananh/2012/10/18/tran-anh--wd-18600-may-giat-long-ngang-say-lg--giat-7-5kg--say-4kg.jpg','','','','','','',0,'',NULL),(51,9,83,'Sanaky VH401K','','2014-09-01 21:41:17','2014-09-06 14:53:00',300,450,5,0,'http://img.trananh.vn/trananh/2012/06/22/401k1.jpg','http://img.trananh.vn/trananh/2012/06/22/401k.jpg','','','','','https://www.youtube.com/watch?v=It1AB5sH0Qs',3,'',NULL),(52,9,83,'EH - DIH2000A','','2014-09-03 21:41:17','2014-09-25 14:57:00',200,350,5,0,'http://img.trananh.vn/trananh/2014/03/14/3(2).jpg','','','','','','https://www.youtube.com/watch?v=CJsVO1z7_aw',0,'',NULL);
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
  PRIMARY KEY (`bid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (32,8,12,11,'2014-08-28 22:41:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mobile Devices','Cellphones, Tablets, etc'),(9,'Home appliances',''),(10,'Vehicles',''),(11,'Laptops',''),(12,'Furniture',''),(13,'Clothes','');
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
/*!40000 ALTER TABLE `digital` ENABLE KEYS */;
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
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (28,-11,0,'Bidded on auction \'Honda vision 2014\' (ID #12)','2014-08-28 22:41:48',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'customer','807908e8af11eb3f416ae163762d4739','duccn01663@gmail.com','Le Thanh Tung','0922333777','Ha Noi',0,1,'1823378392',14989,'2014-08-13 17:01:22'),(14,'admin','807908e8af11eb3f416ae163762d4739','ducchu@live.com','Chu Nhu Duc','097.847.9643','Hanoi HN',2,1,'1823378392',15000,'2014-08-13 17:01:22'),(43,'staff','807908e8af11eb3f416ae163762d4739','duccn01663@fpt.edu.vn','Pham Van Tu','0977999888','Ha Noi',1,1,'1823378392',15000,'2014-08-14 13:17:39'),(44,'staff2','807908e8af11eb3f416ae163762d4739','staff@auction.com','Nguyen Van Hieu','0988666555','Bac Ninh',1,0,'1823378392',15000,'2014-08-15 10:20:37'),(80,'namnv','807908e8af11eb3f416ae163762d4739','namnv2301@gmail.com','Nguyen Van Nam','097.847.9643','Bac Ninh',0,1,'1823378392',15000,'2014-08-27 09:59:18'),(81,'tupv','807908e8af11eb3f416ae163762d4739','tupvse02404@fpt.edu.vn','Pham Van Tu','0988222111','Hai Duong',0,1,'1823378392',15000,'2014-08-27 10:02:14'),(82,'hieund','807908e8af11eb3f416ae163762d4739','hieundse02173@fpt.edu.vn','Nguyen Dinh Hieu','0977555444','Ha Noi',0,1,'1823378392',15000,'2014-08-27 10:03:33'),(83,'hiepnv','807908e8af11eb3f416ae163762d4739','hiepnv@gmail.com','Nguyen Van Hiep','0977888555','Hoa Binh',0,1,'1823378392',15000,'2014-08-27 10:04:15'),(84,'chiendh','807908e8af11eb3f416ae163762d4739','chiendh@gmail.com','Do Huu Chien','0988222333','Ha Noi',0,1,'1823378392',15000,'2014-08-27 10:05:18'),(85,'linhlm','807908e8af11eb3f416ae163762d4739','linhlm@gmail.com','Le Manh Linh','0678444555','Ha Noi',0,1,'1823378392',15000,'2014-08-27 10:06:23'),(86,'anhnn','807908e8af11eb3f416ae163762d4739','anhnn@gmail.com','Nguyen Hoang Anh','0988777333','Hung Yen',0,1,'1823378392',15000,'2014-08-27 10:07:14'),(87,'vunv','807908e8af11eb3f416ae163762d4739','vunv@gmail.com','Nguyen Van Vu','0955666777','Hai Phong',0,1,'1823378392',15000,'2014-08-27 10:07:53'),(88,'hieunn','807908e8af11eb3f416ae163762d4739','hieunn@gmail.com','Nguyen Nhu Hieu','0988333111','Ninh Binh',0,1,'1823378392',15000,'2014-08-27 10:09:15'),(89,'chungbd','807908e8af11eb3f416ae163762d4739','chungbd@gmail.com','Bui Dinh Chung','0988777666','Ha TInh',0,1,'1823378392',15000,'2014-08-27 10:09:52'),(90,'chucnh','807908e8af11eb3f416ae163762d4739','chucnh@gmail.com','Nguyen Huu Chuc','0988777555','Vinh Phuc',0,1,'1823378392',15000,'2014-08-27 10:10:43'),(91,'hoanh','807908e8af11eb3f416ae163762d4739','hoanh@gmail.com','Nguyen Huynh Hoa','0911222333','Phu Tho',0,1,'1823378392',15000,'2014-08-27 10:11:42'),(92,'vulv','807908e8af11eb3f416ae163762d4739','vulv@gmail.com','Le Anh Vu','0911333444','Bac Ninh',0,1,'1823378392',15000,'2014-08-27 10:12:28'),(93,'maint','807908e8af11eb3f416ae163762d4739','maint@gmail.com','Ngo Thi Mai','0988555666','Ha Noi',0,1,'1823378392',15000,'2014-08-27 10:13:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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

-- Dump completed on 2014-08-28 23:19:58
