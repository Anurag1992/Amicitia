-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2013 at 09:04 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `matemessenger`
--

-- --------------------------------------------------------

--
-- Table structure for table `anurag_ojha@hotmail.com`
--

CREATE TABLE IF NOT EXISTS `anurag_ojha@hotmail.com` (
  `Message` longtext NOT NULL,
  `Sender` varchar(25) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main`
--

CREATE TABLE IF NOT EXISTS `main` (
  `FirstName` varchar(15) NOT NULL,
  `LastName` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `Birthday` varchar(12) NOT NULL,
  `Gender` varchar(7) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `UID` text,
  PRIMARY KEY (`email`),
  UNIQUE KEY `FirstName` (`FirstName`),
  UNIQUE KEY `FirstName_2` (`FirstName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main`
--

INSERT INTO `main` (`FirstName`, `LastName`, `email`, `Birthday`, `Gender`, `Password`, `UID`) VALUES
('', '', 'ajit_ojha@hotmail.com', '', '', 'ajit', '2bf94bde-61f8-4af0-882e-bc8c47b93c0f');

-- --------------------------------------------------------

--
-- Table structure for table `sunita_ojha@hotmail.com`
--

CREATE TABLE IF NOT EXISTS `sunita_ojha@hotmail.com` (
  `Message` longtext NOT NULL,
  `Sender` int(25) NOT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
