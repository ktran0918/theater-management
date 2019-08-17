-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Aug 16, 2019 at 07:13 PM
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
(702548509, 243479361),
(832283292, 755560770),
(434736960, 402316707),
(485666116, 200477557),
(513385755, 705620021),
(679610884, 806104336),
(899973637, 946945275),
(995263384, 910384386),
(326287322, 198079086);

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
(315253274, 'Andy Dufresne', 'Tim Robbins'),
(326287322, 'Bryan Mills', 'Liam Neeson'),
(434736960, 'Juror 1', 'Martin Balsam'),
(485666116, 'Michael', 'Al Pacino'),
(513385755, 'Oskar Schindler', 'Liam Neeson'),
(679610884, 'Pumpkin', 'Tim Roth'),
(702548509, 'Bruce Wayne', 'Christian Bale'),
(832283292, 'Galadriel', 'Cate Blanchett'),
(899973637, 'The Narrator', 'Edward Norton'),
(943705231, 'Don Vito Corleone', 'Marlon Brando'),
(995263384, 'Tuco', 'Eli Wallach');

-- --------------------------------------------------------

--
-- Table structure for table `has_movies`
--

CREATE TABLE `has_movies` (
  `movie_ID` bigint(9) NOT NULL,
  `theater_ID` bigint(9) NOT NULL,
  `number_of_tickets_sold` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_movies`
--

INSERT INTO `has_movies` (`movie_ID`, `theater_ID`, `number_of_tickets_sold`) VALUES
(755560770, 743423653, 100),
(705620021, 502908022, 1000),
(402316707, 941283562, 5000),
(705620021, 910415905, 7000),
(402316707, 941283562, 6000),
(705620021, 938470335, 50000),
(806104336, 941283562, 50000),
(705620021, 412498756, 100000),
(243479361, 142042627, 50000),
(200477557, 169270182, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `has_snack`
--

CREATE TABLE `has_snack` (
  `theater_ID` bigint(9) NOT NULL,
  `snack_ID` bigint(9) NOT NULL,
  `quantity_sold` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_snack`
--

INSERT INTO `has_snack` (`theater_ID`, `snack_ID`, `quantity_sold`) VALUES
(743423653, 416508210, 10000),
(982905687, 416508210, 9000),
(941283562, 980508602, 9000),
(169270182, 1595159, 6000),
(982905687, 159784713, 10520),
(743423653, 1595159, 10254),
(162824827, 159784713, 12365),
(938470335, 534467255, 50000),
(743423653, 923779631, 10000),
(888157033, 464843321, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_ID` bigint(9) NOT NULL,
  `movie_name` varchar(50) NOT NULL,
  `release_date` date NOT NULL,
  `running_time` int(10) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_ID`, `movie_name`, `release_date`, `running_time`, `genre`, `rating`, `price`) VALUES
(198079086, 'Taken 3', '2015-02-09', 108, 'Action, Thriller', '6.0', '9.00'),
(200477557, 'The Godfather: Part II', '1974-12-20', 202, 'Crime, Drama', '9.0', '9.60'),
(243479361, 'The Dark Knight', '2008-07-18', 152, 'Action, Crime, Drama', '9.0', '12.99'),
(402316707, '12 Angry Men', '1957-04-10', 96, 'Drama', '8.9', '4.99'),
(705620021, 'Schindler\'s List', '1994-02-04', 195, 'Biography, Drama, History', '8.9', '2.99'),
(755560770, 'The Lord of the Rings: The Return of the King', '2003-12-17', 201, 'Adventure, Drama, Fantasy', '8.9', '15.99'),
(806104336, 'Pulp Fiction', '1994-10-14', 154, 'Crime, Drama', '8.9', '6.99'),
(910384386, 'The Good, the Bad and the Ugly', '1967-12-29', 178, 'Western', '8.8', '7.99'),
(946945275, 'Fight Club', '1999-10-15', 139, 'Drama', '8.8', '8.99');

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
(243479361, 580951365),
(705620021, 419177507),
(705620021, 419177507),
(200477557, 369214314),
(755560770, 419177507),
(200477557, 633711399),
(402316707, 924789268);

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
(1595159, 'Red Vines', '3.99', 'candy'),
(159784713, 'Baby Ruth', '6.00', 'candy'),
(371404683, 'Skittles', '9.99', 'candy'),
(416508210, 'Starburst', '2.50', 'candy'),
(464843321, 'Oreo', '3.00', 'cookie'),
(534467255, 'SweetTarts', '3.00', 'candy'),
(614353323, 'Popcorn', '5.00', 'snack'),
(645310790, 'Coke', '3.00', 'soda'),
(653013753, 'nacho', '5.00', 'snack'),
(672265475, 'CHEETOS', '5.00', 'snack'),
(687757515, 'Dr Pepper', '3.00', 'soda'),
(923779631, 'Milk Duds', '3.00', 'candy'),
(980508602, 'Chex Mix', '3.00', 'snack');

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `theater_ID` bigint(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theater_ID`, `name`, `phone_number`, `street`, `city`, `state`) VALUES
(142042627, 'Regal Tigard', 8444627342, '11626 SW Pacific Highway', 'Portland', 'OR'),
(162824827, 'Regal Stark Street', 8444627342, '2929 N.E. Kane Drive', 'Portland', 'OR'),
(169270182, 'Regal Bridgeport Village & IMAX', 8444627342, '7329 SW Bridgeport Road', 'Portland', 'OR'),
(412498756, 'Regal Stark Street', 8444627342, '2929 N.E. Kane Drive', 'Portland', 'OR'),
(486811707, 'Regal City Center', 8444627342, '801 C Street', 'Vancouver', ' WA'),
(502908022, 'Regal Division Street', 8444627342, '16603 SE Division St.', 'Portland', 'OR'),
(743423653, 'Regal Evergreen Parkway & RPX', 8444627342, '2625 NE 106th Ave', 'Portland', 'OR'),
(888157033, 'Regal Vancouver Plaza', 8444627342, '7800 N.E. Fourth Plain', 'Vancouver ', 'WA'),
(910415905, 'Regal Lloyd Center & IMAX', 8444627342, '1510 NE Multnomah Street', 'Portland', 'OR'),
(938470335, 'Regal Fox Tower', 8444627342, '846 S.W. Park Ave', 'Portland', 'OR'),
(941283562, 'Regal Pioneer Place', 8444627342, '340 SW Morrison Street', 'Portland', 'OR'),
(982905687, 'Regal Cascade IMAX & RPX', 8444627342, '1101 SE 160th Avenue', 'Vancouver ', 'WA');

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
  ADD CONSTRAINT `act_ibfk_1` FOREIGN KEY (`actor_ID`) REFERENCES `actors` (`actor_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `act_ibfk_2` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`) ON DELETE CASCADE;

--
-- Constraints for table `has_movies`
--
ALTER TABLE `has_movies`
  ADD CONSTRAINT `has_movies_ibfk_1` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `has_movies_ibfk_2` FOREIGN KEY (`theater_ID`) REFERENCES `theatre` (`theater_ID`) ON DELETE CASCADE;

--
-- Constraints for table `has_snack`
--
ALTER TABLE `has_snack`
  ADD CONSTRAINT `has_snack_ibfk_1` FOREIGN KEY (`snack_ID`) REFERENCES `snack` (`snack_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `has_snack_ibfk_2` FOREIGN KEY (`theater_ID`) REFERENCES `theatre` (`theater_ID`) ON DELETE CASCADE;

--
-- Constraints for table `produce`
--
ALTER TABLE `produce`
  ADD CONSTRAINT `produce_ibfk_1` FOREIGN KEY (`company_ID`) REFERENCES `production_company` (`company_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `produce_ibfk_2` FOREIGN KEY (`movie_ID`) REFERENCES `movies` (`movie_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
