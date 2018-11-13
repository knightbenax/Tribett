-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2018 at 10:16 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tribett`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Client A', '2018-11-11 21:46:47', '2018-11-11 21:46:47'),
(2, 'Client B', '2018-11-11 21:46:47', '2018-11-11 21:46:47'),
(3, 'Client C', '2018-11-11 21:46:59', '2018-11-11 21:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `priority` int(11) NOT NULL,
  `target_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client` varchar(1000) NOT NULL,
  `product_area` varchar(1000) NOT NULL,
  `status` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `title`, `description`, `priority`, `target_date`, `client`, `product_area`, `status`) VALUES
(26, 'Suck a pipe', 'asdas', 6, '2018-11-12 15:06:02', 'Client C', 'Policies', 'not-started'),
(27, 'Suck a pipe', 'asdas', 7, '2018-11-12 23:22:56', 'Client C', 'Policies', 'done'),
(28, 'Fight Tobi', 'This is a description', 5, '2019-12-30 23:00:00', 'Client B', 'Billing', 'not-started'),
(29, 'Ram', 'This is a description', 8, '2018-11-12 23:22:49', 'Client B', 'Reports', 'done'),
(30, 'ghh', 'gghfghf', 4, '2018-11-12 22:55:11', 'Client B', 'Reports', 'in-progress'),
(31, 'Auasds', 'asdasd', 3, '2018-11-12 22:57:45', 'Client B', 'Claims', 'in-progress'),
(32, 'Final Test Feature', 'this is a description', 1, '2019-09-11 23:00:00', 'Client B', 'Reports', 'not-started');

-- --------------------------------------------------------

--
-- Table structure for table `product_area`
--

CREATE TABLE `product_area` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_area`
--

INSERT INTO `product_area` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Policies', '2018-11-12 08:44:43', '2018-11-12 08:44:43'),
(2, 'Billing', '2018-11-12 08:44:43', '2018-11-12 08:44:43'),
(3, 'Claims', '2018-11-12 08:45:01', '2018-11-12 08:45:01'),
(4, 'Reports', '2018-11-12 08:45:01', '2018-11-12 08:45:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_area`
--
ALTER TABLE `product_area`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_area`
--
ALTER TABLE `product_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
