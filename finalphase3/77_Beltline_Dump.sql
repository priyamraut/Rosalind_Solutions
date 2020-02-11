CREATE DATABASE  IF NOT EXISTS `cs4400_t77` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `cs4400_t77`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cs4400_t77
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assign_to`
--

DROP TABLE IF EXISTS `assign_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assign_to` (
  `eventname` varchar(50) NOT NULL,
  `eventstartdate` date NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`eventname`,`eventstartdate`,`sitename`,`employeeID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `assign_to_ibfk_1` FOREIGN KEY (`eventname`, `eventstartdate`, `sitename`) REFERENCES `event` (`eventname`, `eventstartdate`, `sitename`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assign_to_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_to`
--

LOCK TABLES `assign_to` WRITE;
/*!40000 ALTER TABLE `assign_to` DISABLE KEYS */;
INSERT INTO `assign_to` VALUES ('Bus Tour','2019-02-01','Inman Park','000000002'),('Bus Tour','2019-02-08','Inman Park','000000002'),('Eastside Trail','2019-02-04','Piedmont Park','000000002'),('Eastside Trail','2019-02-13','Historic Fourth Ward Park','000000002'),('Bus Tour','2019-02-08','Inman Park','000000003'),('Eastside Trail','2019-02-04','Inman Park','000000003'),('Private Bus Tour','2019-02-01','Inman Park','000000003'),('Eastside Trail','2019-02-04','Piedmont Park','000000011'),('Eastside Trail','2019-03-01','Inman Park','000000011'),('Official Atlanta BeltLine Bike Tour','2019-02-09','Atlanta BeltLine Center','000000011'),('Westside Trail','2019-02-18','Westview Cemetery','000000011'),('Bus Tour','2019-02-01','Inman Park','000000012'),('Eastside Trail','2019-02-04','Inman Park','000000012'),('Arboretum Walking Tour','2019-02-08','Inman Park','000000013'),('Westside Trail','2019-02-18','Westview Cemetery','000000013');
/*!40000 ALTER TABLE `assign_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect`
--

DROP TABLE IF EXISTS `connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `connect` (
  `transitroute` varchar(20) NOT NULL,
  `transittype` varchar(35) NOT NULL,
  `sitename` varchar(50) NOT NULL,
  PRIMARY KEY (`transittype`,`transitroute`,`sitename`),
  KEY `sitename` (`sitename`),
  KEY `transitroute` (`transitroute`,`transittype`),
  CONSTRAINT `connect_ibfk_1` FOREIGN KEY (`sitename`) REFERENCES `site` (`sitename`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `connect_ibfk_2` FOREIGN KEY (`transitroute`, `transittype`) REFERENCES `transit` (`route`, `type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect`
--

LOCK TABLES `connect` WRITE;
/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
INSERT INTO `connect` VALUES ('Relay','Bike','Historic Fourth Ward Park'),('152','Bus','Historic Fourth Ward Park'),('Blue','MARTA','Historic Fourth Ward Park'),('152','Bus','Inman Park'),('Blue','MARTA','Inman Park'),('Relay','Bike','Piedmont Park'),('152','Bus','Piedmont Park'),('Blue','MARTA','Piedmont Park'),('Blue','MARTA','Westview Cemetery');
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `create_event`
--

DROP TABLE IF EXISTS `create_event`;
/*!50001 DROP VIEW IF EXISTS `create_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `create_event` AS SELECT 
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `enddate`,
 1 AS `price`,
 1 AS `description`,
 1 AS `minstaffreq`,
 1 AS `capacity`,
 1 AS `employeeID`,
 1 AS `eusername`,
 1 AS `Staff`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `create_site`
--

DROP TABLE IF EXISTS `create_site`;
/*!50001 DROP VIEW IF EXISTS `create_site`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `create_site` AS SELECT 
 1 AS `Manager`,
 1 AS `openeveryday`,
 1 AS `zipcode`,
 1 AS `address`,
 1 AS `sitename`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `create_transit`
--

DROP TABLE IF EXISTS `create_transit`;
/*!50001 DROP VIEW IF EXISTS `create_transit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `create_transit` AS SELECT 
 1 AS `route`,
 1 AS `type`,
 1 AS `price`,
 1 AS `sitename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `daily_detail`
--

DROP TABLE IF EXISTS `daily_detail`;
/*!50001 DROP VIEW IF EXISTS `daily_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `daily_detail` AS SELECT 
 1 AS `eventname`,
 1 AS `price`,
 1 AS `employeeID`,
 1 AS `Staff`,
 1 AS `eusername`,
 1 AS `Daily_Revenue`,
 1 AS `Daily_Visits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `edit_event`
--

DROP TABLE IF EXISTS `edit_event`;
/*!50001 DROP VIEW IF EXISTS `edit_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `edit_event` AS SELECT 
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `enddate`,
 1 AS `price`,
 1 AS `capacity`,
 1 AS `description`,
 1 AS `minStaffReq`,
 1 AS `Staff`,
 1 AS `eusername`,
 1 AS `date`,
 1 AS `Daily_Visits`,
 1 AS `Daily_Revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `edit_site`
--

DROP TABLE IF EXISTS `edit_site`;
/*!50001 DROP VIEW IF EXISTS `edit_site`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `edit_site` AS SELECT 
 1 AS `zipcode`,
 1 AS `address`,
 1 AS `sitename`,
 1 AS `openeveryday`,
 1 AS `Manager`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `edit_transit`
--

DROP TABLE IF EXISTS `edit_transit`;
/*!50001 DROP VIEW IF EXISTS `edit_transit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `edit_transit` AS SELECT 
 1 AS `sitename`,
 1 AS `price`,
 1 AS `route`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email` (
  `username` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `email_ibfk_1` (`username`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('david.smith','dsmith@outlook.com'),('james.smith','jsmith@gatech.edu'),('james.smith','jsmith@gmail.com'),('james.smith','jsmith@hotmail.com'),('james.smith','jsmith@outlook.com'),('manager1','m1@beltline.com'),('manager2','m2@beltline.com'),('manager3','m3@beltline.com'),('manager4','m4@beltline.com'),('manager5','m5@beltline.com'),('maria.garcia','mgarcia@gatech.edu'),('maria.garcia','mgarcia@yahoo.com'),('maria.hernandez','mh@gatech.edu'),('maria.hernandez','mh123@gmail.com'),('maria.rodriguez','mrodriguez@gmail.com'),('mary.smith','mary@outlook.com'),('michael.smith','msmith@gmail.com'),('robert.smith','rsmith@hotmail.com'),('staff1','s1@beltline.com'),('staff2','s2@beltline.com'),('staff3','s3@beltline.com'),('user1','u1@beltline.com'),('visitor1','v1@beltline.com');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employeeID` varchar(20) NOT NULL,
  `phone` decimal(10,0) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` tinytext NOT NULL,
  `state` tinytext NOT NULL,
  `zipcode` decimal(5,0) NOT NULL,
  `etype` enum('Admin','Manager','Staff') NOT NULL,
  `eusername` varchar(20) NOT NULL,
  PRIMARY KEY (`eusername`),
  UNIQUE KEY `employeeID` (`employeeID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`eusername`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('000000005',5124776435,'350 Ferst Drive','Atlanta','GA',30332,'Manager','david.smith'),('000000001',4043721234,'123 East Main Street','Rochester','NY',14604,'Admin','james.smith'),('000000006',8045126767,'123 East Main Street','Rochester','NY',14604,'Manager','manager1'),('000000007',9876543210,'123 East Main Street','Rochester','NY',14604,'Manager','manager2'),('000000008',5432167890,'350 Ferst Drive','Atlanta','GA',30332,'Manager','manager3'),('000000009',8053467565,'123 East Main Street','Columbus','OH',43215,'Manager','manager4'),('000000010',8031446782,'801 Atlantic Drive','Atlanta','GA',30332,'Manager','manager5'),('000000004',7890123456,'123 East Main Street','Richland','PA',17987,'Manager','maria.garcia'),('000000002',4043726789,'350 Ferst Drive','Atlanta','GA',30332,'Staff','michael.smith'),('000000003',1234567890,'123 East Main Street','Columbus','OH',43215,'Staff','robert.smith'),('000000011',8024456765,'266 Ferst Drive Northwest','Atlanta','GA',30332,'Staff','staff1'),('000000012',8888888888,'266 Ferst Drive Northwest','Atlanta','GA',30332,'Staff','staff2'),('000000013',3333333333,'801 Atlantic Drive','Atlanta','GA',30332,'Staff','staff3');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event` (
  `description` text,
  `minStaffReq` int(5) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `enddate` date NOT NULL,
  `eventname` varchar(50) NOT NULL,
  `eventstartdate` date NOT NULL,
  `sitename` varchar(50) NOT NULL,
  PRIMARY KEY (`eventname`,`eventstartdate`,`sitename`),
  KEY `sitename` (`sitename`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`sitename`) REFERENCES `site` (`sitename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('Official Atlanta BeltLine Arboretum Walking Tours provide an up-close view of the Westside Trail and the Atlanta BeltLine Arboretum led by Trees Atlanta Docents. The one and a half hour tours step off at at 10am (Oct thru May), and 9am (June thru September). Departure for all tours is from Rose Circle Park near Brown Middle School. More details at: https://beltline.org/visit/atlanta-beltline-tours/#arboretum-walking',1,5,5.00,'2019-02-11','Arboretum Walking Tour','2019-02-08','Inman Park'),('The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources',2,6,25.00,'2019-02-02','Bus Tour','2019-02-01','Inman Park'),('The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources',2,6,25.00,'2019-02-10','Bus Tour','2019-02-08','Inman Park'),('A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1,99999,0.00,'2019-02-05','Eastside Trail','2019-02-04','Inman Park'),('A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1,99999,0.00,'2019-02-05','Eastside Trail','2019-02-04','Piedmont Park'),('A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1,99999,0.00,'2019-02-14','Eastside Trail','2019-02-13','Historic Fourth Ward Park'),('A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1,99999,0.00,'2019-03-02','Eastside Trail','2019-03-01','Inman Park'),('These tours will include rest stops highlighting assets and points of interest along the Atlanta BeltLine. Staff will lead the rides, and each group will have a ride sweep to help with any unexpected mechanical difficulties.',1,5,5.00,'2019-02-14','Official Atlanta BeltLine Bike Tour','2019-02-09','Atlanta BeltLine Center'),('Private tours are available most days, pending bus and tour guide availability. Private tours can accommodate up to 4 guests per tour, and are subject to a tour fee (nonprofit rates are available). As a nonprofit organization with limited resources, we are unable to offer free private tours. We thank you for your support and your understanding as we try to provide as many private group tours as possible. The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources',1,4,40.00,'2019-02-02','Private Bus Tour','2019-02-01','Inman Park'),('The Westside Trail is a free amenity that offers a bicycle and pedestrian-safe corridor with a 14-foot-wide multi-use trail surrounded by mature trees and grasses thanks to Trees Atlanta’s Arboretum. With 16 points of entry, 14 of which will be ADA-accessible with ramp and stair systems, the trail provides numerous access points for people of all abilities. More details at: https://beltline.org/explore-atlanta-beltline-trails/westside-trail/',1,99999,0.00,'2019-02-21','Westside Trail','2019-02-18','Westview Cemetery');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `explore_event`
--

DROP TABLE IF EXISTS `explore_event`;
/*!50001 DROP VIEW IF EXISTS `explore_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `explore_event` AS SELECT 
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `sitename`,
 1 AS `enddate`,
 1 AS `description`,
 1 AS `price`,
 1 AS `capacity`,
 1 AS `Total Visits`,
 1 AS `Tickets Remaining`,
 1 AS `My Visits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `explore_site`
--

DROP TABLE IF EXISTS `explore_site`;
/*!50001 DROP VIEW IF EXISTS `explore_site`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `explore_site` AS SELECT 
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `visitorusername`,
 1 AS `sitename`,
 1 AS `openeveryday`,
 1 AS `Total Visits`,
 1 AS `My Visits`,
 1 AS `Event_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manage_event`
--

DROP TABLE IF EXISTS `manage_event`;
/*!50001 DROP VIEW IF EXISTS `manage_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `manage_event` AS SELECT 
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `enddate`,
 1 AS `description`,
 1 AS `price`,
 1 AS `sitename`,
 1 AS `employeeID`,
 1 AS `Staff`,
 1 AS `eusername`,
 1 AS `Duration`,
 1 AS `Total_Revenue`,
 1 AS `Total_Visits`,
 1 AS `Staff_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manage_profile`
--

DROP TABLE IF EXISTS `manage_profile`;
/*!50001 DROP VIEW IF EXISTS `manage_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `manage_profile` AS SELECT 
 1 AS `fname`,
 1 AS `lname`,
 1 AS `username`,
 1 AS `sitename`,
 1 AS `employeeID`,
 1 AS `phone`,
 1 AS `address`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manage_site`
--

DROP TABLE IF EXISTS `manage_site`;
/*!50001 DROP VIEW IF EXISTS `manage_site`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `manage_site` AS SELECT 
 1 AS `sitename`,
 1 AS `openeveryday`,
 1 AS `Manager`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manage_staff`
--

DROP TABLE IF EXISTS `manage_staff`;
/*!50001 DROP VIEW IF EXISTS `manage_staff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `manage_staff` AS SELECT 
 1 AS `sitename`,
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `enddate`,
 1 AS `employeeID`,
 1 AS `eusername`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `Event_shifts`,
 1 AS `Staff`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manage_transit`
--

DROP TABLE IF EXISTS `manage_transit`;
/*!50001 DROP VIEW IF EXISTS `manage_transit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `manage_transit` AS SELECT 
 1 AS `route`,
 1 AS `type`,
 1 AS `price`,
 1 AS `username`,
 1 AS `sitename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manage_user`
--

DROP TABLE IF EXISTS `manage_user`;
/*!50001 DROP VIEW IF EXISTS `manage_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `manage_user` AS SELECT 
 1 AS `username`,
 1 AS `status`,
 1 AS `etype`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `register_employee`
--

DROP TABLE IF EXISTS `register_employee`;
/*!50001 DROP VIEW IF EXISTS `register_employee`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `register_employee` AS SELECT 
 1 AS `address`,
 1 AS `etype`,
 1 AS `phone`,
 1 AS `zipcode`,
 1 AS `email`,
 1 AS `username`,
 1 AS `state`,
 1 AS `city`,
 1 AS `lname`,
 1 AS `password`,
 1 AS `fname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `register_employee-visitor`
--

DROP TABLE IF EXISTS `register_employee-visitor`;
/*!50001 DROP VIEW IF EXISTS `register_employee-visitor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `register_employee-visitor` AS SELECT 
 1 AS `zipcode`,
 1 AS `address`,
 1 AS `phone`,
 1 AS `etype`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `password`,
 1 AS `city`,
 1 AS `state`,
 1 AS `email`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `register_user`
--

DROP TABLE IF EXISTS `register_user`;
/*!50001 DROP VIEW IF EXISTS `register_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `register_user` AS SELECT 
 1 AS `fname`,
 1 AS `lname`,
 1 AS `password`,
 1 AS `email`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `register_visitor`
--

DROP TABLE IF EXISTS `register_visitor`;
/*!50001 DROP VIEW IF EXISTS `register_visitor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `register_visitor` AS SELECT 
 1 AS `fname`,
 1 AS `password`,
 1 AS `lname`,
 1 AS `email`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `site` (
  `sitename` varchar(50) NOT NULL,
  `openeveryday` tinyint(1) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` tinytext NOT NULL,
  `state` tinytext NOT NULL,
  `zipcode` decimal(5,0) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  PRIMARY KEY (`sitename`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES ('Atlanta Beltline Center',0,'112 Krog Street Northeast','Atlanta','GA',30307,'000000008'),('Historic Fourth Ward Park',1,'680 Dallas Street Northeast','Atlanta','GA',30308,'000000009'),('Inman Park',1,'1055 DeKalb Ave','Atlanta','GA',30307,'000000005'),('Piedmont Park',1,'400 Park Drive Northeast','Atlanta','GA',30306,'000000007'),('Westview Cemetery',0,'1680 Westview Drive Southwest','Atlanta','GA',30310,'000000010');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `site_detail`
--

DROP TABLE IF EXISTS `site_detail`;
/*!50001 DROP VIEW IF EXISTS `site_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `site_detail` AS SELECT 
 1 AS `sitename`,
 1 AS `openeveryday`,
 1 AS `date`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `site_report`
--

DROP TABLE IF EXISTS `site_report`;
/*!50001 DROP VIEW IF EXISTS `site_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `site_report` AS SELECT 
 1 AS `sitename`,
 1 AS `date`,
 1 AS `visitorusername`,
 1 AS `Total_Revenue`,
 1 AS `Total_Visits`,
 1 AS `Staff_count`,
 1 AS `Event_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `staff_event_detail`
--

DROP TABLE IF EXISTS `staff_event_detail`;
/*!50001 DROP VIEW IF EXISTS `staff_event_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `staff_event_detail` AS SELECT 
 1 AS `eventname`,
 1 AS `sitename`,
 1 AS `enddate`,
 1 AS `eventstartdate`,
 1 AS `capacity`,
 1 AS `description`,
 1 AS `price`,
 1 AS `employeeID`,
 1 AS `Staff`,
 1 AS `eusername`,
 1 AS `Duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `take`
--

DROP TABLE IF EXISTS `take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `take` (
  `date` date NOT NULL,
  `transitroute` varchar(20) NOT NULL,
  `transittype` varchar(35) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`date`,`transittype`,`transitroute`,`username`),
  KEY `transitroute` (`transitroute`,`transittype`),
  KEY `username` (`username`),
  CONSTRAINT `take_ibfk_1` FOREIGN KEY (`transitroute`, `transittype`) REFERENCES `transit` (`route`, `type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `take_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take`
--

LOCK TABLES `take` WRITE;
/*!40000 ALTER TABLE `take` DISABLE KEYS */;
INSERT INTO `take` VALUES ('2019-03-20','152','Bus','manager2'),('2019-03-20','Blue','MARTA','manager2'),('2019-03-21','Blue','MARTA','manager2'),('2019-03-22','Blue','MARTA','manager2'),('2019-03-20','Relay','Bike','manager3'),('2019-03-20','Relay','Bike','maria.hernandez'),('2019-03-20','152','Bus','maria.hernandez'),('2019-03-22','152','Bus','maria.hernandez'),('2019-03-23','Relay','Bike','mary.smith'),('2019-03-21','Blue','MARTA','visitor1');
/*!40000 ALTER TABLE `take` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transit`
--

DROP TABLE IF EXISTS `transit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transit` (
  `route` varchar(20) NOT NULL,
  `type` varchar(35) NOT NULL,
  `price` decimal(3,2) NOT NULL,
  PRIMARY KEY (`route`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transit`
--

LOCK TABLES `transit` WRITE;
/*!40000 ALTER TABLE `transit` DISABLE KEYS */;
INSERT INTO `transit` VALUES ('152','Bus',2.00),('Blue','MARTA',2.00),('Relay','Bike',1.00);
/*!40000 ALTER TABLE `transit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `transit_detail`
--

DROP TABLE IF EXISTS `transit_detail`;
/*!50001 DROP VIEW IF EXISTS `transit_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `transit_detail` AS SELECT 
 1 AS `sitename`,
 1 AS `type`,
 1 AS `route`,
 1 AS `price`,
 1 AS `date`,
 1 AS `Connected Sites`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` enum('Approved','Pending','Declined') NOT NULL,
  `fname` tinytext NOT NULL,
  `lname` tinytext NOT NULL,
  `etype` enum('Employee','Visitor','User','employee,visitor','employee,user','user,visitor') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('david.smith','dsmith456','Approved','David','Smith','Employee'),('james.smith','jsmith123','Approved','James','Smith','Employee'),('manager1','manager1','Pending','Manager','One','Employee'),('manager2','manager2','Approved','Manager','Two','employee,visitor'),('manager3','manager3','Approved','Manager','Three','Employee'),('manager4','manager4','Approved','Manager','Four','employee,visitor'),('manager5','manager5','Approved','Manager','Five','employee,visitor'),('maria.garcia','mgarcia123','Approved','Maria','Garcia','employee,visitor'),('maria.hernandez','mhernandez','Approved','Maria','Hernandez','User'),('maria.rodriguez','mrodriguez','Declined','Maria','Rodriguez','Visitor'),('mary.smith','msmith789','Approved','Mary','Smith','Visitor'),('michael.smith','msmith456','Approved','Michael','Smith','employee,visitor'),('robert.smith','rsmith789','Approved','Robert ','Smith','Employee'),('staff1','staff1234','Approved','Staff','One','Employee'),('staff2','staff4567','Approved','Staff','Two','employee,visitor'),('staff3','staff7890','Approved','Staff','Three','employee,visitor'),('user1','user123456','Pending','User','One','User'),('visitor1','visitor123','Approved','Visitor','One','Visitor');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!50001 DROP VIEW IF EXISTS `user_login`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `user_login` AS SELECT 
 1 AS `email`,
 1 AS `password`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_take_transit`
--

DROP TABLE IF EXISTS `user_take_transit`;
/*!50001 DROP VIEW IF EXISTS `user_take_transit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `user_take_transit` AS SELECT 
 1 AS `route`,
 1 AS `type`,
 1 AS `price`,
 1 AS `date`,
 1 AS `Connected Sites`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_transit_history`
--

DROP TABLE IF EXISTS `user_transit_history`;
/*!50001 DROP VIEW IF EXISTS `user_transit_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `user_transit_history` AS SELECT 
 1 AS `route`,
 1 AS `type`,
 1 AS `price`,
 1 AS `date`,
 1 AS `sitename`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_schedule`
--

DROP TABLE IF EXISTS `view_schedule`;
/*!50001 DROP VIEW IF EXISTS `view_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_schedule` AS SELECT 
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `enddate`,
 1 AS `sitename`,
 1 AS `description`,
 1 AS `employeeID`,
 1 AS `Staff_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visit_event`
--

DROP TABLE IF EXISTS `visit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visit_event` (
  `eventname` varchar(50) NOT NULL,
  `eventstartdate` date NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `visitorusername` varchar(35) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`eventname`,`date`,`eventstartdate`,`sitename`,`visitorusername`),
  KEY `eventname` (`eventname`,`eventstartdate`,`sitename`),
  KEY `visitorusername` (`visitorusername`),
  CONSTRAINT `visit_event_ibfk_1` FOREIGN KEY (`eventname`, `eventstartdate`, `sitename`) REFERENCES `event` (`eventname`, `eventstartdate`, `sitename`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_event_ibfk_2` FOREIGN KEY (`visitorusername`) REFERENCES `visitor` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_event`
--

LOCK TABLES `visit_event` WRITE;
/*!40000 ALTER TABLE `visit_event` DISABLE KEYS */;
INSERT INTO `visit_event` VALUES ('Bus Tour','2019-02-01','Inman Park','manager2','2019-02-02'),('Bus Tour','2019-02-01','Inman Park','manager4','2019-02-01'),('Bus Tour','2019-02-01','Inman Park','manager5','2019-02-02'),('Bus Tour','2019-02-01','Inman Park','maria.garcia','2019-02-02'),('Arboretum Walking Tour','2019-02-08','Inman Park','mary.smith','2019-02-10'),('Bus Tour','2019-02-01','Inman Park','mary.smith','2019-02-01'),('Eastside Trail','2019-02-04','Piedmont Park','mary.smith','2019-02-04'),('Eastside Trail','2019-02-13','Historic Fourth Ward Park','mary.smith','2019-02-13'),('Eastside Trail','2019-02-13','Historic Fourth Ward Park','mary.smith','2019-02-14'),('Official Atlanta BeltLine Bike Tour','2019-02-09','Atlanta BeltLine Center','mary.smith','2019-02-10'),('Private Bus Tour','2019-02-01','Inman Park','mary.smith','2019-02-01'),('Private Bus Tour','2019-02-01','Inman Park','mary.smith','2019-02-02'),('Westside Trail','2019-02-18','Westview Cemetery','mary.smith','2019-02-19'),('Bus Tour','2019-02-01','Inman Park','staff2','2019-02-02'),('Eastside Trail','2019-02-13','Historic Fourth Ward Park','visitor1','2019-02-14'),('Official Atlanta BeltLine Bike Tour','2019-02-09','Atlanta BeltLine Center','visitor1','2019-02-10'),('Westside Trail','2019-02-18','Westview Cemetery','visitor1','2019-02-19');
/*!40000 ALTER TABLE `visit_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visit_history`
--

DROP TABLE IF EXISTS `visit_history`;
/*!50001 DROP VIEW IF EXISTS `visit_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `visit_history` AS SELECT 
 1 AS `sitename`,
 1 AS `date`,
 1 AS `eventname`,
 1 AS `eventstartdate`,
 1 AS `price`,
 1 AS `enddate`,
 1 AS `visitorusername`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visit_site`
--

DROP TABLE IF EXISTS `visit_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visit_site` (
  `date` date NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `visitorusername` varchar(35) NOT NULL,
  PRIMARY KEY (`visitorusername`,`date`,`sitename`),
  KEY `sitename` (`sitename`),
  CONSTRAINT `visit_site_ibfk_1` FOREIGN KEY (`visitorusername`) REFERENCES `visitor` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_site_ibfk_2` FOREIGN KEY (`sitename`) REFERENCES `site` (`sitename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_site`
--

LOCK TABLES `visit_site` WRITE;
/*!40000 ALTER TABLE `visit_site` DISABLE KEYS */;
INSERT INTO `visit_site` VALUES ('2019-02-01','Atlanta Beltline Center','mary.smith'),('2019-02-10','Atlanta Beltline Center','mary.smith'),('2019-02-09','Atlanta Beltline Center','visitor1'),('2019-02-13','Atlanta Beltline Center','visitor1'),('2019-02-02','Historic Fourth Ward Park','mary.smith'),('2019-02-11','Historic Fourth Ward Park','visitor1'),('2019-02-01','Inman Park','mary.smith'),('2019-02-02','Inman Park','mary.smith'),('2019-02-03','Inman Park','mary.smith'),('2019-02-01','Inman Park','visitor1'),('2019-02-02','Piedmont Park','mary.smith'),('2019-02-01','Piedmont Park','visitor1'),('2019-02-11','Piedmont Park','visitor1'),('2019-02-06','Westview Cemetery','visitor1');
/*!40000 ALTER TABLE `visit_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visitor` (
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES ('manager2'),('manager4'),('manager5'),('maria.garcia'),('maria.rodriguez'),('mary.smith'),('michael.smith'),('staff2'),('staff3'),('visitor1');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visitor_event_detail`
--

DROP TABLE IF EXISTS `visitor_event_detail`;
/*!50001 DROP VIEW IF EXISTS `visitor_event_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `visitor_event_detail` AS SELECT 
 1 AS `eventname`,
 1 AS `sitename`,
 1 AS `eventstartdate`,
 1 AS `enddate`,
 1 AS `price`,
 1 AS `description`,
 1 AS `capacity`,
 1 AS `visitorusername`,
 1 AS `date`,
 1 AS `Tickets Remaining`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'cs4400_t77'
--

--
-- Dumping routines for database 'cs4400_t77'
--

--
-- Final view structure for view `create_event`
--

/*!50001 DROP VIEW IF EXISTS `create_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `create_event` AS select `event`.`eventname` AS `eventname`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`enddate` AS `enddate`,`event`.`price` AS `price`,`event`.`description` AS `description`,`event`.`minStaffReq` AS `minstaffreq`,`event`.`capacity` AS `capacity`,`assign_to`.`employeeID` AS `employeeID`,`employee`.`eusername` AS `eusername`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Staff` from (((`event` join `assign_to` on(((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`) and (`event`.`sitename` = `assign_to`.`sitename`)))) join `employee` on((`assign_to`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `create_site`
--

/*!50001 DROP VIEW IF EXISTS `create_site`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `create_site` AS select concat(`user`.`fname`,' ',`user`.`lname`) AS `Manager`,`site`.`openeveryday` AS `openeveryday`,`site`.`zipcode` AS `zipcode`,`site`.`address` AS `address`,`site`.`sitename` AS `sitename`,`user`.`username` AS `username` from ((`site` join `employee` on((`site`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `create_transit`
--

/*!50001 DROP VIEW IF EXISTS `create_transit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `create_transit` AS select `transit`.`route` AS `route`,`transit`.`type` AS `type`,`transit`.`price` AS `price`,`connect`.`sitename` AS `sitename` from ((`transit` join `take` on(((`transit`.`route` = `take`.`transitroute`) and (`take`.`transittype` = `transit`.`type`)))) join `connect` on(((`take`.`transittype` = `connect`.`transittype`) and (`take`.`transitroute` = `connect`.`transitroute`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daily_detail`
--

/*!50001 DROP VIEW IF EXISTS `daily_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_detail` AS select distinct `event`.`eventname` AS `eventname`,`event`.`price` AS `price`,`assign_to`.`employeeID` AS `employeeID`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Staff`,`employee`.`eusername` AS `eusername`,`edit_event`.`Daily_Revenue` AS `Daily_Revenue`,`edit_event`.`Daily_Visits` AS `Daily_Visits` from ((((`event` join `assign_to` on(((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`) and (`assign_to`.`sitename` = `event`.`sitename`)))) join `edit_event` on(((`event`.`eventname` = `edit_event`.`eventname`) and (`event`.`eventstartdate` = `edit_event`.`eventstartdate`) and (`edit_event`.`enddate` = `event`.`enddate`) and (`event`.`description` = `edit_event`.`description`) and (`event`.`price` = `edit_event`.`price`) and (`edit_event`.`capacity` = `event`.`capacity`)))) join `employee` on((`assign_to`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `edit_event`
--

/*!50001 DROP VIEW IF EXISTS `edit_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `edit_event` AS select distinct `event`.`eventname` AS `eventname`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`enddate` AS `enddate`,`event`.`price` AS `price`,`event`.`capacity` AS `capacity`,`event`.`description` AS `description`,`event`.`minStaffReq` AS `minStaffReq`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Staff`,`employee`.`eusername` AS `eusername`,`visit_event`.`date` AS `date`,(select count(distinct `visit_event`.`visitorusername`) from `visit_event` where ((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`))) AS `Daily_Visits`,((select count(distinct `visit_event`.`visitorusername`) from `visit_event` where ((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`))) * (select `event`.`price` from `event` where ((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`)))) AS `Daily_Revenue` from ((((`visit_event` join `assign_to` on(((`visit_event`.`eventname` = `assign_to`.`eventname`) and (`visit_event`.`eventstartdate` = `assign_to`.`eventstartdate`) and (`visit_event`.`sitename` = `assign_to`.`sitename`)))) join `event` on(((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`)))) join `employee` on((`assign_to`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `edit_site`
--

/*!50001 DROP VIEW IF EXISTS `edit_site`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `edit_site` AS select `site`.`zipcode` AS `zipcode`,`site`.`address` AS `address`,`site`.`sitename` AS `sitename`,`site`.`openeveryday` AS `openeveryday`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Manager`,`user`.`username` AS `username` from ((`site` join `employee` on((`site`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `edit_transit`
--

/*!50001 DROP VIEW IF EXISTS `edit_transit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `edit_transit` AS select distinct `connect`.`sitename` AS `sitename`,`transit`.`price` AS `price`,`transit`.`route` AS `route`,`transit`.`type` AS `type` from ((`transit` join `take` on(((`transit`.`route` = `take`.`transitroute`) and (`take`.`transittype` = `transit`.`type`)))) join `connect` on(((`take`.`transittype` = `connect`.`transittype`) and (`take`.`transitroute` = `connect`.`transitroute`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `explore_event`
--

/*!50001 DROP VIEW IF EXISTS `explore_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `explore_event` AS select distinct `visit_event`.`eventname` AS `eventname`,`visit_event`.`eventstartdate` AS `eventstartdate`,`visit_event`.`sitename` AS `sitename`,`event`.`enddate` AS `enddate`,`event`.`description` AS `description`,`event`.`price` AS `price`,`event`.`capacity` AS `capacity`,(select count(`visit_event`.`visitorusername`) from `visit_event` where ((`visit_event`.`eventname` = `event`.`eventname`) and (`visit_event`.`eventstartdate` = `event`.`eventstartdate`))) AS `Total Visits`,(`event`.`capacity` - (select count(`visit_event`.`visitorusername`) from `visit_event` where ((`visit_event`.`eventname` = `event`.`eventname`) and (`visit_event`.`eventstartdate` = `event`.`eventstartdate`)))) AS `Tickets Remaining`,(select count(`visit_event`.`visitorusername`) from `visit_event` where ((`visit_event`.`eventname` = `event`.`eventname`) and (`visit_event`.`eventstartdate` = `event`.`eventstartdate`) and (`visit_event`.`visitorusername` = `visitor`.`username`))) AS `My Visits` from ((`event` join `visit_event` on(((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`sitename` = `visit_event`.`sitename`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`)))) join `visitor` on((`visitor`.`username` = `visit_event`.`visitorusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `explore_site`
--

/*!50001 DROP VIEW IF EXISTS `explore_site`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `explore_site` AS select distinct `visit_event`.`eventname` AS `eventname`,`visit_event`.`eventstartdate` AS `eventstartdate`,`visit_site`.`visitorusername` AS `visitorusername`,`visit_site`.`sitename` AS `sitename`,`site`.`openeveryday` AS `openeveryday`,`explore_event`.`Total Visits` AS `Total Visits`,`explore_event`.`My Visits` AS `My Visits`,`site_report`.`Event_count` AS `Event_count` from (((((`visit_event` join `visit_site` on(((`visit_event`.`sitename` = `visit_site`.`sitename`) and (`visit_event`.`date` = `visit_site`.`date`) and (`visit_event`.`visitorusername` = `visit_site`.`visitorusername`)))) join `site` on((`visit_site`.`sitename` = `site`.`sitename`))) join `site_report` on((`site_report`.`sitename` = `site`.`sitename`))) join `explore_event` on(((`visit_event`.`eventname` = `explore_event`.`eventname`) and (`visit_event`.`eventstartdate` = `explore_event`.`eventstartdate`) and (`visit_event`.`sitename` = `explore_event`.`sitename`)))) join `visitor` on((`visitor`.`username` = `visit_event`.`visitorusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_event`
--

/*!50001 DROP VIEW IF EXISTS `manage_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_event` AS select distinct `event`.`eventname` AS `eventname`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`enddate` AS `enddate`,`event`.`description` AS `description`,`event`.`price` AS `price`,`event`.`sitename` AS `sitename`,`assign_to`.`employeeID` AS `employeeID`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Staff`,`employee`.`eusername` AS `eusername`,(`event`.`enddate` - `event`.`eventstartdate`) AS `Duration`,((select `event`.`price` from `event` where ((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`))) * (select count(`visit_event`.`visitorusername`) from `visit_event` where (`visit_event`.`eventname` = `event`.`eventname`))) AS `Total_Revenue`,(select count(`visit_event`.`visitorusername`) from `visit_event` where (`visit_event`.`eventname` = `event`.`eventname`)) AS `Total_Visits`,(select count(distinct `assign_to`.`employeeID`) from `assign_to` where ((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`) and (`assign_to`.`sitename` = `event`.`sitename`))) AS `Staff_Count` from ((((`event` join `assign_to` on(((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`) and (`assign_to`.`sitename` = `event`.`sitename`)))) join `visit_event` on(((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`)))) join `employee` on((`assign_to`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_profile`
--

/*!50001 DROP VIEW IF EXISTS `manage_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_profile` AS select `user`.`fname` AS `fname`,`user`.`lname` AS `lname`,`user`.`username` AS `username`,`site`.`sitename` AS `sitename`,`employee`.`employeeID` AS `employeeID`,`employee`.`phone` AS `phone`,`employee`.`address` AS `address`,`email`.`email` AS `email` from (((`user` join `employee` on((`user`.`username` = `employee`.`eusername`))) join `site` on((`employee`.`employeeID` = `site`.`employeeID`))) join `email` on((`user`.`username` = `email`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_site`
--

/*!50001 DROP VIEW IF EXISTS `manage_site`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_site` AS select `site`.`sitename` AS `sitename`,`site`.`openeveryday` AS `openeveryday`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Manager`,`user`.`username` AS `username` from ((`site` join `employee` on((`site`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_staff`
--

/*!50001 DROP VIEW IF EXISTS `manage_staff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_staff` AS select distinct `assign_to`.`sitename` AS `sitename`,`assign_to`.`eventname` AS `eventname`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`enddate` AS `enddate`,`assign_to`.`employeeID` AS `employeeID`,`employee`.`eusername` AS `eusername`,`user`.`fname` AS `fname`,`user`.`lname` AS `lname`,(select count(distinct `assign_to`.`eventname`) from `assign_to` where ((`assign_to`.`employeeID` = `employee`.`employeeID`) and (`employee`.`eusername` = `user`.`username`))) AS `Event_shifts`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Staff` from (((`event` join `assign_to` on(((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`) and (`event`.`sitename` = `assign_to`.`sitename`)))) join `employee` on((`assign_to`.`employeeID` = `employee`.`employeeID`))) join `user` on((`user`.`username` = `employee`.`eusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_transit`
--

/*!50001 DROP VIEW IF EXISTS `manage_transit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_transit` AS select `transit`.`route` AS `route`,`transit`.`type` AS `type`,`transit`.`price` AS `price`,`take`.`username` AS `username`,`connect`.`sitename` AS `sitename` from (((`transit` join `take` on(((`transit`.`route` = `take`.`transitroute`) and (`take`.`transittype` = `transit`.`type`)))) join `connect` on(((`take`.`transittype` = `connect`.`transittype`) and (`take`.`transitroute` = `connect`.`transitroute`)))) join `user` on((`take`.`username` = `user`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_user`
--

/*!50001 DROP VIEW IF EXISTS `manage_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_user` AS select `user`.`username` AS `username`,`user`.`status` AS `status`,`user`.`etype` AS `etype`,`email`.`email` AS `email` from (`user` join `email` on((`user`.`username` = `email`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `register_employee`
--

/*!50001 DROP VIEW IF EXISTS `register_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `register_employee` AS select `employee`.`address` AS `address`,`employee`.`etype` AS `etype`,`employee`.`phone` AS `phone`,`employee`.`zipcode` AS `zipcode`,`email`.`email` AS `email`,`user`.`username` AS `username`,`employee`.`state` AS `state`,`employee`.`city` AS `city`,`user`.`lname` AS `lname`,`user`.`password` AS `password`,`user`.`fname` AS `fname` from ((`employee` join `user` on((`employee`.`eusername` = `user`.`username`))) join `email` on((`user`.`username` = `email`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `register_employee-visitor`
--

/*!50001 DROP VIEW IF EXISTS `register_employee-visitor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `register_employee-visitor` AS select `employee`.`zipcode` AS `zipcode`,`employee`.`address` AS `address`,`employee`.`phone` AS `phone`,`employee`.`etype` AS `etype`,`user`.`fname` AS `fname`,`user`.`lname` AS `lname`,`user`.`password` AS `password`,`employee`.`city` AS `city`,`employee`.`state` AS `state`,`email`.`email` AS `email`,`user`.`username` AS `username` from ((`employee` join `user` on((`employee`.`eusername` = `user`.`username`))) join `email` on((`user`.`username` = `email`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `register_user`
--

/*!50001 DROP VIEW IF EXISTS `register_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `register_user` AS select `user`.`fname` AS `fname`,`user`.`lname` AS `lname`,`user`.`password` AS `password`,`email`.`email` AS `email`,`user`.`username` AS `username` from (`user` join `email` on((`user`.`username` = `email`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `register_visitor`
--

/*!50001 DROP VIEW IF EXISTS `register_visitor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `register_visitor` AS select `user`.`fname` AS `fname`,`user`.`password` AS `password`,`user`.`lname` AS `lname`,`email`.`email` AS `email`,`user`.`username` AS `username` from (`user` join `email` on((`user`.`username` = `email`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `site_detail`
--

/*!50001 DROP VIEW IF EXISTS `site_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `site_detail` AS select `site`.`sitename` AS `sitename`,`site`.`openeveryday` AS `openeveryday`,`visit_site`.`date` AS `date`,`site`.`address` AS `address` from (`site` join `visit_site` on((`site`.`sitename` = `visit_site`.`sitename`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `site_report`
--

/*!50001 DROP VIEW IF EXISTS `site_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `site_report` AS select distinct `site`.`sitename` AS `sitename`,`visit_site`.`date` AS `date`,`visit_site`.`visitorusername` AS `visitorusername`,`manage_event`.`Total_Revenue` AS `Total_Revenue`,`manage_event`.`Total_Visits` AS `Total_Visits`,`manage_event`.`Staff_Count` AS `Staff_count`,(select count(`assign_to`.`eventname`) from `assign_to` where ((`assign_to`.`eventname` = `manage_event`.`eventname`) and (`assign_to`.`eventstartdate` = `manage_event`.`eventstartdate`))) AS `Event_count` from ((`visit_site` join `site` on((`visit_site`.`sitename` = `site`.`sitename`))) join `manage_event` on((`manage_event`.`sitename` = `site`.`sitename`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_event_detail`
--

/*!50001 DROP VIEW IF EXISTS `staff_event_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_event_detail` AS select `event`.`eventname` AS `eventname`,`event`.`sitename` AS `sitename`,`event`.`enddate` AS `enddate`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`capacity` AS `capacity`,`event`.`description` AS `description`,`event`.`price` AS `price`,`assign_to`.`employeeID` AS `employeeID`,concat(`user`.`fname`,' ',`user`.`lname`) AS `Staff`,`employee`.`eusername` AS `eusername`,(`event`.`enddate` - `event`.`eventstartdate`) AS `Duration` from (((`event` join `assign_to` on(((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`)))) join `employee` on((`assign_to`.`employeeID` = `employee`.`employeeID`))) join `user` on((`employee`.`eusername` = `user`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transit_detail`
--

/*!50001 DROP VIEW IF EXISTS `transit_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transit_detail` AS select distinct `connect`.`sitename` AS `sitename`,`transit`.`type` AS `type`,`transit`.`route` AS `route`,`transit`.`price` AS `price`,`take`.`date` AS `date`,(select count(distinct `connect`.`sitename`) from `connect`) AS `Connected Sites` from ((`transit` join `take` on(((`transit`.`route` = `take`.`transitroute`) and (`take`.`transittype` = `transit`.`type`)))) join `connect` on(((`take`.`transittype` = `connect`.`transittype`) and (`take`.`transitroute` = `connect`.`transitroute`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_login`
--

/*!50001 DROP VIEW IF EXISTS `user_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_login` AS select `email`.`email` AS `email`,`user`.`password` AS `password` from (`email` join `user` on((`email`.`username` = `user`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_take_transit`
--

/*!50001 DROP VIEW IF EXISTS `user_take_transit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_take_transit` AS select distinct `transit`.`route` AS `route`,`transit`.`type` AS `type`,`transit`.`price` AS `price`,`take`.`date` AS `date`,(select count(distinct `connect`.`sitename`) from `connect`) AS `Connected Sites` from ((`transit` join `take` on(((`transit`.`route` = `take`.`transitroute`) and (`transit`.`type` = `take`.`transittype`)))) join `connect` on(((`transit`.`route` = `connect`.`transitroute`) and (`transit`.`type` = `connect`.`transittype`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_transit_history`
--

/*!50001 DROP VIEW IF EXISTS `user_transit_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_transit_history` AS select `transit`.`route` AS `route`,`transit`.`type` AS `type`,`transit`.`price` AS `price`,`take`.`date` AS `date`,`connect`.`sitename` AS `sitename`,`user`.`username` AS `username` from (((`transit` join `take` on(((`transit`.`route` = `take`.`transitroute`) and (`take`.`transittype` = `transit`.`type`)))) join `connect` on(((`take`.`transittype` = `connect`.`transittype`) and (`take`.`transitroute` = `connect`.`transitroute`)))) join `user` on((`take`.`username` = `user`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_schedule`
--

/*!50001 DROP VIEW IF EXISTS `view_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_schedule` AS select distinct `event`.`eventname` AS `eventname`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`enddate` AS `enddate`,`event`.`sitename` AS `sitename`,`event`.`description` AS `description`,`assign_to`.`employeeID` AS `employeeID`,`manage_event`.`Staff_Count` AS `Staff_count` from ((`event` join `assign_to` on(((`event`.`eventname` = `assign_to`.`eventname`) and (`event`.`eventstartdate` = `assign_to`.`eventstartdate`)))) join `manage_event` on(((`event`.`eventname` = `manage_event`.`eventname`) and (`event`.`eventstartdate` = `manage_event`.`eventstartdate`) and (`manage_event`.`enddate` = `event`.`enddate`) and (`event`.`description` = `manage_event`.`description`) and (`event`.`price` = `manage_event`.`price`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visit_history`
--

/*!50001 DROP VIEW IF EXISTS `visit_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visit_history` AS select `visit_site`.`sitename` AS `sitename`,`visit_site`.`date` AS `date`,`visit_event`.`eventname` AS `eventname`,`visit_event`.`eventstartdate` AS `eventstartdate`,`event`.`price` AS `price`,`event`.`enddate` AS `enddate`,`visit_event`.`visitorusername` AS `visitorusername` from ((`visit_event` join `visit_site` on(((`visit_event`.`sitename` = `visit_site`.`sitename`) and (`visit_event`.`date` = `visit_site`.`date`) and (`visit_event`.`visitorusername` = `visit_site`.`visitorusername`)))) join `event` on(((`visit_event`.`sitename` = `event`.`sitename`) and (`visit_event`.`eventname` = `event`.`eventname`) and (`visit_event`.`eventstartdate` = `event`.`eventstartdate`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visitor_event_detail`
--

/*!50001 DROP VIEW IF EXISTS `visitor_event_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visitor_event_detail` AS select `event`.`eventname` AS `eventname`,`event`.`sitename` AS `sitename`,`event`.`eventstartdate` AS `eventstartdate`,`event`.`enddate` AS `enddate`,`event`.`price` AS `price`,`event`.`description` AS `description`,`event`.`capacity` AS `capacity`,`visit_event`.`visitorusername` AS `visitorusername`,`visit_event`.`date` AS `date`,(`event`.`capacity` - (select count(`visit_event`.`visitorusername`) from `visit_event` where ((`visit_event`.`eventname` = `event`.`eventname`) and (`visit_event`.`eventstartdate` = `event`.`eventstartdate`)))) AS `Tickets Remaining` from ((`event` join `visit_event` on(((`event`.`eventname` = `visit_event`.`eventname`) and (`event`.`eventstartdate` = `visit_event`.`eventstartdate`) and (`event`.`sitename` = `visit_event`.`sitename`)))) join `visitor` on((`visitor`.`username` = `visit_event`.`visitorusername`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-21 23:06:16
