-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jxgl
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cno` char(5) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('C01','鏁版嵁搴?),('C02','鏁板'),('C03','淇℃伅绯荤粺'),('C04','鎿嶄綔绯荤粺');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc`
--

DROP TABLE IF EXISTS `sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc` (
  `sno` char(9) NOT NULL,
  `cno` char(4) NOT NULL,
  `degree` decimal(4,1) DEFAULT NULL,
  KEY `s1` (`sno`),
  KEY `s2` (`cno`),
  CONSTRAINT `sc_chk_1` CHECK (((`degree` >= 1) and (`degree` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc`
--

LOCK TABLES `sc` WRITE;
/*!40000 ALTER TABLE `sc` DISABLE KEYS */;
INSERT INTO `sc` VALUES ('20180101','C01',97.0),('20180101','C03',93.0),('20180201','C03',85.0),('20180301','C01',94.0),('20180202','C01',92.0);
/*!40000 ALTER TABLE `sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Sno` char(10) NOT NULL,
  `Sname` varchar(8) DEFAULT NULL,
  `Ssex` char(1) DEFAULT NULL,
  `Sbirthday` date DEFAULT NULL,
  `sdept` char(20) DEFAULT NULL,
  `Speciality` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  CONSTRAINT `student_chk_1` CHECK (((`Ssex` = _utf8mb3'鐢?) or (`Ssex` = _utf8mb3'濂?)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('20180101','鏉庡媷','鐢?,'2000-01-12','CS','璁＄畻鏈哄簲鐢?),('20180201','鍒樻櫒','濂?,'2001-06-04','IS','鐢靛瓙鍟嗗姟'),('20180202','寮犵珛','鐢?,'2001-08-25','IS','鐢靛瓙鍟嗗姟'),('20180301','鐜嬫晱','濂?,'2002-12-23','MA','鏁板');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `Tno` char(3) NOT NULL,
  `Tname` varchar(8) DEFAULT NULL,
  `tsex` char(2) DEFAULT NULL,
  `Tbirthday` date DEFAULT NULL,
  `Tdept` char(16) DEFAULT NULL,
  PRIMARY KEY (`Tno`),
  CONSTRAINT `teacher_chk_1` CHECK (((`tsex` = _utf8mb3'鐢?) or (`tsex` = _utf8mb3'濂?)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('101','鏉庢柊','鐢?,'1977-01-12','CS'),('102','閽卞啗','鐢?,'1978-06-04','CS'),('201','鐜嬪皬鍗?,'濂?,'1979-12-23','IS'),('202','寮犲皬闈?,'鐢?,'1978-08-25','IS');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching` (
  `Cno` char(5) NOT NULL,
  `Tno` char(3) NOT NULL,
  `Cterm` tinyint(1) DEFAULT NULL,
  KEY `Cno` (`Cno`),
  KEY `Tno` (`Tno`),
  CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`Cno`) REFERENCES `course` (`cno`),
  CONSTRAINT `teaching_ibfk_2` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`),
  CONSTRAINT `teaching_chk_1` CHECK ((`Cterm` between 1 and 8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching`
--

LOCK TABLES `teaching` WRITE;
/*!40000 ALTER TABLE `teaching` DISABLE KEYS */;
INSERT INTO `teaching` VALUES ('C01','101',2),('C02','102',1),('C04','201',3),('C04','202',4);
/*!40000 ALTER TABLE `teaching` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08 15:15:18
