-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2026 at 01:36 PM
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
-- Database: `ajibanez_finance_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `Account_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Bank_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Account_type` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `Balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`Account_ID`, `User_ID`, `Bank_name`, `Account_type`, `Balance`) VALUES
(2, 1, 'Chase', 'Checking', 2500.00),
(3, 2, 'Bank of America', 'Savings', 10000.00),
(4, 3, 'Wells Fargo', 'Checking', 3200.00);

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
(1, 'John', 'Doe', 'john.doe@email.com', 1029384756),
(2, 'tim', 'him', 'tim.him@email.com', 1234567890),
(3, 'jim', 'him', 'jim.him@email.com', 2147483647);

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
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Account_Holder`
--
ALTER TABLE `Account_Holder`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
