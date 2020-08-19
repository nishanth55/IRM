-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2020 at 02:43 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covidsoln`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_detail`
--

CREATE TABLE `case_detail` (
  `CASE_ID` int(11) NOT NULL,
  `RECORD_CREATE_DATE` date NOT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `TEMPERATURE` float NOT NULL,
  `STATUS` char(20) DEFAULT NULL COMMENT 'valid values\r\n             Draft\r\n             Created\r\n             In Progress\r\n             Deferred\r\n             Closed',
  `EMPLOYEE_ID` varchar(20) DEFAULT NULL,
  `EMPLOYEE_NAME` varchar(40) NOT NULL,
  `EMPLOYEE_DOB` date NOT NULL,
  `EMPLOYEE_CONTACT` varchar(10) NOT NULL,
  `DISPOSITION_CODE` varchar(20) NOT NULL,
  `COMMENTS` varchar(40) NOT NULL,
  `CASE_TIME` time NOT NULL,
  `CASE_TYPE` varchar(20) NOT NULL,
  `SD_TAG_ID` varchar(20) DEFAULT NULL COMMENT 'social distancing tag ID',
  `SEVERITY` varchar(20) DEFAULT NULL COMMENT 'Severity\r\n             Low\r\n             Medium\r\n             High',
  `DISPOSITION` varchar(40) DEFAULT NULL COMMENT 'Sent Home\r\n             Allowed to Work\r\n             Sent to Hospital\r\n             Sent to Quarantine',
  `FACILITY` varchar(20) DEFAULT NULL,
  `USER_ID` varchar(20) DEFAULT NULL,
  `DEVICE_ID` varchar(20) NOT NULL,
  `SUPERVISOR_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `case_detail`
--

INSERT INTO `case_detail` (`CASE_ID`, `RECORD_CREATE_DATE`, `CREATE_DATE`, `TEMPERATURE`, `STATUS`, `EMPLOYEE_ID`, `EMPLOYEE_NAME`, `EMPLOYEE_DOB`, `EMPLOYEE_CONTACT`, `DISPOSITION_CODE`, `COMMENTS`, `CASE_TIME`, `CASE_TYPE`, `SD_TAG_ID`, `SEVERITY`, `DISPOSITION`, `FACILITY`, `USER_ID`, `DEVICE_ID`, `SUPERVISOR_ID`) VALUES
(1, '0000-00-00', '2020-08-18', 102, 'Created', 'CL-99', 'Nishanth', '2020-08-19', '9032446855', '1254', 'good', '09:34:21', 'High Fever', NULL, 'Low', 'Allowed to Work', 'Bangalore', 'UR-8409', 'DK-1599', 'S-02'),
(2, '0000-00-00', '2020-08-18', 102, 'Created', 'CL-99', 'Nishanth', '2020-08-19', '9032446855', '1254', 'good', '09:34:21', 'High Fever', NULL, 'Low', 'Allowed to Work', 'Bangalore', 'UR-8409', 'DK-1599', 'S-02'),
(3, '0000-00-00', '2019-09-29', 103, 'In Progress', 'Cl-180', 'Nishanth', '1995-07-28', '9955668877', '1666', 'Good', '00:00:00', 'No Face Mask', NULL, 'high', 'Work from home', 'Bangalore', '1246', 'DF-7760', '177'),
(4, '0000-00-00', '2020-05-05', 103, 'Created', 'Cl-179', 'Shifa', '1995-07-28', '9955668877', '1666', 'Good', '19:30:10', 'No Face Mask', NULL, 'high', 'Allowed to work', 'Atlanta', '1247', '15496', '166'),
(5, '0000-00-00', '2019-09-29', 100, 'Created', 'Cl-177', '', '0000-00-00', '', '', '', '00:00:00', 'Face Mask', NULL, 'high', 'Work from home', 'Bangalore', '1246', 'DF-7760', NULL),
(6, '0000-00-00', '2019-09-29', 104, 'Created', 'Cl-180', '', '0000-00-00', '', '', '', '00:00:00', 'Face Mask', NULL, 'high', 'Allowed to work', 'Bangalore', '123', 'DF-7760', NULL),
(7, '0000-00-00', '2020-05-05', 102, 'Created', 'Cl-177', 'Nishanth', '1995-07-28', '9955668877', '1666', 'Good', '19:30:10', 'Face Mask', NULL, 'Low', 'Allowed to work', 'Hyderabad', '123', 'DF-1766', '177'),
(8, '0000-00-00', '2020-05-05', 103, 'In Progress', 'Cl-181', '', '0000-00-00', '', '', '', '19:30:10', '', NULL, 'high', 'Allowed to work', 'Hyderabad', '1246', 'DF-1758', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `covid_case`
--

CREATE TABLE `covid_case` (
  `CASE_ID` int(11) NOT NULL,
  `CREATE_DATE` date NOT NULL COMMENT 'The Date/Time when the event was created in Cumulocity',
  `CASE_TIME` time NOT NULL,
  `STATUS` char(20) DEFAULT NULL COMMENT 'valid values\r\n             Draft\r\n             Created\r\n             In Progress\r\n             Closed',
  `EMPLOYEE_ID` varchar(20) DEFAULT NULL,
  `DEVICE_ID` varchar(40) DEFAULT NULL COMMENT 'The device ID from Cumulocity\r\n             COuld be a thermal camera or a wearable tag',
  `DISPOSITION` varchar(40) DEFAULT NULL COMMENT 'Sent Home\r\n             Allowed to Work\r\n             Sent to Hospital\r\n             Sent to Quarantine',
  `FACILITY` varchar(20) DEFAULT NULL,
  `USER_ID` varchar(20) DEFAULT NULL,
  `SUPERVISOR_ID` varchar(20) DEFAULT NULL,
  `TEMPERATURE` float NOT NULL,
  `CASE_TYPE` varchar(20) NOT NULL COMMENT 'There are 3 case types\r\n             1. No Face Mask\r\n             2. High Fever\r\n             3. Proximity Violation',
  `SEVERITY` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `covid_case`
--

INSERT INTO `covid_case` (`CASE_ID`, `CREATE_DATE`, `CASE_TIME`, `STATUS`, `EMPLOYEE_ID`, `DEVICE_ID`, `DISPOSITION`, `FACILITY`, `USER_ID`, `SUPERVISOR_ID`, `TEMPERATURE`, `CASE_TYPE`, `SEVERITY`) VALUES
(1, '2019-09-29', '09:34:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Bangalore', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium'),
(2, '2019-09-15', '09:38:00', 'Draft', 'CL-85', 'DF-7760', 'Sent Home', 'Bangalore', 'UR-4515', 'S-76', 103, 'No Face Mask', 'Medium'),
(3, '2019-09-20', '18:30:10', 'Draft', 'Cl-118', 'DF-7763', 'Work from home', 'Hyderabad', '1248', 'S-78', 104, 'Face Mask', 'Low'),
(4, '2019-05-29', '18:20:10', 'Draft', 'CL-88', 'DF-7767', 'Sent Home', 'Bangalore', 'UR-4520', 'S-80', 101, 'No Face Mask', 'Medium'),
(5, '2019-09-19', '17:20:10', 'Draft', 'Cl-165', 'DF-7772', 'Work from home', 'Hyderabad', '1246', 'S-88', 102.1, 'Face Mask', 'high'),
(6, '2019-06-29', '18:25:15', 'Draft', 'Cl-156', 'DF-7750', 'Allowed to work', 'Bangalore', '123', 'S-75', 102.1, 'Face Mask', 'high'),
(7, '2019-08-15', '17:10:10', 'Draft', 'CL-64', 'DF-7740', 'Sent Home', 'Hyderabad', 'UR-4524', 'S-45', 103, 'No Face Mask', 'Medium'),
(8, '2019-09-27', '15:20:10', 'Draft', 'CL-89', 'DF-7764', 'Sent Home', 'Bangalore', 'UR-4534', 'S-79', 102.1, 'No Face Mask', 'Medium'),
(9, '2019-09-29', '00:00:00', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Bangalore', 'UR-4514', 'S-75', 101, 'No Face Mask', 'Medium'),
(10, '2019-09-23', '08:34:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Hyderabad', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium'),
(11, '2019-09-16', '08:20:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Bangalore', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium'),
(12, '2019-09-11', '08:34:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Bangalore', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium'),
(13, '2019-10-15', '08:34:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Hyderabad', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium'),
(14, '2019-10-11', '08:34:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Bangalore', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium'),
(15, '2019-09-23', '08:34:21', 'Draft', 'CL-84', 'DF-7760', 'Sent Home', 'Hyderabad', 'UR-4514', 'S-75', 102.1, 'No Face Mask', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', 'admin', '2020-08-17 15:13:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `case_detail`
--
ALTER TABLE `case_detail`
  ADD PRIMARY KEY (`CASE_ID`,`RECORD_CREATE_DATE`);

--
-- Indexes for table `covid_case`
--
ALTER TABLE `covid_case`
  ADD PRIMARY KEY (`CASE_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `case_detail`
--
ALTER TABLE `case_detail`
  MODIFY `CASE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `covid_case`
--
ALTER TABLE `covid_case`
  MODIFY `CASE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `case_detail`
--
ALTER TABLE `case_detail`
  ADD CONSTRAINT `FK_CASE_DET_REFERENCE_CASE` FOREIGN KEY (`CASE_ID`) REFERENCES `covid_case` (`CASE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
