CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: ece356
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `access_level`
--

DROP TABLE IF EXISTS `access_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_level` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `freeform_comments` varchar(45) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `prescription_code` int(11) DEFAULT NULL,
  `treatment_date` varchar(45) DEFAULT NULL,
  `diagnosis_code` int(11) NOT NULL,
  `treatment_code` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `procedure` varchar(45) NOT NULL DEFAULT 'none',
  `dosage_amt` int(11) NOT NULL DEFAULT '0',
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `prescription_code_fk_idx` (`prescription_code`),
  KEY `treatment_code_fk_idx` (`treatment_code`),
  KEY `diagnosis_code_fk_idx` (`diagnosis_code`),
  KEY `patient_id_fk_idx` (`patient_id`),
  CONSTRAINT `patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `diagnosis_code_fk` FOREIGN KEY (`diagnosis_code`) REFERENCES `diagnosis` (`diagnosis_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `prescription_code_fk` FOREIGN KEY (`prescription_code`) REFERENCES `prescription` (`prescription_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `treatment_code_fk` FOREIGN KEY (`treatment_code`) REFERENCES `treatment` (`treatment_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis` (
  `diagnosis_code` int(11) NOT NULL,
  `diagnosis_name` varchar(45) NOT NULL,
  PRIMARY KEY (`diagnosis_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL auto_increment,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor_appointment`
--

DROP TABLE IF EXISTS `doctor_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_appointment` (
  `doctor_code` int(11) NOT NULL,
  `appointment_code` int(11) NOT NULL,
  KEY `appointment_id_fk_idx` (`appointment_code`),
  KEY `doctor_code_fk_idx` (`doctor_code`),
  CONSTRAINT `appointment_id_fk` FOREIGN KEY (`appointment_code`) REFERENCES `appointment` (`appointment_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `doctor_code_fk` FOREIGN KEY (`doctor_code`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL auto_increment,
  `access_level` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `access_level_fk_idx` (`access_level`),
  CONSTRAINT `access_level_fk` FOREIGN KEY (`access_level`) REFERENCES `access_level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL auto_increment,
  `postal_code` varchar(45) NOT NULL,
  `allergies` varchar(45) NOT NULL DEFAULT 'none',
  `OHIP` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `emergency_phone` varchar(45) NOT NULL,
  `emergency_name` varchar(45) NOT NULL,
  `emergency_contact` varchar(45) NOT NULL,
  `patient_status_code` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `patient_status_fk_idx` (`patient_status_code`),
  CONSTRAINT `patient_status_fk` FOREIGN KEY (`patient_status_code`) REFERENCES `patient_status` (`status_code`) ON DELETE NO ACTION ON UPDATE CASCADE, 
  CONSTRAINT `patient_doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `doctor`(`doctor_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_status`
--

DROP TABLE IF EXISTS `patient_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_status` (
  `status_code` int(11) NOT NULL,
  `status_type` varchar(45) NOT NULL,
  PRIMARY KEY (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `prescription_code` int(11) NOT NULL,
  `prescription_name` varchar(45) NOT NULL,
  PRIMARY KEY (`prescription_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `extn` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff_permission`
--

DROP TABLE IF EXISTS `staff_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_permission` (
  `doctor_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `permission` varchar(45) NOT NULL,
  KEY `doctor_id_fk_idx` (`doctor_id`),
  KEY `staff_if_fk_idx` (`staff_id`),
  CONSTRAINT `doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `staff_if_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `treatment_code` int(11) NOT NULL,
  `treatment_name` varchar(45) NOT NULL,
  PRIMARY KEY (`treatment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-13 19:47:39
