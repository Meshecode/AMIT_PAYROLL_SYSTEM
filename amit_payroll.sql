-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 03:29 PM
-- Server version: 8.0.27
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amit_payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `acadamic_rank`
--

CREATE TABLE `acadamic_rank` (
  `Acc_title` varchar(20) NOT NULL,
  `idno` varchar(20) NOT NULL,
  `Acc_no` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `acadamic_rank`
--

INSERT INTO `acadamic_rank` (`Acc_title`, `idno`, `Acc_no`) VALUES
('lecturer', 'AMU/001/2024', 10002233);

-- --------------------------------------------------------

--
-- Table structure for table `duty_report`
--

CREATE TABLE `duty_report` (
  `gross_salary` int DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `House_allowance` varchar(20) NOT NULL,
  `idno` varchar(20) DEFAULT NULL,
  `Education_Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `idno` varchar(20) NOT NULL,
  `title` varchar(15) DEFAULT NULL,
  `fname` varchar(30) NOT NULL,
  `mname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `sex` varchar(7) NOT NULL,
  `phoneno` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `accno` varchar(100) NOT NULL,
  `hiredate` date NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `Acc_title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`idno`, `title`, `fname`, `mname`, `lname`, `sex`, `phoneno`, `email`, `accno`, `hiredate`, `position`, `Acc_title`) VALUES
('AMU/001/2023', 'Mr', 'mesfin', 'Alemu', 'Deboch', 'MAle', 916737914, 'sfinalemu71@yahoo.com', '100112233', '0000-00-00', 'dean', '0');

-- --------------------------------------------------------

--
-- Table structure for table `salary_scale`
--

CREATE TABLE `salary_scale` (
  `idno` varchar(20) DEFAULT NULL,
  `gross_salary` int NOT NULL,
  `Acc_title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary_scale`
--

INSERT INTO `salary_scale` (`idno`, `gross_salary`, `Acc_title`) VALUES
('AMU/001/2023', 1000, 'lecturer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  `status` int DEFAULT '0',
  `idno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `username`, `password`, `email`, `role`, `status`, `idno`) VALUES
('1', 'mesfin', '12345', 'a@amu.edu.et', 'admin', 1, 'AMU/001/2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acadamic_rank`
--
ALTER TABLE `acadamic_rank`
  ADD PRIMARY KEY (`Acc_title`),
  ADD KEY `employee` (`idno`);

--
-- Indexes for table `duty_report`
--
ALTER TABLE `duty_report`
  ADD PRIMARY KEY (`Education_Status`),
  ADD KEY `gross_salary` (`gross_salary`),
  ADD KEY `idno` (`idno`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`idno`),
  ADD KEY `Acc_title` (`Acc_title`),
  ADD KEY `acadamic_rank` (`Acc_title`);

--
-- Indexes for table `salary_scale`
--
ALTER TABLE `salary_scale`
  ADD PRIMARY KEY (`gross_salary`),
  ADD KEY `idno` (`idno`),
  ADD KEY `Acc_title` (`Acc_title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `idno` (`idno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `duty_report`
--
ALTER TABLE `duty_report`
  ADD CONSTRAINT `duty_report_ibfk_1` FOREIGN KEY (`idno`) REFERENCES `employee` (`idno`),
  ADD CONSTRAINT `duty_report_ibfk_2` FOREIGN KEY (`gross_salary`) REFERENCES `salary_scale` (`gross_salary`);

--
-- Constraints for table `salary_scale`
--
ALTER TABLE `salary_scale`
  ADD CONSTRAINT `salary_scale_ibfk_1` FOREIGN KEY (`idno`) REFERENCES `employee` (`idno`),
  ADD CONSTRAINT `salary_scale_ibfk_2` FOREIGN KEY (`Acc_title`) REFERENCES `acadamic_rank` (`Acc_title`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idno`) REFERENCES `employee` (`idno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
