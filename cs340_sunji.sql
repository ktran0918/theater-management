-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Aug 11, 2019 at 09:26 PM
-- Server version: 10.3.13-MariaDB-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_sunji`
--

-- --------------------------------------------------------

--
-- Table structure for table `act`
--

CREATE TABLE `act` (
  `actor_ID` bigint(9) NOT NULL,
  `movie_ID` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `act`
--

INSERT INTO `act` (`actor_ID`, `movie_ID`) VALUES
(422870, 15423),
(789452, 794520),
(492697, 953555),
(369483, 213458),
(499451, 192897),
(594098, 749761),
(667225, 19882),
(849209, 583017),
(849209, 19882),
(456789, 213458);

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actor_ID` bigint(9) NOT NULL,
  `role` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_ID`, `role`, `name`) VALUES
(369483, 'greenman', 'Grigor'),
(422870, 'batgirl', 'Katar'),
(456789, 'superman', 'Amy'),
(492697, 'beachman', 'Toros'),
(496291, 'wanderman', 'Vahan'),
(499451, 'irongirl', 'Varduhi'),
(594098, 'superboy', 'Siran'),
(667225, 'supergirl', 'Vardan'),
(789452, 'batman', 'John'),
(849209, 'ironman', 'Levon');

-- --------------------------------------------------------

--
-- Table structure for table `has_movies`
--

CREATE TABLE `has_movies` (
  `movie_ID` bigint(9) NOT NULL,
  `theater_ID` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_movies`
--

INSERT INTO `has_movies` (`movie_ID`, `theater_ID`) VALUES
(213458, 1420426278),
(723867, 4836811707),
(723867, 910415905),
(192897, 1690270182),
(192897, 7434236753),
(213458, 7434236753),
(192897, 8881527033),
(723867, 1420426278),
(213458, 8881527033),
(213458, 910415905);

-- --------------------------------------------------------

--
-- Table structure for table `has_snack`
--

