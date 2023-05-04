-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: farmers-db
-- ------------------------------------------------------
-- Server version	5.7.41

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
-- Table structure for table `app_animal_breed_types`
--

DROP TABLE IF EXISTS `app_animal_breed_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_animal_breed_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `at_description` varchar(300) NOT NULL,
  `at_animal_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name_desc` (`at_description`),
  KEY `app_animal_breed_types_FK` (`at_animal_type_id`),
  CONSTRAINT `app_animal_breed_types_FK` FOREIGN KEY (`at_animal_type_id`) REFERENCES `app_animal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_animal_breed_types`
--

LOCK TABLES `app_animal_breed_types` WRITE;
/*!40000 ALTER TABLE `app_animal_breed_types` DISABLE KEYS */;
INSERT INTO `app_animal_breed_types` VALUES (2,'Duroc pig',1),(3,'Test Breed Types',1),(4,'Kunekene',1),(5,'Chester White',1),(6,'Berkshire Pigs',1);
/*!40000 ALTER TABLE `app_animal_breed_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_animal_other_types`
--

DROP TABLE IF EXISTS `app_animal_other_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_animal_other_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anot_description` varchar(300) NOT NULL,
  `anot_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`anot_description`),
  KEY `FK8DEDB048EC7ABL` (`anot_type_id`),
  CONSTRAINT `FK8DEDB048EC7ABL` FOREIGN KEY (`anot_type_id`) REFERENCES `app_animal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_animal_other_types`
--

