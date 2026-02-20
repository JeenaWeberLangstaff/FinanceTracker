-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2026 at 07:03 PM
-- Server version: 5.7.44-48
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jpiccoli_2-19`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `Account_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Bank_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Account_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`Account_ID`, `User_ID`, `Bank_name`, `Account_type`, `Balance`) VALUES
(1, 1, 'U.S. Bank', 'Checking', 1186.97),
(2, 2, 'Chase', 'Savings', 1440.78),
(3, 3, 'Capital One', 'Money Market', 2172.70),
(4, 4, 'Truist', 'Savings', 516.01),
(5, 5, 'TD Bank', 'Checking', 3700.98),
(6, 6, 'Bank of America', 'Money Market', 2043.64),
(7, 7, 'Wells Fargo', 'Checking', 4494.09),
(8, 8, 'U.S. Bank', 'Money Market', 2919.90),
(9, 9, 'Wells Fargo', 'Savings', 1610.19),
(10, 10, 'U.S. Bank', 'Money Market', 1441.39),
(11, 11, 'Truist', 'Savings', 2026.33),
(12, 12, 'Capital One', 'Savings', 835.42),
(13, 13, 'Citibank', 'Checking', 1715.38),
(14, 14, 'Wells Fargo', 'Money Market', 3789.49),
(15, 15, 'Truist', 'Savings', 3803.63),
(16, 16, 'Ally', 'Money Market', 1582.86),
(17, 17, 'Truist', 'Savings', 2111.07),
(18, 18, 'Ally', 'Checking', 537.49),
(19, 19, 'Ally', 'Money Market', 3587.41),
(20, 20, 'Ally', 'Money Market', 542.48),
(21, 21, 'Capital One', 'Savings', 3242.54),
(22, 22, 'Citibank', 'Savings', 1988.23),
(23, 23, 'Wells Fargo', 'Checking', 3819.78),
(24, 24, 'Chase', 'Savings', 4026.89),
(25, 25, 'Ally', 'Savings', 2962.92),
(26, 26, 'Truist', 'Money Market', 3776.18),
(27, 27, 'U.S. Bank', 'Money Market', 3159.92),
(28, 28, 'Ally', 'Money Market', 580.94),
(29, 29, 'Ally', 'Savings', 3056.40),
(30, 30, 'Truist', 'Savings', 4011.02),
(31, 31, 'Wells Fargo', 'Savings', 82.90),
(32, 32, 'U.S. Bank', 'Checking', 605.19),
(33, 33, 'Truist', 'Money Market', 1892.45),
(34, 34, 'Ally', 'Checking', 1037.69),
(35, 35, 'Bank of America', 'Money Market', 2705.90),
(36, 36, 'Wells Fargo', 'Savings', 209.50),
(37, 37, 'U.S. Bank', 'Savings', 1034.74),
(38, 38, 'Ally', 'Checking', 1368.69),
(39, 39, 'Citibank', 'Checking', 1927.53),
(40, 40, 'Truist', 'Money Market', 1538.69),
(41, 41, 'Chase', 'Checking', 4849.20),
(42, 42, 'Truist', 'Money Market', 1897.12),
(43, 43, 'Chase', 'Checking', 4673.25),
(44, 44, 'Chase', 'Savings', 3919.86),
(45, 45, 'Bank of America', 'Savings', 4786.48),
(46, 46, 'Capital One', 'Savings', 1749.95),
(47, 47, 'Ally', 'Money Market', 1932.49),
(48, 48, 'Ally', 'Money Market', 4612.98),
(49, 49, 'Capital One', 'Savings', 4156.56),
(50, 50, 'Citibank', 'Money Market', 590.58),
(51, 51, 'TD Bank', 'Savings', 3852.21),
(52, 52, 'Bank of America', 'Savings', 4850.90),
(53, 53, 'Capital One', 'Checking', 2415.97),
(54, 54, 'Wells Fargo', 'Money Market', 3277.98),
(55, 55, 'U.S. Bank', 'Money Market', 1616.09),
(56, 56, 'Chase', 'Money Market', 4233.99),
(57, 57, 'Capital One', 'Money Market', 402.38),
(58, 58, 'Chase', 'Money Market', 3285.65),
(59, 59, 'Bank of America', 'Checking', 2189.91),
(60, 60, 'U.S. Bank', 'Checking', 4195.90),
(61, 61, 'Chase', 'Savings', 4676.11),
(62, 62, 'Ally', 'Checking', 1729.14),
(63, 63, 'Citibank', 'Savings', 3599.32),
(64, 64, 'Capital One', 'Savings', 482.78),
(65, 65, 'TD Bank', 'Money Market', 2114.04),
(66, 66, 'Wells Fargo', 'Money Market', 3593.56),
(67, 67, 'Bank of America', 'Money Market', 4430.06),
(68, 68, 'PNC', 'Savings', 3586.86),
(69, 69, 'Chase', 'Money Market', 4548.48),
(70, 70, 'U.S. Bank', 'Money Market', 3894.74),
(71, 71, 'Truist', 'Money Market', 498.03),
(72, 72, 'U.S. Bank', 'Savings', 2697.31),
(73, 73, 'Citibank', 'Checking', 2850.55),
(74, 74, 'Ally', 'Checking', 1397.66),
(75, 75, 'U.S. Bank', 'Checking', 3182.13),
(76, 76, 'Truist', 'Money Market', 2727.58),
(77, 77, 'PNC', 'Savings', 527.54),
(78, 78, 'PNC', 'Savings', 1704.37),
(79, 79, 'Citibank', 'Checking', 1942.28),
(80, 80, 'U.S. Bank', 'Savings', 3546.62),
(81, 81, 'Chase', 'Savings', 932.06),
(82, 82, 'Chase', 'Savings', 2910.78),
(83, 83, 'Truist', 'Money Market', 2862.26),
(84, 84, 'Chase', 'Money Market', 1134.76),
(85, 85, 'Truist', 'Money Market', 3422.35),
(86, 86, 'Capital One', 'Money Market', 1567.12),
(87, 87, 'Wells Fargo', 'Savings', 3758.52),
(88, 88, 'Citibank', 'Savings', 4750.49),
(89, 89, 'Bank of America', 'Savings', 4514.16),
(90, 90, 'Truist', 'Savings', 510.97),
(91, 91, 'Wells Fargo', 'Checking', 4485.05),
(92, 92, 'Citibank', 'Checking', 4083.78),
(93, 93, 'Truist', 'Savings', 2177.14),
(94, 94, 'Chase', 'Savings', 1673.82),
(95, 95, 'Ally', 'Checking', 2587.89),
(96, 96, 'Chase', 'Savings', 3584.87),
(97, 97, 'Citibank', 'Savings', 602.13),
(98, 98, 'Ally', 'Savings', 1443.21),
(99, 99, 'Citibank', 'Money Market', 3223.60),
(100, 100, 'U.S. Bank', 'Checking', 4393.19);