CREATE TABLE `has_snack` (
  `snack_ID` bigint(9) NOT NULL,
  `theater_ID` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_snack`
--

INSERT INTO `has_snack` (`snack_ID`, `theater_ID`) VALUES
(2587946, 123),
(5344679255, 8881527033),
(4648433021, 7434236753),
(1597847138, 910415905),
(690482392, 7434236753),
(690482392, 1690270182),
(6143533293, 1420426278),
(1597847138, 910415905),
(1597847138, 7434236753),
(4165082310, 7434236753);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_ID` bigint(9) NOT NULL,
  `movie_name` varchar(30) NOT NULL,
  `release_date` date NOT NULL,
  `running_time` int(10) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `number_of_tickets_sold` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_ID`, `movie_name`, `release_date`, `running_time`, `genre`, `rating`, `number_of_tickets_sold`, `price`) VALUES
(15423, 'small', '2019-08-29', 80, 'action', '1.0', 500, '0.99'),
(19882, 'oh!my', '2019-09-13', 60, 'comedy', '9.0', 500, '0.99'),
(22291, 'oh!3', '2019-12-07', 5, 'comedy', '1.2', 60, '0.99'),
(192897, 'big', '2019-09-25', 100, 'comedy', '5.0', 10, '0.99'),
(213458, 'OH!', '2019-08-23', 50, 'comedy', '7.5', 100, '0.99'),
(583017, 'large', '2019-10-19', 800, 'sci-fi', '5.3', 50, '0.99'),
(723867, 'HA!', '2019-08-31', 20, 'action', '8.9', 100, '0.99'),
(749761, 'name', '2019-10-04', 90, 'sci-fi', '9.9', 900, '0.99'),
(794520, 'ye!', '2019-08-15', 20, 'action', '8.9', 80, '0.99'),
(953555, 'oh!2', '2019-11-08', 100, 'action', '6.3', 10, '19.99');

-- --------------------------------------------------------

--
-- Table structure for table `produce`
--

CREATE TABLE `produce` (
  `movie_ID` bigint(9) NOT NULL,
  `company_ID` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produce`
--

INSERT INTO `produce` (`movie_ID`, `company_ID`) VALUES
(15423, 103643103),
(794520, 147083824),
(723867, 400231),
(583017, 369214314),
(22291, 400231),
(213458, 580951365),
(192897, 580951365),
(22291, 733339873),
(213458, 733339873),
(22291, 400231);

-- --------------------------------------------------------

--
-- Table structure for table `production_company`
--

CREATE TABLE `production_company` (
  `name` varchar(30) NOT NULL,
  `company_ID` bigint(9) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone_number` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `production_company`
--

INSERT INTO `production_company` (`name`, `company_ID`, `address`, `phone_number`) VALUES
('Sony Pictures Motion Picture G', 400231, '1234 nw king st', 21474836588),
('Warner Bros. Entertainment', 668404, '123 nw king st', 1234567895),
('20th Century Fox', 103643103, '4321 nw king st', 2147483647),
('Jia\'s', 147083824, '456 nw queen st', 160835365),
('Paramount Pictures', 369214314, '123456 nw king st', 2147483678),
('Sun\'s', 580951365, '321 nw king st', 2147483785),
('Ji\'s', 633711399, '4567 nw queen st', 2147483784),
('Universal Pictures', 733339873, '54321 nw king st', 2147483123),
('Walt Disney Studios', 924789268, '12345 nw king st', 2147483548),
('Lionsgate Films', 949517664, '654321 nw king st', 2147483258);

-- --------------------------------------------------------

--
-- Table structure for table `snack`
--

CREATE TABLE `snack` (
  `snack_ID` bigint(9) NOT NULL,
  `snack_name` varchar(30) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snack`
--

INSERT INTO `snack` (`snack_ID`, `snack_name`, `price`, `type`) VALUES
(2587946, 'a candy', '23.60', 'candy'),
(690482392, 'b candy', '3.00', 'candy'),
(1597847138, 'c candy', '1.30', 'candy'),
(4165082310, 'd candy', '3.00', 'candy'),
(4648433021, 'Oreo', '3.00', 'cookie'),
(5344679255, 'g candy', '3.00', 'candy'),
(6143533293, 'Monster chocolate chip', '5.00', 'cookie'),
(6453108790, 'Coke', '3.00', 'soda'),
(6877575515, 'Dr Pepper', '3.00', 'soda'),
(9805208602, 'j candy', '3.00', 'candy');

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `theater_ID` bigint(9) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theater_ID`, `name`, `phone_number`, `Street`, `city`, `state`) VALUES
(123, 'abc', 2147483647, '850 nw joker st', 'Corvallis', 'or'),
(321, 'cba', 2147483647, '850 nw joker st', 'Eugene', 'NC'),
(910415905, 'iut', 2147483647, '85000 nw joker st', 'j city', 'PO'),
(1420426278, 'cyft', 930722060, '8500000 nw joker st', 'w city', 'MJ'),
(1690270182, 'thg', 1749597709, '85000 nw joker st', 'j city', 'PO'),
(4836811707, 'gvyu', 1765529152, '85400 nw joker st', 'O city', ' MN'),
(5502908022, 'vtyt', 1793504994, '85080 nw joker st', 'P city', 'JH'),
(7434236753, 'nbn', 2147483647, '8500 nw joker st', 'h city', 'BG'),
(8881527033, 'fgty', 2147483647, '850000 nw joker st', 'z city', 'KJ'),
(9829056387, 'bcb', 2147483647, '8500 nw joker st', 'Seattle', 'WA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `act`
--
ALTER TABLE `act`
  ADD KEY `actor_ID` (`actor_ID`),
  ADD KEY `movie_ID` (`movie_ID`);

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_ID`);

--
-- Indexes for table `has_movies`
--
ALTER TABLE `has_movies`
  ADD KEY `movie_ID` (`movie_ID`),
  ADD KEY `theater_ID` (`theater_ID`);

--
-- Indexes for table `has_snack`
--
ALTER TABLE `has_snack`
  ADD KEY `snack_ID` (`snack_ID`),
  ADD KEY `theater_ID` (`theater_ID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_ID`);

--
-- Indexes for table `produce`
--
ALTER TABLE `produce`
  ADD KEY `movie_ID` (`movie_ID`),
  ADD KEY `company_ID` (`company_ID`);

--
-- Indexes for table `production_company`
--
ALTER TABLE `production_company`
  ADD PRIMARY KEY (`company_ID`);

--
-- Indexes for table `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`snack_ID`);

--
-- Indexes for table `theatre`
--
ALTER TABLE `theatre`
  ADD PRIMARY KEY (`theater_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `act`
--
ALTER TABLE `act`
  ADD CONSTRAINT `act_ibfk_1` FOREIGN KEY (`actor_ID`) REFERENCES `actors` (`actor_ID`),
  ADD CONSTRAINT `act_ibfk_2` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`);

--
-- Constraints for table `has_movies`
--
ALTER TABLE `has_movies`
  ADD CONSTRAINT `has_movies_ibfk_1` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`),
  ADD CONSTRAINT `has_movies_ibfk_2` FOREIGN KEY (`theater_ID`) REFERENCES `theatre` (`theater_ID`);

--
-- Constraints for table `has_snack`
--
ALTER TABLE `has_snack`
  ADD CONSTRAINT `has_snack_ibfk_1` FOREIGN KEY (`snack_ID`) REFERENCES `snack` (`snack_ID`),
  ADD CONSTRAINT `has_snack_ibfk_2` FOREIGN KEY (`theater_ID`) REFERENCES `theatre` (`theater_ID`);

--
-- Constraints for table `produce`
--
ALTER TABLE `produce`
  ADD CONSTRAINT `produce_ibfk_1` FOREIGN KEY (`company_ID`) REFERENCES `production_company` (`company_ID`),
  ADD CONSTRAINT `produce_ibfk_2` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
