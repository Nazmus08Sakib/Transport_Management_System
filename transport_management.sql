-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.21-log - MySQL Community Server (GPL)
-- --------------------------------------------------------

-- Dumping database structure for transportmanagementtogit
CREATE DATABASE IF NOT EXISTS `transport_management` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `transport_management`;

-- Dumping structure for table transportmanagementtogit.billing




-- Dumping structure for view transportmanagementtogit.brandandmodel
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `brandandmodel` (
	`id` VARCHAR(36) NOT NULL COLLATE 'utf8_general_ci',
	`brandName` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci',
	`model` TEXT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for table transportmanagementtogit.brandmodel
CREATE TABLE IF NOT EXISTS `brandmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkBrand` int(11) DEFAULT NULL,
  `modelNo` varchar(128) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_brandModel` (`fkBrand`,`modelNo`),
  KEY `FK_brandModelCreatedBy` (`createdBy`),
  CONSTRAINT `FK_brandModelBrand` FOREIGN KEY (`fkBrand`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK_brandModelCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.brandmodel: ~20 rows (approximately)
/*!40000 ALTER TABLE `brandmodel` DISABLE KEYS */;
INSERT INTO `brandmodel` (`id`, `fkBrand`, `modelNo`, `createdBy`, `createdTime`) VALUES
	(1, 2, 'bmw', 5, '2018-11-01 23:16:41'),
	(2, 2, '456', 5, '2018-10-29 22:51:28'),
	(3, 2, '789', 5, '2018-10-29 22:51:31'),
	(4, 2, 'A1', 5, '2018-10-29 22:51:33'),
	(5, 2, 'A2', 3, '2018-10-29 22:51:36'),
	(6, 2, 'A3', 3, '2018-10-29 22:51:39'),
	(7, 9, 'A3', 4, '2018-10-29 22:51:52'),
	(8, 6, 'B', 4, '2018-10-29 22:51:50'),
	(9, 3, 'C', 7, '2018-10-29 22:51:43'),
	(10, 8, 'D', 7, '2018-10-29 22:51:57'),
	(12, 7, '123', 5, '2018-11-04 12:40:13'),
	(13, 5, 'sder', 5, '2018-11-04 12:40:09'),
	(14, 5, 'X54321', 5, '2018-11-04 12:40:07'),
	(15, 15, '123', 5, '2018-11-04 12:40:17'),
	(17, 11, '-', 5, '2018-11-04 12:40:19'),
	(18, 9, 'Salimoddi', 5, '2018-11-04 12:40:11'),
	(27, 5, 'rte', 5, '2018-10-29 23:01:43'),
	(28, 2, 'bmw2', 5, '2018-11-01 23:14:52'),
	(29, 2, 'bmw3', 5, '2018-11-01 23:15:07'),
	(30, 9, 'E!23', 5, '2018-11-04 12:39:26');
/*!40000 ALTER TABLE `brandmodel` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(32) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brandName` (`brandName`),
  KEY `FK_brandsCreatedBy` (`createdBy`),
  CONSTRAINT `FK_brandsCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.brands: ~12 rows (approximately)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`, `brandName`, `createdBy`, `createdTime`) VALUES
	(2, 'BMW', 5, '2018-11-04 12:52:46'),
	(3, 'Marutiy', 5, '2018-11-04 12:52:49'),
	(5, 'Mercedes', 5, '2018-11-04 12:52:52'),
	(6, 'Feari', 5, '2018-11-04 12:52:55'),
	(7, 'TATA', 5, '2018-11-04 12:52:59'),
	(8, 'Mazda', 5, '2018-11-04 12:53:04'),
	(9, 'Echer', 5, '2018-11-04 12:53:08'),
	(11, '-', 5, '2018-11-04 12:53:11'),
	(15, 'NEW3', 5, '2018-11-04 12:54:05'),
	(16, 'New', 5, '2018-11-04 12:54:08'),
	(19, 'Tanvir', 5, '2018-11-04 12:53:20'),
	(21, 'Suzuki', 5, '2018-11-04 12:53:27');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for view transportmanagementtogit.busschedule
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `busschedule` (
	`Bus Name` VARCHAR(32) NULL COLLATE 'utf8_general_ci',
	`Staring Time` TIME NULL,
	`Station From` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`Station To` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`Driver Name` VARCHAR(256) NOT NULL COLLATE 'utf8_general_ci',
	`Helper Name` VARCHAR(256) NOT NULL COLLATE 'utf8_general_ci',
	`Helper Contact` VARCHAR(20) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for table transportmanagementtogit.driverinformation
CREATE TABLE IF NOT EXISTS `driverinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `driverCode` varchar(32) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `drivingLicense` varchar(32) NOT NULL,
  `licenseExpireDate` date DEFAULT NULL,
  `nid` varchar(64) DEFAULT NULL,
  `presentAddress` text,
  `parmanentAddress` text,
  `contactNO` varchar(20) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `driverCode` (`driverCode`),
  UNIQUE KEY `nid` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.driverinformation: ~8 rows (approximately)
/*!40000 ALTER TABLE `driverinformation` DISABLE KEYS */;
INSERT INTO `driverinformation` (`id`, `name`, `driverCode`, `dob`, `drivingLicense`, `licenseExpireDate`, `nid`, `presentAddress`, `parmanentAddress`, `contactNO`, `email`, `photo`) VALUES
	(4, 'Adul Halim', 'DR000000001', '2018-08-19', '236e5635436548326548', '2018-08-01', '98371276875463468743', '34322352', '2552', '01973637453', 'driver@diu.edu.bd', ''),
	(5, 'Karimuzzaman', 'DR000000002', '2018-08-22', '2843275757', '2018-08-24', '19364677777777777748', 'ff', 'fff', '017345327463', 'r@r.com', 'url'),
	(6, 'DWED', 'DEWA', '2018-09-03', '323435436', '2018-09-11', '146346346', '3432423', '31442', '144', 'a@a.com', 'C:\\fakepath\\soft eng assignment.PNG'),
	(7, 'Enam Kobir', 'DR000000005', '2018-09-21', '47836453645184818', '2018-09-14', '193684763443444', 'awsed', 'wwww', '01973565353', 'driver@diu.edu.bd', 'htppdk://cjwhhwgyrg3y'),
	(8, 'Tanvir Hossain', 'DR000000006', '2018-09-21', '34384325823', '2018-09-28', '1937747347653764', 'asde', 'asdfrtg', '01985464534', 'driver5@diu.edu.bd', '232411111111412'),
	(9, 'Akkas Ali Khan', 'DR000000007', '2018-08-31', '5474645845', '2018-09-27', '198736527474764', 'fff', 'fff', '01973637451', 'e@rm.com', 'https://www.hfrhfjre.com/fhgdh'),
	(11, 'Example', 'DR000000099', '2018-11-01', '123', '2018-10-24', '124', 'x', 'x', '43565464', 'driver@diu.edu.bd', ''),
	(16, 'ss', 'ss', '2018-10-22', '45', '2018-10-02', '325', 'we', 'we', '144', 'driver5@diu.edu.bd', ''),
	(17, 'NEW!', 'NEW!', '2018-10-25', '123456789', '2018-10-27', '123456789', 'NEW!', 'NEW!', '01973637451', 'driver@diu.edu.bd', 'C:\\fakepath\\42937159_941861999333078_3867444821132050432_n.jpg'),
	(18, 'Ababas ALi Kahn', 'drrr', '2018-10-15', '46546457', '2018-10-20', '1433432254', 'dex', 'dx', '01973637453', 'r@r.com', 'C:\\fakepath\\Oct 2018.PNG'),
	(19, 'Farhan Tanvir', 'DR9e886438', '1975-10-27', '476325643645', '2021-10-12', '19983453645365435', 'shukrabad', 'shukrabad', '01985464534', 'driver@diu.edu.bd', 'C:\\fakepath\\Fall 2018.PNG'),
	(20, 'Adul Halimm', 'DR0000000098', '2018-08-22', '236e563543654', '2018-10-26', '983712768754634', '34322352', '2552', '01973637453', 'driver@diu.edu.bd', 'C:\\fakepath\\Oct 2018.PNG'),
	(21, 'Abdul Zabbar Miah', '19846543253647565', '2018-10-27', '19846543253647565', '2018-10-27', '19846543253647565', 'change in place, we build the project again and run it. ... for the reply, yes we are using Jackson to convert our Java Object into JSON format,', 'change in place, we build the project again and run it. ... for the reply, yes we are using Jackson to convert our Java Object into JSON format,', '19846543253', 'email@mail.com', 'C:\\fakepath\\soft eng assignment.PNG'),
	(22, 'Abdur Rab', 'D3243721473', '2018-10-26', '19846543253647565', '2018-10-10', '198736527474763847', 'example', 'example', '01985464534', 'alam@alam.com', 'C:\\fakepath\\Oct 2018.PNG');
/*!40000 ALTER TABLE `driverinformation` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.generaltravelinformation
CREATE TABLE IF NOT EXISTS `generaltravelinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkTrnsportId` int(11) NOT NULL,
  `fkFromLocation` int(11) NOT NULL,
  `fkToLocation` int(11) NOT NULL,
  `departureTime` time NOT NULL,
  `fkDriverId` int(11) NOT NULL,
  `fkRequisitionId` int(11) DEFAULT NULL,
  `travelDate` date NOT NULL,
  `driverCheckInTime` time DEFAULT NULL,
  `reachedTime` time DEFAULT NULL,
  `comments` text,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_generalTravelInformationTransportId` (`fkTrnsportId`),
  KEY `FK_generalTravelInformationDriverId` (`fkDriverId`),
  KEY `FK_generalTravelInformationRequisitionId` (`fkRequisitionId`),
  KEY `FK_generaltravelinformationFromLocation` (`fkFromLocation`),
  KEY `FK_generaltravelinformationToLocation` (`fkToLocation`),
  CONSTRAINT `FK_generalTravelInformationDriverId` FOREIGN KEY (`fkDriverId`) REFERENCES `driverinformation` (`id`),
  CONSTRAINT `FK_generalTravelInformationRequisitionId` FOREIGN KEY (`fkRequisitionId`) REFERENCES `transportrequisition` (`id`),
  CONSTRAINT `FK_generalTravelInformationTransportId` FOREIGN KEY (`fkTrnsportId`) REFERENCES `transportinformation` (`id`),
  CONSTRAINT `FK_generaltravelinformationFromLocation` FOREIGN KEY (`fkFromLocation`) REFERENCES `venue` (`id`),
  CONSTRAINT `FK_generaltravelinformationToLocation` FOREIGN KEY (`fkToLocation`) REFERENCES `venue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.generaltravelinformation: ~24 rows (approximately)
/*!40000 ALTER TABLE `generaltravelinformation` DISABLE KEYS */;
INSERT INTO `generaltravelinformation` (`id`, `fkTrnsportId`, `fkFromLocation`, `fkToLocation`, `departureTime`, `fkDriverId`, `fkRequisitionId`, `travelDate`, `driverCheckInTime`, `reachedTime`, `comments`, `createdTime`) VALUES
	(1, 9, 2, 6, '23:50:00', 20, 10, '2018-10-16', '23:50:00', '23:50:00', 'Yes', '2018-10-18 19:06:17'),
	(2, 9, 1, 1, '11:52:00', 4, 1, '2018-10-18', '11:52:00', '11:52:00', 'yes', '2018-10-18 18:40:35'),
	(3, 10, 1, 1, '11:52:00', 4, 1, '2018-10-18', '11:52:00', '11:52:00', 'yes', '2018-10-16 23:55:05'),
	(4, 10, 1, 1, '11:52:00', 4, 1, '2018-10-18', '11:52:00', '11:52:00', 'yes', '2018-10-16 23:55:25'),
	(5, 10, 1, 1, '11:52:00', 4, 1, '2018-10-18', '11:52:00', '11:52:00', 'yes', '2018-10-16 23:55:25'),
	(6, 9, 1, 1, '16:54:00', 4, 1, '2018-10-10', '10:01:00', '07:01:00', 'comment', '2018-10-17 17:28:24'),
	(7, 10, 6, 4, '22:30:00', 8, 11, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-17 17:30:15'),
	(8, 9, 1, 1, '22:30:00', 4, 1, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-17 17:34:58'),
	(9, 9, 1, 14, '22:30:00', 9, 1, '2018-10-27', '12:35:00', '07:01:00', 'last comment', '2018-11-03 16:38:33'),
	(10, 10, 6, 4, '22:30:00', 8, 11, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 21:02:17'),
	(11, 9, 1, 1, '03:45:00', 4, 1, '2018-10-17', '15:45:00', '15:45:00', 'sss', '2018-10-18 15:47:04'),
	(12, 9, 1, 1, '22:30:00', 4, 1, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 16:04:58'),
	(13, 9, 1, 1, '22:30:00', 4, 1, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 16:05:56'),
	(14, 9, 1, 1, '07:30:00', 4, 1, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 16:06:07'),
	(15, 9, 1, 1, '07:30:00', 4, 1, '2018-10-27', '12:35:00', '07:01:00', 'Nothing But Kisu misu', '2018-10-18 16:08:45'),
	(16, 9, 6, 4, '22:30:00', 8, 11, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 16:41:18'),
	(17, 9, 1, 1, '22:30:00', 4, 1, '2018-10-27', '12:35:00', '07:01:00', 'last comment', '2018-10-18 16:43:12'),
	(18, 10, 6, 4, '22:30:00', 8, 11, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 16:48:45'),
	(19, 10, 6, 4, '22:30:00', 8, 11, '2018-10-27', '12:35:00', '07:01:00', 'comment', '2018-10-18 18:28:31'),
	(20, 9, 2, 6, '23:50:00', 20, 10, '2018-10-16', '23:50:00', '23:50:00', 'Yes', '2018-10-18 18:30:16'),
	(21, 10, 1, 1, '11:52:00', 4, 1, '2018-10-18', '11:52:00', '11:52:00', 'yes', '2018-10-18 18:33:25'),
	(22, 9, 1, 1, '11:52:00', 4, 1, '2018-10-18', '11:52:00', '11:52:00', 'NULL', '2018-10-18 18:36:16'),
	(23, 10, 2, 6, '23:50:00', 20, 10, '2018-10-16', '23:50:00', '23:50:00', 'No comment', '2018-10-18 18:44:08'),
	(24, 7, 1, 1, '19:06:00', 4, 1, '2018-10-24', '19:06:00', '19:06:00', 'xyz', '2018-10-18 19:06:42'),
	(25, 9, 1, 1, '07:12:00', 4, 1, '2018-10-03', '19:12:00', '19:12:00', 'example1', '2018-10-18 21:35:11'),
	(26, 10, 1, 4, '01:27:00', 4, 1, '2018-10-18', '01:27:00', '01:27:00', 'None', '2018-10-20 01:27:17'),
	(27, 10, 1, 1, '23:09:00', 4, 1, '2018-10-10', '23:09:00', '23:09:00', 'ss', '2018-10-28 23:10:08'),
	(28, 10, 1, 1, '23:09:00', 4, 1, '2018-10-10', '23:09:00', '23:09:00', 'ss', '2018-10-28 23:11:25');
/*!40000 ALTER TABLE `generaltravelinformation` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.helperinformation
CREATE TABLE IF NOT EXISTS `helperinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `helperCode` varchar(32) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `drivingLicense` varchar(32) DEFAULT NULL,
  `licenseExpireDate` date DEFAULT NULL,
  `nid` varchar(64) NOT NULL,
  `presentAddress` text,
  `parmanentAddress` text,
  `contactNO` varchar(20) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nid` (`nid`),
  UNIQUE KEY `helperCode` (`helperCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.helperinformation: ~2 rows (approximately)
/*!40000 ALTER TABLE `helperinformation` DISABLE KEYS */;
INSERT INTO `helperinformation` (`id`, `name`, `helperCode`, `dob`, `drivingLicense`, `licenseExpireDate`, `nid`, `presentAddress`, `parmanentAddress`, `contactNO`, `email`, `photo`) VALUES
	(1, 'Rahim Miah', 'HLP0837489378', '2018-10-09', '2653672875647365', '2018-10-03', '2653672875647365', 'Dhaka', 'Khulna', '01712345543', 'helper@gmail.com', ''),
	(6, 'Karim Sheikh', 'HLP0837489379', '2018-10-09', '1737647346536453', '2018-10-03', '17376473465364537', 'Dhaka', 'Slyhet', '01912345543', 'helper@edu.bd', '');
/*!40000 ALTER TABLE `helperinformation` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.institute
CREATE TABLE IF NOT EXISTS `institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instituteName` varchar(10) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instituteName` (`instituteName`),
  KEY `FK_instituteCreatedBy` (`createdBy`),
  CONSTRAINT `FK_instituteCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.institute: ~3 rows (approximately)
/*!40000 ALTER TABLE `institute` DISABLE KEYS */;
INSERT INTO `institute` (`id`, `instituteName`, `createdBy`, `createdTime`) VALUES
	(1, 'DIU', 5, '2018-11-04 12:33:17'),
	(2, 'DIS', 5, '2018-11-04 12:33:20'),
	(3, 'DIC', 5, '2018-11-04 12:32:52');
/*!40000 ALTER TABLE `institute` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.policecase
CREATE TABLE IF NOT EXISTS `policecase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caseNumber` bigint(20) NOT NULL,
  `caseDate` date NOT NULL,
  `fkVehicleType` varchar(32) NOT NULL,
  `fkCaseType` varchar(128) NOT NULL,
  `place` text NOT NULL,
  `cost` int(11) NOT NULL,
  `ReliefDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caseNumber` (`caseNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.policecase: ~0 rows (approximately)
/*!40000 ALTER TABLE `policecase` DISABLE KEYS */;
/*!40000 ALTER TABLE `policecase` ENABLE KEYS */;



-- Dumping structure for table transportmanagementtogit.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_role` (`name`,`fk_user_id`),
  KEY `FK_roleUserId` (`fk_user_id`),
  CONSTRAINT `FK_roleUserId` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.role: ~8 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `fk_user_id`) VALUES
	(1, 'ROLE_ADMIN', 1),
	(4, 'ROLE_ADMIN', 5),
	(2, 'ROLE_USER', 1),
	(3, 'ROLE_USER', 2),
	(5, 'ROLE_USER', 4),
	(6, 'ROLE_USER', 5),
	(7, 'ROLE_USER', 6),
	(8, 'ROLE_USER', 7),
	(9, 'ROLE_USER', 8),
	(10, 'ROLE_USER', 12);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.sheduledtravelinformation
CREATE TABLE IF NOT EXISTS `sheduledtravelinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkTrnsportId` int(11) NOT NULL,
  `fkScheduleId` int(11) NOT NULL,
  `fkDriverId` int(11) NOT NULL,
  `travelDate` date NOT NULL,
  `actualDepartureTime` time DEFAULT NULL,
  `actualReachedTime` time DEFAULT NULL,
  `comments` text,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sheduledTravelInformationTransportId` (`fkTrnsportId`),
  KEY `FK_sheduledTravelInformationScheduleId` (`fkScheduleId`),
  KEY `FK_sheduledTravelInformationDriverId` (`fkDriverId`),
  CONSTRAINT `FK_sheduledTravelInformationDriverId` FOREIGN KEY (`fkDriverId`) REFERENCES `driverinformation` (`id`),
  CONSTRAINT `FK_sheduledTravelInformationScheduleId` FOREIGN KEY (`fkScheduleId`) REFERENCES `transportschedule` (`id`),
  CONSTRAINT `FK_sheduledTravelInformationTransportId` FOREIGN KEY (`fkTrnsportId`) REFERENCES `transportinformation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.sheduledtravelinformation: ~5 rows (approximately)
/*!40000 ALTER TABLE `sheduledtravelinformation` DISABLE KEYS */;
INSERT INTO `sheduledtravelinformation` (`id`, `fkTrnsportId`, `fkScheduleId`, `fkDriverId`, `travelDate`, `actualDepartureTime`, `actualReachedTime`, `comments`, `createdTime`) VALUES
	(1, 10, 9, 4, '2018-10-28', '23:11:00', '23:11:00', 'Yes', '2018-10-28 23:15:50'),
	(2, 10, 9, 4, '2018-10-28', '23:54:00', '23:54:00', 'None', '2018-10-28 23:54:24'),
	(3, 10, 9, 4, '2018-10-28', '18:35:00', '22:54:00', 'None', '2018-10-28 23:55:04'),
	(4, 10, 9, 4, '2018-10-29', '11:33:00', '11:33:00', 'Comments', '2018-10-29 11:33:47'),
	(5, 17, 9, 4, '2018-10-29', '11:33:00', '11:33:00', 'Comments', '2018-10-29 11:35:58'),
	(6, 9, 9, 4, '2018-10-29', '11:33:00', '11:33:00', '1', '2018-10-29 11:40:43');
/*!40000 ALTER TABLE `sheduledtravelinformation` ENABLE KEYS */;




-- Dumping structure for table transportmanagementtogit.transportassign
CREATE TABLE IF NOT EXISTS `transportassign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkRequisitionId` int(11) NOT NULL,
  `fkTrnsportId` int(11) NOT NULL,
  `assignedDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_transportassignforgeneraltravelRequisitionId` (`fkRequisitionId`),
  KEY `FK_transportassignforgeneraltravelTrnsportId` (`fkTrnsportId`),
  KEY `FK_transportassignforgeneraltravelCreatedBy` (`createdBy`),
  CONSTRAINT `FK_transportassignforgeneraltravelCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_transportassignforgeneraltravelRequisitionId` FOREIGN KEY (`fkRequisitionId`) REFERENCES `transportrequisition` (`id`),
  CONSTRAINT `FK_transportassignforgeneraltravelTrnsportId` FOREIGN KEY (`fkTrnsportId`) REFERENCES `transportinformation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.transportassign: ~0 rows (approximately)
/*!40000 ALTER TABLE `transportassign` DISABLE KEYS */;
INSERT INTO `transportassign` (`id`, `fkRequisitionId`, `fkTrnsportId`, `assignedDateTime`, `createdBy`) VALUES
	(1, 1, 12, '2018-10-22 10:00:18', 6);
/*!40000 ALTER TABLE `transportassign` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.transportinformation
CREATE TABLE IF NOT EXISTS `transportinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkTransportType` tinyint(4) NOT NULL,
  `vinNumber` varchar(256) NOT NULL,
  `registrationNumber` varchar(64) DEFAULT NULL,
  `licenseNumber` varchar(32) DEFAULT NULL,
  `transportName` varchar(32) DEFAULT NULL,
  `fkModelNo` int(11) DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `purchaseBy` varchar(128) DEFAULT NULL,
  `purchaseReffNo` varchar(256) DEFAULT NULL,
  `purchaseFrom` varchar(128) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `specificaiton` text,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_transportInformationTransportType` (`fkTransportType`),
  KEY `fk_transportInformationModelNo` (`fkModelNo`),
  KEY `fk_transportInformationcreatedBy` (`createdBy`),
  CONSTRAINT `fk_transportInformationModelNo` FOREIGN KEY (`fkModelNo`) REFERENCES `brandmodel` (`id`),
  CONSTRAINT `fk_transportInformationTransportType` FOREIGN KEY (`fkTransportType`) REFERENCES `transporttype` (`id`),
  CONSTRAINT `fk_transportInformationcreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.transportinformation: ~12 rows (approximately)
/*!40000 ALTER TABLE `transportinformation` DISABLE KEYS */;
INSERT INTO `transportinformation` (`id`, `fkTransportType`, `vinNumber`, `registrationNumber`, `licenseNumber`, `transportName`, `fkModelNo`, `purchaseDate`, `purchaseBy`, `purchaseReffNo`, `purchaseFrom`, `price`, `specificaiton`, `createdBy`, `createdTime`) VALUES
	(7, 6, '387346348736481714', '371368754871471947', '75325D432634T632E7', 'Shurjo mukhi 10', 7, '2018-08-31', 'DIU', 'Prof. Abu Yusuf(VC)', 'Niloy Motors', 76237527.00, '4 wheel, 4 window', NULL, '2018-08-16 19:33:47'),
	(8, 12, '387346348736481714', '371368754871471947', '75325D432634T632E7', 'Rojonigondha 01', 1, '2018-08-31', 'DIU', 'Prof. Abu Yusuf(VC)', 'Niloy Motors', 76237527.00, '4 wheel, 4 window', NULL, '2018-10-29 21:15:20'),
	(9, 9, '4325487', '3765437', '3764832', 'Shurjomukhi 11', 18, '2010-09-24', 'Sabur Khan', 'VC sir', 'Niloy Motor', 352573.00, 'hdhgq jwwd by3geu3y3 rguyg', NULL, '2018-09-17 20:58:21'),
	(10, 2, '43254871', '37654371', '37648321', 'Shurjomukhi 9', 7, '2010-09-07', 'Sabur Khann', 'VC sirr', 'Niloy Motorr', 3525732.00, 'dced', NULL, '2018-10-29 21:13:50'),
	(11, 6, '244552352', '2552356', '135443634646', 'Rojonigondha 02', 18, '2018-09-29', 'fgfg', 'fgfgssssssssss', 'fgfdgdf', 5433.00, 'szzz', NULL, '2018-10-29 21:15:29'),
	(12, 14, '145', '5325235', '2324135235', 'Shurjomukhi 3', 15, '2018-10-17', 'edwefe', 'ertgerr', 'frfwrfgr', 12344235.00, 'xyz', NULL, '2018-10-29 21:14:29'),
	(13, 12, '23214135135', '23214135135', '23214135135', 'Shurjomukhi 6', 2, '2018-10-14', '23214135', '23214135', '232141351', 23214135.00, '23214135', NULL, '2018-10-29 21:14:38'),
	(14, 12, '23214135135', '23214135135', '23214135135', 'Shurjomukhi 5', 2, '2018-10-14', '23214135', '23214135', '232141351', 23214135.00, '23214135', NULL, '2018-10-29 21:15:12'),
	(15, 12, '23214135135', '23214135135', '23214135135', 'Shurjomukhi 4', 2, '2018-10-14', '23214135', '23214135', '232141351', 23214135.00, '23214135', NULL, '2018-10-29 21:14:32'),
	(16, 9, '574574667', '4768686', '4546547547', 'Rojonigondha 03', 3, '2018-10-23', 'exmaple', 'exmaple', 'exmaple', 13414.00, 'exmaple', NULL, '2018-10-29 21:15:36'),
	(17, 9, '54366565474', '65475444444444444', '3254364363', 'Shurjomukhi 1', 1, '2018-10-30', 'ghbgb', 'freferf', 'gvergre', 3123124.00, 'czd', NULL, '2018-10-29 21:14:19'),
	(18, 9, '54366565474', '65475444444444444', '3254364363', 'Shurjomukhi 2', 1, '2018-10-30', 'ghbgb', 'freferf', 'gvergre', 3123124.00, 'czd', NULL, '2018-10-29 21:14:22'),
	(19, 2, '3def', 'sdswrw43432', '1234', 'Shurjomukhi 7', 1, '2018-10-09', 'Farhan', 'dholai123', 'Dholaikhal', 20.00, 'Plastic body', 5, '2018-10-29 21:14:42'),
	(20, 9, 'tg44444', '4g', 'gtg4', 'Shurjomukhi 8', 7, '2018-10-23', 'rtt', 'tt', 'ttt', 123.00, 'abc', 1, '2018-10-29 21:14:47');
/*!40000 ALTER TABLE `transportinformation` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.transportrequisition
CREATE TABLE IF NOT EXISTS `transportrequisition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkRequestedBy` bigint(20) DEFAULT NULL,
  `requestDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `travelDate` date NOT NULL,
  `fkTransportType` tinyint(4) NOT NULL,
  `purpose` text,
  `status` varchar(2) DEFAULT NULL COMMENT 'A = Approved, R = Reject, P = Pending',
  `fkApproveBy` bigint(20) DEFAULT NULL,
  `approveDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `FK_transportRequisitionRequestedBy` (`fkRequestedBy`),
  KEY `FK_transportRequisitionTransportType` (`fkTransportType`),
  KEY `FK_transportRequisitionApproveBy` (`fkApproveBy`),
  CONSTRAINT `FK_transportRequisitionApproveBy` FOREIGN KEY (`fkApproveBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_transportRequisitionRequestedBy` FOREIGN KEY (`fkRequestedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_transportRequisitionTransportType` FOREIGN KEY (`fkTransportType`) REFERENCES `transporttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.transportrequisition: ~34 rows (approximately)
/*!40000 ALTER TABLE `transportrequisition` DISABLE KEYS */;
INSERT INTO `transportrequisition` (`id`, `fkRequestedBy`, `requestDate`, `travelDate`, `fkTransportType`, `purpose`, `status`, `fkApproveBy`, `approveDate`, `comments`) VALUES
	(1, 4, '2018-10-20 20:41:45', '2017-09-11', 2, 'Mair purpose', 'A', 4, '0000-00-00 00:00:00', 'By Tanvir'),
	(8, 1, '2018-10-20 20:41:47', '2018-09-17', 1, 'Mair purpose', 'A', 1, '0000-00-00 00:00:00', 'none'),
	(9, 1, '2018-10-20 21:11:33', '2018-09-19', 2, '45', 'A', 1, '0000-00-00 00:00:00', 'Removed'),
	(10, 1, '2018-10-20 00:07:23', '2018-09-19', 12, '45', 'R', 5, '0000-00-00 00:00:00', 'NULL'),
	(11, 5, '2018-10-21 14:40:16', '2018-10-15', 2, 'Approval', 'A', 5, '0000-00-00 00:00:00', 'By Tanvir'),
	(12, 3, '2018-10-20 16:27:35', '2018-10-20', 9, 'test', 'A', 3, '0000-00-00 00:00:00', ''),
	(13, 1, '2018-10-21 19:10:17', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(14, 1, '2018-10-21 19:10:55', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(24, 1, '2018-10-28 14:56:12', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(25, 1, '2018-10-28 15:19:19', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(35, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'R', 1, '0000-00-00 00:00:00', 'example'),
	(36, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'R', 1, '0000-00-00 00:00:00', 'example'),
	(37, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'R', 1, '0000-00-00 00:00:00', 'example'),
	(38, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'R', 1, '0000-00-00 00:00:00', 'example'),
	(39, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'R', 1, '0000-00-00 00:00:00', 'example'),
	(40, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'R', 1, '0000-00-00 00:00:00', 'example'),
	(41, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(42, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(43, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(44, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(45, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(46, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(47, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(48, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(49, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(50, 1, '2018-10-20 20:37:07', '2017-09-11', 2, 'Exaple', 'A', 1, '0000-00-00 00:00:00', 'example'),
	(52, 5, '2018-10-28 15:19:28', '2018-10-09', 9, 'NULL', 'A', NULL, '0000-00-00 00:00:00', ''),
	(53, 5, '2018-10-28 15:19:35', '2018-02-16', 12, 'Abc', 'A', NULL, '0000-00-00 00:00:00', ''),
	(54, 5, '2018-10-28 15:28:47', '2018-02-16', 12, 'Abc', 'A', NULL, '0000-00-00 00:00:00', ''),
	(55, 5, '2018-10-28 17:52:13', '2018-02-16', 12, 'Abc', 'A', NULL, '0000-00-00 00:00:00', 'Yes1'),
	(56, 5, '2018-10-28 18:14:09', '2019-12-01', 12, 'Abc', 'A', NULL, '0000-00-00 00:00:00', ''),
	(57, 5, '2018-11-04 12:46:47', '2018-10-31', 12, 'Abc', 'A', NULL, '0000-00-00 00:00:00', ''),
	(58, 5, '2018-10-22 12:54:28', '2020-07-24', 1, 'Abc', 'P', NULL, '0000-00-00 00:00:00', ''),
	(59, 5, '2018-10-28 17:50:15', '2018-10-27', 12, 'Abc', 'A', NULL, '0000-00-00 00:00:00', ''),
	(60, 5, '2018-10-29 19:01:30', '2018-10-29', 2, 'ooh', 'P', NULL, '0000-00-00 00:00:00', '');
/*!40000 ALTER TABLE `transportrequisition` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.transportschedule
CREATE TABLE IF NOT EXISTS `transportschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkInstitute` int(11) NOT NULL,
  `fkTransportId` int(11) NOT NULL,
  `fkDriver` int(11) NOT NULL,
  `fkHelper` int(11) NOT NULL,
  `fkFromLocation` int(11) NOT NULL,
  `fkToLocation` int(11) NOT NULL,
  `departureTime` time DEFAULT NULL,
  `expectedTravelTime` int(11) DEFAULT NULL COMMENT 'It will calculated by minuits',
  `capacity` int(11) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_transportScheduleOrganization` (`fkInstitute`),
  KEY `FK_transportScheduleTransportId` (`fkTransportId`),
  KEY `FK_transportScheduleDriver` (`fkDriver`),
  KEY `FK_transportScheduleHelper` (`fkHelper`),
  KEY `FK_transportScheduleFromLocation` (`fkFromLocation`),
  KEY `FK_transportScheduleToLocation` (`fkToLocation`),
  KEY `FK_transportScheduleCreatedBy` (`createdBy`),
  CONSTRAINT `FK_transportScheduleCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_transportScheduleDriver` FOREIGN KEY (`fkDriver`) REFERENCES `driverinformation` (`id`),
  CONSTRAINT `FK_transportScheduleFromLocation` FOREIGN KEY (`fkFromLocation`) REFERENCES `venue` (`id`),
  CONSTRAINT `FK_transportScheduleHelper` FOREIGN KEY (`fkHelper`) REFERENCES `helperinformation` (`id`),
  CONSTRAINT `FK_transportScheduleInstitute` FOREIGN KEY (`fkInstitute`) REFERENCES `institute` (`id`),
  CONSTRAINT `FK_transportScheduleToLocation` FOREIGN KEY (`fkToLocation`) REFERENCES `venue` (`id`),
  CONSTRAINT `FK_transportScheduleTransportId` FOREIGN KEY (`fkTransportId`) REFERENCES `transportinformation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.transportschedule: ~11 rows (approximately)
/*!40000 ALTER TABLE `transportschedule` DISABLE KEYS */;
INSERT INTO `transportschedule` (`id`, `fkInstitute`, `fkTransportId`, `fkDriver`, `fkHelper`, `fkFromLocation`, `fkToLocation`, `departureTime`, `expectedTravelTime`, `capacity`, `createdTime`, `createdBy`) VALUES
	(9, 1, 10, 4, 1, 1, 1, '00:00:00', 111, 40, '2018-10-23 00:35:01', 5),
	(10, 1, 7, 4, 1, 1, 1, '00:00:00', 111, 40, '2018-10-23 00:35:09', 5),
	(11, 1, 9, 4, 6, 1, 1, '12:14:00', 11, 30, '2018-10-24 00:14:35', 5),
	(12, 1, 19, 5, 1, 2, 3, '08:30:00', 30, 40, '2018-10-24 00:15:32', 5),
	(13, 1, 19, 5, 1, 2, 2, '08:30:00', 30, 40, '2018-10-24 00:18:21', 5),
	(14, 1, 13, 9, 6, 14, 4, '00:05:54', 40, 40, '2018-10-25 00:06:07', 5),
	(15, 1, 13, 6, 1, 6, 11, '01:51:29', 60, 40, '2018-10-25 01:51:48', 1),
	(16, 1, 17, 4, 1, 1, 1, '00:01:00', 12, 10, '2018-10-26 00:01:25', 5),
	(17, 1, 20, 4, 1, 2, 14, '01:13:00', 120, 40, '2018-10-26 01:21:02', 5),
	(18, 1, 19, 7, 1, 13, 2, '11:16:00', 40, 40, '2018-10-28 11:17:06', 5),
	(19, 1, 10, 6, 1, 4, 3, '02:00:00', 33, 30, '2018-10-28 14:01:00', 5);
/*!40000 ALTER TABLE `transportschedule` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.transporttype
CREATE TABLE IF NOT EXISTS `transporttype` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typeTitle` varchar(32) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typeTitle` (`typeTitle`),
  KEY `FK_transportTypeCreatedBy` (`createdBy`),
  CONSTRAINT `FK_transportTypeCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.transporttype: ~10 rows (approximately)
/*!40000 ALTER TABLE `transporttype` DISABLE KEYS */;
INSERT INTO `transporttype` (`id`, `typeTitle`, `createdBy`, `createdTime`) VALUES
	(1, 'Private Car', 5, '2018-11-04 13:01:23'),
	(2, 'Abc', 5, '2018-11-04 13:01:24'),
	(3, 'Microbus', 5, '2018-11-04 13:01:26'),
	(4, 'Truck', 5, '2018-11-04 13:01:28'),
	(5, 'Pick Up', 5, '2018-11-04 13:01:48'),
	(6, 'Bus AC', 5, '2018-11-04 13:01:51'),
	(7, 'Van', 5, '2018-11-04 13:01:33'),
	(9, 'Bus', 5, '2018-11-04 13:01:35'),
	(12, '-', 5, '2018-11-04 13:01:40'),
	(14, 'Test', 5, '2018-11-04 13:01:38');
/*!40000 ALTER TABLE `transporttype` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `password` varchar(80) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `con_users_usercode_uk` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `enabled`, `createdTime`) VALUES
	(1, 'mujahid', '$2a$10$lqJ4wQHh9K5yEd98UECBnuzXaSdBD0x1fM6Y9bawMWOznk6HsihWS', 1, '2018-05-27 16:27:13'),
	(2, 'mujahid@gmail.com', '$2a$10$lqJ4wQHh9K5yEd98UECBnuzXaSdBD0x1fM6Y9bawMWOznk6HsihWS', 1, '2018-05-28 14:01:22'),
	(3, 'khan', '$2a$10$qf9k7z8QIbCOEtWrSxcB5eKQHla.met8EuYNGSg.Z/ei1Z3Tlwk2W', 1, '2018-05-30 14:10:16'),
	(4, 'mahadi', '$2a$10$zcvkCT2JXxe9iXiS0uf2L.FCwvYtPqI/qQI7/PpqW1Oms1bkhOe3u', 1, '2018-05-30 14:27:37'),
	(5, 'admin', '$2a$10$W2FYB/zACVsjmwtM1UL.vO8bsfWgsYqod7Uq3DSJOx4wAm02YKP82', 1, '2018-08-19 00:09:34'),
	(6, 'tanvir', '$2a$10$.1omyCCfhkFUxBbZE6RnJuqkuAUBfFN5czxD8vmoOooZyFIzkLo9W', 1, '2018-10-18 19:07:21'),
	(7, 'ribon', '$2a$10$sJKfR/IVvbtHpJiYkL7SROQT4zLRk611IgtqWJN6RkBvaALPLd8G2', 1, '2018-10-18 20:01:12'),
	(8, 'tanvir1', '$2a$10$fFtuz6ZKGUI9PF3sfNtRcuPUj4j6QzcYLMiYy9TM/rfaugjDCZLem', 1, '2018-10-18 20:01:59'),
	(12, 'someone', '$2a$10$MBV51JgJghElzyeWX5GRWe.Ikm.TadrqXkQ.beNRds61IXGTkvIsa', 1, '2018-10-28 22:17:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table transportmanagementtogit.venue
CREATE TABLE IF NOT EXISTS `venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venueName` varchar(100) NOT NULL,
  `locationMap` varchar(256) DEFAULT 'N/A',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `venueName` (`venueName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table transportmanagementtogit.venue: ~8 rows (approximately)
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` (`id`, `venueName`, `locationMap`, `createdTime`) VALUES
	(1, 'Main Campus', '', '2018-10-29 19:31:28'),
	(2, 'Permanent Campus', '', '2018-10-29 19:32:05'),
	(3, 'Uttara Campus', '', '2018-10-29 19:33:50'),
	(4, 'C & B', '', '2018-10-29 19:34:17'),
	(6, 'Mirpur-11', '', '2018-10-29 19:34:30'),
	(11, 'Mirpur-1', '', '2018-10-29 19:35:05'),
	(13, 'Savar', '', '2018-10-29 19:35:16'),
	(14, 'Gazipur', '', '2018-10-29 19:25:25');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;

-- Dumping structure for view transportmanagementtogit.viewbusschedule
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `viewbusschedule` (
	`id` VARCHAR(36) NOT NULL COLLATE 'utf8_general_ci',
	`busName` VARCHAR(32) NULL COLLATE 'utf8_general_ci',
	`startingTime` TIME NULL,
	`stationFrom` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`stationTo` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`driverName` VARCHAR(256) NOT NULL COLLATE 'utf8_general_ci',
	`helperName` VARCHAR(256) NOT NULL COLLATE 'utf8_general_ci',
	`helperContact` VARCHAR(20) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view transportmanagementtogit.viewtest
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `viewtest` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(256) NOT NULL COLLATE 'utf8_general_ci',
	`driverCode` VARCHAR(32) NULL COLLATE 'utf8_general_ci',
	`dob` DATE NULL,
	`drivingLicense` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci',
	`licenseExpireDate` DATE NULL,
	`nid` VARCHAR(64) NULL COLLATE 'utf8_general_ci',
	`presentAddress` TEXT NULL COLLATE 'utf8_general_ci',
	`parmanentAddress` TEXT NULL COLLATE 'utf8_general_ci',
	`contactNO` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`email` VARCHAR(256) NULL COLLATE 'utf8_general_ci',
	`photo` VARCHAR(256) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view transportmanagementtogit.brandandmodel
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `brandandmodel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `brandandmodel` AS select uuid() AS `id`,`bn`.`brandName` AS `brandName`,group_concat(`bm`.`modelNo` separator ',') AS `model` from (`brands` `bn` join `brandmodel` `bm`) where (`bm`.`fkBrand` = `bn`.`id`) group by `bn`.`brandName`;

-- Dumping structure for view transportmanagementtogit.busschedule
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `busschedule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `busschedule` AS select `ti`.`transportName` AS `Bus Name`,`ts`.`departureTime` AS `Staring Time`,`vn`.`venueName` AS `Station From`,`vn1`.`venueName` AS `Station To`,`di`.`name` AS `Driver Name`,`hi`.`name` AS `Helper Name`,`hi`.`contactNO` AS `Helper Contact` from (((((((`transporttype` `tt` join `transportschedule` `ts`) join `transportinformation` `ti`) join `venue` `vn`) join `venue` `vn1`) join `driverinformation` `di`) join `helperinformation` `hi`) join `institute` `ins`) where ((`ti`.`fkTransportType` = `tt`.`id`) and (`ts`.`fkTransportId` = `ti`.`id`) and (`ts`.`fkFromLocation` = `vn`.`id`) and (`ts`.`fkToLocation` = `vn1`.`id`) and (`ts`.`fkDriver` = `di`.`id`) and (`ts`.`fkHelper` = `hi`.`id`) and (`ins`.`instituteName` = 'DIU'));

-- Dumping structure for view transportmanagementtogit.viewbusschedule
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `viewbusschedule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewbusschedule` AS select uuid() AS `id`,`ti`.`transportName` AS `busName`,`ts`.`departureTime` AS `startingTime`,`vn`.`venueName` AS `stationFrom`,`vn1`.`venueName` AS `stationTo`,`di`.`name` AS `driverName`,`hi`.`name` AS `helperName`,`hi`.`contactNO` AS `helperContact` from (((((((`transporttype` `tt` join `transportschedule` `ts`) join `transportinformation` `ti`) join `venue` `vn`) join `venue` `vn1`) join `driverinformation` `di`) join `helperinformation` `hi`) join `institute` `ins`) where ((`ti`.`fkTransportType` = `tt`.`id`) and (`ts`.`fkTransportId` = `ti`.`id`) and (`ts`.`fkFromLocation` = `vn`.`id`) and (`ts`.`fkToLocation` = `vn1`.`id`) and (`ts`.`fkDriver` = `di`.`id`) and (`ts`.`fkHelper` = `hi`.`id`) and (`ins`.`instituteName` = 'DIU'));

-- Dumping structure for view transportmanagementtogit.viewtest
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `viewtest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewtest` AS select `driverinformation`.`id` AS `id`,`driverinformation`.`name` AS `name`,`driverinformation`.`driverCode` AS `driverCode`,`driverinformation`.`dob` AS `dob`,`driverinformation`.`drivingLicense` AS `drivingLicense`,`driverinformation`.`licenseExpireDate` AS `licenseExpireDate`,`driverinformation`.`nid` AS `nid`,`driverinformation`.`presentAddress` AS `presentAddress`,`driverinformation`.`parmanentAddress` AS `parmanentAddress`,`driverinformation`.`contactNO` AS `contactNO`,`driverinformation`.`email` AS `email`,`driverinformation`.`photo` AS `photo` from `driverinformation`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
