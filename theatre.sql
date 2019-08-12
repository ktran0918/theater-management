-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Aug 11, 2019 at 08:16 PM
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
-- Database: `cs340_trankho`
--

-- --------------------------------------------------------

--
-- Table structure for table `act`
--

CREATE TABLE `act` (
  `actor_ID` bigint(60) NOT NULL,
  `movie_ID` bigint(60) NOT NULL
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
  `actor_ID` bigint(60) NOT NULL,
  `role` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL
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
  `movie_ID` bigint(11) NOT NULL,
  `theater_ID` bigint(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_movies`
--

INSERT INTO `has_movies` (`movie_ID`, `theater_ID`) VALUES
(15423, 123),
(794520, 9829056387),
(723867, 1420426278),
(213458, 7434236753),
(22291, 5502908022),
(749761, 4836811707),
(22291, 7434236753),
(723867, 910415905),
(953555, 4836811707),
(723867, 4836811707);

-- --------------------------------------------------------

--
-- Table structure for table `has_snack`
--

CREATE TABLE `has_snack` (
  `theater_ID` bigint(60) NOT NULL,
  `snack_ID` bigint(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_snack`
--

INSERT INTO `has_snack` (`theater_ID`, `snack_ID`) VALUES
(123, 2587946),
(123, 2587946),
(9829056387, 2587946),
(321, 5344679255),
(4836811707, 9805208602),
(8881527033, 4648433021),
(8881527033, 4648433021),
(910415905, 5344679255),
(1420426278, 4165082310),
(8881527033, 4165082310);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_ID` bigint(60) NOT NULL,
  `movie_name` varchar(60) NOT NULL,
  `release_date` date NOT NULL,
  `running_time` bigint(20) NOT NULL,
  `genre` varchar(60) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `number_of_tickets_sold` bigint(20) NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_ID`, `movie_name`, `release_date`, `running_time`, `genre`, `rating`, `number_of_tickets_sold`, `price`) VALUES
(15423, 'small', '2019-08-29', 80, 'action', '1.0', 500, '2.30'),
(19882, 'oh!my', '2019-09-13', 60, 'comedy', '9.0', 500, '8.70'),
(22291, 'oh!3', '2019-12-07', 5, 'comedy', '1.2', 60, '32.30'),
(192897, 'big', '2019-09-25', 100, 'comedy', '5.0', 10, '5.00'),
(213458, 'OH!', '2019-08-23', 50, 'comedy', '7.5', 100, '123.20'),
(583017, 'large', '2019-10-19', 800, 'sci-fi', '5.3', 50, '6.30'),
(723867, 'HA!', '2019-08-31', 20, 'action', '8.9', 100, '8.20'),
(749761, 'name', '2019-10-04', 90, 'sci-fi', '9.9', 900, '50.00'),
(794520, 'ye!', '2019-08-15', 20, 'action', '8.9', 80, '23.60'),
(953555, 'oh!2', '2019-11-08', 100, 'action', '6.3', 10, '5.30');

-- --------------------------------------------------------

--
-- Table structure for table `produce`
--

CREATE TABLE `produce` (
  `company_ID` bigint(60) NOT NULL,
  `movie_ID` bigint(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produce`
--

INSERT INTO `produce` (`company_ID`, `movie_ID`) VALUES
(1036431035, 15423),
(6337113993, 794520),
(1470838248, 723867),
(9495176647, 953555),
(3692143145, 213458),
(400231, 192897),
(5809513656, 19882),
(668404, 192897),
(400231, 192897),
(9247892682, 22291);

-- --------------------------------------------------------

--
-- Table structure for table `production_company`
--

CREATE TABLE `production_company` (
  `name` varchar(60) NOT NULL,
  `company_ID` bigint(60) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone_number` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `production_company`
--

INSERT INTO `production_company` (`name`, `company_ID`, `address`, `phone_number`) VALUES
('Sony Pictures Motion Picture Group', 400231, '1234 nw king st', 5360433135),
('Warner Bros. Entertainment', 668404, '123 nw king st', 1234567895),
('20th Century Fox', 1036431035, '4321 nw king st', 5792504343),
('Jia\'s', 1470838248, '456 nw queen st', 160835365),
('Paramount Pictures', 3692143145, '123456 nw king st', 8429700610),
('Sun\'s', 5809513656, '321 nw king st', 9257571797),
('Ji\'s', 6337113993, '4567 nw queen st', 4762835353),
('Universal Pictures', 7333398733, '54321 nw king st', 2260386930),
('Walt Disney Studios', 9247892682, '12345 nw king st', 4942305102),
('Lionsgate Films', 9495176647, '654321 nw king st', 3546701065);

-- --------------------------------------------------------

--
-- Table structure for table `snack`
--

CREATE TABLE `snack` (
  `snack_ID` bigint(60) NOT NULL,
  `snack_name` varchar(60) NOT NULL,
  `price` decimal(60,2) NOT NULL,
  `type` varchar(60) NOT NULL
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
  `theater_ID` bigint(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `Street` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `state` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theater_ID`, `name`, `phone_number`, `Street`, `city`, `state`) VALUES
(123, 'abc', 5418292442, '850 nw joker st', 'Corvallis', 'or'),
(321, 'cba', 5418292443, '850 nw joker st', 'Eugene', 'NC'),
(910415905, 'iut', 7560720534, '85000 nw joker st', 'j city', 'PO'),
(1420426278, 'cyft', 930722060, '8500000 nw joker st', 'w city', 'MJ'),
(1690270182, 'thg', 1749597709, '85000 nw joker st', 'j city', 'PO'),
(4836811707, 'gvyu', 1765529152, '85400 nw joker st', 'O city', ' MN'),
(5502908022, 'vtyt', 1793504994, '85080 nw joker st', 'P city', 'JH'),
(7434236753, 'nbn', 4748685932, '8500 nw joker st', 'h city', 'BG'),
(8881527033, 'fgty', 4817435509, '850000 nw joker st', 'z city', 'KJ'),
(9829056387, 'bcb', 5004795153, '8500 nw joker st', 'Seattle', 'WA');

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
  ADD CONSTRAINT `produce_ibfk_1` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`),
  ADD CONSTRAINT `produce_ibfk_2` FOREIGN KEY (`company_ID`) REFERENCES `production_company` (`company_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
