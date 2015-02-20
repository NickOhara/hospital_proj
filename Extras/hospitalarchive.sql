-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
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
-- Dumping data for table `access_level`
--

LOCK TABLES `access_level` WRITE;
/*!40000 ALTER TABLE `access_level` DISABLE KEYS */;
INSERT INTO `access_level` VALUES (0,'admin'),(1,'finance'),(2,'doctor'),(3,'staff'),(4,'patient');
/*!40000 ALTER TABLE `access_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `freeform_comments` varchar(45) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `prescription_code` int(11) DEFAULT NULL,
  `treatment_date` varchar(45) DEFAULT NULL,
  `diagnosis_code` int(11) NOT NULL,
  `treatment_code` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `end_date` datetime NOT NULL,
  `length` int(11) NOT NULL DEFAULT '0',
  `procedure` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `prescription_code_fk_idx` (`prescription_code`),
  KEY `treatment_code_fk_idx` (`treatment_code`),
  KEY `diagnosis_code_fk_idx` (`diagnosis_code`),
  KEY `patient_id_fk_idx` (`patient_id`),
  CONSTRAINT `diagnosis_code_fk` FOREIGN KEY (`diagnosis_code`) REFERENCES `diagnosis` (`diagnosis_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `prescription_code_fk` FOREIGN KEY (`prescription_code`) REFERENCES `prescription` (`prescription_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `treatment_code_fk` FOREIGN KEY (`treatment_code`) REFERENCES `treatment` (`treatment_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'update','2014-03-30 17:15:42',47,'18/03/2015 00:46',26,0,9,'0000-00-00 00:00:00',0,NULL),(2,'high sugar','2014-03-30 17:15:42',25,'28/12/2014 20:44',3,1,2,'0000-00-00 00:00:00',0,NULL),(3,'high BP','2014-03-30 17:15:42',31,'31/12/2014 19:08',55,6,4,'0000-00-00 00:00:00',0,NULL),(4,'high BP','2014-03-30 17:15:42',45,'25/04/2014 15:04',66,6,8,'0000-00-00 00:00:00',0,NULL),(5,'deathly ill','2014-03-30 17:15:42',18,'11/06/2014 13:28',28,0,2,'0000-00-00 00:00:00',0,NULL),(6,'deathly ill','2014-03-30 17:15:42',25,'21/11/2015 17:23',2,4,3,'0000-00-00 00:00:00',0,NULL),(7,'high sugar','2014-03-30 17:15:42',21,'21/06/2014 03:01',11,4,6,'0000-00-00 00:00:00',0,NULL),(8,'high cholesterol','2014-03-30 17:15:42',14,'28/06/2014 02:50',26,1,1,'0000-00-00 00:00:00',0,NULL),(9,'exercise','2014-03-30 17:15:42',21,'10/06/2014 14:07',78,6,8,'0000-00-00 00:00:00',0,NULL),(10,'overweight','2014-03-30 17:15:42',30,'16/03/2015 06:05',4,0,5,'0000-00-00 00:00:00',0,NULL),(11,'exercise','2014-03-30 17:15:42',50,'17/06/2014 14:55',36,6,2,'0000-00-00 00:00:00',0,NULL),(12,'all good','2014-03-30 17:15:42',46,'14/09/2014 07:19',10,1,10,'0000-00-00 00:00:00',0,NULL),(13,'overweight','2014-03-30 17:15:42',14,'21/09/2016 20:16',64,5,8,'0000-00-00 00:00:00',0,NULL),(14,'overweight','2014-03-30 17:15:42',47,'24/11/2014 23:37',61,1,9,'0000-00-00 00:00:00',0,NULL),(15,'overweight','2014-03-30 17:15:42',19,'11/04/2014 21:07',97,0,10,'0000-00-00 00:00:00',0,NULL),(16,'high cholesterol','2014-03-30 17:15:42',1,'16/11/2014 19:24',4,1,7,'0000-00-00 00:00:00',0,NULL),(17,'overweight','2014-03-30 17:15:42',35,'13/01/2015 12:43',63,0,8,'0000-00-00 00:00:00',0,NULL),(18,'exercise','2014-03-30 17:15:42',36,'01/12/2014 05:33',22,6,8,'0000-00-00 00:00:00',0,NULL),(19,'exercise','2014-03-30 17:15:42',34,'09/06/2014 00:14',56,2,7,'0000-00-00 00:00:00',0,NULL),(20,'overweight','2014-03-30 17:15:42',23,'16/02/2015 10:25',74,3,1,'0000-00-00 00:00:00',0,NULL),(21,'ads','2010-01-01 01:01:00',1,NULL,0,0,17,'2010-01-01 01:16:00',15,'None Given'),(22,'','2010-01-01 01:01:00',8,NULL,16,2,17,'2010-01-01 01:16:00',15,'None Given'),(23,'','2010-01-01 02:01:00',1,NULL,0,0,17,'2010-01-01 02:16:00',15,'None Given'),(24,'','2010-01-01 09:01:00',1,NULL,0,0,17,'2010-01-01 09:16:00',15,'None Given');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger appointmentlog before update on appointment
for each row
insert into appointment_archive(version,appointment_id,freeform_comments,date,prescription_code,treatment_date,diagnosis_code,treatment_code,patient_id,end_date,length,`procedure`,last_updated)
select NULL, NEW.appointment_id,appointment.freeform_comments,appointment.date,appointment.prescription_code,appointment.treatment_date,appointment.diagnosis_code,appointment.treatment_code,appointment.patient_id,appointment.end_date,appointment.length,appointment.`procedure`,NULL
from appointment where appointment_id = NEW.appointment_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger appointmentlog_ondelete before delete on appointment
for each row
insert into appointment_archive(version,appointment_id,freeform_comments,date,prescription_code,treatment_date,diagnosis_code,treatment_code,patient_id,end_date,length,`procedure`,last_updated)
select NULL,OLD.appointment_id,appointment.freeform_comments,appointment.date,appointment.prescription_code,appointment.treatment_date,appointment.diagnosis_code,appointment.treatment_code,appointment.patient_id,appointment.end_date,appointment.length,appointment.`procedure`,NULL
from appointment where appointment_id = OLD.appointment_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `appointment_archive`
--

DROP TABLE IF EXISTS `appointment_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_archive` (
  `version` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL,
  `freeform_comments` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `prescription_code` int(11) DEFAULT NULL,
  `treatment_date` varchar(45) DEFAULT NULL,
  `diagnosis_code` int(11) DEFAULT NULL,
  `treatment_code` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `procedure` varchar(45) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_archive`
--

LOCK TABLES `appointment_archive` WRITE;
/*!40000 ALTER TABLE `appointment_archive` DISABLE KEYS */;
INSERT INTO `appointment_archive` VALUES (1,1,'high sugar','2014-03-30 17:15:42',47,'18/03/2015 00:46',26,0,9,'0000-00-00 00:00:00',0,NULL,'2014-03-31 15:12:26');
/*!40000 ALTER TABLE `appointment_archive` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (0,'Unknown\r'),(1,'New Disease\r'),(2,'allergies\r'),(3,'Alzheimer\'s disease\r'),(4,'anxiety disorders\r'),(5,'arthritis\r'),(6,'asthma\r'),(7,'astigmatism\r'),(8,'autoimmune diseases\r'),(9,'benign prostate hyperplasia (BPH)\r'),(10,'bipolar disorder (manic-depressive)\r'),(11,'brain cancer\r'),(12,'breast cancer\r'),(13,'cancer\r'),(14,'candidiasis\r'),(15,'cataracts\r'),(16,'celiac disease\r'),(17,'cervical cancer\r'),(18,'chicken pox\r'),(19,'chlamydia\r'),(20,'chronic fatigue syndrome (CFS)\r'),(21,'chronic illness\r'),(22,'cold sores\r'),(23,'colon cancer\r'),(24,'common cold\r'),(25,'constipation\r'),(26,'COPD\r'),(27,'cough\r'),(28,'Crohn\'s disease\r'),(29,'cystic fibrosis\r'),(30,'dementia\r'),(31,'depression\r'),(32,'diabetes\r'),(33,'diarrhea\r'),(34,'eczema\r'),(35,'endometriosis\r'),(36,'eye disorders\r'),(37,'fibroids\r'),(38,'fibromyalgia\r'),(39,'flu (influenza)\r'),(40,'food poisoning\r'),(41,'Fracture\r'),(42,'Gallstones\r'),(43,'genital herpes\r'),(44,'gonorrhea\r'),(45,'Graves\' disease\r'),(46,'Hashimoto\'s thyroiditis\r'),(47,'hay fever\r'),(48,'headache\r'),(49,'heart disease\r'),(50,'hemochromatosis\r'),(51,'hepatitis\r'),(52,'herpes\r'),(53,'high cholesterol\r'),(54,'HIV\r'),(55,'Hodgkin\'s disease\r'),(56,'HPV (human papilloma virus)\r'),(57,'hypertension\r'),(58,'impotence\r'),(59,'insomnia\r'),(60,'irritable bowel syndrome\r'),(61,'jaundice\r'),(62,'kidney disease\r'),(63,'lactose intolerance\r'),(64,'leukemia\r'),(65,'liver cancer\r'),(66,'liver disease\r'),(67,'lung cancer\r'),(68,'lupus\r'),(69,'Lyme disease\r'),(70,'lymphoma\r'),(71,'meningitis\r'),(72,'meningococcal disease\r'),(73,'menopause\r'),(74,'mental illness\r'),(75,'migraine\r'),(76,'multiple sclerosis\r'),(77,'muscular dystrophy\r'),(78,'myopia (short-sightedness)\r'),(79,'narcolepsy\r'),(80,'Non-Hodgkin\'s lymphoma\r'),(81,'obesity\r'),(82,'osteoporosis\r'),(83,'otitis media (middle ear infection)\r'),(84,'ovarian cancer\r'),(85,'overweight\r'),(86,'pain\r'),(87,'Parkinson\'s disease\r'),(88,'pelvic inflammatory disease\r'),(89,'pertussis\r'),(90,'pregnancy\r'),(91,'premenstrual syndrome (PMS)\r'),(92,'prostate cancer\r'),(93,'prostate disorders\r'),(94,'Raynaud\'s Phenomenon\r'),(95,'SARS\r'),(96,'sexually transmitted diseases\r'),(97,'sleep disorders\r'),(98,'stroke\r'),(99,'thrush\r'),(100,'thyroid disorders\r'),(101,'whooping cough\r');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `specialization` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `specialization_fk` (`specialization`),
  CONSTRAINT `specialization_fk` FOREIGN KEY (`specialization`) REFERENCES `doctor_specialization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Wu','Smith \r',1),(2,'Cook','Jay \r',1),(3,'Simpson','Homer \r',1),(4,'Black','Jack \r',2),(5,'Zuess','Brian \r',1),(6,'Jay','Smith  \r',1),(7,'Henry','Lisa \r',1),(8,'Knowles','Daivd \r',1),(9,'Biggs','Nick \r',1),(10,'Diddy','Peter ',1),(12,'YOOOOOO','YOYOYO',18),(13,'dasdas','asd',19);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger doctorlog before update on doctor
for each row
insert into doctor_archive(version,doctor_id,last_name,first_name,specialization)
select NULL, NEW.doctor_id,doctor.last_name,doctor.first_name,doctor.specialization,NULL
from doctor where doctor_id = NEW.doctor_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger doctorlog_ondelete before delete on doctor
for each row
insert into doctor_archive(version,doctor_id,last_name,first_name,specialization)
select NULL, OLD.doctor_id,doctor.last_name,doctor.first_name,doctor.specialization,NULL
from doctor where doctor_id = OLD.doctor_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `doctor_appointment`
--

LOCK TABLES `doctor_appointment` WRITE;
/*!40000 ALTER TABLE `doctor_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_specialization`
--

DROP TABLE IF EXISTS `doctor_specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_specialization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialization` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_specialization`
--

LOCK TABLES `doctor_specialization` WRITE;
/*!40000 ALTER TABLE `doctor_specialization` DISABLE KEYS */;
INSERT INTO `doctor_specialization` VALUES (1,'Paediatric surgery\r'),(2,'Cardiothoracic surgery\r'),(3,'Occupational medicine\r'),(4,'Neuroradiology\r'),(5,'Interventional Radiology\r'),(6,'Radiology\r'),(7,'Gynaecology and obstetrics\r'),(8,'Pathology\r'),(9,'Otorhinolaryngology\r'),(10,'Paediatric rheumatology\r'),(11,'Microbiology\r'),(12,'Allergy and Immunology\r'),(13,'Health Informatics\r'),(14,'Endocrinology\r'),(15,'Dermato-Venereology\r'),(16,'Nuclear medicine\r'),(17,'Internal Medicine\r'),(18,'Nephrology\r'),(19,'Vascular surgery\r'),(20,' Reconstructive and Aesthetic Surgery\r'),(21,'Cardiology\r'),(22,'General Practice\r'),(23,'Occupational medicine\r'),(24,'Nephrology\r'),(25,'Plastic\r'),(26,'Vascular surgery\r'),(27,'Internal Medicine\r'),(28,'Pneumology\r'),(29,'Neurosurgery\r'),(30,'Nuclear medicine\r'),(31,'Orthopaedics\r'),(32,'Gynaecology and obstetrics\r'),(33,'Endocrinology\r'),(34,'Interventional Radiology\r'),(35,'Paediatric surgery\r'),(36,'Cardiology\r'),(37,'Paediatric allergology\r'),(38,'Paediatric cardiology\r'),(39,'Plastic\r'),(40,'Infectious diseases\r'),(41,'Allergy and Immunology\r'),(42,'Allergy and Immunology\r'),(43,'General Practice\r'),(44,'Paediatric surgery\r'),(45,'Gynaecology and obstetrics\r'),(46,'Ophthalmology\r'),(47,'Infectious diseases\r'),(48,'Radiology\r'),(49,'Plastic\r'),(50,'Plastic\r'),(51,'General surgery\r'),(52,'Plastic\r'),(53,'Plastic\r'),(54,'Neuroradiology\r'),(55,'Vascular surgery\r'),(56,'Orthopaedics\r'),(57,'Cardiology\r'),(58,'Paediatric endocrinology and diabetes\r'),(59,'Vascular surgery\r'),(60,'Radiology\r'),(61,'Plastic\r'),(62,'Paediatric haematology and oncology\r'),(63,'Microbiology\r'),(64,'Gastroenterology\r'),(65,'Clinical neurophysiology\r'),(66,'Vascular surgery\r'),(67,' Reconstructive and Aesthetic Surgery\r'),(68,'Child and adolescent psychiatry and psychothe'),(69,'Paediatrics\r'),(70,'Pneumology\r'),(71,'Paediatric rheumatology\r'),(72,'Radiotherapy\r'),(73,'Cardiothoracic surgery\r'),(74,'Oral and Maxillofacial Surgery\r'),(75,'Paediatrics\r'),(76,'Internal Medicine\r'),(77,'Allergy and Immunology\r'),(78,'Clinical neurophysiology\r'),(79,'Neurology\r'),(80,'Pathology\r'),(81,'Microbiology\r'),(82,'Radiotherapy\r'),(83,'Paediatric rheumatology\r'),(84,'Otorhinolaryngology\r'),(85,'Paediatric Nephrology\r'),(86,' Reconstructive and Aesthetic Surgery\r'),(87,'Neurosurgery\r'),(88,'Paediatrics\r'),(89,'Clinical neurophysiology\r'),(90,'Vascular medicine\r'),(91,'Microbiology\r'),(92,'Plastic\r'),(93,'Orthopaedics\r'),(94,'Child and adolescent psychiatry and psychothe'),(95,'Child and adolescent psychiatry and psychothe'),(96,'Paediatric rheumatology\r'),(97,'Vascular surgery\r'),(98,'Pathology\r'),(99,'Paediatric gastroenterology\r'),(100,' hepatology and nutrition');
/*!40000 ALTER TABLE `doctor_specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorlog`
--

DROP TABLE IF EXISTS `doctorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorlog` (
  `version` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `specialization` int(11) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorlog`
--

LOCK TABLES `doctorlog` WRITE;
/*!40000 ALTER TABLE `doctorlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL DEFAULT '0',
  `access_level` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`access_level`),
  KEY `access_level_fk_idx` (`access_level`),
  CONSTRAINT `access_level_fk` FOREIGN KEY (`access_level`) REFERENCES `access_level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,3,'staff','staff'),(2,0,'admin','admin'),(3,1,'finance','finance'),(4,2,'doctor','doctor'),(5,4,'patient','patient'),(6,3,'JimTan','JimTan'),(7,3,'ChandarSmith','ChandarSmith'),(8,3,'LisaLi','LisaLi'),(9,3,'BrockHarder','BrockHarder'),(10,3,'DavidLee','DavidLee');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
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
  KEY `patient_doctor_id_fk` (`doctor_id`),
  CONSTRAINT `patient_status_fk` FOREIGN KEY (`patient_status_code`) REFERENCES `patient_status` (`status_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `patient_doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'T4H-1K8','milk',340748,55120,'female','31/12/1939','Brampton','Ap #288-7053 Auctor Road','Tyler','1-924-363-6750','1-818-299-2049','Xanthus','1-367-548-0791',3,3),(2,'S5A-1K5','dogs',346457,52060,'male','02/10/1940','Etobioke','389-4247 Interdum Rd.','Erin','1-404-293-3700','1-574-114-6369','Sylvia','1-355-648-7951',2,2),(3,'Y3Z-2C5','dogs',344738,54820,'female','09/02/1944','Ajax','Ap #218-7614 Nunc Avenue','Zachery','1-455-394-7044','1-163-295-0181','Ava','1-761-395-2442',2,2),(4,'X7V-7F2','milk',378296,53930,'female','05/12/1944','Burlington','Ap #824-7016 Tincidunt Ave','India','1-685-620-5839','1-916-882-3955','Sebastian','1-228-440-5228',3,8),(5,'S5S-5S2','wheat',348608,53920,'female','05/02/1945','Burlington','122-6895 Sapien. Street','Nina','1-789-659-3733','1-390-904-4867','Rowan','1-428-840-9838',3,10),(6,'H3A-6T3','fruit',378999,53860,'female','23/01/1946','Barrie','5683 Placerat Rd.','Olga','1-993-271-9005','1-702-906-0745','Britanni','1-849-360-9274',4,5),(7,'E1Y-0Z1','fish',347553,52110,'male','27/03/1946','Markham','947-2978 Consectetuer St.','Brock','1-399-342-5136','1-738-378-9620','Wyoming','1-816-105-4580',1,1),(8,'Y2Z-9W9','wheat',347460,52870,'female','31/05/1950','Waterloo','870-9341 Arcu. Rd.','Rashad','1-779-774-5061','1-174-240-4950','Sigourney','1-290-875-5106',3,1),(9,'B8F-3K2','fruit',372923,54360,'male','19/06/1952','Ajax','262-6037 Donec Road','Lucy','1-499-613-9399','1-934-202-9710','Pascale','1-490-220-4096',4,1),(10,'E9X-5K4','ntus',341943,55990,'female','22/05/1954','Barrie','6058 Arcu. Rd.','Xenos','1-499-739-1806','1-954-237-2320','Amir','1-472-279-9168',3,6),(11,'L8C-9D8','wheat',372633,54110,'female','19/11/1966','Burlington','219-2364 Gravida Ave','Nash','1-880-163-9702','1-447-584-5293','Kimberley','1-771-662-1443',3,8),(12,'R0M-2Q5','oats',370007,55380,'male','23/04/1971','Etobioke','Ap #162-7937 Ipsum Road','Fallon','1-508-554-7695','1-262-641-0457','Athena','1-507-298-9961',3,9),(13,'R2Q-2M1','oats',349592,52170,'female','16/09/1971','Burlington','8821 Faucibus. Ave','Kevin','1-981-378-4708','1-810-537-8709','Nomlanga','1-424-251-8287',2,6),(14,'J0F-9A4','fish',349931,55870,'male','23/03/1972','Vaughan','Ap #144-7728 Eget St.','Hasad','1-331-291-9371','1-462-425-1132','Alan','1-685-765-8605',2,1),(15,'A6T-0J8','wheat',348438,51620,'female','07/01/1982','Barrie','3791 Aliquam Road','Honorato','1-731-472-8798','1-805-679-6607','Isadora','1-270-206-1132',2,10),(16,'E2N-3H8','fish',373890,54830,'male','09/05/1984','Ajax','1238 Neque. Ave','Shea','1-462-345-1855','1-269-762-8359','Dominic','1-110-756-5614',4,2),(17,'X4Q-8Z6','ntus',379568,54330,'male','10/09/1984','Ajax','630-8445 In St.','Germaine','1-968-726-8397','1-571-711-3619','Kelly','1-489-196-1681',2,4),(18,'X7Y-7E2','milk',347605,53070,'female','11/02/1985','Waterloo','3619 Duis Rd.','Jason','1-530-101-1165','1-148-316-0806','Stephanie','1-605-711-0673',4,7),(19,'R3V-7O2','gluten',325132,53440,'female','13/04/1988','Oakville','381-9075 Primis St.','Vielka','1-349-735-6616','1-818-385-6199','Barbara','1-142-712-6211',2,10),(20,'S9N-1X1','milk',349301,54600,'female','01/06/1994','Etobioke','Ap #381-8149 Dapibus Rd.','Blair','1-376-224-0910','1-674-524-9480','Morgan','1-132-409-1059',4,3),(21,'S9G-0S0','gluten',354239,51160,'female','14/04/2002','London','Ap #542-1555 Sit St.','Lois','1-969-700-3696','1-712-890-8593','Quynn','1-734-813-4709',3,10),(22,'V0T-1W0','gluten',311103,56890,'female','24/04/2003','Vaughan','7211 Vehicula Rd.','Plato','1-310-328-8616','1-122-156-3294','Colton','1-524-992-4318',4,6),(23,'Y3L-5B6','milk',341017,55620,'female','23/04/2008','Brampton','698-3461 Iaculis Rd.','Larissa','1-986-282-3250','1-649-120-7397','Ora','1-559-291-8824',5,4),(24,'V3T-8T9','gluten',396164,56010,'male','12/11/2008','Etobioke','1831 Massa St.','Ivory','1-554-559-7867','1-430-653-5329','Aquila','1-543-328-2266',4,4),(25,'R6D-8U0','cats',347067,53110,'male','17/12/2008','Ajax','3634 Non St.','Wade','1-495-186-2784','1-198-257-5414','Colby','1-517-259-4019',3,6),(26,'M6H-8Q1','gluten',365234,56950,'female','09/03/2009','Markham','9372 Aliquam Road','Casey','1-881-983-9300','1-580-832-8042','Pascale','1-571-950-1050',3,3),(27,'S0B-5C6','wheat',343227,51200,'female','27/07/2009','Ajax','695-2341 Cum Avenue','Ginger','1-880-596-5077','1-968-369-0361','Xantha','1-545-835-5809',5,8),(28,'T0E-2U5','fish',344707,542360,'female','10/09/2009','Ajax','2656 Sem St.','Gil','1-823-852-8321','1-495-901-8373','Kerry','1-525-704-7434',3,10),(29,'Y6B-3J9','fish',372299,511700,'female','22/09/2009','London','865-7735 Proin Rd.','Uriah','1-181-701-5184','1-589-914-3382','Angelica','1-279-683-4275',1,9),(30,'T6J-2L4','fish',378862,521450,'male','26/02/2010','Brampton','Ap #901-6209 Dui. Rd.','Jayme','1-804-178-9329','1-441-183-2030','Ulysses','1-566-441-4862',1,10),(31,'R1A-6Q3','dogs',348263,513110,'female','14/04/2010','Etobioke','8745 Laoreet Av.','Kameko','1-115-435-9418','1-365-448-3724','Briar','1-878-991-6599',5,4),(32,'Y8D-2Z3','fruit',370354,528300,'male','03/12/2010','Etobioke','359-1019 Sagittis. Road','Graiden','1-782-973-7180','1-878-131-8157','Eden','1-694-987-7393',3,5),(33,'A4V-3B2','fruit',378660,512450,'female','06/12/2010','Vaughan','483 Duis Road','Rebecca','1-310-505-4382','1-486-394-5902','Cally','1-281-875-4961',1,7),(34,'R9M-3Y1','ntus',344514,526240,'male','17/10/2011','Brampton','581-2471 Quisque Avenue','Seth','1-232-777-9381','1-764-333-4045','Norman','1-251-105-4343',3,3),(35,'B9G-5Q6','fish',373399,520720,'male','25/10/2011','London','7992 Posuere Ave','Odessa','1-599-561-5236','1-971-961-4645','Heidi','1-496-189-7912',2,10),(36,'Y5O-4W8','cats',377907,532050,'female','23/12/2011','Ajax','Ap #661-3189 Dictum Street','Beatrice','1-593-520-3684','1-867-690-2650','Honorato','1-361-858-2481',2,8),(37,'C0E-3Q5','dogs',371910,550020,'male','27/12/2011','Burlington','415-7306 Natoque Av.','Jordan','1-438-516-2741','1-719-213-0303','Scarlett','1-106-988-9481',1,9),(38,'A7S-7Y4','cats',376276,513000,'male','19/11/2012','Ajax','Ap #465-297 Non St.','Madeline','1-565-820-8634','1-892-680-8296','Helen','1-564-946-3551',3,9),(39,'K5Q-8F0','milk',376350,548030,'male','17/12/2012','Etobioke','9778 Ac St.','Armando','1-214-542-4923','1-368-971-2565','Kiara','1-492-720-1340',4,8),(40,'P4X-7N8','fruit',342602,535790,'female','19/02/2013','Etobioke','8719 Est St.','Rashad','1-572-866-3362','1-407-701-7037','Quinn','1-398-990-7129',2,1),(41,'E6H-8C4','ntus',347839,538160,'male','22/05/2013','London','519-7091 Nascetur Rd.','Guy','1-149-684-5945','1-608-749-3178','Moses','1-266-163-5778',5,1),(42,'T0J-5J2','dogs',377319,533810,'female','04/06/2013','Vaughan','Ap #976-4972 Vestibulum St.','Andrew','1-800-769-1601','1-269-871-3642','Rosalyn','1-263-595-0975',2,2),(43,'S4Q-5Q8','cats',372688,517840,'female','31/01/2014','Burlington','254-488 Ante St.','Gail','1-953-821-4193','1-301-182-9054','Olympia','1-159-422-7514',5,2),(44,'X3W-5A6','oats',374887,522980,'male','10/04/1973','Toronto','735-4326 Non Street','Hadassah','1-219-982-3550','1-904-820-3391','Hedwig','1-213-641-6166',4,2),(45,'C7Q-6Z3','oats',378692,541100,'male','07/01/1974','Barrie','5287 Fringilla St.','Yuli','1-276-135-1893','1-154-699-7885','Elizabeth','1-685-923-0721',2,5),(46,'C6P-7M8','gluten',348719,505030,'male','16/07/2014','Vaughan','Ap #784-6401 Sed Avenue','Stone','1-167-907-3280','1-324-382-6785','Branden','1-109-869-4103',2,6),(47,'Y8S-1N1','dogs',345911,539360,'male','28/11/2014','Etobioke','8169 Vehicula. Rd.','Jessamine','1-304-194-0964','1-766-445-9306','Daryl','1-986-370-3413',4,7),(48,'H9J-7R8','dogs',345698,536870,'female','02/06/1996','Ajax','180-725 Luctus Avenue','Farrah','1-884-725-1677','1-508-955-8831','Althea','1-909-665-6658',4,9),(49,'X4J-2A1','cats',344897,542360,'female','22/07/1996','Markham','Ap #356-5680 Dolor St.','Eliana','1-525-947-1560','1-291-542-0798','Ann','1-483-699-0343',5,3),(50,'B9W-8U5','ntus',371783,532600,'male','20/06/1997','Barrie','Ap #397-4181 Sed St.','Amery','1-393-370-3036','1-222-970-5138','Abel','1-926-563-9705',1,2),(51,'R9K-3S4','cats',341141,554210,'male','14/12/1997','Brampton','3846 Dictum St.','Rhona','1-498-122-4029','1-441-646-8470','Ori','1-921-871-5999',4,2),(52,'A5N-4V7','fish',379919,516010,'male','17/08/2000','Toronto','6839 Praesent Av.','Germaine','1-611-665-3226','1-960-233-8714','Stacey','1-438-528-9246',4,7),(53,'B0H-4V2','wheat',370618,519060,'female','08/04/1973','London','Ap #753-9626 Eleifend Road','Channing','1-905-678-6873','1-929-432-1113','Rhonda','1-253-490-1503',5,2),(54,'R4M-7S1','wheat',371526,527390,'female','30/05/2014','Ajax','652-3486 Tellus. Road','Morgan','1-791-542-4307','1-475-800-1498','Imelda','1-300-569-9152',3,8),(55,'X3P-4B4','milk',374422,531040,'male','10/06/2014','Ajax','168 Nulla Rd.','Ezra','1-748-171-7562','1-206-237-4248','Travis','1-366-714-1533',5,3),(56,'C9U-5V3','cats',348581,549770,'male','27/04/1974','Barrie','Ap #391-2073 Ultrices Ave','Amelia','1-804-406-0648','1-208-517-0176','Jena','1-400-473-1107',1,1),(57,'A2L-0M9','fish',376592,534580,'female','27/06/1975','Etobioke','Ap #766-6181 Diam. St.','Dennis','1-107-156-0608','1-710-347-1502','Ivana','1-116-109-6124',4,2),(58,'T6L-0P2','wheat',377109,558070,'female','17/07/1976','Burlington','2759 Feugiat St.','Nola','1-675-342-3374','1-332-291-5143','Byron','1-205-563-0669',3,9);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger patientlog before update on patient
for each row
insert into patient_archive(version,patient_id,allergies,OHIP,SSN,gender,dob,city,address,name,phone_no,emergency_phone,emergency_name,emergency_contact,patient_status_code,doctor_id,last_updated)
select NULL, NEW.patient_id,patient.allergies,patient.OHIP,patient.SSN,patient.gender,patient.dob,patient.city,patient.address,patient.name,patient.phone_no,patient.emergency_phone,patient.emergency_name,patient.emergency_contact,patient.patient_status_code,patient.doctor_id,NULL
from patient where patient_id = NEW.patient_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger patientlog_ondelete before delete on patient
for each row
insert into patient_archive(version,patient_id,allergies,OHIP,SSN,gender,dob,city,address,name,phone_no,emergency_phone,emergency_name,emergency_contact,patient_status_code,doctor_id,last_updated)
select NULL, OLD.patient_id,patient.allergies,patient.OHIP,patient.SSN,patient.gender,patient.dob,patient.city,patient.address,patient.name,patient.phone_no,patient.emergency_phone,patient.emergency_name,patient.emergency_contact,patient.patient_status_code,patient.doctor_id, NULL
from patient where patient_id = OLD.patient_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient_archive`
--

DROP TABLE IF EXISTS `patient_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_archive` (
  `version` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `allergies` varchar(45) NOT NULL,
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
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_archive`
--

LOCK TABLES `patient_archive` WRITE;
/*!40000 ALTER TABLE `patient_archive` DISABLE KEYS */;
INSERT INTO `patient_archive` VALUES (66,59,'ntus',376859,542800,'male','24/07/1976','Barrie','2372 Lacus. St.','Ebony','1-641-985-9237','1-647-772-3631','Bert','1-551-227-4867',4,5,'2014-03-31 15:48:17');
/*!40000 ALTER TABLE `patient_archive` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `patient_status`
--

LOCK TABLES `patient_status` WRITE;
/*!40000 ALTER TABLE `patient_status` DISABLE KEYS */;
INSERT INTO `patient_status` VALUES (1,'Healthy\r'),(2,'Treatment\r'),(3,'Scheduled\r'),(4,'Deceased\r'),(5,'Terminal');
/*!40000 ALTER TABLE `patient_status` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'big bottle of death'),(2,'01 Moisture Foundation SPF 15\r'),(3,'02 Balancing Foundation\r'),(4,'02 Moisture Foundation SPF 15\r'),(5,'03 Balancing Foundation\r'),(6,'03 Moisture Foundation SPF 15\r'),(7,'04 Balancing Foundation\r'),(8,'04 Moisture Foundation SPF 15\r'),(9,'05 Balancing Foundation\r'),(10,'05 Moisture Foundation SPF 15\r'),(11,'06 Balancing Foundation\r'),(12,'06 Moisture Foundation SPF 15\r'),(13,'07 Balancing Foundation\r'),(14,'07 Moisture Foundation SPF 15\r'),(15,'08 Balancing Foundation\r'),(16,'08 Moisture Foundation SPF 15\r'),(17,'09 Balancing Foundation\r'),(18,'1 Bladder\r'),(19,'1 hydrocortisone\r'),(20,'10 Balancing Foundation\r'),(21,'10 Person ANSI\r'),(22,'10 Stomach\r'),(23,'1012 Antimicrobial\r'),(24,'1014 Foaming Antimicrobial\r'),(25,'11 Thyroid Adrenal\r'),(26,'12 hour allergy d\r'),(27,'12 hour cough relief\r'),(28,'12 hour decongestant\r'),(29,'12 hour nasal decongestant\r'),(30,'12 Male Reproductive\r'),(31,'13 Female\r'),(32,'2 Gallbladder\r'),(33,'2 in 1\r'),(34,'2 IN 1 POWDER MAKE-UP\r'),(35,'big bottle of death'),(36,'2-OAK MIX'),(37,'2-Pack Hand Sanitizer\r'),(38,'20/20\r'),(39,'24 HOUR\r'),(40,'24 Hour Allergy\r'),(41,'24 HOUR HIGH PERFORMANCE ANTIPERSPIRANT\r'),(42,'24-Hour All Day Allergy\r'),(43,'25 Person ANSI\r'),(44,'big bottle of death'),(45,'2in1\r'),(46,'2X Sunblock SPF 50\r'),(47,'3 CONCEPT EYES BACK TO BABY\r'),(48,'big bottle of death'),(49,'big bottle of death'),(50,'big bottle of death'),(51,'big bottle of death'),(52,'3 CONCEPT EYES HONEY FACE CHIFFON FLUID 001\r'),(53,'3 CONCEPT EYES HONEY FACE CHIFFON FLUID 002\r'),(54,'3 CONCEPT EYES LIQUID FOUNDATION IVORY BEIGE\r'),(55,'3 CONCEPT EYES LIQUID FOUNDATION LACE BEIGE\r'),(56,'3 CONCEPT EYES SLIM FIT PACT NATURAL IVORY\r'),(57,'3 CONCEPT EYES SLIM FIT PACT SOFT BEIGE\r'),(58,'3 Hand Sanitizers\r'),(59,'3 HAND SANITIZERS KIT\r'),(60,'3 Heart\r'),(61,'3 in 1 Antibacterial Hair and Body Wash\r'),(62,'big bottle of death'),(63,'big bottle of death'),(64,'big bottle of death'),(65,'3 Step First Aid Kit\r'),(66,'3-in-1 First Aid Povidone-Iodine Swab\r'),(67,'3-OAK MIX'),(68,'3-RAGWEED MIX'),(69,'3-Step First Aid Kit\r'),(70,'365 Everyday Value Arnica\r');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `extn` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Li','Brock',3917),(2,'Cooke','Anna',7769),(3,'Smith','Anna',6444),(4,'Ray','Brock',1628),(5,'Wu','Bill',9939),(6,'Tan','Jim',1820),(7,'Smith','Chandar',5915),(8,'Li','Lisa',2802),(9,'Harder','Brock',5954),(10,'Lee','David',3647);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger stafflog before update on staff
for each row
insert into staff(version,staff_id,last_name,first_name,extn,last_updated)
select NULL,NEW.staff_id,staff.last_name,staff.first_name,staff.extn,NULL
from staff where staff_id = NEW.staff_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger stafflog_ondelete before delete on staff
for each row
insert into staff(version,staff_id,last_name,first_name,extn,last_updated)
select NULL, OLD.staff_id,staff.last_name,staff.first_name,staff.extn,NULL
from staff where staff_id = OLD.staff_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff_archive`
--

DROP TABLE IF EXISTS `staff_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_archive` (
  `version` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `extn` int(11) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_archive`
--

LOCK TABLES `staff_archive` WRITE;
/*!40000 ALTER TABLE `staff_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_permission`
--

DROP TABLE IF EXISTS `staff_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_permission` (
  `doctor_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `permission` tinyint(1) NOT NULL,
  KEY `doctor_id_fk_idx` (`doctor_id`),
  KEY `staff_if_fk_idx` (`staff_id`),
  CONSTRAINT `doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `staff_if_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_permission`
--

LOCK TABLES `staff_permission` WRITE;
/*!40000 ALTER TABLE `staff_permission` DISABLE KEYS */;
INSERT INTO `staff_permission` VALUES (9,1,0),(5,2,1),(4,3,1),(2,4,0),(7,5,1),(8,6,1),(4,7,0),(2,8,0),(9,9,0),(1,10,0);
/*!40000 ALTER TABLE `staff_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger staff_permissionlog before update on staff_permission
for each row
insert into staff_permission_archive(version,doctor_id,staff_id,permission,last_updated)
select NULL,NEW.doctor_id,staff_permission.staff_id,staff_permission.permission,NULL
from staff_permission where doctor_id = NEW.doctor_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff_permission_archive`
--

DROP TABLE IF EXISTS `staff_permission_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_permission_archive` (
  `version` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `permission` tinyint(1) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_permission_archive`
--

LOCK TABLES `staff_permission_archive` WRITE;
/*!40000 ALTER TABLE `staff_permission_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_permission_archive` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (0,'None Required\r'),(1,'Surgery\r'),(2,'X-Ray\r'),(3,'CAT Scan\r'),(4,'MRI\r'),(5,'Medication\r'),(6,'Chemotherapy\r');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-31 12:21:48