-- --------------------------------------------------------

--
-- Table structure for table `Account_Holder`
--

CREATE TABLE `Account_Holder` (
  `User_ID` int(11) NOT NULL,
  `First_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Last_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Account_Holder`
--

INSERT INTO `Account_Holder` (`User_ID`, `First_Name`, `Last_Name`, `Email`, `Phone_number`) VALUES
(1, 'Benjamin', 'Jackson', 'benjamin.jackson1@example.com', 326381088),
(2, 'Emma', 'Taylor', 'emma.taylor2@example.com', 1713142197),
(3, 'Ava', 'Moore', 'ava.moore3@example.com', 1626214580),
(4, 'Mia', 'Hernandez', 'mia.hernandez4@example.com', 827498608),
(5, 'Benjamin', 'Moore', 'benjamin.moore5@example.com', 961577524),
(6, 'Harper', 'Anderson', 'harper.anderson6@example.com', 415554534),
(7, 'Ava', 'Thomas', 'ava.thomas7@example.com', 974779629),
(8, 'Benjamin', 'Johnson', 'benjamin.johnson8@example.com', 567795656),
(9, 'Noah', 'Martin', 'noah.martin9@example.com', 1199700961),
(10, 'Harper', 'Rodriguez', 'harper.rodriguez10@example.com', 2111737782),
(11, 'James', 'Martin', 'james.martin11@example.com', 1156118306),
(12, 'Mia', 'Moore', 'mia.moore12@example.com', 1316781548),
(13, 'Liam', 'Thomas', 'liam.thomas13@example.com', 2106856929),
(14, 'Lucas', 'Moore', 'lucas.moore14@example.com', 442921686),
(15, 'James', 'Miller', 'james.miller15@example.com', 955916507),
(16, 'Liam', 'Johnson', 'liam.johnson16@example.com', 610809873),
(17, 'Sophia', 'Davis', 'sophia.davis17@example.com', 2032247696),
(18, 'Daniel', 'Johnson', 'daniel.johnson18@example.com', 1049790610),
(19, 'Ethan', 'Johnson', 'ethan.johnson19@example.com', 721338013),
(20, 'Amelia', 'Rodriguez', 'amelia.rodriguez20@example.com', 477925308),
(21, 'Ethan', 'Davis', 'ethan.davis21@example.com', 1569472235),
(22, 'Amelia', 'Hernandez', 'amelia.hernandez22@example.com', 1400503513),
(23, 'Emma', 'Jackson', 'emma.jackson23@example.com', 303315752),
(24, 'Ethan', 'Moore', 'ethan.moore24@example.com', 819971385),
(25, 'Benjamin', 'Johnson', 'benjamin.johnson25@example.com', 1216317090),
(26, 'Mia', 'Williams', 'mia.williams26@example.com', 565697089),
(27, 'Ethan', 'Jackson', 'ethan.jackson27@example.com', 1724239752),
(28, 'Lucas', 'Williams', 'lucas.williams28@example.com', 1338290561),
(29, 'Sophia', 'Martin', 'sophia.martin29@example.com', 1624327337),
(30, 'Henry', 'Smith', 'henry.smith30@example.com', 1084653883),
(31, 'Harper', 'Martinez', 'harper.martinez31@example.com', 731393942),
(32, 'Ethan', 'Wilson', 'ethan.wilson32@example.com', 1310221178),
(33, 'Amelia', 'Jackson', 'amelia.jackson33@example.com', 1824116083),
(34, 'Liam', 'Jackson', 'liam.jackson34@example.com', 967841868),
(35, 'Ava', 'Jones', 'ava.jones35@example.com', 336528305),
(36, 'Noah', 'Martin', 'noah.martin36@example.com', 424140856),
(37, 'Sophia', 'Jackson', 'sophia.jackson37@example.com', 468011192),
(38, 'James', 'Moore', 'james.moore38@example.com', 1322673562),
(39, 'Ava', 'Gonzalez', 'ava.gonzalez39@example.com', 1612976191),
(40, 'Mia', 'Davis', 'mia.davis40@example.com', 558292388),
(41, 'Henry', 'Garcia', 'henry.garcia41@example.com', 1946056169),
(42, 'Benjamin', 'Martin', 'benjamin.martin42@example.com', 2014698207),
(43, 'Liam', 'Williams', 'liam.williams43@example.com', 913896403),
(44, 'Abigail', 'Brown', 'abigail.brown44@example.com', 1475440641),
(45, 'Lucas', 'Garcia', 'lucas.garcia45@example.com', 1519678862),
(46, 'Liam', 'Hernandez', 'liam.hernandez46@example.com', 1406540229),
(47, 'Ava', 'Taylor', 'ava.taylor47@example.com', 958113887),
(48, 'Amelia', 'Jones', 'amelia.jones48@example.com', 2113806197),
(49, 'Daniel', 'Williams', 'daniel.williams49@example.com', 1860920439),
(50, 'Mia', 'Taylor', 'mia.taylor50@example.com', 753040379),
(51, 'Lucas', 'Martin', 'lucas.martin51@example.com', 1855515556),
(52, 'Mia', 'Hernandez', 'mia.hernandez52@example.com', 1165219027),
(53, 'Noah', 'Hernandez', 'noah.hernandez53@example.com', 1566464224),
(54, 'Amelia', 'Davis', 'amelia.davis54@example.com', 1592718714),
(55, 'Harper', 'Hernandez', 'harper.hernandez55@example.com', 1750978623),
(56, 'Alexander', 'Thomas', 'alexander.thomas56@example.com', 211003340),
(57, 'James', 'Garcia', 'james.garcia57@example.com', 1358899871),
(58, 'Matthew', 'Garcia', 'matthew.garcia58@example.com', 780148871),
(59, 'Olivia', 'Anderson', 'olivia.anderson59@example.com', 868589617),
(60, 'Ethan', 'Johnson', 'ethan.johnson60@example.com', 1147643219),
(61, 'Henry', 'Jackson', 'henry.jackson61@example.com', 453525175),
(62, 'Olivia', 'Moore', 'olivia.moore62@example.com', 1491371345),
(63, 'Abigail', 'Martin', 'abigail.martin63@example.com', 1712819212),
(64, 'Ethan', 'Rodriguez', 'ethan.rodriguez64@example.com', 1769916400),
(65, 'Abigail', 'Garcia', 'abigail.garcia65@example.com', 1922522461),
(66, 'Ethan', 'Thomas', 'ethan.thomas66@example.com', 1443154292),
(67, 'Benjamin', 'Brown', 'benjamin.brown67@example.com', 870618991),
(68, 'Charlotte', 'Jackson', 'charlotte.jackson68@example.com', 1924149806),
(69, 'Noah', 'Thomas', 'noah.thomas69@example.com', 1501313270),
(70, 'Alexander', 'Anderson', 'alexander.anderson70@example.com', 2024964953),
(71, 'Ethan', 'Jones', 'ethan.jones71@example.com', 1522865360),
(72, 'Mia', 'Williams', 'mia.williams72@example.com', 596351087),
(73, 'James', 'Gonzalez', 'james.gonzalez73@example.com', 1692597127),
(74, 'Lucas', 'Hernandez', 'lucas.hernandez74@example.com', 242496425),
(75, 'Harper', 'Anderson', 'harper.anderson75@example.com', 2143861394),
(76, 'Benjamin', 'Lopez', 'benjamin.lopez76@example.com', 718296714),
(77, 'Evelyn', 'Davis', 'evelyn.davis77@example.com', 1531787005),
(78, 'Mia', 'Moore', 'mia.moore78@example.com', 648303683),
(79, 'Matthew', 'Johnson', 'matthew.johnson79@example.com', 801488496),
(80, 'Ethan', 'Johnson', 'ethan.johnson80@example.com', 1192896456),
(81, 'Charlotte', 'Wilson', 'charlotte.wilson81@example.com', 845421721),
(82, 'Sophia', 'Williams', 'sophia.williams82@example.com', 1296188985),
(83, 'Liam', 'Moore', 'liam.moore83@example.com', 1898051715),
(84, 'Amelia', 'Hernandez', 'amelia.hernandez84@example.com', 457001864),
(85, 'Evelyn', 'Smith', 'evelyn.smith85@example.com', 1031896123),
(86, 'Sophia', 'Jackson', 'sophia.jackson86@example.com', 1168627201),
(87, 'Harper', 'Jones', 'harper.jones87@example.com', 333892295),
(88, 'Amelia', 'Garcia', 'amelia.garcia88@example.com', 1174139985),
(89, 'Charlotte', 'Smith', 'charlotte.smith89@example.com', 439668433),
(90, 'Matthew', 'Jackson', 'matthew.jackson90@example.com', 1786131966),
(91, 'Henry', 'Jackson', 'henry.jackson91@example.com', 1461994552),
(92, 'Liam', 'Garcia', 'liam.garcia92@example.com', 440513821),
(93, 'Lucas', 'Moore', 'lucas.moore93@example.com', 1202574666),
(94, 'Mia', 'Thomas', 'mia.thomas94@example.com', 1566774434),
(95, 'Olivia', 'Wilson', 'olivia.wilson95@example.com', 287221724),
(96, 'Abigail', 'Johnson', 'abigail.johnson96@example.com', 1459793474),
(97, 'Matthew', 'Smith', 'matthew.smith97@example.com', 1648034930),
(98, 'Benjamin', 'Taylor', 'benjamin.taylor98@example.com', 851479245),
(99, 'Lucas', 'Jackson', 'lucas.jackson99@example.com', 389193397),
(100, 'Charlotte', 'Brown', 'charlotte.brown100@example.com', 2089810020);

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `Category_ID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`Category_ID`, `Name`, `Type`) VALUES
(1, 'Salary', 'Income'),
(2, 'Groceries', 'Expense'),
(3, 'Rent', 'Expense'),
(4, 'Dropshipping', 'Income'),
(5, 'Games', 'Expense');

-- --------------------------------------------------------

--
-- Table structure for table `Payee/Source`
--

CREATE TABLE `Payee/Source` (
  `Pay_ID` int(50) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Payee/Source`
--

INSERT INTO `Payee/Source` (`Pay_ID`, `Name`) VALUES
(1, 'Amazon'),
(2, 'Walmart'),
(3, 'Employer Inc'),
(4, 'Electric Company'),
(5, 'Landlord LLC');

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `Transaction_ID` int(11) NOT NULL,
  `Account_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `Pay_ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`Account_ID`),
  ADD KEY `fk_user_id` (`User_ID`) USING BTREE;

--
-- Indexes for table `Account_Holder`
--
ALTER TABLE `Account_Holder`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `uq_email` (`Email`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `Payee/Source`
--
ALTER TABLE `Payee/Source`
  ADD PRIMARY KEY (`Pay_ID`);

--
-- Indexes for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `fk_account_id` (`Account_ID`),
  ADD KEY `fk_category_id` (`Category_ID`),
  ADD KEY `fk_pay_id` (`Pay_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `Account_Holder`
--
ALTER TABLE `Account_Holder`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Payee/Source`
--
ALTER TABLE `Payee/Source`
  MODIFY `Pay_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `fk_account_holder` FOREIGN KEY (`User_ID`) REFERENCES `Account_Holder` (`User_ID`);

--
-- Constraints for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `fk_account_id` FOREIGN KEY (`Account_ID`) REFERENCES `Account` (`Account_ID`),
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`),
  ADD CONSTRAINT `fk_pay_id` FOREIGN KEY (`Pay_ID`) REFERENCES `Payee/Source` (`Pay_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
