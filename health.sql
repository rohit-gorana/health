-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 23, 2016 at 05:31 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `health`
--

-- --------------------------------------------------------

--
-- Table structure for table `aadhar`
--

CREATE TABLE IF NOT EXISTS `aadhar` (
  `uid` bigint(12) NOT NULL,
  `name` text NOT NULL,
  `dob` date NOT NULL,
  `gender` char(1) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `email` text NOT NULL,
  `street` text NOT NULL,
  `vtc` text NOT NULL,
  `subdist` text NOT NULL,
  `district` text NOT NULL,
  `state` text NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aadhar`
--

INSERT INTO `aadhar` (`uid`, `name`, `dob`, `gender`, `phone`, `email`, `street`, `vtc`, `subdist`, `district`, `state`, `pincode`) VALUES
(999999990019, 'Shivshankar Choudhury', '1968-05-13', 'M', 2810806979, 'sschoudhury@dummyemail.com', '12 Maulana Azad Marg', 'New Delhi', 'New Delhi', 'New Delhi', 'New Delhi', 110002),
(999999990026, 'Kumar Agarwal', '1978-05-04', 'M', 2314475929, 'kma@mailserver.com', '5A Madhuban', 'Udaipur', 'Udaipur', 'Udaipur', 'Rajasthan', 313001),
(999999990042, 'Fatim Bedi', '1943-07-30', 'F', 2837032088, 'bedi2020@mailserver.com', 'K-3A Rampur Garden', 'Bareilly', 'Bareilly', 'Bareilley', 'Uttar Pradesh', 243001),
(999999990057, 'Rohit Pandey', '1985-07-08', 'M', 2821096353, 'rpandey@mailserver.com', '7TH Road Raja Wadi', 'Mumbai', 'Mumbai', 'Mumbai', 'Maharastra', 243001),
(999999999910, 'Rohit Gorana', '1996-08-18', 'M', 8386841960, 'Rohit@gmail.com', 'block a, sec 3', 'Hiran Magri', 'Udaipur', 'Udaipur', 'Rajasthan', 313001),
(999999999994, 'Raju Rastogi', '2000-12-06', 'M', 9828527801, 'rajubhai@gmail.com', 'Dholi Magri sec 4', 'Hiran Magri', 'Udaipur', 'Udaipur', 'Rajasthan', 315531),
(999999999995, 'Neha Kalra', '2001-07-06', 'F', 7725993314, 'Neha@gmail.com', 'Suraj Pole', 'Suraj Pole', 'Udaipur', 'Udaipur', 'Rajasthan', 325023),
(999999999996, 'Meena Kumari', '1984-10-08', 'F', 9680764272, 'meena@gmail.com', 'Suraj Pole', 'Suraj Pole', 'Udaipur', 'Udaipur', 'Rajasthan', 325023),
(999999999997, 'Suraj Panchal', '1995-10-09', 'M', 9829432890, 'suraj@gmail.com', 'Suraj Pole', 'Suraj Pole', 'Udaipur', 'Udaipur', 'Rajasthan', 325023),
(999999999998, 'Sahil Suhalka', '2000-03-09', 'M', 9509964391, 'sahil@gmail.com', 'Suraj Pole', 'Suraj Pole', 'Udaipur', 'Udaipur', 'Rajasthan', 325023),
(999999999999, 'Tejal Chouhan', '2001-03-15', 'F', 8854999473, 'tejal@gmail.com', 'Suraj Pole', 'Suraj Pole', 'Udaipur', 'Udaipur', 'Rajasthan', 325023);

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE IF NOT EXISTS `allergies` (
`Id` bigint(12) NOT NULL,
  `Card_Id` bigint(20) NOT NULL,
  `Allergy` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allergies`
--

INSERT INTO `allergies` (`Id`, `Card_Id`, `Allergy`) VALUES
(1, 1, 'Lactos'),
(2, 1, 'Olives'),
(3, 2, 'Ginger'),
(4, 2, 'Cats'),
(5, 3, 'Polen'),
(6, 3, 'Lemon'),
(7, 4, 'Lemon'),
(8, 4, 'Dirt'),
(9, 5, 'Dirt'),
(10, 5, 'Lactos'),
(11, 6, 'Olives'),
(12, 6, 'Ginger'),
(13, 7, 'Ginger'),
(14, 7, 'Cat'),
(15, 9, 'Cat'),
(16, 9, 'Polen'),
(17, 10, 'Polens'),
(18, 10, 'Dirt');

-- --------------------------------------------------------

--
-- Table structure for table `chronic_conditions`
--

CREATE TABLE IF NOT EXISTS `chronic_conditions` (
`id` bigint(12) NOT NULL,
  `Card_Id` bigint(20) NOT NULL,
  `Chr_Condition` text NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chronic_conditions`
--

INSERT INTO `chronic_conditions` (`id`, `Card_Id`, `Chr_Condition`, `Status`) VALUES
(1, 1, 'Blood Pressure', 'Normal'),
(2, 1, 'Diabetes', 'Normal'),
(3, 2, 'Diabetes', 'Serious'),
(4, 2, 'Arthritis', 'Normal'),
(5, 3, 'Arthritis', 'Normal'),
(6, 3, 'Migrane', 'Concern'),
(7, 4, 'Migrane', 'Normal'),
(8, 4, 'Depression', 'Concern'),
(9, 5, 'Depression', 'Serious'),
(10, 5, 'Sleeplessness', 'Normal'),
(11, 6, 'Sleeplessness', 'Normal'),
(12, 6, 'Blood Pressure', 'Normal'),
(13, 7, 'Blood Pressure', 'Serious'),
(14, 7, 'Diabetes', 'Concern'),
(15, 8, 'Diabetes', 'Serious'),
(16, 8, 'Arthritis', 'Normal'),
(17, 9, 'Arthritis', 'Normal'),
(18, 9, 'Migrane', 'Concern'),
(19, 10, 'Sleeplessness', 'Normal'),
(20, 10, 'Blood Pressure', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `current_conditions`
--

CREATE TABLE IF NOT EXISTS `current_conditions` (
`id` bigint(12) NOT NULL,
  `Card_Id` bigint(20) NOT NULL,
  `Health_Status` text NOT NULL,
  `Initial_Date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `current_conditions`
--

INSERT INTO `current_conditions` (`id`, `Card_Id`, `Health_Status`, `Initial_Date`) VALUES
(1, 1, 'Healthy', '2016-08-01'),
(2, 2, 'Phenemonia', '2016-08-01'),
(3, 3, 'Healthy', '2016-08-01'),
(4, 4, 'Healthy', '2016-08-01'),
(5, 5, 'Jaundice', '2016-08-01'),
(6, 6, 'Fever', '2016-08-01'),
(7, 7, 'Healthy', '2016-08-01'),
(8, 8, 'Healthy', '2016-08-01'),
(9, 9, 'Healthy', '2016-08-01'),
(10, 10, 'Healthy', '2016-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `healthcard`
--

CREATE TABLE IF NOT EXISTS `healthcard` (
`id` bigint(12) NOT NULL,
  `Aadhar_No` bigint(12) NOT NULL,
  `Name` text NOT NULL,
  `Last_Diag` date DEFAULT NULL,
  `Blood_Group` char(2) NOT NULL,
  `Emg_Contact` bigint(12) NOT NULL,
  `Password` text
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `healthcard`
--

INSERT INTO `healthcard` (`id`, `Aadhar_No`, `Name`, `Last_Diag`, `Blood_Group`, `Emg_Contact`, `Password`) VALUES
(1, 999999990019, 'Shivshankar Choudhary', '2016-08-01', 'B+', 8386841960, '123'),
(2, 999999990026, 'Kumar Agarwal', '2016-08-01', 'A', 8386841969, '123'),
(3, 999999990042, 'Fatim Bedi', '2016-08-01', 'O-', 8386841960, '123'),
(4, 999999990057, 'Rohit Pandey', '2016-08-01', 'O+', 8386841960, '123'),
(5, 999999999994, 'Raju Rastogi', '2016-08-01', 'A+', 8386841960, '123'),
(6, 999999999995, 'Neha Kalra', '2016-08-01', 'A-', 8386841960, '123'),
(7, 999999999996, 'Meena Kumari', '2016-08-01', 'B-', 8386841960, '123'),
(8, 999999999997, 'Suraj Panchal', '2016-08-01', 'B+', 8386841960, '123'),
(9, 999999999998, 'Sahil Suhalka', '2016-08-01', 'B+', 8386841960, '123'),
(10, 999999999999, 'Tejal Chouhan', '2016-08-01', 'A-', 8386841960, '123');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
`Id` bigint(12) NOT NULL,
  `Card_Id` bigint(12) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Diagnosis` text NOT NULL,
  `Result` text,
  `Notes` text
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`Id`, `Card_Id`, `Start_Date`, `End_Date`, `Diagnosis`, `Result`, `Notes`) VALUES
(1, 1, '2016-07-13', '2016-07-16', 'Fever', 'Cured', 'Nill'),
(2, 1, '2016-06-21', '2016-06-22', 'Flew', 'Cured', 'Caused due to cold.'),
(3, 1, '2016-05-04', '2016-05-09', 'Food Poisoning', 'Cured', 'Caused due to Junk Food.'),
(4, 2, '2016-07-13', '2016-07-16', 'Fever', 'Cured', 'Nill'),
(5, 2, '2016-05-04', '2016-05-09', 'Food Poisoning', 'Cured', 'Caused due to Junk Food.'),
(6, 3, '2016-06-03', '2016-06-11', 'Dangue', 'Cured', NULL),
(7, 3, '2016-04-01', '2016-04-04', 'Fever', 'Cured', NULL),
(8, 4, '2016-08-12', '2016-08-13', 'Fever', 'Cured', NULL),
(9, 4, '2016-07-06', '2016-07-09', 'Jaundice', 'Cured', NULL),
(10, 5, '2016-01-16', '2016-01-21', 'Malaria', 'Cured', NULL),
(11, 5, '2016-05-14', '2016-05-15', 'Fever', 'Cured', NULL),
(12, 6, '2016-02-28', '2016-02-18', 'Chicken Pox', 'Cured', NULL),
(13, 6, '2016-04-09', '2016-04-11', 'Cold', 'Cured', NULL),
(14, 7, '2016-06-10', '2016-06-21', 'Chicken Pox', 'Cured', NULL),
(15, 7, '2016-06-14', '2016-06-19', 'Fever', 'Cured', NULL),
(16, 8, '2016-02-16', '2016-02-22', 'Cold', 'Cured', NULL),
(17, 8, '2016-06-16', '2016-06-20', 'Fever', 'Cured', NULL),
(18, 9, '2016-04-12', '2016-04-30', 'TB', 'Cured', NULL),
(19, 9, '2016-02-03', '2016-02-21', 'Phenemonia', 'Cured', NULL),
(20, 10, '2016-05-04', '2016-05-19', 'Jaundice', 'Cured', NULL),
(21, 10, '2016-08-07', '2016-08-14', 'Maleria', 'Cured', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aadhar`
--
ALTER TABLE `aadhar`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
 ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `chronic_conditions`
--
ALTER TABLE `chronic_conditions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_conditions`
--
ALTER TABLE `current_conditions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `healthcard`
--
ALTER TABLE `healthcard`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
 ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergies`
--
ALTER TABLE `allergies`
MODIFY `Id` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `chronic_conditions`
--
ALTER TABLE `chronic_conditions`
MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `current_conditions`
--
ALTER TABLE `current_conditions`
MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `healthcard`
--
ALTER TABLE `healthcard`
MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
MODIFY `Id` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
