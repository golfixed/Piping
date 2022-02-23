-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 23, 2022 at 05:02 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `piping`
--

-- --------------------------------------------------------

--
-- Table structure for table `CML`
--

CREATE TABLE `CML` (
  `id` int(11) NOT NULL,
  `cml_number` int(11) NOT NULL,
  `cml_description` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `actual_outside_diameter` float DEFAULT NULL,
  `design_thickness` float DEFAULT NULL,
  `structural_thickness` float DEFAULT NULL,
  `required_thickness` float DEFAULT NULL,
  `id_info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `CML`
--

INSERT INTO `CML` (`id`, `cml_number`, `cml_description`, `actual_outside_diameter`, `design_thickness`, `structural_thickness`, `required_thickness`, `id_info`) VALUES
(5, 12, 'ทดสอบแล้วว่ายังใช้ได้ 555 555', 168.3, 4.186, 2.8, 4.186, 21),
(6, 2, 'what if it separated', 168.3, 4.186, 2.8, 4.186, 21),
(9, 1, 'test 555', 60.3, 1.5, 1.8, 1.8, 23),
(10, 2, 'ทดสอบอีกรอบ ทดสอบอีก', 60.3, 1.5, 1.8, 1.8, 23),
(14, 3, 'test moree more', 457, 11.366, 2.8, 11.366, 21),
(15, 20, 'ภาษาไทย english', 457, 11.366, 2.8, 11.366, 21),
(16, 1, 'test ทดสอบ', 457, 11.366, 2.8, 11.366, 21);

-- --------------------------------------------------------

--
-- Table structure for table `INFO`
--

CREATE TABLE `INFO` (
  `id` int(11) NOT NULL,
  `line_number` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `_from` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `_to` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `drawing_number` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `service` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `material` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `inservice_date` date DEFAULT NULL,
  `pipe_size` float DEFAULT NULL,
  `original_thickness` float DEFAULT NULL,
  `stress` float DEFAULT NULL,
  `joint_efficiency` float DEFAULT NULL,
  `ca` float DEFAULT NULL,
  `design_life` float DEFAULT NULL,
  `design_pressure` float DEFAULT NULL,
  `operating_pressure` float DEFAULT NULL,
  `design_temperature` float DEFAULT NULL,
  `operating_temperature` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `INFO`
--

INSERT INTO `INFO` (`id`, `line_number`, `location`, `_from`, `_to`, `drawing_number`, `service`, `material`, `inservice_date`, `pipe_size`, `original_thickness`, `stress`, `joint_efficiency`, `ca`, `design_life`, `design_pressure`, `operating_pressure`, `design_temperature`, `operating_temperature`) VALUES
(21, '6-PL-J4N-01007', 'Dacon A', 'BLACK STARTCOOLED WELL FLUID FROM MDPP ', 'TEST SEPARATOR,V-0111', 'MDA-D-B-26001-1-0-Rev00-2011', 'PL', 'Duplex Stainless Steel', '2022-02-22', 18, 7.5, 20000, 1, 3, 25, 1015, 327, 140, 70),
(25, '3-GC-J4N-10017', 'Dacon C', 'BLACK STARTCOOLED WELL FLUID FROM MDPP ', 'TEST SEPARATOR,V-0111', 'B17-3-AMA-PR-005-0003', 'GC', 'Duplex Stainless Steel', '2022-02-22', 3, 5.48, 20000, 1, 3, 25, 1015, 623, 120, 73.48);

-- --------------------------------------------------------

--
-- Table structure for table `TESTPOINT`
--

CREATE TABLE `TESTPOINT` (
  `id` int(11) NOT NULL,
  `tp_number` int(11) NOT NULL,
  `tp_description` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `id_cml` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `TESTPOINT`
--

INSERT INTO `TESTPOINT` (`id`, `tp_number`, `tp_description`, `note`, `id_cml`) VALUES
(1, 1, 120, 'note jaaa', 4),
(2, 2, 250, 'note jaaa eiei', 4),
(3, 3, 2500, 'test test test', 4),
(4, 4, 250, 'hmm....', 4),
(5, 5, 250, 'sss', 4),
(6, 6, 1450, 'erer', 4),
(7, 7, 250, 'golf', 4),
(10, 2, 360, 'test', 5),
(11, 1, 250, 'humm', 11),
(12, 1, 12, 'another test', 8),
(13, 1, 250, 'first exe', 15),
(14, 3, 500, 'this is golf', 5),
(15, 1, 250, 'first execution', 16);

-- --------------------------------------------------------

--
-- Table structure for table `THICKNESS`
--

CREATE TABLE `THICKNESS` (
  `id` int(11) NOT NULL,
  `inspection_date` date NOT NULL,
  `actual_thickness` float DEFAULT NULL,
  `id_testpoint` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `THICKNESS`
--

INSERT INTO `THICKNESS` (`id`, `inspection_date`, `actual_thickness`, `id_testpoint`) VALUES
(3, '2022-02-01', 3.2, 11),
(6, '2022-02-23', 3.6, 12),
(7, '2022-02-22', 2.5, 12),
(8, '2022-02-17', 8, 10),
(9, '2022-02-02', 10, 1),
(11, '2022-02-23', 5.5, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CML`
--
ALTER TABLE `CML`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_info` (`id_info`);

--
-- Indexes for table `INFO`
--
ALTER TABLE `INFO`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TESTPOINT`
--
ALTER TABLE `TESTPOINT`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cml` (`id_cml`);

--
-- Indexes for table `THICKNESS`
--
ALTER TABLE `THICKNESS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_testpoint` (`id_testpoint`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CML`
--
ALTER TABLE `CML`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `INFO`
--
ALTER TABLE `INFO`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `TESTPOINT`
--
ALTER TABLE `TESTPOINT`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `THICKNESS`
--
ALTER TABLE `THICKNESS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
