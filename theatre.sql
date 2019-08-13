-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Aug 12, 2019 at 07:29 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `has_snack`
--

CREATE TABLE `has_snack` (
  `theater_ID` bigint(9) NOT NULL,
  `snack_ID` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(120602931, 'HA!', '2019-08-31', 20, 'action', '8.9', 100, '0.99'),
(157154533, 'name', '2019-10-04', 90, 'sci-fi', '9.9', 900, '0.99'),
(200477557, 'oh!my', '2019-09-13', 60, 'comedy', '9.0', 500, '0.99'),
(243479361, 'oh!2', '2019-11-08', 100, 'action', '6.3', 10, '19.99'),
(402316707, 'big', '2019-09-25', 100, 'comedy', '5.0', 10, '0.99'),
(705620021, 'ye!', '2019-08-15', 20, 'action', '8.9', 80, '0.99'),
(755560770, 'oh!3', '2019-12-07', 5, 'comedy', '1.2', 60, '0.99'),
(806104336, 'large', '2019-10-19', 800, 'sci-fi', '5.3', 50, '0.99'),
(910384386, 'small', '2019-08-29', 80, 'action', '1.0', 500, '0.99'),
(946945275, 'OH!', '2019-08-23', 50, 'comedy', '7.5', 100, '0.99');

-- --------------------------------------------------------

--
-- Table structure for table `produce`
--

CREATE TABLE `produce` (
  `movie_ID` bigint(9) NOT NULL,
  `company_ID` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_company`
--

CREATE TABLE `production_company` (
  `name` varchar(40) NOT NULL,
  `company_ID` bigint(9) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone_number` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `production_company`
--

INSERT INTO `production_company` (`name`, `company_ID`, `address`, `phone_number`) VALUES
('20th Century Fox', 103643103, '4321 nw king st', 2147483647),
('DreamWorks Pictures', 147083824, '456 nw queen st', 160835365),
('Warner Bros. Entertainment', 367367099, '123 nw king st', 1234567895),
('Paramount Pictures', 369214314, '123456 nw king st', 2147483678),
('Sony Pictures Motion Picture Group', 419177507, '1234 nw king st', 21474836588),
('Metro-Goldwyn-Mayer Studios', 580951365, '321 nw king st', 2147483785),
('The Weinstein Company', 633711399, '4567 nw queen st', 2147483784),
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
(159784713, 'Baby Ruth', '1.30', 'candy'),
(371404683, 'Skittles', '9.99', 'candy'),
(416508210, 'Starburst', '3.00', 'candy'),
(464843321, 'Oreo', '3.00', 'cookie'),
(534467255, 'SweetTarts', '3.00', 'candy'),
(614353323, 'Bit o Honey', '5.00', 'candy'),
(645310790, 'Coke', '3.00', 'soda'),
(687757515, 'Dr Pepper', '3.00', 'soda'),
(923779631, 'Milk Duds', '3.00', 'candy'),
(980508602, 'Werther\'s Original', '3.00', 'candy');

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `theater_ID` bigint(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theater_ID`, `name`, `phone_number`, `Street`, `city`, `state`) VALUES
(910415905, 'Regal Lloyd Center & IMAX', 8444627342, '1510 NE Multnomah Street', 'Portland', 'OR'),
(938470335, 'Regal Fox Tower', 8444627342, '846 S.W. Park Ave', 'Portland', 'OR'),
(941283562, 'Regal Pioneer Place', 8444627342, '340 SW Morrison Street', 'Portland', 'OR'),
(1420426278, 'Regal Tigard', 8444627342, '11626 SW Pacific Highway', 'Portland', 'OR'),
(1690270182, 'Regal Bridgeport Village & IMAX', 8444627342, '7329 SW Bridgeport Road', 'Portland', 'OR'),
(4836811707, 'Regal City Center', 8444627342, '801 C Street', 'Vancouver', ' WA'),
(5502908022, 'Regal Division Street', 8444627342, '16603 SE Division St.', 'Portland', 'OR'),
(7434236753, 'Regal Evergreen Parkway & RPX', 8444627342, '2625 NE 106th Ave', 'Portland', 'OR'),
(8881527033, 'Regal Vancouver Plaza', 8444627342, '7800 N.E. Fourth Plain', 'Vancouver ', 'WA'),
(9829056387, 'Regal Cascade IMAX & RPX', 8444627342, '1101 SE 160th Avenue', 'Vancouver ', 'WA');

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
  ADD KEY `theater_ID` (`theater_ID`),
  ADD KEY `snack_ID` (`snack_ID`);

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
