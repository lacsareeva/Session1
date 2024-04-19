-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 06:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `session1`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetgroups`
--

CREATE TABLE `assetgroups` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assetgroups`
--

INSERT INTO `assetgroups` (`ID`, `Name`) VALUES
(1, 'Hydraulic'),
(3, 'Electrical'),
(4, 'Mechanical ');

-- --------------------------------------------------------

--
-- Table structure for table `assetphotos`
--

CREATE TABLE `assetphotos` (
  `ID` bigint(20) NOT NULL,
  `AssetID` bigint(20) NOT NULL,
  `AssetPhoto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `ID` bigint(20) NOT NULL,
  `AssetSN` varchar(20) NOT NULL,
  `AssetName` varchar(150) NOT NULL,
  `DepartmentLocationID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL,
  `AssetGroupID` bigint(20) NOT NULL,
  `Description` text NOT NULL,
  `WarrantyDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`ID`, `AssetSN`, `AssetName`, `DepartmentLocationID`, `EmployeeID`, `AssetGroupID`, `Description`, `WarrantyDate`) VALUES
(1, '02/03/0023', 'Toyota Hilux FAF321', 3, 5, 3, '', '0000-00-00'),
(2, '03/01/0031', 'Suction Line 852', 2, 8, 3, '', '2020-03-02'),
(3, '02/04/0024', 'ZENY 3,5CFM Single-Stage 5 Pa Rotary Vane', 10, 22, 1, '', '2018-01-17'),
(4, '03/04/0034', 'Volvo FH16', 8, 26, 4, '', NULL),
(9, '03/01/0009', 'Car Dealer', 3, 1, 1, '', '0000-00-00'),
(11, '06/04/0011', 'Pizza Seller', 6, 17, 4, '', '0000-00-00'),
(14, '02/03/0011', 'Fish Seller', 2, 2, 3, '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `assettransferlogs`
--

CREATE TABLE `assettransferlogs` (
  `ID` bigint(20) NOT NULL,
  `AssetID` bigint(20) NOT NULL,
  `TransferDate` date NOT NULL,
  `FromAssetSN` varchar(20) NOT NULL,
  `ToAssetSN` varchar(20) NOT NULL,
  `FromDepartmentLocationID` bigint(20) NOT NULL,
  `ToDepartmentLocationID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assettransferlogs`
--

INSERT INTO `assettransferlogs` (`ID`, `AssetID`, `TransferDate`, `FromAssetSN`, `ToAssetSN`, `FromDepartmentLocationID`, `ToDepartmentLocationID`) VALUES
(1, 1, '2012-01-09', '04/04/0002', '05/04/0001', 7, 4),
(2, 3, '2014-02-02', '03/01/0001', '01/01/0001', 8, 11),
(24, 2, '2024-04-02', '04/03/0001', '01/03/0013', 5, 11),
(28, 1, '2024-04-02', '05/04/0001', '01/04/0014', 3, 11),
(29, 1, '2024-04-02', '05/04/0001', '01/04/0014', 3, 11),
(31, 4, '2024-04-02', '02/03/0023', '01/04/0014', 22, 13),
(33, 2, '2024-04-02', '01/04/0014', '02/03/0023', 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `departmentlocations`
--

CREATE TABLE `departmentlocations` (
  `ID` bigint(20) NOT NULL,
  `DepartmentID` bigint(20) NOT NULL,
  `LocationID` bigint(20) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `departmentlocations`
--

INSERT INTO `departmentlocations` (`ID`, `DepartmentID`, `LocationID`, `StartDate`, `EndDate`) VALUES
(1, 6, 3, '2010-12-28', '2011-01-20'),
(2, 3, 2, '2015-12-27', '2019-08-20'),
(3, 5, 2, '1996-04-29', NULL),
(4, 5, 1, '2002-03-04', NULL),
(5, 3, 3, '1991-03-25', '2001-10-30'),
(6, 4, 3, '2012-05-28', NULL),
(7, 4, 2, '2005-05-04', NULL),
(8, 3, 2, '1992-10-17', NULL),
(9, 3, 3, '2000-01-08', NULL),
(10, 2, 2, '1993-12-25', NULL),
(11, 1, 2, '2005-11-11', NULL),
(12, 1, 2, '1991-01-17', '2000-02-02'),
(13, 1, 1, '0000-00-00', NULL),
(14, 2, 1, '0000-00-00', NULL),
(15, 3, 2, '0000-00-00', NULL),
(16, 3, 1, '0000-00-00', NULL),
(17, 3, 3, '0000-00-00', NULL),
(18, 6, 3, '0000-00-00', NULL),
(19, 6, 3, '0000-00-00', NULL),
(20, 4, 3, '0000-00-00', NULL),
(21, 1, 3, '2024-04-02', NULL),
(22, 2, 3, '2024-04-02', NULL),
(23, 3, 1, '0000-00-00', NULL),
(24, 2, 1, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`ID`, `Name`) VALUES
(1, 'Exploration'),
(2, 'Production'),
(3, 'Transportation'),
(4, 'R&D'),
(5, 'Distribution'),
(6, 'QHSE');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` bigint(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `FirstName`, `LastName`, `Phone`) VALUES
(1, 'Martina', 'Winegarden', '69232044381'),
(2, 'Rashida', 'Brammer', '70687629632'),
(3, 'Mohamed', 'Krall', '52688435003'),
(4, 'Shante', 'Karr', '73706803851'),
(5, 'Rosaura', 'Rames', '70477806324'),
(6, 'Toi', 'Courchesne', '37756763508'),
(7, 'Precious', 'Wismer', '15287468908'),
(8, 'Josefa', 'Otte', '68886927765'),
(9, 'Afton', 'Harrington', '41731972558'),
(10, 'Daphne', 'Morrow', '49099375842'),
(11, 'Dottie', 'Polson', '91205317719'),
(12, 'Alleen', 'Nally', '26312971918'),
(13, 'Hilton', 'Odom', '66197770749'),
(14, 'Shawn', 'Hillebrand', '64091780262'),
(15, 'Lorelei', 'Kettler', '73606665126'),
(16, 'Jalisa', 'Gossage', '10484197749'),
(17, 'Germaine', 'Sim', '62454794026'),
(18, 'Suzanna', 'Wollman', '97932678482'),
(19, 'Jennette', 'Besse', '26229712670'),
(20, 'Margherita', 'Anstine', '87423893204'),
(21, 'Earleen', 'Lambright', '64658700776'),
(22, 'Lyn', 'Valdivia', '32010885662'),
(23, 'Alycia', 'Couey', '41716866650'),
(24, 'Lewis', 'Rousey', '16716397946'),
(25, 'Tanja', 'Profitt', '77230010211'),
(26, 'Cherie', 'Whyte', '33510813739'),
(27, 'Efren', 'Leaf', '72090665294'),
(28, 'Delta', 'Darcangelo', '73136120450'),
(29, 'Jess', 'Bodnar', '12207277240'),
(30, 'Sudie', 'Parkhurst', '26842289705');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`ID`, `Name`) VALUES
(1, 'Kazan'),
(2, 'Volka'),
(3, 'Moscow');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetgroups`
--
ALTER TABLE `assetgroups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `assetphotos`
--
ALTER TABLE `assetphotos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AssetPhotos_Assets` (`AssetID`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Assets_Employees` (`EmployeeID`),
  ADD KEY `FK_Assets_AssetGroups` (`AssetGroupID`),
  ADD KEY `FK_Assets_DepartmentLocations` (`DepartmentLocationID`);

--
-- Indexes for table `assettransferlogs`
--
ALTER TABLE `assettransferlogs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AssetTransferLogs_DepartmentLocations` (`FromDepartmentLocationID`),
  ADD KEY `FK_AssetTransferLogs_DepartmentLocations1` (`ToDepartmentLocationID`),
  ADD KEY `FK_AssetTransfers_Assets` (`AssetID`);

--
-- Indexes for table `departmentlocations`
--
ALTER TABLE `departmentlocations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DepartmentLocations_Departments` (`DepartmentID`),
  ADD KEY `FK_DepartmentLocations_Locations` (`LocationID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetgroups`
--
ALTER TABLE `assetgroups`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `assetphotos`
--
ALTER TABLE `assetphotos`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `assettransferlogs`
--
ALTER TABLE `assettransferlogs`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `departmentlocations`
--
ALTER TABLE `departmentlocations`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetphotos`
--
ALTER TABLE `assetphotos`
  ADD CONSTRAINT `FK_AssetPhotos_Assets` FOREIGN KEY (`AssetID`) REFERENCES `assets` (`ID`);

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `FK_Assets_AssetGroups` FOREIGN KEY (`AssetGroupID`) REFERENCES `assetgroups` (`ID`),
  ADD CONSTRAINT `FK_Assets_DepartmentLocations` FOREIGN KEY (`DepartmentLocationID`) REFERENCES `departmentlocations` (`ID`),
  ADD CONSTRAINT `FK_Assets_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`ID`);

--
-- Constraints for table `assettransferlogs`
--
ALTER TABLE `assettransferlogs`
  ADD CONSTRAINT `FK_AssetTransferLogs_DepartmentLocations` FOREIGN KEY (`FromDepartmentLocationID`) REFERENCES `departmentlocations` (`ID`),
  ADD CONSTRAINT `FK_AssetTransferLogs_DepartmentLocations1` FOREIGN KEY (`ToDepartmentLocationID`) REFERENCES `departmentlocations` (`ID`),
  ADD CONSTRAINT `FK_AssetTransfers_Assets` FOREIGN KEY (`AssetID`) REFERENCES `assets` (`ID`);

--
-- Constraints for table `departmentlocations`
--
ALTER TABLE `departmentlocations`
  ADD CONSTRAINT `FK_DepartmentLocations_Departments` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`ID`),
  ADD CONSTRAINT `FK_DepartmentLocations_Locations` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
