-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: registration
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `duration` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_student`
--

DROP TABLE IF EXISTS `new_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_student` (
  `rno` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `field` varchar(45) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `phn` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `perc` float NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_student`
--

LOCK TABLES `new_student` WRITE;
/*!40000 ALTER TABLE `new_student` DISABLE KEYS */;
INSERT INTO `new_student` VALUES (1,'Aditya Ashok Kachare','aadityakachare132@gmail.com','Thane','B.Tech','Information Technology Engineering','1234567890','2003-02-27',93,'123','approved'),(2,'Shubham','sahiljadhav@gmail.com','Thane','B.Tech','Computer Engineering','8177847299','2023-04-15',96,'123','approved'),(3,'Sahil','sahil@gmail.com','Wadala','BSc','Physics','5678906533','2003-02-27',84,'123','approved'),(4,'Pranay','pranay@gmail.com','Thane','B.Tech','Computer Engineering','1234567890','2016-02-12',85,'123','disapproved'),(5,'Aditya Ashok Kachare','aadityakachare132@gmail.com','Thane','MSc','Information Technology','9023019238','2016-02-13',90,'123','disapproved'),(6,'Aditya Ashok Kachare','aadityakachare132@gmail.com','aA','MSc','Information Technology','1234567890','2023-03-29',23,'123','disapproved'),(7,'Aditya Ashok Kachare1','aadityakachare132@gmail.com','thad','BSc','Information Technology','1233254343','2023-04-06',34,'123','disapproved'),(8,'Aditya Ashok Kachare','aadityakachare132@gmail.com','tht','B.Tech','Computer Engineering','8177847299','2023-03-31',54,'123','disapproved');
/*!40000 ALTER TABLE `new_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_teacher`
--

DROP TABLE IF EXISTS `new_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_teacher` (
  `eid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `phn` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `qual` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_teacher`
--

LOCK TABLES `new_teacher` WRITE;
/*!40000 ALTER TABLE `new_teacher` DISABLE KEYS */;
INSERT INTO `new_teacher` VALUES (1,'John','john@gmail.com','Thane','BSc','Physics','1234567890','2003-02-27','CTET','123','approved'),(2,'Mark','mark@gmail.com','Dombivali','MSc','Data Science','8901253678','2003-02-27','NET','456','disapproved'),(3,'Aditya Ashok Kachare','aadityakachare132@gmail.com','Thane','MSc','Information Technology','9090090910','2023-03-31','NET','123','disapproved'),(4,'Aditya Ashok Kachare','aadityakachare132@gmail.com','Thane','B.Tech','Computer Engineering','9090090910','2023-03-31','NET','123','disapproved'),(5,'Aditya Ashok Kachare','aadityakachare132@gmail.com','Thane','M.Tech','Computer Engineering','9090090910','2023-03-31','NET','123','disapproved'),(6,'Aditya Ashok Kachare','aadityakachare132@gmail.com','asf','M.Tech','Computer Engineering','7099234903','2023-04-04','NET','123','disapproved'),(7,'Aditya Ashok Kachare','aadityakachare132@gmail.com','jwf','B.Tech','Computer Engineering','8177847299','2023-04-18','NET','123','disapproved'),(8,'Aditya Ashok Kachare','aadityakachare132@gmail.com','jwf','M.Tech','Computer Engineering','8177847299','2023-04-18','NET','123','disapproved'),(9,'Aditya Ashok Kachare','aadityakachare132@gmail.com','jwf','B.Tech','Computer Engineering','8177847299','2023-04-18','NET','123','disapproved');
/*!40000 ALTER TABLE `new_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principal_noti`
--

DROP TABLE IF EXISTS `principal_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principal_noti` (
  `id` int NOT NULL,
  `noti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principal_noti`
--

LOCK TABLES `principal_noti` WRITE;
/*!40000 ALTER TABLE `principal_noti` DISABLE KEYS */;
INSERT INTO `principal_noti` VALUES (1,'abc');
/*!40000 ALTER TABLE `principal_noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principle`
--

DROP TABLE IF EXISTS `principle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principle` (
  `eid` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `phn` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principle`
--

LOCK TABLES `principle` WRITE;
/*!40000 ALTER TABLE `principle` DISABLE KEYS */;
INSERT INTO `principle` VALUES (1,'Tony','ironman@gmail.com','Mumbai','8901234657','2003-02-27','123');
/*!40000 ALTER TABLE `principle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_noti`
--

DROP TABLE IF EXISTS `student_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_noti` (
  `id` int NOT NULL,
  `noti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_noti`
--

LOCK TABLES `student_noti` WRITE;
/*!40000 ALTER TABLE `student_noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_noti`
--

DROP TABLE IF EXISTS `teacher_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_noti` (
  `id` int NOT NULL,
  `noti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_noti`
--

LOCK TABLES `teacher_noti` WRITE;
/*!40000 ALTER TABLE `teacher_noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_noti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 23:16:55
