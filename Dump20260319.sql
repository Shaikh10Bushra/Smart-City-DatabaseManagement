-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: smartcity_management
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Temporary view structure for view `active_emergencies`
--

DROP TABLE IF EXISTS `active_emergencies`;
/*!50001 DROP VIEW IF EXISTS `active_emergencies`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `active_emergencies` AS SELECT 
 1 AS `type`,
 1 AS `current_status`,
 1 AS `priority_level`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `citizen_reports`
--

DROP TABLE IF EXISTS `citizen_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizen_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(100) DEFAULT NULL,
  `status` enum('Pending','In Progress','Resolved') DEFAULT 'Pending',
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizen_reports`
--

LOCK TABLES `citizen_reports` WRITE;
/*!40000 ALTER TABLE `citizen_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `citizen_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_vehicles`
--

DROP TABLE IF EXISTS `emergency_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_vehicles` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  `priority_level` int DEFAULT '1',
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_vehicles`
--

LOCK TABLES `emergency_vehicles` WRITE;
/*!40000 ALTER TABLE `emergency_vehicles` DISABLE KEYS */;
INSERT INTO `emergency_vehicles` VALUES (1,'Ambulance','Active',10);
/*!40000 ALTER TABLE `emergency_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_logs`
--

DROP TABLE IF EXISTS `maintenance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `sensor_id` int DEFAULT NULL,
  `technician_name` varchar(50) DEFAULT NULL,
  `maintenance_date` date DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `maintenance_logs_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `traffic_sensors` (`sensor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_logs`
--

LOCK TABLES `maintenance_logs` WRITE;
/*!40000 ALTER TABLE `maintenance_logs` DISABLE KEYS */;
INSERT INTO `maintenance_logs` VALUES (1,1,'Engr. Shaikh','2026-03-19');
/*!40000 ALTER TABLE `maintenance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic_sensors`
--

DROP TABLE IF EXISTS `traffic_sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traffic_sensors` (
  `sensor_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(100) DEFAULT NULL,
  `traffic_density` enum('Low','Medium','High','Critical') DEFAULT NULL,
  `last_signal_change` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sensor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic_sensors`
--

LOCK TABLES `traffic_sensors` WRITE;
/*!40000 ALTER TABLE `traffic_sensors` DISABLE KEYS */;
INSERT INTO `traffic_sensors` VALUES (1,'Main Chowk','High','2026-03-19 09:44:03'),(2,'University Road','Low','2026-03-19 09:44:03');
/*!40000 ALTER TABLE `traffic_sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smartcity_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `UpdateReportStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateReportStatus`(IN r_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Citizen_Reports 
    SET status = new_status 
    WHERE report_id = r_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `active_emergencies`
--

/*!50001 DROP VIEW IF EXISTS `active_emergencies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_emergencies` AS select `emergency_vehicles`.`type` AS `type`,`emergency_vehicles`.`current_status` AS `current_status`,`emergency_vehicles`.`priority_level` AS `priority_level` from `emergency_vehicles` where (`emergency_vehicles`.`priority_level` > 5) */;
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

-- Dump completed on 2026-03-19 15:32:14
