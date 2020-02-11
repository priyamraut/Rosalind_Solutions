DROP DATABASE IF EXISTS `CS4400_T77`;
CREATE DATABASE IF NOT EXISTS `CS4400_T77`;
USE `CS4400_T77`;

# 4-19-2019 MHS
# For Team 77, CS4400 Database System project phase III
# Added views and dummy data for testing purposes

# THIS IS A WORKING DRAFT!


-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cs4400_t77
-- ------------------------------------------------------
-- Server version	8.0.12

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
INSERT INTO `take` VALUES ('2019-03-20','Relay','Bike','manager3'),('2019-03-20','Relay','Bike','maria.hernandez'),('2019-03-20','152','Bus','manager2'),('2019-03-20','152','Bus','maria.hernandez'),('2019-03-20','Blue','MARTA','manager2'),('2019-03-21','Blue','MARTA','manager2'),('2019-03-21','Blue','MARTA','visitor1'),('2019-03-22','152','Bus','maria.hernandez'),('2019-03-22','Blue','MARTA','manager2'),('2019-03-23','Relay','Bike','mary.smith');
/*!40000 ALTER TABLE `take` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


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
INSERT INTO `employee` VALUES ('000000001',4043721234,'123 East Main Street','Rochester','NY',14604,'Admin','james.smith'),('000000002',4043726789,'350 Ferst Drive','Atlanta','GA',30332,'Staff','michael.smith'),('000000003',1234567890,'123 East Main Street','Columbus','OH',43215,'Staff','robert.smith'),('000000004',7890123456,'123 East Main Street','Richland','PA',17987,'Manager','maria.garcia'),('000000005',5124776435,'350 Ferst Drive','Atlanta','GA',30332,'Manager','david.smith'),('000000006',8045126767,'123 East Main Street','Rochester','NY',14604,'Manager','manager1'),('000000007',9876543210,'123 East Main Street','Rochester','NY',14604,'Manager','manager2'),('000000008',5432167890,'350 Ferst Drive','Atlanta','GA',30332,'Manager','manager3'),('000000009',8053467565,'123 East Main Street','Columbus','OH',43215,'Manager','manager4'),('000000010',8031446782,'801 Atlantic Drive','Atlanta','GA',30332,'Manager','manager5'),('000000011',8024456765,'266 Ferst Drive Northwest','Atlanta','GA',30332,'Staff','staff1'),('000000012',8888888888,'266 Ferst Drive Northwest','Atlanta','GA',30332,'Staff','staff2'),('000000013',3333333333,'801 Atlantic Drive','Atlanta','GA',30332,'Staff','staff3');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

###  CREATE VIEWS  ###
### MHS 4-17-2019  ###

# Screen 1 -- User Login
DROP VIEW IF EXISTS `user_login`;
CREATE VIEW `user_login` AS
	SELECT
		`email`.`email`,
		`user`.`password`
	FROM
		`email` JOIN `user`
	USING ( username )
;

# Screen 3 -- Register User Only
DROP VIEW IF EXISTS `register_user`;
CREATE VIEW `register_user` AS
	SELECT
		`user`.`fname`,
		`user`.`lname`,
		`user`.`password`,
		`email`.`email`,
		`user`.`username`
	FROM
		`user` JOIN `email`
	USING ( username )
;

# Screen 4 -- Register Visitor Only
DROP VIEW IF EXISTS `register_visitor`;
CREATE VIEW `register_visitor` AS
	SELECT
		`user`.`fname`,
		`user`.`password`,
		`user`.`lname`,
		`email`.`email`,
		`user`.`username`
	FROM
		`user` JOIN `email`
	USING ( username )
;

# Screen 5 -- Register Employee Only
DROP VIEW IF EXISTS `register_employee`;
CREATE VIEW `register_employee` AS
	SELECT
		`employee`.`address`,
		`employee`.`etype`,
		`employee`.`phone`,
		`employee`.`zipcode`,
		`email`.`email`,
		`user`.`username`,
		`employee`.`state`,
		`employee`.`city`,
		`user`.`lname`,
		`user`.`password`,
		`user`.`fname`
	FROM
		`employee` JOIN `user` ON `employee`.`eusername` = `user`.`username`
        JOIN `email` ON `user`.`username` = `email`.`username`
;

# Screen 5 -- Register Employee-Visitor
DROP VIEW IF EXISTS `register_employee-visitor`;
CREATE VIEW `register_employee-visitor` AS
	SELECT
		`employee`.`zipcode`,
		`employee`.`address`,
		`employee`.`phone`,
		`employee`.`etype`,
		`user`.`fname`,
		`user`.`lname`,
		`user`.`password`,
		`employee`.`city`,
		`employee`.`state`,
		`email`.`email`,
		`user`.`username`
	FROM
		`employee` JOIN `user` ON `employee`.`eusername` = `user`.`username`
        JOIN `email` ON `user`.`username` = `email`.`username`
;

######################################
#   Screens 7-14 are just buttons
#   and will operate directly thru
#   the GUI.  No SQL code needed.
######################################

# Screen 15 -- User Take Transit
DROP VIEW IF EXISTS `user_take_transit`;
CREATE VIEW `user_take_transit` AS
	SELECT DISTINCT
		`transit`.`route`,
		`transit`.`type`,
		`transit`.`price`,
		`take`.`date`,
		( SELECT COUNT( DISTINCT(`sitename`) ) FROM `connect` ) AS `Connected Sites`
	FROM
		`transit` JOIN `take` ON `transit`.`route` = `take`.`transitroute` AND `transit`.`type` = `take`.`transittype`
		JOIN `connect` ON `transit`.`route` = `connect`.`transitroute` AND `transit`.`type` = `connect`.`transittype`
;

# Screen 16 -- User Transit History
DROP VIEW IF EXISTS `user_transit_history`;
CREATE VIEW `user_transit_history` AS
	SELECT
		`transit`.`route`,
        `transit`.`type`,
        `transit`.`price`,
        `take`.`date`,
        `connect`.`sitename`,
        `user`.`username`
	FROM
		`transit` JOIN `take` ON `transit`.`route` = `take`.`transitroute` AND `take`.`transittype` = `transit`.`type`
        JOIN `connect` ON `take`.`transittype` = `connect`.`transittype` AND `take`.`transitroute` = `connect`.`transitroute`
        JOIN `user` ON `take`.`username` = `user`.`username`
;

# Screen 17 -- Employee Manage Profile
DROP VIEW IF EXISTS `manage_profile`;
CREATE VIEW `manage_profile` AS
	SELECT
		`user`.`fname`,
		`user`.`lname`,
        `user`.`username`,
		`site`.`sitename`,
		`employee`.`employeeID`,
		`employee`.`phone`,
		`employee`.`address`,
        `email`.`email`
	FROM
		`user` JOIN `employee` ON `user`.`username` = `employee`.`eusername`
        JOIN `site` ON `employee`.`employeeID` = `site`.`employeeID`
        JOIN `email` ON `user`.`username` = `email`.`username`
;

# Screen 18 -- Manage User
DROP VIEW IF EXISTS `manage_user`;
CREATE VIEW `manage_user` AS
	SELECT
		`user`.`username`,
		`user`.`status`,
		`user`.`etype`,
        `email`.`email`		 # SELECT COUNT( DISTINCT(`email`) ) FROM manage_user WHERE manage_user.username = 'james.smith' ;
	FROM
		`user` #JOIN `employee` ON `user`.`username` = `employee`.`eusername`
        JOIN `email` ON `user`.`username` = `email`.`username`
;

# Screen 19 -- Administrator Manage Site
DROP VIEW IF EXISTS `manage_site`;
CREATE VIEW `manage_site` AS
	SELECT
		`site`.`sitename`,
		`site`.`openeveryday`,
		CONCAT(`user`.`fname`,' ',`user`.`lname`) as Manager,
        `user`.`username`
	FROM
		`site` JOIN `employee` ON `site`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 20 -- Administrator Edit Site
DROP VIEW IF EXISTS `edit_site`;
CREATE VIEW `edit_site` AS
	SELECT
		`site`.`zipcode`,
		`site`.`address`,
		`site`.`sitename`,
        `site`.`openeveryday`,
		CONCAT(`user`.`fname`,' ',`user`.`lname`) as Manager,
        `user`.`username`
	FROM
		`site` JOIN `employee` ON `site`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 21 -- Administrator Create Site
DROP VIEW IF EXISTS `create_site`;
CREATE VIEW `create_site` AS
	SELECT
		CONCAT(`user`.`fname`,' ',`user`.`lname`) as Manager,
        `site`.`openeveryday`,
		`site`.`zipcode`,
		`site`.`address`,
		`site`.`sitename`,
        `user`.`username`
	FROM
		`site` JOIN `employee` ON `site`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 22 -- Administrator Manage Transit
DROP VIEW IF EXISTS `manage_transit`;
CREATE VIEW `manage_transit` AS
	SELECT
		`transit`.`route`,
		`transit`.`type`,
		`transit`.`price`,
        `take`.`username`,		# SELECT COUNT( `route` ) FROM manage_transit WHERE manage_transit.route = '152' AND `username` = 'maria.hernandez';
		`connect`.`sitename`		# SELECT COUNT( DISTINCT(`sitename`) ) FROM manage_transit WHERE manage_transit.route = 'blue' ;
	FROM
		`transit` JOIN `take` ON `transit`.`route` = `take`.`transitroute` AND `take`.`transittype` = `transit`.`type`
        JOIN `connect` ON `take`.`transittype` = `connect`.`transittype` AND `take`.`transitroute` = `connect`.`transitroute`
        JOIN `user` ON `take`.`username` = `user`.`username`
;

# Screen 23 -- Administrator Edit Transit
DROP VIEW IF EXISTS `edit_transit`;
CREATE VIEW `edit_transit` AS
	SELECT DISTINCT
		`connect`.`sitename`,  # SELECT DISTINCT( `sitename` ) FROM `edit_transit` WHERE `route` = 'blue';
		`transit`.`price`,
		`transit`.`route`,
		`transit`.`type`
	FROM
		`transit` JOIN `take` ON `transit`.`route` = `take`.`transitroute` AND `take`.`transittype` = `transit`.`type`
        JOIN `connect` ON `take`.`transittype` = `connect`.`transittype` AND `take`.`transitroute` = `connect`.`transitroute`
;

# Screen 24 -- Administrator Create Transit
DROP VIEW IF EXISTS `create_transit`;
CREATE VIEW `create_transit` AS
	SELECT
		`transit`.`route`,
		`transit`.`type`,
		`transit`.`price`,
		`connect`.`sitename`		# SELECT DISTINCT( `sitename` ) FROM `edit_transit` WHERE `route` = 'blue';
	FROM
		`transit` JOIN `take` ON `transit`.`route` = `take`.`transitroute` AND `take`.`transittype` = `transit`.`type`
        JOIN `connect` ON `take`.`transittype` = `connect`.`transittype` AND `take`.`transitroute` = `connect`.`transitroute`
;

# Screen 25 -- Manager Manage Event 
DROP VIEW IF EXISTS `manage_event`;
CREATE VIEW `manage_event` AS
	SELECT DISTINCT
		`event`.`eventname`,
		`event`.`eventstartdate`,
        `event`.`enddate`,
        `event`.`description`,
        `event`.`price`,
         `event`.`sitename`,
        `assign_to`.`employeeID`,
        CONCAT(`user`.`fname`,' ',`user`.`lname`) as Staff,
        `employee`.`eusername`,
        `event`.`enddate` - `event`.`eventstartdate` AS `Duration`,
		( (SELECT `price` FROM `event` WHERE `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` AND `event`.`sitename` = `visit_event`.`sitename`) 
        * ( SELECT COUNT(`visitorusername`) FROM `visit_event` WHERE `visit_event`.`eventname` = `event`.`eventname` ) ) AS `Total_Revenue`,
        ( SELECT COUNT(`visitorusername`) FROM `visit_event` WHERE `visit_event`.`eventname` = `event`.`eventname` ) AS `Total_Visits`,
        
        ( SELECT COUNT( DISTINCT(`employeeID`) ) FROM `assign_to` WHERE `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate` AND `assign_to`.`sitename` = `event`.`sitename` ) AS `Staff_Count`
	FROM
		`event` JOIN `assign_to` ON `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate` AND `assign_to`.`sitename` = `event`.`sitename`
        JOIN `visit_event` ON `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` AND `event`.`sitename` = `visit_event`.`sitename`
		JOIN `employee` ON `assign_to`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 26 -- Manager View/Edit Event
DROP VIEW IF EXISTS `edit_event`;
CREATE VIEW `edit_event` AS
	SELECT DISTINCT
		`event`.`eventname`,
        `event`.`eventstartdate`,
        `event`.`enddate`,
        `event`.`price`,
		`event`.`capacity`,
        `event`.`description`,
        `event`.`minStaffReq`,
        CONCAT(`user`.`fname`,' ',`user`.`lname`) as Staff,
        `employee`.`eusername`,
        `visit_event`.`date`,
        ( SELECT COUNT( DISTINCT(`visitorusername`) ) FROM `visit_event` WHERE `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` AND `event`.`sitename` = `visit_event`.`sitename` ) AS `Daily_Visits`,
        ( ( SELECT COUNT( DISTINCT(`visitorusername`) ) FROM `visit_event` WHERE `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` AND `event`.`sitename` = `visit_event`.`sitename` )
        * ( SELECT `price` FROM `event` WHERE `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` AND `event`.`sitename` = `visit_event`.`sitename` ) ) AS `Daily_Revenue`
	FROM
		`visit_event` JOIN `assign_to` ON `visit_event`.`eventname` = `assign_to`.`eventname` AND `visit_event`.`eventstartdate` = `assign_to`.`eventstartdate` 
			AND `visit_event`.`sitename` = `assign_to`.`sitename`
        JOIN `event` ON `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` 
			AND `event`.`sitename` = `visit_event`.`sitename`
        JOIN `employee` ON `assign_to`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 27 -- Manager Create Event
DROP VIEW IF EXISTS `create_event`;
CREATE VIEW `create_event` AS
	SELECT
		`event`.`eventname`,
		`event`.`eventstartdate`,
        `event`.`enddate`,
		`event`.`price`,
		`event`.`description`,
        `event`.`minstaffreq`,
        `event`.`capacity`,
		`assign_to`.`employeeID`,
        `employee`.`eusername`,
        CONCAT(`user`.`fname`,' ',`user`.`lname`) as Staff
	FROM
		`event` JOIN `assign_to` ON `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate` AND `event`.`sitename` = `assign_to`.`sitename`
        JOIN `employee` ON `assign_to`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 28 -- Manager Manage Staff
DROP VIEW IF EXISTS `manage_staff`;
CREATE VIEW `manage_staff` AS
	SELECT DISTINCT
		`assign_to`.`sitename`,
        `assign_to`.`eventname`,
		`event`.`eventstartdate`,
        `event`.`enddate`,
		`assign_to`.`employeeID`,
        `employee`.`eusername`,
        #`visit_event`.`date`,
        `user`.`fname`,
        `user`.`lname`,
		( SELECT COUNT( DISTINCT(`eventname`) ) FROM `assign_to` WHERE `assign_to`.`employeeID` = `employee`.`employeeID` AND `employee`.`eusername` = `user`.`username`) AS `Event_shifts`,
        CONCAT(`user`.`fname`,' ',`user`.`lname`) as `Staff`
	FROM
		`event` JOIN `assign_to` ON `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate` AND `event`.`sitename` = `assign_to`.`sitename`
        #JOIN `visit_event` ON `event`.`eventname` = `visit_event`.`eventname` AND `event`.`eventstartdate` = `visit_event`.`eventstartdate`
        JOIN `employee` ON `assign_to`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 29 -- Manager Site Report			
DROP VIEW IF EXISTS `site_report`;
CREATE VIEW `site_report` AS
	SELECT DISTINCT
		`site`.`sitename`,
        `visit_site`.`date`,
		`visit_site`.`visitorusername`,
		`manage_event`.`Total_Revenue`,
        `manage_event`.`Total_Visits`,
        `manage_event`.`Staff_count`,
        ( SELECT COUNT( `eventname` ) FROM `assign_to` WHERE `assign_to`.`eventname` = `manage_event`.`eventname` AND `assign_to`.`eventstartdate` = `manage_event`.`eventstartdate` ) as `Event_count`
	FROM
		`visit_site` JOIN `site` ON `visit_site`.`sitename` = `site`.`sitename`
        JOIN `manage_event` ON `manage_event`.`sitename` = `site`.`sitename`
;

# Screen 30 -- Manager Daily Detail			
DROP VIEW IF EXISTS `daily_detail`;
CREATE VIEW `daily_detail` AS
	SELECT DISTINCT
        `event`.`eventname`,
        `event`.`price`,
        `assign_to`.`employeeID`,
        CONCAT(`user`.`fname`,' ',`user`.`lname`) as `Staff`,
        `employee`.`eusername`,
        `edit_event`.`Daily_Revenue`,
        `edit_event`.`Daily_Visits`
	FROM
		`event` JOIN `assign_to` ON `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate` AND `assign_to`.`sitename` = `event`.`sitename`
        JOIN `edit_event` ON `event`.`eventname` = `edit_event`.`eventname` AND `event`.`eventstartdate` = `edit_event`.`eventstartdate` AND `edit_event`.`enddate` = `event`.`enddate` 
				AND `event`.`description` = `edit_event`.`description` AND `event`.`price` = `edit_event`.`price` AND `edit_event`.`capacity` = `event`.`capacity` 
		JOIN `employee` ON `assign_to`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `user`.`username` = `employee`.`eusername`
;

# Screen 31 -- Staff View Schedule
DROP VIEW IF EXISTS `view_schedule`;
CREATE VIEW `view_schedule` AS
	SELECT DISTINCT
		`event`.`eventname`,
        `event`.`eventstartdate`,
        `event`.`enddate`,
		`event`.`sitename`,
        `event`.`description`,
        `assign_to`.`employeeID`,
        `manage_event`.`Staff_count`	
	FROM
		`event` JOIN `assign_to` ON `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate`
        JOIN `manage_event` ON `event`.`eventname` = `manage_event`.`eventname` AND `event`.`eventstartdate` = `manage_event`.`eventstartdate` AND `manage_event`.`enddate` = `event`.`enddate` 
				AND `event`.`description` = `manage_event`.`description` AND `event`.`price` = `manage_event`.`price`
;

# Screen 32 -- Staff Event Detail
DROP VIEW IF EXISTS `staff_event_detail`;
CREATE VIEW `staff_event_detail` AS
	SELECT
		`event`.`eventname`,
        `event`.`sitename`,
        `event`.`enddate`,
		`event`.`eventstartdate`,
        `event`.`capacity`,
        `event`.`description`,
		`event`.`price`,
        `assign_to`.`employeeID`,
        CONCAT(`user`.`fname`,' ',`user`.`lname`) as `Staff`,
        `employee`.`eusername`,
		( `event`.`enddate` - `event`.`eventstartdate` ) AS `Duration`       
    FROM
		`event` JOIN `assign_to` ON `event`.`eventname` = `assign_to`.`eventname` AND `event`.`eventstartdate` = `assign_to`.`eventstartdate`
        JOIN `employee` ON `assign_to`.`employeeID` = `employee`.`employeeID`
        JOIN `user` ON `employee`.`eusername` = `user`.`username`
;

# Screen 33 -- Visitor Explore Event			
DROP VIEW IF EXISTS `explore_event`;
CREATE VIEW `explore_event` AS
	SELECT DISTINCT
		`visit_event`.`eventname`,
		`visit_event`.`eventstartdate`,
		`visit_event`.`sitename`,
		`event`.`enddate`,
        `event`.`description`,
        `event`.`price`,
        `event`.`capacity`,
        ( SELECT COUNT(`visitorusername`) FROM `visit_event` WHERE `visit_event`.`eventname` = `event`.`eventname` AND `visit_event`.`eventstartdate` = `event`.`eventstartdate` ) AS `Total Visits`,
        ( `event`.`capacity` - ( SELECT COUNT(`visitorusername`) FROM `visit_event` WHERE `visit_event`.`eventname` = `event`.`eventname` AND `visit_event`.`eventstartdate` = `event`.`eventstartdate` ) ) AS `Tickets Remaining`,
        ( SELECT COUNT(`visitorusername`) FROM `visit_event` WHERE `visit_event`.`eventname` = `event`.`eventname` AND `visit_event`.`eventstartdate` = `event`.`eventstartdate` AND `visit_event`.`visitorusername` = `visitor`.`username` ) as `My Visits`
         # Sold Out == if ( Ticket_remaining = 0 ) 
	FROM
		`event` JOIN `visit_event` ON `event`.`eventname` = `visit_event`.`eventname` AND `event`.`sitename` = `visit_event`.`sitename`
			AND `event`.`eventstartdate` = `visit_event`.`eventstartdate`
		JOIN `visitor` ON `visitor`.`username` = `visit_event`.`visitorusername`
;

# Screen 34 -- Visitor Event Detail
DROP VIEW IF EXISTS `visitor_event_detail`;
CREATE VIEW `visitor_event_detail` AS
	SELECT
		`event`.`eventname`,
        `event`.`sitename`,
		`event`.`eventstartdate`,
		`event`.`enddate`,
		`event`.`price`,
        `event`.`description`,
        `event`.`capacity`,
        `visit_event`.`visitorusername`,
         `visit_event`.`date`,
		( `event`.`capacity` - ( SELECT COUNT(`visitorusername`) FROM `visit_event` WHERE `visit_event`.`eventname` = `event`.`eventname` AND `visit_event`.`eventstartdate` = `event`.`eventstartdate` ) ) AS `Tickets Remaining`

	FROM
		`event` JOIN `visit_event` ON `event`.`eventname` = `visit_event`.`eventname` 
			AND `event`.`eventstartdate` = `visit_event`.`eventstartdate` AND `event`.`sitename` = `visit_event`.`sitename`
		JOIN `visitor` ON `visitor`.`username` = `visit_event`.`visitorusername`
;

# Screen 35 -- Visitor Explore Site		
DROP VIEW IF EXISTS `explore_site`;
CREATE VIEW `explore_site` AS
	SELECT DISTINCT
		`visit_event`.`eventname`,
        `visit_event`.`eventstartdate`,
        `visit_site`.`visitorusername`,
        `visit_site`.`sitename`,
		`site`.`openeveryday`,
		`explore_event`.`Total Visits`,
        `explore_event`.`My Visits`,
		`site_report`.`Event_count`
	FROM
		`visit_event` JOIN `visit_site` ON `visit_event`.`sitename` = `visit_site`.`sitename` AND `visit_event`.`date` = `visit_site`.`date` AND `visit_event`.`visitorusername` = `visit_site`.`visitorusername`
		JOIN `site` ON `visit_site`.`sitename` = `site`.`sitename`
        JOIN `site_report` ON `site_report`.`sitename` = `site`.`sitename`
        JOIN `explore_event` ON `visit_event`.`eventname` = `explore_event`.`eventname` and `visit_event`.`eventstartdate` = `explore_event`.`eventstartdate` AND `visit_event`.`sitename` = `explore_event`.`sitename`
        JOIN `visitor` ON `visitor`.`username` = `visit_event`.`visitorusername`
;

# Screen 36 -- Visitor Transit Detail
DROP VIEW IF EXISTS `transit_detail`;
CREATE VIEW `transit_detail` AS
	SELECT DISTINCT
		`connect`.`sitename`,
        `transit`.`type`,
		`transit`.`route`,
        `transit`.`price`,
        `take`.`date`,
        ( SELECT COUNT( DISTINCT(`sitename`) ) FROM `connect` ) AS `Connected Sites`
	FROM
		`transit` JOIN `take` ON `transit`.`route` = `take`.`transitroute` AND `take`.`transittype` = `transit`.`type`
        JOIN `connect` ON `take`.`transittype` = `connect`.`transittype` AND `take`.`transitroute` = `connect`.`transitroute`
;

# Screen 38 -- Visitor Transit Detail
DROP VIEW IF EXISTS `site_detail`;
CREATE VIEW `site_detail` AS
	SELECT
		`site`.`sitename`,
        `site`.`openeveryday`,
		`visit_site`.`date`,			
		`site`.`address`
	FROM
		`site` JOIN `visit_site` ON `site`.`sitename` = `visit_site`.`sitename`
;

# Screen 37 -- Visitor Visit History
DROP VIEW IF EXISTS `visit_history`;
CREATE VIEW `visit_history` AS
	SELECT
		`visit_site`.`sitename`,
		`visit_site`.`date`,
        `visit_event`.`eventname`,
        `visit_event`.`eventstartdate`,
        `event`.`price`,
        `event`.`enddate`,
        `visit_event`.`visitorusername`
	FROM
        `visit_event` JOIN `visit_site` ON `visit_event`.`sitename` = `visit_site`.`sitename` AND `visit_event`.`date` = `visit_site`.`date` AND `visit_event`.`visitorusername` = `visit_site`.`visitorusername`
		JOIN `event` ON `visit_event`.`sitename` = `event`.`sitename` AND `visit_event`.`eventname` = `event`.`eventname` AND `visit_event`.`eventstartdate` = `event`.`eventstartdate`
;