LOCK TABLES `app_animal_other_types` WRITE;
/*!40000 ALTER TABLE `app_animal_other_types` DISABLE KEYS */;
INSERT INTO `app_animal_other_types` VALUES (1,'Guilt',1),(2,'Sow',1),(3,'Boars',3);
/*!40000 ALTER TABLE `app_animal_other_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_animal_types`
--

DROP TABLE IF EXISTS `app_animal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_animal_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `at_description` varchar(300) NOT NULL,
  `at_age_maturity` int(6) NOT NULL,
  `at_frequency` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `at_desc` (`at_description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_animal_types`
--

LOCK TABLES `app_animal_types` WRITE;
/*!40000 ALTER TABLE `app_animal_types` DISABLE KEYS */;
INSERT INTO `app_animal_types` VALUES (1,'Pig',7,'Months'),(3,'Cow',30,'Months');
/*!40000 ALTER TABLE `app_animal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_apply_fertilizer`
--

DROP TABLE IF EXISTS `app_apply_fertilizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_apply_fertilizer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applied_rate` decimal(23,5) NOT NULL,
  `applied_method` varchar(20) NOT NULL,
  `equipment` varchar(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `fertilizer_id` bigint(20) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DE08Ee7AB34` (`block_id`),
  KEY `FKDE048Ee7AB34` (`fertilizer_id`),
  KEY `FK8DEDeeB0REC7B334` (`created_by`),
  CONSTRAINT `FK8DE08Ee7AB34` FOREIGN KEY (`block_id`) REFERENCES `app_plant_blocks` (`id`),
  CONSTRAINT `FK8DEDeeB0REC7B334` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FKDE048Ee7AB34` FOREIGN KEY (`fertilizer_id`) REFERENCES `app_fertilizers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_apply_fertilizer`
--

LOCK TABLES `app_apply_fertilizer` WRITE;
/*!40000 ALTER TABLE `app_apply_fertilizer` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_apply_fertilizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_appuser`
--

DROP TABLE IF EXISTS `app_appuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_appuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `firsttime_login_remaining` bit(1) NOT NULL,
  `nonexpired` bit(1) NOT NULL,
  `nonlocked` bit(1) NOT NULL,
  `nonexpired_credentials` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_time_password_updated` date NOT NULL,
  `password_never_expires` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'define if the password, should be check for validity period or not',
  `gender` varchar(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `encodeduser` varchar(200) DEFAULT NULL,
  `activated` varchar(1) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_org` (`username`),
  KEY `last_time_password_updated` (`last_time_password_updated`),
  KEY `FK_m_appuser_centre_id` (`centre_id`),
  CONSTRAINT `FK_m_appuser_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_appuser`
--

LOCK TABLES `app_appuser` WRITE;
/*!40000 ALTER TABLE `app_appuser` DISABLE KEYS */;
INSERT INTO `app_appuser` VALUES (68,0,'admin','System','0720357230','Administrator','380ede7368b998e6ed8cb68a88cf2791e794480284d8679ecd37679ad92d6596','alkamemist@gmail.com',_binary '\0',_binary '',_binary '',_binary '',_binary '','2021-05-25',0,'M','1989-01-05','97b8786d5d3d47c443adca5a6bea8ff3d4df1f550e50ba4bb8f531ae4264650b','Y',NULL,NULL);
/*!40000 ALTER TABLE `app_appuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_appuser_role`
--

DROP TABLE IF EXISTS `app_appuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_appuser_role` (
  `appuser_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`appuser_id`,`role_id`),
  KEY `FK7662CE59B4100309` (`appuser_id`),
  KEY `FK7662CE5915CEC7AB` (`role_id`),
  CONSTRAINT `FK7662CE5915CEC7AB` FOREIGN KEY (`role_id`) REFERENCES `app_roles` (`id`),
  CONSTRAINT `FK7662CE59B4100309` FOREIGN KEY (`appuser_id`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_appuser_role`
--

LOCK TABLES `app_appuser_role` WRITE;
/*!40000 ALTER TABLE `app_appuser_role` DISABLE KEYS */;
INSERT INTO `app_appuser_role` VALUES (68,1);
/*!40000 ALTER TABLE `app_appuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_banks`
--

DROP TABLE IF EXISTS `app_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_banks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_id` varchar(30) NOT NULL,
  `bank_name` varchar(80) NOT NULL,
  `account_format` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`bank_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_banks`
--

LOCK TABLES `app_banks` WRITE;
/*!40000 ALTER TABLE `app_banks` DISABLE KEYS */;
INSERT INTO `app_banks` VALUES (4,'EQUITY','EQUITY BANK','^[0-9]{13}$'),(5,'COOP','COOP BANK',NULL),(6,'FAMILY','FAMILY BANK',NULL),(7,'NIC','NIC',NULL),(8,'GURDIAN','GURDIAN BANK','^[0-9]{7}$'),(9,'ABSA','ABSA','^[0-9]{13}$');
/*!40000 ALTER TABLE `app_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_banks_branches`
--

DROP TABLE IF EXISTS `app_banks_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_banks_branches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` varchar(30) NOT NULL,
  `branch_name` varchar(80) NOT NULL,
  `branch_bank_id` bigint(20) NOT NULL,
  `branch_ref_code` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`branch_name`),
  KEY `FK8DEDB048EC7AB` (`branch_bank_id`),
  CONSTRAINT `FK8DEDB048EC7AB` FOREIGN KEY (`branch_bank_id`) REFERENCES `app_banks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_banks_branches`
--

LOCK TABLES `app_banks_branches` WRITE;
/*!40000 ALTER TABLE `app_banks_branches` DISABLE KEYS */;
INSERT INTO `app_banks_branches` VALUES (4,'DONHOLM','DONHOLM',4,'009089');
/*!40000 ALTER TABLE `app_banks_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_cache`
--

DROP TABLE IF EXISTS `app_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cache_type_enum` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cache`
--

LOCK TABLES `app_cache` WRITE;
/*!40000 ALTER TABLE `app_cache` DISABLE KEYS */;
INSERT INTO `app_cache` VALUES (1,2);
/*!40000 ALTER TABLE `app_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_centre_inventory_items`
--

DROP TABLE IF EXISTS `app_centre_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_centre_inventory_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock` decimal(7,2) DEFAULT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  `inventory_item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `centre_id` (`centre_id`),
  KEY `inventory_item_id` (`inventory_item_id`),
  CONSTRAINT `app_centre_inventory_items_ibfk_1` FOREIGN KEY (`inventory_item_id`) REFERENCES `app_farmers_inventory_item` (`id`),
  CONSTRAINT `app_centre_inventory_items_ibfk_2` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_centre_inventory_items`
--

LOCK TABLES `app_centre_inventory_items` WRITE;
/*!40000 ALTER TABLE `app_centre_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_centre_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_code`
--

DROP TABLE IF EXISTS `app_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(100) DEFAULT NULL,
  `is_system_defined` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_name` (`code_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_code`
--

LOCK TABLES `app_code` WRITE;
/*!40000 ALTER TABLE `app_code` DISABLE KEYS */;
INSERT INTO `app_code` VALUES (1,'Gender',0),(2,'ClientRejectReason',0);
/*!40000 ALTER TABLE `app_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_code_value`
--

DROP TABLE IF EXISTS `app_code_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_code_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) NOT NULL,
  `code_value` varchar(100) DEFAULT NULL,
  `code_description` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  `order_position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_value` (`code_id`,`code_value`),
  KEY `FKCFCEA42640BE071Z` (`code_id`),
  CONSTRAINT `FKCFCEA42640BE071Z` FOREIGN KEY (`code_id`) REFERENCES `app_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_code_value`
--

LOCK TABLES `app_code_value` WRITE;
/*!40000 ALTER TABLE `app_code_value` DISABLE KEYS */;
INSERT INTO `app_code_value` VALUES (1,1,'Male','Male',1,0,1),(2,1,'Female','Female',1,0,2),(3,2,'Invalid ID Documents','Invalid ID Documents',1,0,1),(4,2,'Missing Account Number','Missing Account Number',1,0,2);
/*!40000 ALTER TABLE `app_code_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_company_farmer_centres`
--

DROP TABLE IF EXISTS `app_company_farmer_centres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_company_farmer_centres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fc_centre_id` bigint(20) NOT NULL,
  `fc_farmer_id` bigint(20) NOT NULL,
  `fc_wef` date NOT NULL,
  `fc_wet` date DEFAULT NULL,
  `fc_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB02815CFCTA` (`fc_centre_id`),
  KEY `FK8DEDB0381048F544` (`fc_farmer_id`),
  CONSTRAINT `FK8DEDB02815CFCTA` FOREIGN KEY (`fc_centre_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK8DEDB0381048F544` FOREIGN KEY (`fc_farmer_id`) REFERENCES `app_company_farmers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_company_farmer_centres`
--

LOCK TABLES `app_company_farmer_centres` WRITE;
/*!40000 ALTER TABLE `app_company_farmer_centres` DISABLE KEYS */;
INSERT INTO `app_company_farmer_centres` VALUES (1,10,1,'2023-02-06',NULL,'ACTIVE'),(2,10,2,'2023-03-07',NULL,'ACTIVE'),(3,7,3,'2023-03-27',NULL,'ACTIVE'),(4,7,4,'2023-03-31',NULL,'ACTIVE');
/*!40000 ALTER TABLE `app_company_farmer_centres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_company_farmer_directors`
--

DROP TABLE IF EXISTS `app_company_farmer_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_company_farmer_directors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fd_farmer_id` bigint(20) NOT NULL,
  `fd_name` varchar(200) NOT NULL,
  `fd_id_no` varchar(20) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB031048F544` (`fd_farmer_id`),
  KEY `app_company_farmer_directors_FK` (`image_id`),
  CONSTRAINT `FK8DEDB031048F544` FOREIGN KEY (`fd_farmer_id`) REFERENCES `app_company_farmers` (`id`),
  CONSTRAINT `app_company_farmer_directors_FK` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_company_farmer_directors`
--

LOCK TABLES `app_company_farmer_directors` WRITE;
/*!40000 ALTER TABLE `app_company_farmer_directors` DISABLE KEYS */;
INSERT INTO `app_company_farmer_directors` VALUES (1,1,'Dan Mugo','2222222',16032),(2,2,'Joseph Limani Ad','9873456',16053),(3,3,'Admin Mugenya','25667645',16060),(4,4,'Admin Mugenya','25998945',16063);
/*!40000 ALTER TABLE `app_company_farmer_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_company_farmers`
--

DROP TABLE IF EXISTS `app_company_farmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_company_farmers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `company_name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_directors` bigint(10) DEFAULT NULL,
  `activated` varchar(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `farmer_code` varchar(30) NOT NULL,
  `status_code` smallint(5) NOT NULL,
  `date_registered` date DEFAULT NULL,
  `image_id_no` bigint(20) DEFAULT NULL,
  `image_atm_card` bigint(20) DEFAULT NULL,
  `submitted_by` bigint(20) DEFAULT NULL,
  `contact_name` varchar(250) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_id_no` varchar(30) DEFAULT NULL,
  `contact_email_address` varchar(120) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `farmer_gen_code` varchar(50) DEFAULT NULL,
  `mobileno` varchar(30) DEFAULT NULL,
  `account_no` varchar(30) DEFAULT NULL,
  `bank_branch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cfarmer_image_id` (`image_id_no`),
  KEY `app_co_farmers_FK` (`image_atm_card`),
  KEY `app_co_farmers_FK_1` (`submitted_by`),
  KEY `app_co_farmers_FK_2` (`region_id`),
  KEY `fk_company_bank_account` (`bank_branch_id`),
  CONSTRAINT `FK_cfarmer_image_id` FOREIGN KEY (`image_id_no`) REFERENCES `m_image` (`id`),
  CONSTRAINT `app_co_farmers_FK` FOREIGN KEY (`image_atm_card`) REFERENCES `m_image` (`id`),
  CONSTRAINT `app_co_farmers_FK_1` FOREIGN KEY (`submitted_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `app_co_farmers_FK_2` FOREIGN KEY (`region_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `fk_company_bank_account` FOREIGN KEY (`bank_branch_id`) REFERENCES `app_banks_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_company_farmers`
--

LOCK TABLES `app_company_farmers` WRITE;
/*!40000 ALTER TABLE `app_company_farmers` DISABLE KEYS */;
INSERT INTO `app_company_farmers` VALUES (1,0,'EMIDAN LTD ','',1,'Y','2023-02-06 08:16:21','',300,'2023-02-06',16030,16031,68,'Dan Mugo','0721963563','','dan@emidan.co.ke',10,'000000001','',NULL,NULL),(2,0,'UPLANDS COMPANY','',1,'Y','2023-03-07 09:36:24','',300,'2023-03-07',16051,16052,68,'Joseph Ndirangu Samuel','0766344210','','',10,'000000002','',NULL,NULL),(3,0,'BRIAN MUTINDA','carhi@gmail.co',1,'Y','2023-03-27 15:46:09','3333',300,'2023-03-27',16058,16059,68,'brian mutinda','0733444223','','carhi@gmail.co',7,'000000003','0720332212','',4),(4,0,'PETERMUGENYA','pmugenya@gmail.com',1,'Y','2023-03-31 18:06:06','00988',300,'2023-03-31',16061,16062,68,'brian mutinda','0700983398','','carhi@gmail.co',7,'000000004','0720332212','090098898',4);
/*!40000 ALTER TABLE `app_company_farmers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_contract_docs`
--

DROP TABLE IF EXISTS `app_contract_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_contract_docs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_image_id` bigint(20) DEFAULT NULL,
  `doc_id` bigint(20) NOT NULL,
  `doc_group_id` bigint(20) NOT NULL,
  `doc_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB023815CECTAB` (`doc_image_id`),
  KEY `FK8DE3DB0381048B544B` (`doc_id`),
  KEY `FK8DEDB08810483B544G` (`doc_group_id`),
  CONSTRAINT `FK8DE3DB0381048B544B` FOREIGN KEY (`doc_id`) REFERENCES `app_doc_types` (`id`),
  CONSTRAINT `FK8DEDB023815CECTAB` FOREIGN KEY (`doc_image_id`) REFERENCES `m_image` (`id`),
  CONSTRAINT `FK8DEDB08810483B544G` FOREIGN KEY (`doc_group_id`) REFERENCES `app_contract_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_contract_docs`
--

LOCK TABLES `app_contract_docs` WRITE;
/*!40000 ALTER TABLE `app_contract_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_contract_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_contract_groups`
--

DROP TABLE IF EXISTS `app_contract_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_contract_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `group_name` varchar(200) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activated` varchar(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `group_code` varchar(30) NOT NULL,
  `status_code` smallint(5) NOT NULL,
  `submittedon_userid` bigint(11) DEFAULT NULL,
  `date_registered` date DEFAULT NULL,
  `hierachy_id` bigint(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_contract_groups` (`group_code`),
  KEY `FK_app_contract_groups_submitter_value` (`submittedon_userid`),
  KEY `app_contract_groups_m_hierachy_object_fk` (`hierachy_id`),
  KEY `FK_updatedrr_by_id` (`updated_by`),
  CONSTRAINT `FK_app_contract_groups_submitter_value` FOREIGN KEY (`submittedon_userid`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK_updatedrr_by_id` FOREIGN KEY (`updated_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `app_contract_groups_m_hierachy_object_fk` FOREIGN KEY (`hierachy_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_contract_groups`
--

LOCK TABLES `app_contract_groups` WRITE;
/*!40000 ALTER TABLE `app_contract_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_contract_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_crop_date_centers`
--

DROP TABLE IF EXISTS `app_crop_date_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_crop_date_centers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `center_id` bigint(20) DEFAULT NULL,
  `cd_id` bigint(20) DEFAULT NULL,
  `target` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DED2815CECTAB5T` (`center_id`),
  KEY `FK8DEDB03810444BA4` (`cd_id`),
  CONSTRAINT `FK8DED2815CECTAB5T` FOREIGN KEY (`center_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK8DEDB03810444BA4` FOREIGN KEY (`cd_id`) REFERENCES `app_crop_dates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_crop_date_centers`
--

LOCK TABLES `app_crop_date_centers` WRITE;
/*!40000 ALTER TABLE `app_crop_date_centers` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_crop_date_centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_crop_dates`
--

DROP TABLE IF EXISTS `app_crop_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_crop_dates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_prod_id` bigint(20) DEFAULT NULL,
  `date_variety_id` bigint(20) DEFAULT NULL,
  `planting_date` date NOT NULL,
  `date_status` varchar(1) NOT NULL DEFAULT 'Y',
  `recruitment_extension_status` varchar(1) DEFAULT NULL,
  `new_recruitment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DED2815CECTAB` (`date_prod_id`),
  KEY `FK8DEDB03810444B` (`date_variety_id`),
  CONSTRAINT `FK8DED2815CECTAB` FOREIGN KEY (`date_prod_id`) REFERENCES `app_plant_products` (`id`),
  CONSTRAINT `FK8DEDB03810444B` FOREIGN KEY (`date_variety_id`) REFERENCES `app_product_varieties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_crop_dates`
--

LOCK TABLES `app_crop_dates` WRITE;
/*!40000 ALTER TABLE `app_crop_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_crop_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_doc_types`
--

DROP TABLE IF EXISTS `app_doc_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_doc_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sht_desc` varchar(40) NOT NULL,
  `doc_type` varchar(100) NOT NULL,
  `wef` date NOT NULL,
  `wet` date DEFAULT NULL,
  `doc_format` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sht_desc` (`sht_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_doc_types`
--

LOCK TABLES `app_doc_types` WRITE;
/*!40000 ALTER TABLE `app_doc_types` DISABLE KEYS */;
INSERT INTO `app_doc_types` VALUES (1,'Id Card','Identity Card','1900-08-01',NULL,'^[0-9]{1,15}$'),(2,'Certificate of Incorporation','Certificate of Incorporation','2020-01-31',NULL,''),(3,'KRA PIN','KRA PIN CERTIFICATE','2020-01-31',NULL,'^[0-9, A-Z]{7,8}$');
/*!40000 ALTER TABLE `app_doc_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farm_comments`
--

DROP TABLE IF EXISTS `app_farm_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farm_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fc_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fc_description` (`fc_description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farm_comments`
--

LOCK TABLES `app_farm_comments` WRITE;
/*!40000 ALTER TABLE `app_farm_comments` DISABLE KEYS */;
INSERT INTO `app_farm_comments` VALUES (4,'Housing'),(2,'Not What I Expected'),(1,'The Farm visit was Satisfactory'),(3,'This is a test remark'),(5,'Water');
/*!40000 ALTER TABLE `app_farm_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farm_names`
--

DROP TABLE IF EXISTS `app_farm_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farm_names` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farm_sht_desc` varchar(50) NOT NULL,
  `farm_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sht_desc` (`farm_sht_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farm_names`
--

LOCK TABLES `app_farm_names` WRITE;
/*!40000 ALTER TABLE `app_farm_names` DISABLE KEYS */;
INSERT INTO `app_farm_names` VALUES (1,'Runda','Runda'),(2,'Meru','Meru');
/*!40000 ALTER TABLE `app_farm_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farm_plant_varieties`
--

DROP TABLE IF EXISTS `app_farm_plant_varieties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farm_plant_varieties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sht_desc` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sht_desc` (`sht_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farm_plant_varieties`
--

LOCK TABLES `app_farm_plant_varieties` WRITE;
/*!40000 ALTER TABLE `app_farm_plant_varieties` DISABLE KEYS */;
INSERT INTO `app_farm_plant_varieties` VALUES (3,'Yellow Bean','Yellow Bean'),(4,'Organdi','Organdi');
/*!40000 ALTER TABLE `app_farm_plant_varieties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farm_rating`
--

DROP TABLE IF EXISTS `app_farm_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farm_rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fr_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fr_description` (`fr_description`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farm_rating`
--

LOCK TABLES `app_farm_rating` WRITE;
/*!40000 ALTER TABLE `app_farm_rating` DISABLE KEYS */;
INSERT INTO `app_farm_rating` VALUES (6,'Bad'),(4,'Fair'),(3,'Good'),(5,'Perfect'),(7,'Sample');
/*!40000 ALTER TABLE `app_farm_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farm_registration`
--

DROP TABLE IF EXISTS `app_farm_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farm_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `block_name` varchar(80) NOT NULL,
  `centre_id` bigint(20) NOT NULL,
  `farm_name_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `date_registered` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB048EC7AB34` (`centre_id`),
  KEY `FK8DEDB048EC7AB334` (`farm_name_id`),
  KEY `FK8DEDB0REC7AB334` (`created_by`),
  CONSTRAINT `FK8DEDB048EC7AB334` FOREIGN KEY (`farm_name_id`) REFERENCES `app_farm_names` (`id`),
  CONSTRAINT `FK8DEDB048EC7AB34` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK8DEDB0REC7AB334` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farm_registration`
--

LOCK TABLES `app_farm_registration` WRITE;
/*!40000 ALTER TABLE `app_farm_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farm_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farm_registration_areas`
--

DROP TABLE IF EXISTS `app_farm_registration_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farm_registration_areas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_type` varchar(80) NOT NULL,
  `area` decimal(23,5) NOT NULL,
  `registration_id` bigint(20) NOT NULL,
  `crop_date_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `date_registered` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DB048EC7AB34` (`crop_date_id`),
  KEY `FK8DEDB0EC7AB334` (`registration_id`),
  KEY `FK8DEDB0REC7A34` (`created_by`),
  CONSTRAINT `FK8DB048EC7AB34` FOREIGN KEY (`crop_date_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `FK8DEDB0EC7AB334` FOREIGN KEY (`registration_id`) REFERENCES `app_farm_registration` (`id`),
  CONSTRAINT `FK8DEDB0REC7A34` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farm_registration_areas`
--

LOCK TABLES `app_farm_registration_areas` WRITE;
/*!40000 ALTER TABLE `app_farm_registration_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farm_registration_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_account_details`
--

DROP TABLE IF EXISTS `app_farmer_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_account_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(100) NOT NULL,
  `bank_id` bigint(20) NOT NULL,
  `account_doc_id` bigint(20) NOT NULL,
  `account_farmer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB04815CECTAB` (`bank_id`),
  KEY `FK8DEDB0481048B544B` (`account_doc_id`),
  KEY `FK8DEDB0481048B544G` (`account_farmer_id`),
  CONSTRAINT `FK8DEDB0481048B544B` FOREIGN KEY (`account_doc_id`) REFERENCES `m_image` (`id`),
  CONSTRAINT `FK8DEDB0481048B544G` FOREIGN KEY (`account_farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `FK8DEDB04815CECTAB` FOREIGN KEY (`bank_id`) REFERENCES `app_banks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_account_details`
--

LOCK TABLES `app_farmer_account_details` WRITE;
/*!40000 ALTER TABLE `app_farmer_account_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_centres`
--

DROP TABLE IF EXISTS `app_farmer_centres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_centres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fc_centre_id` bigint(20) NOT NULL,
  `fc_farmer_id` bigint(20) NOT NULL,
  `fc_wef` date NOT NULL,
  `fc_wet` date DEFAULT NULL,
  `fc_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB02815CFCTAB` (`fc_centre_id`),
  KEY `FK8DEDB0381048F544B` (`fc_farmer_id`),
  CONSTRAINT `FK8DEDB02815CFCTAB` FOREIGN KEY (`fc_centre_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK8DEDB0381048F544B` FOREIGN KEY (`fc_farmer_id`) REFERENCES `app_farmers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_centres`
--

LOCK TABLES `app_farmer_centres` WRITE;
/*!40000 ALTER TABLE `app_farmer_centres` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_centres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_docs`
--

DROP TABLE IF EXISTS `app_farmer_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_docs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_image_id` bigint(20) NOT NULL,
  `doc_id` bigint(20) NOT NULL,
  `doc_farmer_id` bigint(20) NOT NULL,
  `doc_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB02815CECTAB` (`doc_image_id`),
  KEY `FK8DEDB0381048B544B` (`doc_id`),
  KEY `FK8DEDB0881048B544G` (`doc_farmer_id`),
  CONSTRAINT `FK8DEDB02815CECTAB` FOREIGN KEY (`doc_image_id`) REFERENCES `m_image` (`id`),
  CONSTRAINT `FK8DEDB0381048B544B` FOREIGN KEY (`doc_farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `FK8DEDB0881048B544G` FOREIGN KEY (`doc_id`) REFERENCES `app_doc_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_docs`
--

LOCK TABLES `app_farmer_docs` WRITE;
/*!40000 ALTER TABLE `app_farmer_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_groups`
--

DROP TABLE IF EXISTS `app_farmer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farmer_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7662CE594B4100309` (`farmer_id`),
  KEY `FK7662CE5915C7EC7AB` (`group_id`),
  CONSTRAINT `FK7662CE5915C7EC7AB` FOREIGN KEY (`group_id`) REFERENCES `app_contract_groups` (`id`),
  CONSTRAINT `FK7662CE594B4100309` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_groups`
--

LOCK TABLES `app_farmer_groups` WRITE;
/*!40000 ALTER TABLE `app_farmer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_location`
--

DROP TABLE IF EXISTS `app_farmer_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farmer_id` bigint(20) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `ward_id` bigint(20) DEFAULT NULL,
  `nearest_centre_id` bigint(20) DEFAULT NULL,
  `gps_location` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cordinates` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_farmer_location_FK` (`farmer_id`),
  KEY `app_farmer_location_FK_1` (`user_id`),
  KEY `app_farmer_location_FK_2` (`region_id`),
  KEY `app_farmer_location_FK_3` (`ward_id`),
  KEY `app_farmer_location_FK_4` (`nearest_centre_id`),
  CONSTRAINT `app_farmer_location_FK` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `app_farmer_location_FK_1` FOREIGN KEY (`user_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `app_farmer_location_FK_2` FOREIGN KEY (`region_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `app_farmer_location_FK_3` FOREIGN KEY (`ward_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `app_farmer_location_FK_4` FOREIGN KEY (`nearest_centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_location`
--

LOCK TABLES `app_farmer_location` WRITE;
/*!40000 ALTER TABLE `app_farmer_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_visit`
--

DROP TABLE IF EXISTS `app_farmer_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farmer_id` bigint(20) DEFAULT NULL,
  `nearest_centre_id` bigint(20) DEFAULT NULL,
  `gps_location` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_visited` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cordinates` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_farmer_visit_FK` (`farmer_id`),
  KEY `app_farmer_visit_FK_1` (`user_id`),
  KEY `app_farmer_visit_FK_4` (`nearest_centre_id`),
  CONSTRAINT `app_farmer_visit_FK` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `app_farmer_visit_FK_1` FOREIGN KEY (`user_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `app_farmer_visit_FK_4` FOREIGN KEY (`nearest_centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_visit`
--

LOCK TABLES `app_farmer_visit` WRITE;
/*!40000 ALTER TABLE `app_farmer_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_visit_breeds_size`
--

DROP TABLE IF EXISTS `app_farmer_visit_breeds_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_visit_breeds_size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farm_visit_id` bigint(20) DEFAULT NULL,
  `farm_breed_type_id` bigint(20) DEFAULT NULL,
  `farm_animal_type_id` bigint(20) DEFAULT NULL,
  `farm_pop_cnt` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_breed_visit_FK` (`farm_visit_id`),
  KEY `app_breed_visit_FK_1` (`farm_breed_type_id`),
  KEY `app_breed_visit_FK_2` (`farm_animal_type_id`),
  CONSTRAINT `app_breed_visit_FK` FOREIGN KEY (`farm_visit_id`) REFERENCES `app_farmer_visit` (`id`),
  CONSTRAINT `app_breed_visit_FK_1` FOREIGN KEY (`farm_breed_type_id`) REFERENCES `app_animal_breed_types` (`id`),
  CONSTRAINT `app_breed_visit_FK_2` FOREIGN KEY (`farm_animal_type_id`) REFERENCES `app_animal_other_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_visit_breeds_size`
--

LOCK TABLES `app_farmer_visit_breeds_size` WRITE;
/*!40000 ALTER TABLE `app_farmer_visit_breeds_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_visit_breeds_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_visit_comments`
--

DROP TABLE IF EXISTS `app_farmer_visit_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_visit_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farm_visit_id` bigint(20) NOT NULL,
  `farm_comment_id` bigint(20) NOT NULL,
  `rating_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DE08Ee7AB34L` (`farm_comment_id`),
  KEY `FK8DEDeeB0REC7B4` (`farm_visit_id`),
  KEY `app_farmer_visit_comments_FK` (`rating_id`),
  CONSTRAINT `FK8DE08Ee7AB34L` FOREIGN KEY (`farm_comment_id`) REFERENCES `app_farm_comments` (`id`),
  CONSTRAINT `FK8DEDeeB0REC7B4` FOREIGN KEY (`farm_visit_id`) REFERENCES `app_farmer_visit` (`id`),
  CONSTRAINT `app_farmer_visit_comments_FK` FOREIGN KEY (`rating_id`) REFERENCES `app_farm_rating` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_visit_comments`
--

LOCK TABLES `app_farmer_visit_comments` WRITE;
/*!40000 ALTER TABLE `app_farmer_visit_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_visit_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmer_visit_population`
--

DROP TABLE IF EXISTS `app_farmer_visit_population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmer_visit_population` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farm_visit_id` bigint(20) DEFAULT NULL,
  `farm_pop_type_id` bigint(20) DEFAULT NULL,
  `cordinates` varchar(100) DEFAULT NULL,
  `farm_pop_cnt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_farmer_pop_FK` (`farm_visit_id`),
  KEY `app_farmer_pop_FK_1` (`farm_pop_type_id`),
  CONSTRAINT `app_farmer_pop_FK` FOREIGN KEY (`farm_visit_id`) REFERENCES `app_farmer_visit` (`id`),
  CONSTRAINT `app_farmer_pop_FK_1` FOREIGN KEY (`farm_pop_type_id`) REFERENCES `app_population_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmer_visit_population`
--

LOCK TABLES `app_farmer_visit_population` WRITE;
/*!40000 ALTER TABLE `app_farmer_visit_population` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmer_visit_population` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers`
--

DROP TABLE IF EXISTS `app_farmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `mobileno` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `activated` varchar(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `farmer_code` varchar(30) NOT NULL,
  `status_code` smallint(5) NOT NULL,
  `date_registered` date DEFAULT NULL,
  `image_id_no` bigint(20) DEFAULT NULL,
  `image_atm_card` bigint(20) DEFAULT NULL,
  `submitted_by` bigint(20) DEFAULT NULL,
  `contact_name` varchar(250) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_id_no` varchar(30) DEFAULT NULL,
  `contact_email_address` varchar(120) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `id_number` varchar(10) DEFAULT NULL,
  `farmer_gen_code` varchar(50) DEFAULT NULL,
  `account_no` varchar(30) DEFAULT NULL,
  `bank_branch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_farmer_image_id` (`image_id_no`),
  KEY `app_farmers_FK` (`image_atm_card`),
  KEY `app_farmers_FK_1` (`submitted_by`),
  KEY `app_farmers_FK_2` (`region_id`),
  KEY `app_bank_branch_fk` (`bank_branch_id`),
  CONSTRAINT `FK_farmer_image_id` FOREIGN KEY (`image_id_no`) REFERENCES `m_image` (`id`),
  CONSTRAINT `app_bank_branch_fk` FOREIGN KEY (`bank_branch_id`) REFERENCES `app_banks_branches` (`id`),
  CONSTRAINT `app_farmers_FK` FOREIGN KEY (`image_atm_card`) REFERENCES `m_image` (`id`),
  CONSTRAINT `app_farmers_FK_1` FOREIGN KEY (`submitted_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `app_farmers_FK_2` FOREIGN KEY (`region_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers`
--

LOCK TABLES `app_farmers` WRITE;
/*!40000 ALTER TABLE `app_farmers` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_change_history`
--

DROP TABLE IF EXISTS `app_farmers_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reject_reason_id` int(11) NOT NULL,
  `farmer_id` bigint(20) NOT NULL,
  `change_wef` date NOT NULL,
  `change_wet` date DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB048ECB90` (`reject_reason_id`),
  KEY `app_reasons_for_change` (`updated_by`),
  CONSTRAINT `FK8DEDB048ECB90` FOREIGN KEY (`reject_reason_id`) REFERENCES `app_reasons_for_change` (`id`),
  CONSTRAINT `FK_updated_bytest_id` FOREIGN KEY (`updated_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_change_history`
--

LOCK TABLES `app_farmers_change_history` WRITE;
/*!40000 ALTER TABLE `app_farmers_change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_contract_signing`
--

DROP TABLE IF EXISTS `app_farmers_contract_signing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_contract_signing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(50) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `crop_date_id` bigint(20) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `farmer_id` bigint(20) NOT NULL,
  `contract_date` date DEFAULT NULL,
  `units` bigint(20) NOT NULL,
  `contract_seq_id` bigint(20) DEFAULT NULL,
  `contract_progress` varchar(1) DEFAULT NULL,
  `recruitment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contract_crop_dates` (`crop_date_id`),
  KEY `app_farmers_contract_signing_app_farmers_fk` (`farmer_id`),
  KEY `FK_recruitment_id` (`recruitment_id`),
  CONSTRAINT `FK_contract_crop_dates` FOREIGN KEY (`crop_date_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `FK_recruitment_id` FOREIGN KEY (`recruitment_id`) REFERENCES `app_farmers_recruitment` (`id`),
  CONSTRAINT `app_farmers_contract_signing_app_farmers_fk` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_contract_signing`
--

LOCK TABLES `app_farmers_contract_signing` WRITE;
/*!40000 ALTER TABLE `app_farmers_contract_signing` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_contract_signing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_crop_walk`
--

DROP TABLE IF EXISTS `app_farmers_crop_walk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_crop_walk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crop_date_id` bigint(20) NOT NULL,
  `farmer_id` bigint(20) NOT NULL,
  `centre_id` bigint(20) NOT NULL,
  `done_by` bigint(20) NOT NULL,
  `parameter_id` bigint(20) NOT NULL,
  `crop_stage` bigint(20) NOT NULL,
  `value` varchar(200) NOT NULL,
  `done_date` date DEFAULT NULL,
  `units` decimal(23,5) DEFAULT NULL,
  `other` varchar(400) DEFAULT NULL,
  `comment` varchar(400) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contracrop_dates015_FK` (`crop_date_id`),
  KEY `FK_cont_crop_das015_FK` (`farmer_id`),
  KEY `FK_app_far_centre_id` (`centre_id`),
  KEY `FK_contt_crop_das5_FK` (`done_by`),
  KEY `FK_parameter_id` (`parameter_id`),
  KEY `FK_crop_stage_id` (`crop_stage`),
  KEY `app_farmers_crop_walk_FK` (`image_id`),
  CONSTRAINT `FK_app_far_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK_cont_crop_das015_FK` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `FK_contracrop_dates015_FK` FOREIGN KEY (`crop_date_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `FK_contt_crop_das5_FK` FOREIGN KEY (`done_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK_crop_stage_id` FOREIGN KEY (`crop_stage`) REFERENCES `m_crop_walk_parameter` (`id`),
  CONSTRAINT `FK_parameter_id` FOREIGN KEY (`parameter_id`) REFERENCES `m_crop_walk_parameter` (`id`),
  CONSTRAINT `app_farmers_crop_walk_FK` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_crop_walk`
--

LOCK TABLES `app_farmers_crop_walk` WRITE;
/*!40000 ALTER TABLE `app_farmers_crop_walk` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_crop_walk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_harvesting`
--

DROP TABLE IF EXISTS `app_farmers_harvesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_harvesting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crop_date_id` bigint(20) NOT NULL,
  `farmer_id` bigint(20) NOT NULL,
  `done_by` bigint(20) NOT NULL,
  `kilos_per_unit` decimal(23,5) DEFAULT NULL,
  `harvest_kilo` decimal(23,5) DEFAULT NULL,
  `harvest_date` date DEFAULT NULL,
  `contract_id` bigint(20) DEFAULT NULL,
  `units` decimal(23,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contract_crop_dates015_FK` (`crop_date_id`),
  KEY `FK_contract_crop_das015_FK` (`farmer_id`),
  KEY `FK_contract_crop_das5_FK` (`done_by`),
  KEY `FK_harvest_contract_id` (`contract_id`),
  CONSTRAINT `FK_contract_crop_das015_FK` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `FK_contract_crop_das5_FK` FOREIGN KEY (`done_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK_contract_crop_dates015_FK` FOREIGN KEY (`crop_date_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `FK_harvest_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `app_farmers_contract_signing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_harvesting`
--

LOCK TABLES `app_farmers_harvesting` WRITE;
/*!40000 ALTER TABLE `app_farmers_harvesting` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_harvesting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_inventory_item`
--

DROP TABLE IF EXISTS `app_farmers_inventory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_inventory_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inv_item_sht_desc` varchar(50) NOT NULL,
  `inv_item_desc` varchar(100) NOT NULL,
  `uom_id` bigint(20) DEFAULT NULL,
  `packaging_type_id` bigint(20) DEFAULT NULL,
  `conversion_factor` decimal(7,2) DEFAULT NULL,
  `quantity` decimal(7,2) DEFAULT NULL,
  `inv_type_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uom_id` (`uom_id`),
  KEY `packaging_type_id` (`packaging_type_id`),
  KEY `inv_type_id` (`inv_type_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `app_farmers_inventory_item_ibfk_1` FOREIGN KEY (`uom_id`) REFERENCES `app_farmers_unit_of_measure` (`id`),
  CONSTRAINT `app_farmers_inventory_item_ibfk_2` FOREIGN KEY (`packaging_type_id`) REFERENCES `app_farmers_packaging_types` (`id`),
  CONSTRAINT `app_farmers_inventory_item_ibfk_3` FOREIGN KEY (`inv_type_id`) REFERENCES `app_farmers_inventory_types` (`id`),
  CONSTRAINT `app_farmers_inventory_item_ibfk_4` FOREIGN KEY (`store_id`) REFERENCES `app_farmers_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_inventory_item`
--

LOCK TABLES `app_farmers_inventory_item` WRITE;
/*!40000 ALTER TABLE `app_farmers_inventory_item` DISABLE KEYS */;
INSERT INTO `app_farmers_inventory_item` VALUES (5,'AE001','Organdi Seeds 1900',3,2,5.00,95070.00,2,3),(6,'AE002','DAP 500',3,2,5.00,95070.00,4,3),(7,'Oshothane','Oshothane Plus WG',6,3,100.00,286.00,5,3),(8,'Agrithane','Agrithane',6,3,1.00,50000.00,5,3),(9,'Synergizer','Synergizer',5,3,1.00,1300.00,5,3),(10,'Triger','Triger 5EC',7,3,100.00,1000.00,5,3),(11,'Click','Click 20SL',7,3,100.00,979.00,5,3),(12,'Equation','Equation Pro',6,3,1000.00,1000.00,5,3),(13,'Iprode','Iprode',7,3,1000.00,1000.00,5,3),(14,'Knock','Knock bectin',7,3,1000.00,1000.00,5,3);
/*!40000 ALTER TABLE `app_farmers_inventory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_inventory_types`
--

DROP TABLE IF EXISTS `app_farmers_inventory_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_inventory_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inv_types_sht_desc` varchar(50) NOT NULL,
  `inv_types_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_inventory_types`
--

LOCK TABLES `app_farmers_inventory_types` WRITE;
/*!40000 ALTER TABLE `app_farmers_inventory_types` DISABLE KEYS */;
INSERT INTO `app_farmers_inventory_types` VALUES (2,'SEED','SEED'),(4,'FERT','FERTILIZER'),(5,'CHEMICAL','CHEMICAL');
/*!40000 ALTER TABLE `app_farmers_inventory_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_packaging`
--

DROP TABLE IF EXISTS `app_farmers_packaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_packaging` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farming_type` varchar(100) NOT NULL,
  `recruitment_unit` int(11) NOT NULL,
  `with_effect_from` datetime NOT NULL,
  `with_effect_to` datetime DEFAULT NULL,
  `crop_product_id` bigint(20) DEFAULT NULL,
  `packaging_type` varchar(1) DEFAULT 'P',
  `region_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crop_product_id` (`crop_product_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `app_farmers_packaging_ibfk_1` FOREIGN KEY (`crop_product_id`) REFERENCES `app_plant_products` (`id`),
  CONSTRAINT `app_farmers_packaging_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_packaging`
--

LOCK TABLES `app_farmers_packaging` WRITE;
/*!40000 ALTER TABLE `app_farmers_packaging` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_packaging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_packaging_inventory`
--

DROP TABLE IF EXISTS `app_farmers_packaging_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_packaging_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `planting_id` bigint(20) DEFAULT NULL,
  `inventory_items_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `planting_id` (`planting_id`),
  KEY `inventory_items_id` (`inventory_items_id`),
  CONSTRAINT `app_farmers_packaging_inventory_ibfk_1` FOREIGN KEY (`planting_id`) REFERENCES `app_farmers_packaging` (`id`),
  CONSTRAINT `app_farmers_packaging_inventory_ibfk_2` FOREIGN KEY (`inventory_items_id`) REFERENCES `app_farmers_inventory_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_packaging_inventory`
--

LOCK TABLES `app_farmers_packaging_inventory` WRITE;
/*!40000 ALTER TABLE `app_farmers_packaging_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_packaging_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_packaging_types`
--

DROP TABLE IF EXISTS `app_farmers_packaging_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_packaging_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pt_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_packaging_types`
--

LOCK TABLES `app_farmers_packaging_types` WRITE;
/*!40000 ALTER TABLE `app_farmers_packaging_types` DISABLE KEYS */;
INSERT INTO `app_farmers_packaging_types` VALUES (2,'Bag'),(3,'Bottle'),(4,'Packet'),(5,'Gurney Bags'),(6,'Sachets');
/*!40000 ALTER TABLE `app_farmers_packaging_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_plant_requisition`
--

DROP TABLE IF EXISTS `app_farmers_plant_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_plant_requisition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `requisition_date` datetime NOT NULL,
  `authorization_date` datetime DEFAULT NULL,
  `authorization_by` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `crop_dates_id` bigint(20) DEFAULT NULL,
  `requisition_number` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crop_dates_id_ibfk_2` (`crop_dates_id`),
  KEY `created_by_ibfk_2` (`created_by`),
  KEY `authorization_by_ibfk_2` (`authorization_by`),
  CONSTRAINT `authorization_by_ibfk_2` FOREIGN KEY (`authorization_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `created_by_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `crop_dates_id_ibfk_2` FOREIGN KEY (`crop_dates_id`) REFERENCES `app_crop_dates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_plant_requisition`
--

LOCK TABLES `app_farmers_plant_requisition` WRITE;
/*!40000 ALTER TABLE `app_farmers_plant_requisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_plant_requisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_recruitment`
--

DROP TABLE IF EXISTS `app_farmers_recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_recruitment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `land_ownership` varchar(1) NOT NULL,
  `centre_id` bigint(20) NOT NULL,
  `cordinates` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `total_units` int(11) NOT NULL,
  `farmer_id` bigint(20) DEFAULT NULL,
  `recruited_date` datetime NOT NULL,
  `recruited_by` bigint(20) DEFAULT NULL,
  `land_section` varchar(1) DEFAULT NULL,
  `planting_date_id` bigint(20) DEFAULT NULL,
  `crop_id` bigint(20) DEFAULT NULL,
  `recruit_status` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `FK_app_farmer_centre_id` (`centre_id`),
  KEY `FK_app_farmer_farmer_id` (`farmer_id`),
  KEY `FK_app_recruited_by` (`recruited_by`),
  KEY `FK_app_planting_date` (`planting_date_id`),
  KEY `FK_m_recruitment_crop_id` (`crop_id`),
  CONSTRAINT `FK_app_farmer_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK_app_farmer_farmer_id` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `FK_app_planting_date` FOREIGN KEY (`planting_date_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `FK_app_recruited_by` FOREIGN KEY (`recruited_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK_m_recruitment_crop_id` FOREIGN KEY (`crop_id`) REFERENCES `app_plant_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_recruitment`
--

LOCK TABLES `app_farmers_recruitment` WRITE;
/*!40000 ALTER TABLE `app_farmers_recruitment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_spray_requisition`
--

DROP TABLE IF EXISTS `app_farmers_spray_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_spray_requisition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `requisition_date` datetime NOT NULL,
  `authorization_date` datetime DEFAULT NULL,
  `authorization_by` bigint(20) DEFAULT NULL,
  `spray_program_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `crop_dates_id` bigint(20) DEFAULT NULL,
  `requisition_number` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crop_dates_d_ibfk_2` (`crop_dates_id`),
  KEY `created_by_bfk_2` (`created_by`),
  KEY `authorization_by_bfk_2` (`authorization_by`),
  KEY `spray_program_ibfk_2` (`spray_program_id`),
  CONSTRAINT `authorization_by_bfk_2` FOREIGN KEY (`authorization_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `created_by_bfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `crop_dates_d_ibfk_2` FOREIGN KEY (`crop_dates_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `spray_program_ibfk_2` FOREIGN KEY (`spray_program_id`) REFERENCES `app_spray_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_spray_requisition`
--

LOCK TABLES `app_farmers_spray_requisition` WRITE;
/*!40000 ALTER TABLE `app_farmers_spray_requisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_spray_requisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_spray_requisition_dtls`
--

DROP TABLE IF EXISTS `app_farmers_spray_requisition_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_spray_requisition_dtls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prd_requistion_id` bigint(20) DEFAULT NULL,
  `quantity` decimal(7,2) DEFAULT NULL,
  `recruited_units` decimal(7,2) DEFAULT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  `inventory_item_id` bigint(20) DEFAULT NULL,
  `received_qty` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prd_requistion_id` (`prd_requistion_id`),
  KEY `centre_id` (`centre_id`),
  KEY `inventory_item_id` (`inventory_item_id`),
  CONSTRAINT `app_farmers_inventory_item_i_4` FOREIGN KEY (`inventory_item_id`) REFERENCES `app_farmers_inventory_item` (`id`),
  CONSTRAINT `app_farmers_requistio_ibfk_1` FOREIGN KEY (`prd_requistion_id`) REFERENCES `app_farmers_spray_requisition` (`id`),
  CONSTRAINT `m_hierachy_object_ibf3` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_spray_requisition_dtls`
--

LOCK TABLES `app_farmers_spray_requisition_dtls` WRITE;
/*!40000 ALTER TABLE `app_farmers_spray_requisition_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmers_spray_requisition_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_store`
--

DROP TABLE IF EXISTS `app_farmers_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_sht_desc` varchar(50) NOT NULL,
  `store_desc` varchar(100) NOT NULL,
  `store_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_store`
--

LOCK TABLES `app_farmers_store` WRITE;
/*!40000 ALTER TABLE `app_farmers_store` DISABLE KEYS */;
INSERT INTO `app_farmers_store` VALUES (3,'MAIN STORE','MAIN STORE','main store'),(4,'SAGANA','SAGANA STORE','sub store');
/*!40000 ALTER TABLE `app_farmers_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmers_unit_of_measure`
--

DROP TABLE IF EXISTS `app_farmers_unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_farmers_unit_of_measure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uom_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmers_unit_of_measure`
--

LOCK TABLES `app_farmers_unit_of_measure` WRITE;
/*!40000 ALTER TABLE `app_farmers_unit_of_measure` DISABLE KEYS */;
INSERT INTO `app_farmers_unit_of_measure` VALUES (3,'KG'),(5,'Litres'),(6,'gms'),(7,'mls');
/*!40000 ALTER TABLE `app_farmers_unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fertilizers`
--

DROP TABLE IF EXISTS `app_fertilizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fertilizers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sht_desc` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sht_desc` (`sht_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fertilizers`
--

LOCK TABLES `app_fertilizers` WRITE;
/*!40000 ALTER TABLE `app_fertilizers` DISABLE KEYS */;
INSERT INTO `app_fertilizers` VALUES (6,'Dap','DAP'),(8,'NPK','NPK');
/*!40000 ALTER TABLE `app_fertilizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_group_account_details`
--

DROP TABLE IF EXISTS `app_group_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_group_account_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(100) NOT NULL,
  `bank_id` bigint(20) NOT NULL,
  `account_doc_id` bigint(20) DEFAULT NULL,
  `account_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DE3DB04815CECTAB` (`bank_id`),
  KEY `FK8DEDB03481048B544B` (`account_doc_id`),
  KEY `FK8DEDB3481048B544G` (`account_group_id`),
  CONSTRAINT `FK8DE3DB04815CECTAB` FOREIGN KEY (`bank_id`) REFERENCES `app_banks` (`id`),
  CONSTRAINT `FK8DEDB03481048B544B` FOREIGN KEY (`account_doc_id`) REFERENCES `m_image` (`id`),
  CONSTRAINT `FK8DEDB3481048B544G` FOREIGN KEY (`account_group_id`) REFERENCES `app_contract_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_group_account_details`
--

LOCK TABLES `app_group_account_details` WRITE;
/*!40000 ALTER TABLE `app_group_account_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_group_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_group_centres`
--

DROP TABLE IF EXISTS `app_group_centres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_group_centres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fc_centre_id` bigint(20) NOT NULL,
  `fc_group_id` bigint(20) NOT NULL,
  `fc_wef` date NOT NULL,
  `fc_wet` date DEFAULT NULL,
  `fc_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB0815CFCTAB` (`fc_centre_id`),
  KEY `FK8DEDB031048F544B` (`fc_group_id`),
  CONSTRAINT `FK8DEDB031048F544B` FOREIGN KEY (`fc_group_id`) REFERENCES `app_contract_groups` (`id`),
  CONSTRAINT `FK8DEDB0815CFCTAB` FOREIGN KEY (`fc_centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_group_centres`
--

LOCK TABLES `app_group_centres` WRITE;
/*!40000 ALTER TABLE `app_group_centres` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_group_centres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_harvest_blocks`
--

DROP TABLE IF EXISTS `app_harvest_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_harvest_blocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `harvest_kilos` decimal(23,5) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DE048ECe7AB34` (`block_id`),
  KEY `FK8DEDeeBy0REC7AB334` (`created_by`),
  CONSTRAINT `FK8DE048ECe7AB34` FOREIGN KEY (`block_id`) REFERENCES `app_plant_blocks` (`id`),
  CONSTRAINT `FK8DEDeeBy0REC7AB334` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_harvest_blocks`
--

LOCK TABLES `app_harvest_blocks` WRITE;
/*!40000 ALTER TABLE `app_harvest_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_harvest_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_irrigate_block`
--

DROP TABLE IF EXISTS `app_irrigate_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_irrigate_block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `irrigation_hours` decimal(23,5) NOT NULL,
  `cubic_litres` decimal(23,5) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DE048Ee7AB34` (`block_id`),
  KEY `FK8DEDeeBy0REC7B334` (`created_by`),
  CONSTRAINT `FK8DE048Ee7AB34` FOREIGN KEY (`block_id`) REFERENCES `app_plant_blocks` (`id`),
  CONSTRAINT `FK8DEDeeBy0REC7B334` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_irrigate_block`
--

LOCK TABLES `app_irrigate_block` WRITE;
/*!40000 ALTER TABLE `app_irrigate_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_irrigate_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_jobs`
--

DROP TABLE IF EXISTS `app_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `cron_expression` varchar(20) CHARACTER SET latin1 NOT NULL,
  `create_time` datetime NOT NULL,
  `task_priority` smallint(6) NOT NULL DEFAULT '5',
  `group_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `previous_run_start_time` datetime DEFAULT NULL,
  `next_run_time` datetime DEFAULT NULL,
  `job_key` varchar(500) DEFAULT NULL,
  `initializing_errorlog` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `currently_running` tinyint(1) NOT NULL DEFAULT '0',
  `updates_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `scheduler_group` smallint(2) NOT NULL DEFAULT '0',
  `is_misfired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_jobs`
--

LOCK TABLES `app_jobs` WRITE;
/*!40000 ALTER TABLE `app_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_permissions`
--

DROP TABLE IF EXISTS `app_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grouping` varchar(45) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `entity_name` varchar(100) DEFAULT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `can_maker_checker` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_permissions`
--

LOCK TABLES `app_permissions` WRITE;
/*!40000 ALTER TABLE `app_permissions` DISABLE KEYS */;
INSERT INTO `app_permissions` VALUES (1,'special','ALL_FUNCTIONS',NULL,NULL,0),(38,'special','READ_BANKS','BANKS','READ',0),(39,'special','CREATE_BANKS','BANKS','CREATE',0),(40,'special','READ_FARMER','FARMER','READ',0),(41,'special','READ_DOCUMENTTYPES','DOCUMENTTYPES','READ',0),(42,'special','READ_FARMERCENTRE','FARMERCENTRE','READ',0),(43,'special','READ_REASONSCHANGE','REASONSCHANGE','READ',0),(44,'special','CREATE_FARMERCENTRE','FARMERCENTRE','CREATE',0),(45,'special','CREATE_DOCUMENTTYPES','DOCUMENTTYPES','CREATE',0),(46,'special','DELETE_DOCUMENTTYPES','DOCUMENTTYPES','DELETE',0),(47,'special','UPDATE_DOCUMENTTYPES','DOCUMENTTYPES','UPDATE',0),(48,'special','ACTIVATE_FARMER','FARMER','ACTIVATE',0),(49,'special','APPROVE_FARMER','FARMER','APPROVE',0),(50,'special','BLACKLIST_FARMER','FARMER','BLACKLIST',0),(51,'special','CREATE_FARMER','FARMER','CREATE',0),(52,'special','UPDATE_FARMER','FARMER','UPDATE',0),(53,'special','REJECT_FARMER','FARMER','REJECT',0),(54,'special','CREATE_REASONSCHANGE','REASONSCHANGE','CREATE',0),(55,'special','RECRUIT_FARMERRECRUITMENT','FARMERRECRUITMENT','RECRUIT',0),(56,'special','READ_CAPTURECROPDESTRUCTION','CAPTURECROPDESTRUCTION','READ',0),(57,'special','CREATE_CAPTURECROPDESTRUCTION','CAPTURECROPDESTRUCTION','CREATE',0),(58,'special','DELETE_CAPTURECROPDESTRUCTION','CAPTURECROPDESTRUCTION','DELETE',0),(59,'special','UPDATE_CAPTURECROPDESTRUCTION','CAPTURECROPDESTRUCTION','UPDATE',0),(60,'special','READ_HIERACHYLOCATION','HIERACHYLOCATION','READ',0),(61,'special','CREATE_HIERACHYLOCATION','HIERACHYLOCATION','CREATE',0),(62,'special','CREATE_HIERACHY','HIERACHY','CREATE',0),(63,'special','UPDATE_HIERACHY','HIERACHY','UPDATE',0),(64,'special','UPDATE_HIERACHYLOCATION','HIERACHYLOCATION','UPDATE',0),(65,'special','READ_CROPDESTRUCTIONREASONS','CROPDESTRUCTIONREASONS','READ',0),(66,'special','READ_CONTRACT_SIGNING','CONTRACT_SIGNING','READ',0),(67,'special','CREATE_CROPDESTRUCTIONREASONS','CROPDESTRUCTIONREASONS','CREATE',0),(68,'special','DELETE_CROPDESTRUCTIONREASONS','CROPDESTRUCTIONREASONS','DELETE',0),(69,'special','UPDATE_CROPDESTRUCTIONREASONS','CROPDESTRUCTIONREASONS','UPDATE',0),(70,'special','CREATE_CONTRACTSIGNING','CONTRACTSIGNING','CREATE',0),(71,'special','DELETE_CONTRACTSIGNING','CONTRACTSIGNING','DELETE',0),(72,'special','UPDATE_CONTRACTSIGNING','CONTRACTSIGNING','UPDATE',0),(73,'special','READ_FARMERACCOUNTS','FARMERACCOUNTS','READ',0),(74,'special','READ_FARMERSDOCUMENTS','FARMERSDOCUMENTS','READ',0),(75,'special','READ_FARMERRECRUITMENT','FARMERRECRUITMENT','READ',0),(77,'special','READ_CLIENTNOTE','CLIENTNOTE','READ',0),(78,'special','CREATE_CLIENTNOTE','CLIENTNOTE','CREATE',0),(79,'special','DELETE_CLIENTNOTE','CLIENTNOTE','DELETE',0),(81,'special','READ_PLANTREQUISITION','PLANTREQUISITION','READ',0),(82,'special','APPROVE_PLANTREQUISITION','PLANTREQUISITION','APPROVE',0),(83,'special','CREATE_PLANTREQUISITION','PLANTREQUISITION','CREATE',0),(84,'special','READ_REGISTEREDFARMERREPORT','REGISTEREDFARMERREPORT','READ',0),(85,'special','READ_RECRUITEDFARMERREPORT','RECRUITEDFARMERREPORT','READ',0),(87,'special','READ_UNITOFMEASURE','UNITOFMEASURE','READ',0),(88,'special','CREATE_UNITOFMEASURE','UNITOFMEASURE','CREATE',0),(89,'special','DELETE_UNITOFMEASURE','UNITOFMEASURE','DELETE',0),(90,'special','UPDATE_UNITOFMEASURE','UNITOFMEASURE','UPDATE',0),(91,'special','READ_PACKAGINGTYPE','PACKAGINGTYPE','READ',0),(92,'special','READ_HIERACHYTYPES','HIERACHYTYPES','READ',0),(93,'special','READ_PLANTINGPACKAGE','PLANTINGPACKAGE','READ',0),(94,'special','CREATE_PLANTINGPACKAGE','PLANTINGPACKAGE','CREATE',0),(95,'special','UPDATE_PLANTINGPACKAGE','PLANTINGPACKAGE','UPDATE',0),(96,'special','DELETE_PLANTINGPACKAGE','PLANTINGPACKAGE','DELETE',0),(97,'special','READ_CROPDATES','CROPDATES','READ',0),(98,'special','READ_STORES','STORE','READ',0),(99,'special','CREATE_STORES','STORE','CREATE',0),(100,'special','UPDATE_STORES','STORE','UPDATE',0),(101,'special','DELETE_STORES','STORE','DELETE',0),(102,'special','READ_INVENTORYITEM','INVENTORYITEM','READ',0),(103,'special','CREATE_INVENTORYITEM','INVENTORYITEM','CREATE',0),(104,'special','DELETE_INVENTORYITEM','INVENTORYITEM','DELETE',0),(105,'special','UPDATE_INVENTORYITEM','INVENTORYITEM','UPDATE',0),(106,'special','READ_INVENTORYTYPES','INVENTORYTYPES','READ',0),(107,'special','CREATE_INVENTORYTYPES','INVENTORYTYPES','CREATE',0),(108,'special','DELETE_INVENTORYTYPES','INVENTORYTYPES','DELETE',0),(109,'special','UPDATE_INVENTORYTYPES','INVENTORYTYPES','UPDATE',0),(111,'special','READ_CROPPRODUCTS','CROPPRODUCTS','READ',0),(112,'special','CREATE_CROPPRODUCTS','CROPPRODUCTS','CREATE',0),(113,'special','READ_PRODUCTVARIETY','PRODUCTVARIETY','READ',0),(114,'special','DELETE_CROPPRODUCTS','CROPPRODUCTS','DELETE',0),(115,'special','CREATE_PRODUCTVARIETY','PRODUCTVARIETY','CREATE',0),(116,'special','UPDATE_CROPPRODUCTS','CROPPRODUCTS','UPDATE',0),(117,'special','UPDATE_PRODUCTVARIETY','PRODUCTVARIETY','UPDATE',0),(118,'special','CREATE_CROPDATES','CROPDATES','CREATE',0),(119,'special','UPDATE_CROPDATES','CROPDATES','UPDATE',0),(120,'special','CREATE_PACKAGECENTRE','PACKAGECENTRE','CREATE',0),(121,'special','UPDATE_PACKAGECENTRE','PACKAGECENTRE','UPDATE',0),(122,'special','DELETE_PACKAGECENTRE','PACKAGECENTRE','DELETE',0),(123,'special','READ_FARMER_MOBILE','FARMER_MOBILE','READ',0),(124,'special','CREATE_FARMER_MOBILE','FARMER_MOBILE','CREATE',0),(125,'special','RECRUIT_FARMER_MOBILE','FARMER_MOBILE','RECRUIT',0),(126,'special','CONTRACT_FARMER_MOBILE','FARMER_MOBILE','CONTRACT',0),(127,'special','APPROVE_FARMERRECRUITMENT','FARMERRECRUITMENT','APPROVE',0),(130,'special','CREATE_PLANTBLOCK','PLANTBLOCK','CREATE',0),(131,'special','READ_PLANTBLOCK','PLANTBLOCK','READ',0),(132,'special','CREATE_HARVESTBLOCK','HARVESTBLOCK','CREATE',0),(133,'special','READ_HARVESTBLOCK','HARVESTBLOCK','READ',0),(134,'special','READ_IRRIGATEBLOCK','IRRIGATEBLOCK','READ',0),(135,'special','CREATE_IRRIGATEBLOCK','IRRIGATEBLOCK','CREATE',0),(136,'special','READ_APPLYFERTILIZER','APPLYFERTILIZER','READ',0),(137,'special','CREATE_APPLYFERTILIZER','APPLYFERTILIZER','CREATE',0),(138,'special','READ_SCOUTMONITOR','SCOUTMONITOR','READ',0),(139,'special','CREATE_SCOUTMONITOR','SCOUTMONITOR','CREATE',0),(140,'report','READ_Farmer Recruitment Report','Farmer Recruitment Report','READ',0),(141,'report','READ_Contracts Signed','Contracts Signed','READ',0),(142,'report','READ_Plantings Verified','Plantings Verified','READ',0),(143,'special','READ_REPORT','REPORT','READ',0),(144,'special','REPORTING_SUPER_USER',NULL,NULL,0),(145,'special','READ_Farmer Registration Report',NULL,NULL,0),(146,'report','READ_Harvest Collection','Harvest Collection','READ',0);
/*!40000 ALTER TABLE `app_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_plant_blocks`
--

DROP TABLE IF EXISTS `app_plant_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plant_blocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bags_planted` bigint(11) DEFAULT NULL,
  `seed_rate` varchar(50) NOT NULL,
  `bag_lot_no` bigint(11) DEFAULT NULL,
  `cordinates` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `variety_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB048ECe7AB34` (`block_id`),
  KEY `FK8DEDB048EC7AB3334` (`variety_id`),
  KEY `FK8DEDBy0REC7AB334` (`created_by`),
  CONSTRAINT `FK8DEDB048EC7AB3334` FOREIGN KEY (`variety_id`) REFERENCES `app_farm_plant_varieties` (`id`),
  CONSTRAINT `FK8DEDB048ECe7AB34` FOREIGN KEY (`block_id`) REFERENCES `app_farm_registration_areas` (`id`),
  CONSTRAINT `FK8DEDBy0REC7AB334` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_plant_blocks`
--

LOCK TABLES `app_plant_blocks` WRITE;
/*!40000 ALTER TABLE `app_plant_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plant_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_plant_centre_stock`
--

DROP TABLE IF EXISTS `app_plant_centre_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plant_centre_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(7,2) DEFAULT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  `inventory_item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `centre_id` (`centre_id`),
  KEY `inventory_item_id` (`inventory_item_id`),
  CONSTRAINT `app_farmers_invtory_item_ib_4` FOREIGN KEY (`inventory_item_id`) REFERENCES `app_farmers_inventory_item` (`id`),
  CONSTRAINT `m_hierachy_ject_ibfk_3` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_plant_centre_stock`
--

LOCK TABLES `app_plant_centre_stock` WRITE;
/*!40000 ALTER TABLE `app_plant_centre_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plant_centre_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_plant_products`
--

DROP TABLE IF EXISTS `app_plant_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plant_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_sht_desc` varchar(30) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_frequency` varchar(30) DEFAULT NULL,
  `prod_frequency_type` varchar(30) DEFAULT NULL,
  `prod_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_plant_products`
--

LOCK TABLES `app_plant_products` WRITE;
/*!40000 ALTER TABLE `app_plant_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plant_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_plant_requisition_dtls`
--

DROP TABLE IF EXISTS `app_plant_requisition_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plant_requisition_dtls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prd_requistion_id` bigint(20) DEFAULT NULL,
  `quantity` decimal(7,2) DEFAULT NULL,
  `recruited_units` decimal(7,2) DEFAULT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  `inventory_item_id` bigint(20) DEFAULT NULL,
  `received_qty` decimal(7,2) DEFAULT NULL,
  `recruitment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prd_requistion_id` (`prd_requistion_id`),
  KEY `centre_id` (`centre_id`),
  KEY `inventory_item_id` (`inventory_item_id`),
  KEY `FK_req_recruitment_id` (`recruitment_id`),
  CONSTRAINT `FK_req_recruitment_id` FOREIGN KEY (`recruitment_id`) REFERENCES `app_farmers_recruitment` (`id`),
  CONSTRAINT `app_farmers_inventory_item_ib_4` FOREIGN KEY (`inventory_item_id`) REFERENCES `app_farmers_inventory_item` (`id`),
  CONSTRAINT `app_farmers_requistion_ibfk_1` FOREIGN KEY (`prd_requistion_id`) REFERENCES `app_farmers_plant_requisition` (`id`),
  CONSTRAINT `m_hierachy_object_ibfk_3` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_plant_requisition_dtls`
--

LOCK TABLES `app_plant_requisition_dtls` WRITE;
/*!40000 ALTER TABLE `app_plant_requisition_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plant_requisition_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_planting_verification`
--

DROP TABLE IF EXISTS `app_planting_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_planting_verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) NOT NULL,
  `cordinates` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `planting_confirmed` varchar(1) NOT NULL,
  `watering_confirmed` varchar(1) NOT NULL,
  `verified_on` datetime DEFAULT NULL,
  `verified_by` bigint(20) NOT NULL,
  `confirmed_units` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDY48EC7AB` (`contract_id`),
  KEY `verified_by` (`verified_by`),
  CONSTRAINT `FK8DEDY48EC7AB` FOREIGN KEY (`contract_id`) REFERENCES `app_farmers_contract_signing` (`id`),
  CONSTRAINT `app_planting_verification_ibfk_1` FOREIGN KEY (`verified_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_planting_verification`
--

LOCK TABLES `app_planting_verification` WRITE;
/*!40000 ALTER TABLE `app_planting_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_planting_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_population_types`
--

DROP TABLE IF EXISTS `app_population_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_population_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `atp_population_type` varchar(50) NOT NULL,
  `atp_min_age` int(6) NOT NULL,
  `atp_max_age` int(6) NOT NULL,
  `atp_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB048EC7ABLA` (`atp_type_id`),
  CONSTRAINT `FK8DEDB048EC7ABLA` FOREIGN KEY (`atp_type_id`) REFERENCES `app_animal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_population_types`
--

LOCK TABLES `app_population_types` WRITE;
/*!40000 ALTER TABLE `app_population_types` DISABLE KEYS */;
INSERT INTO `app_population_types` VALUES (1,'Piglets',1,2,1),(2,'Weener',2,3,1),(4,'Piglet',3,5,1);
/*!40000 ALTER TABLE `app_population_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_product_varieties`
--

DROP TABLE IF EXISTS `app_product_varieties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_product_varieties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variety_sht_desc` varchar(30) NOT NULL,
  `variety_name` varchar(100) NOT NULL,
  `variety_product_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK8DEDB02815CETAB` (`variety_product_id`),
  CONSTRAINT `FK8DEDB02815CETAB` FOREIGN KEY (`variety_product_id`) REFERENCES `app_plant_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product_varieties`
--

LOCK TABLES `app_product_varieties` WRITE;
/*!40000 ALTER TABLE `app_product_varieties` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_product_varieties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_ptf_command_source`
--

DROP TABLE IF EXISTS `app_ptf_command_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_ptf_command_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(50) NOT NULL,
  `entity_name` varchar(50) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `api_get_url` varchar(100) NOT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `subresource_id` bigint(20) DEFAULT NULL,
  `command_as_json` text NOT NULL,
  `maker_id` bigint(20) NOT NULL,
  `made_on_date` datetime NOT NULL,
  `checker_id` bigint(20) DEFAULT NULL,
  `checked_on_date` datetime DEFAULT NULL,
  `processing_result_enum` smallint(5) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m_maker_m_appuser` (`maker_id`),
  KEY `FK_m_checker_m_appuser` (`checker_id`),
  KEY `action_name` (`action_name`),
  KEY `entity_name` (`entity_name`,`resource_id`),
  KEY `made_on_date` (`made_on_date`),
  KEY `checked_on_date` (`checked_on_date`),
  KEY `processing_result_enum` (`processing_result_enum`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `FK_m_checker_m_appuser` FOREIGN KEY (`checker_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK_m_maker_m_appuser` FOREIGN KEY (`maker_id`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_ptf_command_source`
--

LOCK TABLES `app_ptf_command_source` WRITE;
/*!40000 ALTER TABLE `app_ptf_command_source` DISABLE KEYS */;
INSERT INTO `app_ptf_command_source` VALUES (1,'CREATE','ROLE',NULL,'/roles/template',3,NULL,'{\"name\":\"ADD_USER\",\"description\":\"Add user to the system\"}',68,'2019-05-24 12:27:10',NULL,NULL,1,NULL),(2,'CREATE','CODE',NULL,'/codes/template',1,NULL,'{\"name\":\"Gender\"}',68,'2019-05-24 14:46:30',NULL,NULL,1,NULL),(3,'CREATE','CODEVALUE',NULL,'/codes/1/codevalues/template',1,NULL,'{\"isActive\":true,\"name\":\"Male\",\"description\":\"Male\",\"position\":\"1\"}',68,'2019-05-24 14:54:30',NULL,NULL,1,NULL),(4,'CREATE','CODEVALUE',NULL,'/codes/1/codevalues/template',1,NULL,'{\"isActive\":true,\"name\":\"Female\",\"description\":\"Female\",\"position\":\"2\"}',68,'2019-05-24 15:14:43',NULL,NULL,1,NULL),(5,'UPDATE','CACHE',NULL,'/cache',NULL,NULL,'{\"cacheType\":2}',68,'2019-05-25 21:33:30',NULL,NULL,1,NULL),(6,'UPDATE','CACHE',NULL,'/cache',NULL,NULL,'{\"cacheType\":1}',68,'2019-05-25 21:33:34',NULL,NULL,1,NULL),(7,'UPDATE','CACHE',NULL,'/cache',NULL,NULL,'{\"cacheType\":2}',68,'2019-05-25 21:33:36',NULL,NULL,1,NULL),(8,'UPDATE','CONFIGURATION',NULL,'/configurations/4',4,NULL,'{\"enabled\":true}',68,'2019-05-25 21:33:40',NULL,NULL,1,NULL),(9,'UPDATE','CONFIGURATION',NULL,'/configurations/4',4,NULL,'{\"enabled\":false}',68,'2019-05-25 21:33:41',NULL,NULL,1,NULL),(10,'UPDATE','CONFIGURATION',NULL,'/configurations/4',4,NULL,'{\"value\":2}',68,'2019-05-25 21:36:50',NULL,NULL,1,NULL),(11,'UPDATE','CONFIGURATION',NULL,'/configurations/4',4,NULL,'{\"value\":0}',68,'2019-05-25 21:36:56',NULL,NULL,1,NULL),(12,'UPDATE','CACHE',NULL,'/cache',NULL,NULL,'{\"cacheType\":1}',68,'2019-05-25 21:37:15',NULL,NULL,1,NULL),(13,'UPDATE','CACHE',NULL,'/cache',NULL,NULL,'{\"cacheType\":2}',68,'2019-05-25 21:37:17',NULL,NULL,1,NULL),(14,'CREATE','FARMER',NULL,'/farmerscapture',1,NULL,'{\"firstname\":\"Peter\",\"middlename\":\"Olingo\",\"lastname\":\"Mugenya\",\"idno\":\"21895632\",\"mobileno\":\"0720357230\",\"email\":\"pmugenya@gmail.com\",\"address\":\"2018-00100\\nNAIROBI\",\"active\":true,\"nextkin\":\"JAMES OMONDI OMOLLO\",\"nextkinmobile\":\"0720357230\",\"nextkinidno\":\"26776645\",\"gender\":\"M\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"17 July 2019\",\"dateRegistered\":\"17 July 2019\",\"dateOfBirth\":\"06 July 1992\"}',68,'2019-07-17 11:00:07',NULL,NULL,1,NULL),(15,'CREATE','FARMER',NULL,'/farmerscapture',2,NULL,'{\"firstname\":\"PAUL\",\"middlename\":\"OMONDI\",\"lastname\":\"OKELLO\",\"idno\":\"24335532\",\"mobileno\":\"0788932232\",\"email\":\"swmasinde@gmail.com\",\"address\":\"21897-00900\\nNAIROBI\",\"active\":true,\"nextkin\":\"JANE WANGARE\",\"nextkinmobile\":\"0720357230\",\"nextkinidno\":\"26776645\",\"gender\":\"M\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"17 July 2019\",\"dateRegistered\":\"17 July 2019\",\"dateOfBirth\":\"06 July 1992\"}',68,'2019-07-17 11:14:35',NULL,NULL,1,NULL),(16,'CREATE','OFFICE',NULL,'/offices/template',2,NULL,'{\"parentId\":1,\"name\":\"Region\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"19 July 2019\"}',68,'2019-07-19 13:05:43',NULL,NULL,1,NULL),(17,'CREATE','OFFICE',NULL,'/offices/template',3,NULL,'{\"parentId\":2,\"name\":\"Center\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"19 July 2019\"}',68,'2019-07-19 13:05:56',NULL,NULL,1,NULL),(18,'CREATE','OFFICE',NULL,'/offices/template',4,NULL,'{\"parentId\":1,\"name\":\"Region\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"19 July 2019\"}',68,'2019-07-19 13:13:57',NULL,NULL,1,NULL),(19,'CREATE','OFFICE',NULL,'/offices/template',5,NULL,'{\"parentId\":4,\"name\":\"Sub Region\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"19 July 2019\"}',68,'2019-07-19 15:43:59',NULL,NULL,1,NULL),(20,'CREATE','OFFICE',NULL,'/offices/template',6,NULL,'{\"parentId\":5,\"name\":\"Center\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"19 July 2019\"}',68,'2019-07-19 15:54:34',NULL,NULL,1,NULL),(21,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"farmer_account_details\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"acct_id\",\"type\":\"String\",\"mandatory\":false,\"length\":\"10\"},{\"name\":\"account_number\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"},{\"name\":\"bank_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"100\"}]}',68,'2019-07-20 21:20:14',NULL,NULL,1,NULL),(22,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"farmer_account_details\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"acct_id\",\"type\":\"String\",\"mandatory\":false,\"length\":\"100\"},{\"name\":\"branch_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"100\"},{\"name\":\"account_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"100\"}]}',68,'2019-07-20 21:33:50',NULL,NULL,1,NULL),(23,'UPDATE','PASSWORD_PREFERENCES',NULL,'/passwordpreferences',NULL,NULL,'{\"active\":true}',68,'2019-07-21 00:32:24',NULL,NULL,1,NULL),(24,'UPDATE','PASSWORD_PREFERENCES',NULL,'/passwordpreferences',NULL,NULL,'{\"active\":true}',68,'2019-07-21 00:32:35',NULL,NULL,1,NULL),(25,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"farmer_account_details\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"branch_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"},{\"name\":\"account_number\",\"type\":\"String\",\"mandatory\":false,\"length\":\"69\"}]}',68,'2019-07-21 13:05:50',NULL,NULL,1,NULL),(26,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"farmer_account_details\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"branch_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"},{\"name\":\"account_no\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"}]}',68,'2019-07-22 11:43:06',NULL,NULL,1,NULL),(27,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"farmer_account_details\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"account_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"},{\"name\":\"bank_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"},{\"name\":\"bank_branch_name\",\"type\":\"String\",\"mandatory\":false,\"length\":\"50\"}]}',68,'2019-07-22 11:59:21',NULL,NULL,1,NULL),(28,'CREATE','ENTITY_DATATABLE_CHECK',NULL,'/entityDatatableChecks/',1,NULL,'{\"entity\":\"app_farmers\",\"status\":100,\"datatableName\":\"farmer_account_details\"}',68,'2019-07-22 11:59:31',NULL,NULL,1,NULL),(29,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"IDENTITY DETAILS\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"ID TYPE\",\"type\":\"Dropdown\",\"mandatory\":false,\"code\":\"Gender\"},{\"name\":\"ID VALUE\",\"type\":\"String\",\"mandatory\":false,\"length\":\"80\"}]}',68,'2019-07-22 12:56:07',NULL,NULL,1,NULL),(30,'CREATE','DATATABLE',NULL,'/datatables/',NULL,NULL,'{\"datatableName\":\"IDENTITY DETAILS\",\"apptableName\":\"app_farmers\",\"multiRow\":false,\"columns\":[{\"name\":\"id type\",\"type\":\"String\",\"mandatory\":false,\"length\":\"80\"},{\"name\":\"id value\",\"type\":\"String\",\"mandatory\":false,\"length\":\"80\"}]}',68,'2019-07-22 12:57:38',NULL,NULL,1,NULL),(31,'CREATE','ENTITY_DATATABLE_CHECK',NULL,'/entityDatatableChecks/',2,NULL,'{\"entity\":\"app_farmers\",\"status\":100,\"datatableName\":\"IDENTITY DETAILS\"}',68,'2019-07-22 12:58:21',NULL,NULL,1,NULL),(32,'CREATE','OFFICE',NULL,'/offices/template',7,NULL,'{\"parentId\":6,\"name\":\"Makuthi\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"25 July 2019\"}',68,'2019-07-25 00:35:17',NULL,NULL,1,NULL),(33,'CREATE','OFFICE',NULL,'/offices/template',8,NULL,'{\"parentId\":5,\"name\":\"Makuthi\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"25 July 2019\"}',68,'2019-07-25 00:37:25',NULL,NULL,1,NULL),(34,'CREATE','FARMER',NULL,'/farmerscapture',3,NULL,'{\"datatables\":[{\"registeredTableName\":\"farmer_account_details\",\"data\":{\"locale\":\"en\",\"account_name\":\"ljlj\",\"bank_name\":\"lkjkj\",\"bank_branch_name\":\"jklj\"}},{\"registeredTableName\":\"IDENTITY DETAILS\",\"data\":{\"locale\":\"en\",\"id type\":\"ljlk\",\"id value\":\"lkj\"}}],\"firstname\":\"Elvis\",\"middlename\":\"Olingo\",\"lastname\":\"Kamau\",\"idno\":\"33444223\",\"email\":\"pmugenya@gmail.com\",\"gender\":\"M\",\"address\":\"08090\",\"centerid\":5,\"locale\":\"en\",\"active\":false,\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"25 July 2019\",\"dateRegistered\":\"25 July 2019\",\"dateOfBirth\":\"10 July 1986\",\"mobileno\":\"0745777666\"}',68,'2019-07-25 01:05:17',NULL,NULL,1,NULL),(35,'CREATE','FARMER',NULL,'/farmerscapture',4,NULL,'{\n	\"firstname\":\"Eliakim\",\n	\"middlename\":\"Omuga\",\n	\"lastname\": \"nduta\",\n	\"mobileno\":\"0720345098\",\n	\"email\":\"pmuge@gmail.com\",\n	\"gender\":\"M\",\n	\"idno\":\"25665465\",\n	\"dateOfBirth\":\"1990-09-04\",\n	\"activated\":\"true\",\n	\"centerid\":5,\n	\"dateFormat\":\"yyyy-MM-dd\",\n	\"locale\":\"en\"\n}',68,'2019-08-02 19:44:30',NULL,NULL,1,NULL),(36,'CREATE','FARMER',NULL,'/farmerscapture',5,NULL,'{\"firstname\":\"John\",\n	\"middlename\":\"Omuga\",\n	\"lastname\": \"Otieno\",\n	\"mobileno\":\"0720345098\",\n	\"email\":\"pmuge@gmail.com\",\n	\"gender\":\"M\",\n	\"idno\":\"25665485\",\n	\"dateOfBirth\":\"1990-09-04\",\n	\"activated\":\"true\",\n	\"centerid\":5,\n	\"dateFormat\":\"yyyy-MM-dd\",\n	\"locale\":\"en\",\n            \"accountdetails\": {\n                 \"accountno\": \"123456\",\n                 \"bankname\":\"AFC Bank\",\n                 \"image\":\"base64imagestring\"\n             },\n           \"identitydetails\":{\n                  \"documenttype\":\"ID\",\n                  \"image\":\"base64imagestring\"\n            }\n}',68,'2019-08-05 12:05:12',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `app_ptf_command_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_reasons_for_change`
--

DROP TABLE IF EXISTS `app_reasons_for_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_reasons_for_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_id` varchar(100) NOT NULL,
  `reason_desc` varchar(1000) NOT NULL,
  `reason_type` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reason_id` (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_reasons_for_change`
--

LOCK TABLES `app_reasons_for_change` WRITE;
/*!40000 ALTER TABLE `app_reasons_for_change` DISABLE KEYS */;
INSERT INTO `app_reasons_for_change` VALUES (1,'Rudeness','Was not able to submit details','B'),(2,'Good Behaviour','Good Behaviour','R'),(3,'zddd','ddd','B');
/*!40000 ALTER TABLE `app_reasons_for_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_requistion_temp`
--

DROP TABLE IF EXISTS `app_requistion_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_requistion_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `center_id` bigint(20) DEFAULT NULL,
  `cd_id` bigint(20) DEFAULT NULL,
  `recruited_units` int(11) DEFAULT NULL,
  `requistion_date` date DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `store_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DED2815CECTA5T` (`center_id`),
  KEY `FK8DEDB3810444BA4` (`cd_id`),
  KEY `FK8DEDB0381044BA4` (`type_id`),
  KEY `FK8DEDB381044BA4` (`store_id`),
  CONSTRAINT `FK8DED2815CECTA5T` FOREIGN KEY (`center_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK8DEDB0381044BA4` FOREIGN KEY (`type_id`) REFERENCES `app_farmers_inventory_types` (`id`),
  CONSTRAINT `FK8DEDB3810444BA4` FOREIGN KEY (`cd_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `FK8DEDB381044BA4` FOREIGN KEY (`store_id`) REFERENCES `app_farmers_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_requistion_temp`
--

LOCK TABLES `app_requistion_temp` WRITE;
/*!40000 ALTER TABLE `app_requistion_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_requistion_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role_permission`
--

DROP TABLE IF EXISTS `app_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK8DEDB04815CEC7AB` (`role_id`),
  KEY `FK8DEDB048103B544B` (`permission_id`),
  CONSTRAINT `FK8DEDB048103B544B` FOREIGN KEY (`permission_id`) REFERENCES `app_permissions` (`id`),
  CONSTRAINT `FK8DEDB04815CEC7AB` FOREIGN KEY (`role_id`) REFERENCES `app_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role_permission`
--

LOCK TABLES `app_role_permission` WRITE;
/*!40000 ALTER TABLE `app_role_permission` DISABLE KEYS */;
INSERT INTO `app_role_permission` VALUES (1,1),(3,38),(3,40),(3,97),(4,51),(4,123),(4,125),(4,126),(5,40),(5,42),(5,52),(5,73),(6,127),(7,1),(7,38),(7,40),(7,41),(7,42),(7,43),(7,44),(7,46),(7,48),(7,51),(7,52),(7,55),(7,60),(7,63),(7,64),(7,66),(7,70),(7,71),(7,72),(7,73),(7,74),(7,75),(7,77),(7,78),(7,79),(7,81),(7,82),(7,83),(7,84),(7,85),(7,87),(7,88),(7,90),(7,91),(7,92),(7,93),(7,95),(7,96),(7,97),(7,98),(7,100),(7,102),(7,104),(7,105),(7,106),(7,108),(7,109),(7,111),(7,113),(7,114),(7,116),(7,117),(7,118),(7,119),(7,121),(7,122),(7,123),(7,124),(7,125),(7,126),(7,127),(8,1),(8,38),(8,39),(8,40),(8,41),(8,42),(8,43),(8,44),(8,45),(8,46),(8,47),(8,48),(8,49),(8,50),(8,51),(8,52),(8,53),(8,54),(8,55),(8,56),(8,57),(8,58),(8,59),(8,60),(8,61),(8,62),(8,63),(8,64),(8,65),(8,66),(8,67),(8,68),(8,69),(8,70),(8,71),(8,72),(8,73),(8,74),(8,75),(8,77),(8,78),(8,79),(8,81),(8,82),(8,83),(8,84),(8,85),(8,87),(8,88),(8,89),(8,90),(8,91),(8,92),(8,93),(8,94),(8,95),(8,96),(8,97),(8,98),(8,99),(8,100),(8,101),(8,102),(8,103),(8,104),(8,105),(8,106),(8,107),(8,108),(8,109),(8,111),(8,112),(8,113),(8,114),(8,115),(8,116),(8,117),(8,118),(8,119),(8,120),(8,121),(8,122),(8,123),(8,124),(8,125),(8,127),(9,51),(10,130),(10,131),(10,132),(10,133),(10,134),(10,135),(10,136),(10,137),(10,138),(10,139),(11,140),(11,141),(11,142),(11,143),(11,144),(11,145);
/*!40000 ALTER TABLE `app_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_roles`
--

DROP TABLE IF EXISTS `app_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_roles`
--

LOCK TABLES `app_roles` WRITE;
/*!40000 ALTER TABLE `app_roles` DISABLE KEYS */;
INSERT INTO `app_roles` VALUES (1,'Super user','This role provides all application permissions.',0),(3,'ADD_USER','Add user to the system',0),(4,'Create Farmer','Farmer Creation',0),(5,'View Farmer','View Farmer',0),(6,'Approve_Recruitment','This role will approve recruitments above the threshold set',0),(7,'Center Controller','Register Farmer,View Farmer, Contract Signing, Inventory, Harvest Collection',0),(8,'Field Assistant','Register Farmer,View Farmer, Planting Verification, Spray Confirmation, Dashboard',0),(9,'Clerk','Clerk',0),(10,'Runda','Runda value chain permissions',0),(11,'Report_viewer','Ability to view system reports',0);
/*!40000 ALTER TABLE `app_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_scheduler_detail`
--

DROP TABLE IF EXISTS `app_scheduler_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_scheduler_detail` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `execute_misfired_jobs` tinyint(1) NOT NULL DEFAULT '1',
  `reset_scheduler_on_bootup` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_scheduler_detail`
--

LOCK TABLES `app_scheduler_detail` WRITE;
/*!40000 ALTER TABLE `app_scheduler_detail` DISABLE KEYS */;
INSERT INTO `app_scheduler_detail` VALUES (1,0,1,1);
/*!40000 ALTER TABLE `app_scheduler_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_scout_monitor`
--

DROP TABLE IF EXISTS `app_scout_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_scout_monitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `survival_rate` decimal(23,5) NOT NULL,
  `flowering_rate` decimal(23,5) NOT NULL,
  `average_pods` decimal(23,5) NOT NULL,
  `watered` varchar(20) NOT NULL,
  `germination` varchar(20) NOT NULL,
  `weeded` varchar(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DE08Ee7AB3` (`block_id`),
  KEY `FKEDeeB0REC7B334` (`created_by`),
  CONSTRAINT `FK8DE08Ee7AB3` FOREIGN KEY (`block_id`) REFERENCES `app_plant_blocks` (`id`),
  CONSTRAINT `FKEDeeB0REC7B334` FOREIGN KEY (`created_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_scout_monitor`
--

LOCK TABLES `app_scout_monitor` WRITE;
/*!40000 ALTER TABLE `app_scout_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_scout_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_spray_config`
--

DROP TABLE IF EXISTS `app_spray_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_spray_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spray_name` varchar(100) NOT NULL,
  `spray_no` int(11) NOT NULL,
  `spray_wef` date DEFAULT NULL,
  `spray_wet` date DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_spray_config_region_id` (`region_id`),
  CONSTRAINT `FK_spray_config_region_id` FOREIGN KEY (`region_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_spray_config`
--

LOCK TABLES `app_spray_config` WRITE;
/*!40000 ALTER TABLE `app_spray_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_spray_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_spray_confirmation`
--

DROP TABLE IF EXISTS `app_spray_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_spray_confirmation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spray_program_id` bigint(20) NOT NULL,
  `verification_id` bigint(20) NOT NULL,
  `cordinates` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `spray_confirmed` varchar(1) NOT NULL,
  `verified_on` datetime DEFAULT NULL,
  `verified_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DED48EC7AB` (`spray_program_id`),
  KEY `FK8DEDY48EC7B` (`verification_id`),
  KEY `verified_by` (`verified_by`),
  CONSTRAINT `FK8DED48EC7AB` FOREIGN KEY (`spray_program_id`) REFERENCES `app_spray_program` (`id`),
  CONSTRAINT `FK8DEDY48EC7B` FOREIGN KEY (`verification_id`) REFERENCES `app_planting_verification` (`id`),
  CONSTRAINT `app_planting_verification_ik_1` FOREIGN KEY (`verified_by`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_spray_confirmation`
--

LOCK TABLES `app_spray_confirmation` WRITE;
/*!40000 ALTER TABLE `app_spray_confirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_spray_confirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_spray_names`
--

DROP TABLE IF EXISTS `app_spray_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_spray_names` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spray_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_spray_names_un` (`spray_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_spray_names`
--

LOCK TABLES `app_spray_names` WRITE;
/*!40000 ALTER TABLE `app_spray_names` DISABLE KEYS */;
INSERT INTO `app_spray_names` VALUES (3,'New Spray Configuration'),(4,'Spray Programme'),(5,'Spray Programmer Muranga'),(2,'Test Spay');
/*!40000 ALTER TABLE `app_spray_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_spray_program`
--

DROP TABLE IF EXISTS `app_spray_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_spray_program` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spray_no` varchar(50) NOT NULL,
  `config_id` bigint(20) NOT NULL,
  `farming_type` varchar(100) NOT NULL,
  `recruitment_unit` int(11) NOT NULL,
  `with_effect_from` date NOT NULL,
  `with_effect_to` date DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `crop_product_id` bigint(20) DEFAULT NULL,
  `spray_name_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_spray_program_config_id` (`config_id`),
  KEY `FK_spray_program_region_id` (`region_id`),
  KEY `FK_spray_program_crop_id` (`crop_product_id`),
  KEY `FK_spray_name_id` (`spray_name_id`),
  CONSTRAINT `FK_spray_name_id` FOREIGN KEY (`spray_name_id`) REFERENCES `app_spray_names` (`id`),
  CONSTRAINT `FK_spray_program_config_id` FOREIGN KEY (`config_id`) REFERENCES `app_spray_config` (`id`),
  CONSTRAINT `FK_spray_program_crop_id` FOREIGN KEY (`crop_product_id`) REFERENCES `app_plant_products` (`id`),
  CONSTRAINT `FK_spray_program_region_id` FOREIGN KEY (`region_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_spray_program`
--

LOCK TABLES `app_spray_program` WRITE;
/*!40000 ALTER TABLE `app_spray_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_spray_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_spray_program_inventory`
--

DROP TABLE IF EXISTS `app_spray_program_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_spray_program_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `program_id` bigint(20) NOT NULL,
  `applicable_freq` decimal(23,5) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `app_farmers_packng_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `app_spray_program` (`id`),
  CONSTRAINT `app_farmers_packng_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `app_farmers_inventory_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_spray_program_inventory`
--

LOCK TABLES `app_spray_program_inventory` WRITE;
/*!40000 ALTER TABLE `app_spray_program_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_spray_program_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_tasks`
--

DROP TABLE IF EXISTS `app_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) DEFAULT NULL,
  `entity_name` varchar(100) DEFAULT NULL,
  `raised_by_user_id` bigint(20) NOT NULL,
  `made_on_date` datetime NOT NULL,
  `approved_by_user_id` bigint(20) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `entity_object` varchar(100) DEFAULT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  `sub_entity_id` bigint(20) DEFAULT NULL,
  `task_send_to_owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB048EC7AB1A` (`raised_by_user_id`),
  KEY `FK8DEDB048EA7AB0B` (`approved_by_user_id`),
  KEY `centre_id` (`centre_id`),
  KEY `FK_task_send_to_owner_id` (`task_send_to_owner_id`),
  CONSTRAINT `FK8DEDB048EA7AB0B` FOREIGN KEY (`approved_by_user_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK8DEDB048EC7AB1A` FOREIGN KEY (`raised_by_user_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK_task_send_to_owner_id` FOREIGN KEY (`task_send_to_owner_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `app_tasks_ibfk_1` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_tasks`
--

LOCK TABLES `app_tasks` WRITE;
/*!40000 ALTER TABLE `app_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_account_number_format`
--

DROP TABLE IF EXISTS `c_account_number_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_account_number_format` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_type_enum` smallint(1) NOT NULL,
  `prefix_type_enum` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_type_enum` (`account_type_enum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_account_number_format`
--

LOCK TABLES `c_account_number_format` WRITE;
/*!40000 ALTER TABLE `c_account_number_format` DISABLE KEYS */;
INSERT INTO `c_account_number_format` VALUES (1,1,101),(2,2,102);
/*!40000 ALTER TABLE `c_account_number_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_configuration`
--

DROP TABLE IF EXISTS `c_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_trap_door` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(300) DEFAULT NULL,
  `string_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_configuration`
--

LOCK TABLES `c_configuration` WRITE;
/*!40000 ALTER TABLE `c_configuration` DISABLE KEYS */;
INSERT INTO `c_configuration` VALUES (1,'maker-checker',NULL,NULL,0,0,NULL,NULL),(4,'amazon-S3',0,NULL,0,0,NULL,NULL),(10,'penalty-wait-period',2,NULL,1,0,NULL,NULL),(11,'force-password-reset-days',0,NULL,0,0,NULL,NULL),(23,'rounding-mode',6,NULL,1,1,'0 - UP, 1 - DOWN, 2- CEILING, 3- FLOOR, 4- HALF_UP, 5- HALF_DOWN, 6 - HALF_EVEN',NULL),(32,'Enable-Address',NULL,NULL,0,0,NULL,NULL),(33,'constraint_approach_for_datatables',NULL,NULL,1,0,NULL,NULL),(34,'autoactivate_client',1,NULL,1,0,NULL,'Y'),(35,'maximum-recruitment-units',5,NULL,1,0,NULL,NULL),(36,'minimum-requistion-units',1,NULL,0,0,NULL,NULL),(37,'sign-contract-without-centre-stock',1,NULL,0,0,NULL,'Y'),(38,'maximum-recruitment-extension-days',100,NULL,1,0,NULL,'Y'),(39,'maximum-crop-date-available-days',85,NULL,1,0,NULL,'Y'),(40,'crop-walk-days-greater-than-crop-date',60,NULL,1,0,NULL,'Y');
/*!40000 ALTER TABLE `c_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_external_service`
--

DROP TABLE IF EXISTS `c_external_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_external_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_external_service`
--

LOCK TABLES `c_external_service` WRITE;
/*!40000 ALTER TABLE `c_external_service` DISABLE KEYS */;
INSERT INTO `c_external_service` VALUES (2,'SMTP_Email_Account');
/*!40000 ALTER TABLE `c_external_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_external_service_properties`
--

DROP TABLE IF EXISTS `c_external_service_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_external_service_properties` (
  `name` varchar(150) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  `external_service_id` bigint(20) NOT NULL,
  KEY `FK_c_external_service_properties_c_external_service` (`external_service_id`),
  CONSTRAINT `FK_c_external_service_properties_c_external_service` FOREIGN KEY (`external_service_id`) REFERENCES `c_external_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_external_service_properties`
--

LOCK TABLES `c_external_service_properties` WRITE;
/*!40000 ALTER TABLE `c_external_service_properties` DISABLE KEYS */;
INSERT INTO `c_external_service_properties` VALUES ('username','renttechtest@gmail.com',2),('password','Manunited12**',2),('host','smtp.gmail.com',2),('port','25',2),('useTLS','true',2);
/*!40000 ALTER TABLE `c_external_service_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_destruction_reasons`
--

DROP TABLE IF EXISTS `crop_destruction_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crop_destruction_reasons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `destruction_sht_desc` varchar(100) NOT NULL,
  `destruction_reason` varchar(100) NOT NULL,
  `destruction_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_destruction_reasons`
--

LOCK TABLES `crop_destruction_reasons` WRITE;
/*!40000 ALTER TABLE `crop_destruction_reasons` DISABLE KEYS */;
INSERT INTO `crop_destruction_reasons` VALUES (1,'Too Much Rain','Too Much Rain','Partial Destruction'),(3,'Pest','Pests','Crop Destruction'),(4,'Lack of Water','Lack of water','Partial Destruction'),(5,'Farmer\'s Fault','Farmer\'s Fault','Crop Destruction'),(6,'Animals','Animals','Crop Destruction'),(7,'Disease','Diseases','Crop Destruction');
/*!40000 ALTER TABLE `crop_destruction_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_crop_destruction`
--

DROP TABLE IF EXISTS `farmer_crop_destruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_crop_destruction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(50) NOT NULL,
  `unit` bigint(20) NOT NULL,
  `crop_destruction_type` varchar(100) NOT NULL,
  `farmer_id` bigint(20) NOT NULL,
  `crop_date_id` bigint(20) NOT NULL,
  `crop_dest_reason_id` bigint(20) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `destruction_date` date DEFAULT NULL,
  `crop_marked_requistioned` varchar(5) DEFAULT NULL,
  `contract_id` bigint(20) DEFAULT NULL,
  `destruction_status` varchar(3) DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmer_id` (`farmer_id`),
  KEY `crop_date_id` (`crop_date_id`),
  KEY `crop_dest_reason_id` (`crop_dest_reason_id`),
  KEY `image_id` (`image_id`),
  KEY `FK_contract_ids` (`contract_id`),
  CONSTRAINT `FK_contract_ids` FOREIGN KEY (`contract_id`) REFERENCES `app_farmers_contract_signing` (`id`),
  CONSTRAINT `farmer_crop_destruction_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `farmer_crop_destruction_ibfk_2` FOREIGN KEY (`crop_date_id`) REFERENCES `app_crop_dates` (`id`),
  CONSTRAINT `farmer_crop_destruction_ibfk_3` FOREIGN KEY (`crop_dest_reason_id`) REFERENCES `crop_destruction_reasons` (`id`),
  CONSTRAINT `farmer_crop_destruction_ibfk_4` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_crop_destruction`
--

LOCK TABLES `farmer_crop_destruction` WRITE;
/*!40000 ALTER TABLE `farmer_crop_destruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmer_crop_destruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_run_history`
--

DROP TABLE IF EXISTS `job_run_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_run_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime DEFAULT NULL,
  `error_log` varchar(300) DEFAULT NULL,
  `error_message` varchar(1000) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `trigger_type` varchar(100) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkjob_history` (`job_id`),
  CONSTRAINT `fkjob_history` FOREIGN KEY (`job_id`) REFERENCES `app_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_run_history`
--

LOCK TABLES `job_run_history` WRITE;
/*!40000 ALTER TABLE `job_run_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_run_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_appuser_previous_password`
--

DROP TABLE IF EXISTS `m_appuser_previous_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_appuser_previous_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `removal_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `m_appuser_previous_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_appuser_previous_password`
--

LOCK TABLES `m_appuser_previous_password` WRITE;
/*!40000 ALTER TABLE `m_appuser_previous_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_appuser_previous_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_crop_walk_parameter`
--

DROP TABLE IF EXISTS `m_crop_walk_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_crop_walk_parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(50) NOT NULL,
  `param_type` varchar(50) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `param_constraints` varchar(50) DEFAULT NULL,
  `param_status` varchar(1) DEFAULT NULL,
  `hierarchy` varchar(100) DEFAULT NULL,
  `param_additional_depend_val` varchar(100) DEFAULT NULL,
  `param_addition_param_type` varchar(50) DEFAULT NULL,
  `param_addition_constraints` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_hierachy_object_hierachy_object_fk` (`parent_id`),
  CONSTRAINT `m_hierachy_object_hierachy_object_fk` FOREIGN KEY (`parent_id`) REFERENCES `m_crop_walk_parameter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_crop_walk_parameter`
--

LOCK TABLES `m_crop_walk_parameter` WRITE;
/*!40000 ALTER TABLE `m_crop_walk_parameter` DISABLE KEYS */;
INSERT INTO `m_crop_walk_parameter` VALUES (1,'Before Planting',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Crop Rotation','T',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Germination',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Germination %','N',3,'0,100',NULL,NULL,NULL,NULL,NULL),(8,'Trifoliate / Branching','',NULL,'','','.',NULL,NULL,NULL),(9,'Weeding & CAN Incorporation','D',8,'Not Weeded, CAN Applied, Both Done','','.9.','',NULL,NULL),(11,'Irrigation','D',8,'Once, Twice, Thrice','','.11.','',NULL,NULL),(12,'Diseases','D',8,'Present, Absent','','.12.','Present','M','Rust, ALS'),(13,'Budding Stage','',NULL,'','','.','',NULL,NULL),(14,'Budding','N',13,'0,100','','.14.','',NULL,NULL),(15,'Diseases','D',13,'Present, Absent','','.14.15.','Present','M','Rust, ALS'),(16,'Pests','D',13,'Present, Absent','','.16.','Present','M','Thrips, Wflies'),(17,'Destructions','N',13,'0,100','','.17.','',NULL,NULL),(18,'Weeding & NPK','D',13,'Not Weeded, NPK Applied, Both Done','','.18.','',NULL,NULL),(19,'Irrigation','D',3,'Dry, Adequate','','null19.','',NULL,NULL),(20,'Two Leaf','',NULL,'','','.','',NULL,NULL),(21,'Bald Head','N',20,'1,10','','.21.','',NULL,NULL),(22,'Irrigation','D',20,'Dry, Adequate','','.22.','',NULL,NULL),(23,'Cut Worms','N',20,'1,10','','.23.','',NULL,NULL),(24,'Pests','D',8,'Present, Absent','','.24.','Present','M','Thrips, Wflies'),(25,'Flowering Stage','',NULL,'','','.','',NULL,NULL),(26,'Flowering','N',25,'0,100','','.26.','',NULL,NULL),(27,'Destructions','N',25,'0,100','','.27.','',NULL,NULL),(28,'Irrigation','D',25,'Dry, Adequate','','.28.','',NULL,NULL),(29,'Diseases','D',25,'Present, Absent','','.29.','Present','M','Rust, ALS, Blight'),(30,'Pests','D',25,'Present, Absent','','.30.','Present','M','Thrips, Wflies, Aphids'),(31,'Podding Stage','',NULL,'','','.','',NULL,NULL),(32,'Podding','N',31,'0,100','','.32.','',NULL,NULL),(33,'Destructions','N',31,'0,100','','.33.','',NULL,NULL),(34,'Diseases','D',31,'Present, Absent','','.34.','Present','M','Rust, ALS, Wilting'),(35,'Pests','D',31,'Present, Absent','','.35.','Present','M','Wflies, Caterpillars'),(36,'Irrigation','D',31,'Dry, Adequate','','.36.','',NULL,NULL),(37,'Weeds','D',31,'Present, Absent','','.37.','',NULL,NULL),(38,'Crop Survival %','N',31,'0,100','','.38.','',NULL,NULL),(39,'Production','',NULL,'','','.','',NULL,NULL),(40,'Irrigation','D',39,'Dry soil during harvest, Adequate','','.40.','',NULL,NULL),(41,'Pests','D',39,'Present, Absent','','.41.','',NULL,NULL),(42,'Harvesting','D',39,'Once a week, Twice, Thrice','','.42.','',NULL,NULL),(43,'Overall production / unit','N',39,'0,300','','.43.','',NULL,NULL);
/*!40000 ALTER TABLE `m_crop_walk_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_entity_datatable_check`
--

DROP TABLE IF EXISTS `m_entity_datatable_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_entity_datatable_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_table_name` varchar(200) NOT NULL,
  `x_registered_table_name` varchar(50) NOT NULL,
  `status_enum` int(11) NOT NULL,
  `system_defined` tinyint(4) NOT NULL DEFAULT '0',
  `product_id` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entity_check` (`application_table_name`,`x_registered_table_name`,`status_enum`,`product_id`),
  KEY `x_registered_table_name` (`x_registered_table_name`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `m_entity_datatable_check_ibfk_1` FOREIGN KEY (`x_registered_table_name`) REFERENCES `x_registered_table` (`registered_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity_datatable_check`
--

LOCK TABLES `m_entity_datatable_check` WRITE;
/*!40000 ALTER TABLE `m_entity_datatable_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_entity_datatable_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hierachy`
--

DROP TABLE IF EXISTS `m_hierachy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hierachy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `hierarchy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB04C7AB` (`parent_id`),
  CONSTRAINT `FK8DEDB04C7AB` FOREIGN KEY (`parent_id`) REFERENCES `m_hierachy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hierachy`
--

LOCK TABLES `m_hierachy` WRITE;
/*!40000 ALTER TABLE `m_hierachy` DISABLE KEYS */;
INSERT INTO `m_hierachy` VALUES (1,NULL,'Organization','1.'),(4,1,'Region','14.'),(5,4,'Counties','14.5.'),(6,8,'Nearest Center','14.5.7.8.6.'),(7,5,'Sub Counties','14.5.7.'),(8,7,'Ward','14.5.7.8.');
/*!40000 ALTER TABLE `m_hierachy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hierachy_object`
--

DROP TABLE IF EXISTS `m_hierachy_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hierachy_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hierachy_type_id` bigint(20) DEFAULT NULL,
  `obj_name` varchar(50) NOT NULL,
  `obj_sht_desc` varchar(50) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `hierarchy` varchar(50) DEFAULT NULL,
  `obj_centre_type` varchar(1) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `cordinates` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DED4C7AB` (`hierachy_type_id`),
  KEY `m_hierachy_object_m_hierachy_object_fk` (`parent_id`),
  CONSTRAINT `FK8DED4C7AB` FOREIGN KEY (`hierachy_type_id`) REFERENCES `m_hierachy` (`id`),
  CONSTRAINT `m_hierachy_object_m_hierachy_object_fk` FOREIGN KEY (`parent_id`) REFERENCES `m_hierachy_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hierachy_object`
--

LOCK TABLES `m_hierachy_object` WRITE;
/*!40000 ALTER TABLE `m_hierachy_object` DISABLE KEYS */;
INSERT INTO `m_hierachy_object` VALUES (1,1,'Farmers Choice','FC',NULL,'.','','','undefined,undefined'),(2,4,'Western','WEST',1,'.2.','','','undefined,undefined'),(3,5,'Busia','Bus',2,'.2.3.','','','undefined,undefined'),(4,7,'Nambale','Nambale',3,'.2.3.4.','','','undefined,undefined'),(5,8,'Manyole','Many',4,'.2.3.4.5.','','','undefined,undefined'),(6,6,'Huruma Hospital','Hurum',5,'.2.3.4.5.6.','','Frankfurt, Germany','50.1109221,8.6821267'),(7,4,'Central','Central',1,'.7.','','','undefined,undefined'),(8,5,'Nyeri','Nyeri',7,'.7.8.','','','undefined,undefined'),(9,7,'Othaya','Othaya',8,'.7.8.9.','','','undefined,undefined'),(10,8,'Kianganda','Kianganda',9,'.7.8.9.10.','','','undefined,undefined'),(11,6,'Kianganda Dispensary','Kianganda Disp',10,'.7.8.9.10.11.','','CXR2+77H, Othaya, Kenya','-0.5593019,36.9507267'),(12,8,'Gatitu','Gatitu',9,'.7.8.9.12.','','','undefined,undefined'),(14,6,'Othaya Town Stadium','OT',10,'.7.8.9.10.14.','','FW2V+4FP, Othaya, Kenya','-0.5496587,36.943709'),(15,6,'Kianganda Catholic Church','K',10,'.7.8.9.10.15.','','Unnamed Road, CWRX+FWF, Othaya, Kenya','-0.5588133,36.9497818');
/*!40000 ALTER TABLE `m_hierachy_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook`
--

DROP TABLE IF EXISTS `m_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` smallint(6) NOT NULL,
  `is_active` smallint(3) NOT NULL DEFAULT '1',
  `name` varchar(45) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `ugd_template_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_id_idx` (`template_id`),
  KEY `fk_ugd_template_id` (`ugd_template_id`),
  CONSTRAINT `fk_template_id` FOREIGN KEY (`template_id`) REFERENCES `m_hook_templates` (`id`),
  CONSTRAINT `fk_ugd_template_id` FOREIGN KEY (`ugd_template_id`) REFERENCES `m_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook`
--

LOCK TABLES `m_hook` WRITE;
/*!40000 ALTER TABLE `m_hook` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_configuration`
--

DROP TABLE IF EXISTS `m_hook_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hook_id` bigint(20) DEFAULT NULL,
  `field_type` varchar(45) NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `field_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hook_id_idx` (`hook_id`),
  CONSTRAINT `fk_hook_id_cfg` FOREIGN KEY (`hook_id`) REFERENCES `m_hook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_configuration`
--

LOCK TABLES `m_hook_configuration` WRITE;
/*!40000 ALTER TABLE `m_hook_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_hook_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_registered_events`
--

DROP TABLE IF EXISTS `m_hook_registered_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_registered_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hook_id` bigint(20) NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `action_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hook_id_idx` (`hook_id`),
  CONSTRAINT `fk_hook_idc` FOREIGN KEY (`hook_id`) REFERENCES `m_hook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_registered_events`
--

LOCK TABLES `m_hook_registered_events` WRITE;
/*!40000 ALTER TABLE `m_hook_registered_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_hook_registered_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_schema`
--

DROP TABLE IF EXISTS `m_hook_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_schema` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `hook_template_id` smallint(6) NOT NULL,
  `field_type` varchar(45) NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `placeholder` varchar(100) DEFAULT NULL,
  `optional` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hook_template_id_idx` (`hook_template_id`),
  CONSTRAINT `fk_hook_template_id` FOREIGN KEY (`hook_template_id`) REFERENCES `m_hook_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_schema`
--

LOCK TABLES `m_hook_schema` WRITE;
/*!40000 ALTER TABLE `m_hook_schema` DISABLE KEYS */;
INSERT INTO `m_hook_schema` VALUES (1,1,'string','Payload URL',NULL,0),(2,1,'string','Content Type','json / form',0),(3,2,'string','Payload URL',NULL,0),(4,2,'string','SMS Provider',NULL,0),(5,2,'string','Phone Number',NULL,0),(6,2,'string','SMS Provider Token',NULL,0),(7,2,'string','SMS Provider Account Id',NULL,0);
/*!40000 ALTER TABLE `m_hook_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hook_templates`
--

DROP TABLE IF EXISTS `m_hook_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_hook_templates` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hook_templates`
--

LOCK TABLES `m_hook_templates` WRITE;
/*!40000 ALTER TABLE `m_hook_templates` DISABLE KEYS */;
INSERT INTO `m_hook_templates` VALUES (1,'Web'),(2,'SMS Bridge');
/*!40000 ALTER TABLE `m_hook_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_image`
--

DROP TABLE IF EXISTS `m_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location` varchar(500) DEFAULT NULL,
  `storage_type_enum` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16068 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_image`
--

LOCK TABLES `m_image` WRITE;
/*!40000 ALTER TABLE `m_image` DISABLE KEYS */;
INSERT INTO `m_image` VALUES (16009,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/22/imageCOMPANYREG.png',1),(16010,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/22/imageCOMPACCTS.png',1),(16011,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/25/imageDIRECTIMG.png',1),(16012,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/26/imageDIRECTIMG.png',1),(16013,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/27/imageDIRECTIMG.png',1),(16014,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/1/imageID.png',1),(16015,'/home/pmugenya/.fineract/DefaultDemoTenant/images/clients/1/imageACCT.png',1),(16016,'/root/.fineract/DefaultDemoTenant/images/clients/2/imageID.png',1),(16017,'/root/.fineract/DefaultDemoTenant/images/clients/2/imageACCT.png',1),(16018,'/root/.fineract/DefaultDemoTenant/images/clients/3/imageID.png',1),(16019,'/root/.fineract/DefaultDemoTenant/images/clients/3/imageACCT.png',1),(16020,'/root/.fineract/DefaultDemoTenant/images/clients/4/imageID.png',1),(16021,'/root/.fineract/DefaultDemoTenant/images/clients/4/imageACCT.png',1),(16022,'/root/.fineract/DefaultDemoTenant/images/clients/5/imageID.png',1),(16023,'/root/.fineract/DefaultDemoTenant/images/clients/5/imageACCT.png',1),(16024,'/root/.fineract/DefaultDemoTenant/images/clients/6/imageID.png',1),(16025,'/root/.fineract/DefaultDemoTenant/images/clients/6/imageACCT.png',1),(16026,'/root/.fineract/DefaultDemoTenant/images/clients/7/imageID.png',1),(16027,'/root/.fineract/DefaultDemoTenant/images/clients/7/imageACCT.png',1),(16028,'/root/.fineract/DefaultDemoTenant/images/clients/8/imageID.png',1),(16029,'/root/.fineract/DefaultDemoTenant/images/clients/8/imageACCT.png',1),(16030,'/root/.fineract/DefaultDemoTenant/images/clients/1/imageCOMPANYREG.png',1),(16031,'/root/.fineract/DefaultDemoTenant/images/clients/1/imageCOMPACCTS.png',1),(16032,'/root/.fineract/DefaultDemoTenant/images/clients/1/imageDIRECTIMG.png',1),(16033,'/root/.fineract/DefaultDemoTenant/images/clients/9/imageID.png',1),(16034,'/root/.fineract/DefaultDemoTenant/images/clients/9/imageACCT.png',1),(16035,'/root/.fineract/DefaultDemoTenant/images/clients/10/imageID.png',1),(16036,'/root/.fineract/DefaultDemoTenant/images/clients/10/imageACCT.png',1),(16037,'/root/.fineract/DefaultDemoTenant/images/clients/11/imageID.png',1),(16038,'/root/.fineract/DefaultDemoTenant/images/clients/11/imageACCT.png',1),(16039,'/root/.fineract/DefaultDemoTenant/images/clients/12/imageID.png',1),(16040,'/root/.fineract/DefaultDemoTenant/images/clients/12/imageACCT.png',1),(16041,'/root/.fineract/DefaultDemoTenant/images/clients/13/imageID.png',1),(16042,'/root/.fineract/DefaultDemoTenant/images/clients/13/imageACCT.png',1),(16043,'/root/.fineract/DefaultDemoTenant/images/clients/14/imageID.png',1),(16044,'/root/.fineract/DefaultDemoTenant/images/clients/14/imageACCT.png',1),(16045,'/root/.fineract/DefaultDemoTenant/images/clients/15/imageID.png',1),(16046,'/root/.fineract/DefaultDemoTenant/images/clients/15/imageACCT.png',1),(16047,'/root/.fineract/DefaultDemoTenant/images/clients/16/imageID.png',1),(16048,'/root/.fineract/DefaultDemoTenant/images/clients/16/imageACCT.png',1),(16049,'/root/.fineract/DefaultDemoTenant/images/clients/17/imageID.png',1),(16050,'/root/.fineract/DefaultDemoTenant/images/clients/17/imageACCT.png',1),(16051,'/root/.fineract/DefaultDemoTenant/images/clients/2/imageCOMPANYREG.png',1),(16052,'/root/.fineract/DefaultDemoTenant/images/clients/2/imageCOMPACCTS.png',1),(16053,'/root/.fineract/DefaultDemoTenant/images/clients/2/imageDIRECTIMG.png',1),(16054,'/root/.fineract/DefaultDemoTenant/images/clients/18/imageID.png',1),(16055,'/root/.fineract/DefaultDemoTenant/images/clients/18/imageACCT.png',1),(16056,'/root/.fineract/DefaultDemoTenant/images/clients/19/imageID.png',1),(16057,'/root/.fineract/DefaultDemoTenant/images/clients/19/imageACCT.png',1),(16058,'/root/.fineract/DefaultDemoTenant/images/clients/3/imageCOMPANYREG.png',1),(16059,'/root/.fineract/DefaultDemoTenant/images/clients/3/imageCOMPACCTS.png',1),(16060,'/root/.fineract/DefaultDemoTenant/images/clients/3/imageDIRECTIMG.png',1),(16061,'/root/.fineract/DefaultDemoTenant/images/clients/4/imageCOMPANYREG.png',1),(16062,'/root/.fineract/DefaultDemoTenant/images/clients/4/imageCOMPACCTS.png',1),(16063,'/root/.fineract/DefaultDemoTenant/images/clients/4/imageDIRECTIMG.png',1),(16064,'/root/.fineract/DefaultDemoTenant/images/clients/20/imageID.png',1),(16065,'/root/.fineract/DefaultDemoTenant/images/clients/20/imageACCT.png',1),(16066,'/root/.fineract/DefaultDemoTenant/images/clients/21/imageID.png',1),(16067,'/root/.fineract/DefaultDemoTenant/images/clients/21/imageACCT.png',1);
/*!40000 ALTER TABLE `m_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_note`
--

DROP TABLE IF EXISTS `m_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) DEFAULT NULL,
  `note_type_enum` smallint(5) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7C97089541F0A56` (`createdby_id`),
  KEY `FK7C970897179A0CB` (`client_id`),
  KEY `FK7C970898F889C3F` (`lastmodifiedby_id`),
  CONSTRAINT `FK7C97089541F0A56` FOREIGN KEY (`createdby_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `FK7C970897179A0CB` FOREIGN KEY (`client_id`) REFERENCES `app_farmers` (`id`),
  CONSTRAINT `FK7C970898F889C3F` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_note`
--

LOCK TABLES `m_note` WRITE;
/*!40000 ALTER TABLE `m_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_password_validation_policy`
--

DROP TABLE IF EXISTS `m_password_validation_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_password_validation_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regex` text NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_password_validation_policy`
--

LOCK TABLES `m_password_validation_policy` WRITE;
/*!40000 ALTER TABLE `m_password_validation_policy` DISABLE KEYS */;
INSERT INTO `m_password_validation_policy` VALUES (1,'^.{1,50}$','Password most be at least 1 character and not more that 50 characters long',1,'simple'),(2,'^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).{6,50}$','Password must be at least 6 characters, no more than 50 characters long, must include at least one upper case letter, one lower case letter, one numeric digit and no space',0,'secure');
/*!40000 ALTER TABLE `m_password_validation_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_template`
--

DROP TABLE IF EXISTS `m_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entity` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_template`
--

LOCK TABLES `m_template` WRITE;
/*!40000 ALTER TABLE `m_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_templatemappers`
--

DROP TABLE IF EXISTS `m_templatemappers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_templatemappers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mapperkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mapperorder` int(11) DEFAULT NULL,
  `mappervalue` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_templatemappers`
--

LOCK TABLES `m_templatemappers` WRITE;
/*!40000 ALTER TABLE `m_templatemappers` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_templatemappers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_generator`
--

DROP TABLE IF EXISTS `notification_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_generator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` text,
  `object_identifier` bigint(20) DEFAULT NULL,
  `action` text,
  `actor` bigint(20) DEFAULT NULL,
  `is_system_generated` tinyint(1) DEFAULT '0',
  `notification_content` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_generator`
--

LOCK TABLES `notification_generator` WRITE;
/*!40000 ALTER TABLE `notification_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mapper`
--

DROP TABLE IF EXISTS `notification_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mapper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_mapper` (`user_id`),
  KEY `notification_id` (`notification_id`),
  CONSTRAINT `notification_mapper_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `notification_mapper_ibfk_3` FOREIGN KEY (`notification_id`) REFERENCES `notification_generator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mapper`
--

LOCK TABLES `notification_mapper` WRITE;
/*!40000 ALTER TABLE `notification_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_appuser_centres`
--

DROP TABLE IF EXISTS `portal_appuser_centres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_appuser_centres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `centre_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DEDB04C7AB90` (`user_id`),
  KEY `FK8DEDB04C7A234` (`centre_id`),
  CONSTRAINT `FK8DEDB04C7A234` FOREIGN KEY (`centre_id`) REFERENCES `m_hierachy_object` (`id`),
  CONSTRAINT `FK8DEDB04C7AB90` FOREIGN KEY (`user_id`) REFERENCES `app_appuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_appuser_centres`
--

LOCK TABLES `portal_appuser_centres` WRITE;
/*!40000 ALTER TABLE `portal_appuser_centres` DISABLE KEYS */;
INSERT INTO `portal_appuser_centres` VALUES (4,68,7);
/*!40000 ALTER TABLE `portal_appuser_centres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_enum_value`
--

DROP TABLE IF EXISTS `r_enum_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_enum_value` (
  `enum_name` varchar(100) NOT NULL,
  `enum_id` int(11) NOT NULL,
  `enum_message_property` varchar(100) NOT NULL,
  `enum_value` varchar(100) NOT NULL,
  PRIMARY KEY (`enum_name`,`enum_id`),
  UNIQUE KEY `enum_message_property` (`enum_name`,`enum_message_property`),
  UNIQUE KEY `enum_value` (`enum_name`,`enum_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_enum_value`
--

LOCK TABLES `r_enum_value` WRITE;
/*!40000 ALTER TABLE `r_enum_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_enum_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretchy_parameter`
--

DROP TABLE IF EXISTS `stretchy_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretchy_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(45) NOT NULL,
  `parameter_variable` varchar(45) DEFAULT NULL,
  `parameter_label` varchar(45) NOT NULL,
  `parameter_displayType` varchar(45) NOT NULL,
  `parameter_FormatType` varchar(10) NOT NULL,
  `parameter_default` varchar(45) NOT NULL,
  `special` varchar(1) DEFAULT NULL,
  `selectOne` varchar(1) DEFAULT NULL,
  `selectAll` varchar(1) DEFAULT NULL,
  `parameter_sql` text,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`parameter_name`),
  KEY `fk_stretchy_parameter_001_idx` (`parent_id`),
  CONSTRAINT `fk_stretchy_parameter_001` FOREIGN KEY (`parent_id`) REFERENCES `stretchy_parameter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretchy_parameter`
--

LOCK TABLES `stretchy_parameter` WRITE;
/*!40000 ALTER TABLE `stretchy_parameter` DISABLE KEYS */;
INSERT INTO `stretchy_parameter` VALUES (1,'startDateSelect','startDate','startDate','date','date','today',NULL,NULL,NULL,'',NULL),(2,'endDateSelect','endDate','endDate','date','date','today',NULL,NULL,NULL,'',NULL),(5,'CenterIdSelectOne','centerId','Center','select','number','0',NULL,'Y',NULL,'select id, obj_name as tc from m_hierachy_object where hierachy_type_id=6',NULL),(6,'RegionIdSelectOne','regionId','Region','select','number','0',NULL,'Y',NULL,'select id, obj_name as tc from m_hierachy_object where hierachy_type_id=4',NULL),(7,'CropDatesSelectOne','cropDatesId','Crop Date','select','number','0',NULL,'Y',NULL,'select id,DATE_FORMAT(planting_date, \"%d-%b-%Y\")  as tc from app_crop_dates',NULL),(1001,'FullReportList',NULL,'n/a','n/a','n/a','n/a','Y',NULL,NULL,'select  r.id as report_id, r.report_name, r.report_type, r.report_subtype, r.report_category,\nrp.id as parameter_id, rp.report_parameter_name, p.parameter_name\n  from stretchy_report r\n  left join stretchy_report_parameter rp on rp.report_id = r.id \n  left join stretchy_parameter p on p.id = rp.parameter_id\n  where r.use_report is true\n  and exists\n  ( select \'f\'\n  from app_appuser_role ur \n  join app_roles r on r.id = ur.role_id\n  join app_role_permission rp on rp.role_id = r.id\n  join app_permissions p on p.id = rp.permission_id\n  where ur.appuser_id = ${currentUserId}\n  and (p.code in (\'ALL_FUNCTIONS_READ\', \'ALL_FUNCTIONS\') or p.code = concat(\"READ_\", r.report_name)) )\n  order by r.report_category, r.report_name, rp.id',NULL),(1002,'FullParameterList',NULL,'n/a','n/a','n/a','n/a','Y',NULL,NULL,'select sp.parameter_name, sp.parameter_variable, sp.parameter_label, sp.parameter_displayType, \n sp.parameter_FormatType, sp.parameter_default, sp.selectOne,  sp.selectAll, spp.parameter_name as parentParameterName\n from stretchy_parameter sp\n left join stretchy_parameter spp on spp.id = sp.parent_id\n where sp.special is null\n and exists \n   (select \'f\' \n  from stretchy_report sr\n   join stretchy_report_parameter srp on srp.report_id = sr.id\n   where sr.report_name in(${reportListing})\n   and srp.parameter_id = sp.id\n  )\n order by sp.id',NULL),(1003,'reportCategoryList',NULL,'n/a','n/a','n/a','n/a','Y',NULL,NULL,'select  r.id as report_id, r.report_name, r.report_type, r.report_subtype, r.report_category,\n  rp.id as parameter_id, rp.report_parameter_name, p.parameter_name\n  from stretchy_report r\n  left join stretchy_report_parameter rp on rp.report_id = r.id\n  left join stretchy_parameter p on p.id = rp.parameter_id\n  where r.report_category = \'${reportCategory}\'\n  and r.use_report is true\n  and exists\n  (select \'f\'\n  from app_appuser_role ur \n  join app_roles r on r.id = ur.role_id\n  join app_role_permission rp on rp.role_id = r.id\n  join app_permissions p on p.id = rp.permission_id\n  where ur.appuser_id = ${currentUserId}\n  and (p.code in (\'ALL_FUNCTIONS_READ\', \'ALL_FUNCTIONS\') or p.code = concat(\"READ_\", r.report_name)) )\n  order by r.report_category, r.report_name, rp.id',NULL);
/*!40000 ALTER TABLE `stretchy_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretchy_report`
--

DROP TABLE IF EXISTS `stretchy_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretchy_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(100) NOT NULL,
  `report_type` varchar(20) NOT NULL,
  `report_subtype` varchar(20) DEFAULT NULL,
  `report_category` varchar(45) DEFAULT NULL,
  `report_sql` text,
  `description` text,
  `core_report` tinyint(1) DEFAULT '0',
  `use_report` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_name_UNIQUE` (`report_name`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretchy_report`
--

LOCK TABLES `stretchy_report` WRITE;
/*!40000 ALTER TABLE `stretchy_report` DISABLE KEYS */;
INSERT INTO `stretchy_report` VALUES (188,'Farmer Registration Report','Table',NULL,'Farmers Registered','SELECT farmer_code \"Farmer Code\", \nUPPER(CONCAT(app_farmers.firstname,\' \',IFNULL(app_farmers.middlename,\' \'),\' \',app_farmers.lastname)) AS \"Name\", \napp_farmer_docs.doc_number \"ID Number\",\nCASE WHEN app_farmers.gender = \'M\' THEN \'Male\'\nELSE \'Female\' END Gender,\nCONCAT(\"\'\",app_farmers.mobileno) AS \"Mobile No\",\n\nCONCAT(\"\'\",app_farmer_account_details.account_no) \"Account Number\", \n\nDATE_FORMAT(app_farmers.date_of_birth,\"%d/%m/%Y\") \"Date of Birth\",\nDATE_FORMAT(date_registered,\"%d/%m/%Y\") \"Date Registered\",\napp_appuser.username \"Created By\",\n\nUPPER(m_hierachy_object.obj_name) \"Centre\"\n\nFROM app_farmers, app_appuser, app_farmer_docs, app_farmer_account_details,app_farmer_centres,m_hierachy_object\nWHERE app_farmers.submittedon_userid = app_appuser.id\nAND app_farmer_docs.doc_farmer_id = app_farmers.id\nAND app_farmer_account_details.account_farmer_id = app_farmers.id\nAND app_farmer_centres.fc_farmer_id = app_farmers.id\nAND app_farmer_centres.fc_centre_id = m_hierachy_object.id\nAND app_farmer_centres.fc_status = \'ACTIVE\'\nAND Obj_name NOT IN (\'Test Centre\', \'Makuthi\', \'Gaturuini 1\',\'Kangai\',\'Kisii\', \'Group Test\')\nAND app_appuser.username NOT IN (\'Admin\',\'peter2019\')\nAND date_created BETWEEN \'${startDate}\' AND \'${endDate}\'\nORDER BY date_registered DESC','Farmer Listing',0,1),(191,'Farmer Recruitment Report','Table','','Farmer Recruitment','SELECT \nfarmer_code \"Farmer Code\", \ntotal_units \"Units Recruited\", \nDATE_FORMAT(planting_date,\"%d/%m/%Y\") \'Crop Date\',\nDATE_FORMAT(recruited_date,\"%d/%m/%Y\") \"Date Recruited\", \nland_section \"Section\",\n\n\nUPPER(obj_name) \'Centre\',\n\nf.username \"Username\"\n\nFROM `app_farmers_recruitment` a, `app_farmers` b,app_farmer_centres c,m_hierachy_object d, app_crop_dates e, app_appuser f\nWHERE a.farmer_id = b.id\nAND b.id = fc_farmer_id\nAND fc_centre_id = d.id\nAND fc_status = \'ACTIVE\'\nAND e.id = planting_date_id\nAND Obj_name NOT IN (\'Test Centre\', \'Makuthi\', \'Gaturuini 1\',\'Kangai\',\'Kisii\', \'Group Test\')\nAND recruit_status = \'Ý\'\nAND a.recruited_by = f.id\nAND e.planting_date > \'2020-06-29\'\nAND a.recruited_date BETWEEN \'${startDate}\' AND \'${endDate}\'\nORDER BY a.recruited_date DESC','Farmer Recruitment Report by date recruited',0,1),(192,'Contracts Signed','Table',NULL,'Contracts Signed','SELECT \nfarmer_code \"Farmer Code\",\nreference_no \"Reference No\", \nDATE_FORMAT(contract_date, \"%d/%m/%Y\") \"Contract Date\",\nunits \"Units Issued\", \ntotal_units \"Recruited Units\",\nUPPER(obj_name) \"Centre\",\nDATE_FORMAT(planting_date,\"%d/%m/%Y\") \"Crop Date\"\nFROM app_farmers a,app_farmers_contract_signing b, m_hierachy_object c, app_crop_dates d, app_farmers_recruitment e\nWHERE a.id = b.farmer_id\nAND a.hierachy_id = c.id\nAND b.crop_date_id = d.id\nAND e.id = b.recruitment_id\nAND obj_name NOT IN (\'Test Centre\', \'Makuthi\', \'Gaturuini 1\',\'Kangai\',\'Kisii\', \'Group Test\')\nAND contract_progress = \'Y\'\nAND contract_date BETWEEN \'${startDate}\' AND \'${endDate}\'\nAND d.planting_date > \'2020-06-29\'','Contracts',0,1),(193,'Plantings Verified','Table',NULL,'','SELECT farmer_code \"Farmer Code\",\nreference_no \"Contract Reference\", \nDATE_FORMAT(contract_date, \"%d/%m/%Y\") \"Contract Date\",\nplanting_confirmed \"Confirmed\", \nconfirmed_units \"Confirmed Units\", \nunits \"Units Issued\", \nDATE_FORMAT(verified_on,\"%d/%m/%Y\") \"Date Verified\", \nDATE_FORMAT(planting_date,\"%d/%m/%Y\") \"Crop Date\",\nUPPER(obj_name) \"Centre\"\nFROM app_farmers_contract_signing a, app_planting_Verification b, app_crop_dates c, app_farmers d, m_hierachy_object e\nWHERE a.id = b.contract_id\nAND a.crop_date_id = c.id\nAND a.farmer_id = d.id\nAND d.hierachy_id = e.id\nAND c.planting_date > \'2020-06-29\'\nAND obj_name NOT IN (\'Test Centre\', \'Makuthi\', \'Gaturuini 1\',\'Kangai\',\'Kisii\', \'Group Test\')\nAND verified_on BETWEEN \'${startDate}\' AND \'${endDate}\'\nORDER BY verified_on DESC','Plantings Verified',0,1),(194,'Harvest Collection','Table','','Harvest Reports','SELECT \nROUND(a.harvest_kilo,1) \"Kilos Harvested\",\nDATE_FORMAT(a.harvest_date,\"%d/%m/%Y\") \"Harvest Date\",\nDATE_FORMAT(b.planting_date,\"%d/%m/%Y\") \"Crop Date\",\nc.username \"User\",\nUPPER(f.obj_name) \"Centre\",\nCONCAT(UPPER(f.obj_name),\"-\",DATE_FORMAT(b.planting_date,\"%d/%m/%Y\")) \"H-Crop Date Relation\"\nFROM app_farmers_harvesting a, app_crop_dates b, app_appuser c, app_farmers_contract_signing d, app_farmers e, m_hierachy_object f\nWHERE a.crop_date_id = b.id\nAND  a.done_by = c.id\nAND  b.planting_date > \'2020-06-29\'\nAND a.contract_id = d.id\nAND a.farmer_id = e.id\nAND e.hierachy_id = f.id\nAND obj_name NOT IN (\'Test Centre\', \'Makuthi\', \'Gaturuini 1\',\'Kangai\',\'Kisii\', \'Group Test\')\nAND c.username NOT IN (\'admin\')\nAND a.harvest_date BETWEEN \'${startDate}\' AND \'${endDate}\'\nORDER BY harvest_date DESC',NULL,0,1);
/*!40000 ALTER TABLE `stretchy_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretchy_report_parameter`
--

DROP TABLE IF EXISTS `stretchy_report_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretchy_report_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `report_parameter_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_parameter_unique` (`report_id`,`parameter_id`),
  KEY `fk_report_parameter_001_idx` (`report_id`),
  KEY `fk_report_parameter_002_idx` (`parameter_id`),
  CONSTRAINT `fk_report_parameter_001` FOREIGN KEY (`report_id`) REFERENCES `stretchy_report` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_parameter_002` FOREIGN KEY (`parameter_id`) REFERENCES `stretchy_parameter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretchy_report_parameter`
--

LOCK TABLES `stretchy_report_parameter` WRITE;
/*!40000 ALTER TABLE `stretchy_report_parameter` DISABLE KEYS */;
INSERT INTO `stretchy_report_parameter` VALUES (1,188,2,'endDate'),(2,188,1,'startDate'),(7,191,2,'endDate'),(8,191,1,'startDate'),(10,192,2,'endDate'),(11,192,1,'startDate'),(12,193,1,'startDate'),(13,193,2,'endDate'),(14,194,1,'startDate'),(15,194,2,'endDate');
/*!40000 ALTER TABLE `stretchy_report_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `entity_id` bigint(20) NOT NULL,
  `entity_type` text NOT NULL,
  `member_type` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_subscriber`
--

DROP TABLE IF EXISTS `topic_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_subscriber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `subscription_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_topic_has_m_appuser_topic` (`topic_id`),
  KEY `fk_topic_has_m_appuser_m_appuser1` (`user_id`),
  CONSTRAINT `fk_topic_has_m_appuser_m_appuser1` FOREIGN KEY (`user_id`) REFERENCES `app_appuser` (`id`),
  CONSTRAINT `fk_topic_has_m_appuser_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_subscriber`
--

LOCK TABLES `topic_subscriber` WRITE;
/*!40000 ALTER TABLE `topic_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_registered_table`
--

DROP TABLE IF EXISTS `x_registered_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_registered_table` (
  `registered_table_name` varchar(50) NOT NULL,
  `application_table_name` varchar(50) NOT NULL,
  `category` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`registered_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_registered_table`
--

LOCK TABLES `x_registered_table` WRITE;
/*!40000 ALTER TABLE `x_registered_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_registered_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_table_column_code_mappings`
--

DROP TABLE IF EXISTS `x_table_column_code_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_table_column_code_mappings` (
  `column_alias_name` varchar(50) NOT NULL,
  `code_id` int(10) NOT NULL,
  PRIMARY KEY (`column_alias_name`),
  KEY `FK_x_code_id` (`code_id`),
  CONSTRAINT `FK_x_code_id` FOREIGN KEY (`code_id`) REFERENCES `app_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_table_column_code_mappings`
--

LOCK TABLES `x_table_column_code_mappings` WRITE;
/*!40000 ALTER TABLE `x_table_column_code_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_table_column_code_mappings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-28 12:09:47
