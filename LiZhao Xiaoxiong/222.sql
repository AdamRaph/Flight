-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2015 at 09:24 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `222`
--

-- --------------------------------------------------------

--
-- Table structure for table `agentprofiles`
--

CREATE TABLE IF NOT EXISTS `agentprofiles` (
  `agent_id` int(3) NOT NULL AUTO_INCREMENT,
  `travel_agent` varchar(32) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`agent_id`),
  UNIQUE KEY `unq_agent` (`travel_agent`,`phone`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `agentprofiles`
--

INSERT INTO `agentprofiles` (`agent_id`, `travel_agent`, `phone`, `email`) VALUES
(2, 'Gday', '61-415', 'gday@sydney'),
(1, 'Gday', '61-54564564', 'goodday@aus.com');

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

CREATE TABLE IF NOT EXISTS `airplane` (
  `PlaneID` int(4) NOT NULL AUTO_INCREMENT,
  `onefleet` int(4) NOT NULL,
  `firstClass` int(2) NOT NULL,
  `businessClass` int(2) NOT NULL,
  `premiumClass` int(2) NOT NULL,
  `economyClass` int(3) NOT NULL,
  `total` int(3) NOT NULL,
  PRIMARY KEY (`PlaneID`),
  KEY `Plane0_FK` (`onefleet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE IF NOT EXISTS `airport` (
  `airportID` int(4) NOT NULL,
  `name` varchar(64) NOT NULL,
  `city` varchar(32) NOT NULL,
  `country` varchar(32) NOT NULL,
  `IATA` varchar(3) NOT NULL,
  `latitude` double(5,2) NOT NULL,
  `longitude` double(5,2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `DST` varchar(1) NOT NULL,
  `timeZone` varchar(32) NOT NULL,
  PRIMARY KEY (`IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airportID`, `name`, `city`, `country`, `IATA`, `latitude`, `longitude`, `altitude`, `DST`, `timeZone`) VALUES
(215, 'Birmingham', 'Birmingham', 'United Kingdom', 'BHX', 52.45, -1.75, 327, 'E', '0'),
(5021, 'Gove Airport', 'Gove', 'Australia', 'GOV', -12.27, 136.82, 192, 'O', '9.5'),
(3088, 'Hamburg', 'Hamburg', 'Germany', 'HAM', 53.63, 9.99, 53, 'E', '1'),
(8738, 'Mildura Airport', 'Mildura', 'Australia', 'MQL', -34.23, 142.09, 167, 'O', '10'),
(4413, 'Port Macquarie Airport', 'Port Macquarie', 'Australia', 'PQQ', -31.44, 152.86, 12, 'O', '10'),
(3813, 'Pudong', 'Shanghai', 'China', 'PVG', 31.14, -118.41, 126, 'A', '-8');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `DOB` date NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `street_address` varchar(64) NOT NULL,
  `city` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `country` varchar(32) NOT NULL,
  `credit_card_type` varchar(32) NOT NULL,
  `credit_card_num` varchar(32) NOT NULL,
  `frequent_flier_pts` int(6) NOT NULL,
  `passport_holder` tinyint(1) NOT NULL,
  `flight_status` varchar(8) DEFAULT NULL,
  `travel_agent` varchar(32) DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `usr` (`username`),
  KEY `Cust_FK2` (`travel_agent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `title`, `first_name`, `last_name`, `gender`, `DOB`, `phone`, `email`, `street_address`, `city`, `state`, `country`, `credit_card_type`, `credit_card_num`, `frequent_flier_pts`, `passport_holder`, `flight_status`, `travel_agent`, `username`) VALUES
(1, 'Mr', 'Collins', 'Jackson', 'on', '1992-11-11', '61-415', 'jackson@uow', 'collins', 'sydney', 'NSW', 'Aus', 'jcb', '123456789012341', 0, 0, NULL, NULL, 'jackson');

-- --------------------------------------------------------

--
-- Table structure for table `fleet`
--

CREATE TABLE IF NOT EXISTS `fleet` (
  `fleetID` int(4) NOT NULL AUTO_INCREMENT,
  `AirportITIA` varchar(3) NOT NULL,
  `inService` int(2) NOT NULL,
  PRIMARY KEY (`fleetID`),
  KEY `Fleet0_FK` (`AirportITIA`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fleet`
--

INSERT INTO `fleet` (`fleetID`, `AirportITIA`, `inService`) VALUES
(1, 'GOV', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` varchar(16) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `role`) VALUES
('adam', '123', 'profilemanager'),
('ironman', 'tonystark', 'admin'),
('jackson', '12345', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `routeID` int(4) NOT NULL AUTO_INCREMENT,
  `sourceAirport` varchar(3) NOT NULL,
  `destinationAirport` varchar(3) NOT NULL,
  `codeShare` varchar(1) DEFAULT NULL,
  `stops` int(1) DEFAULT NULL,
  `InternationalFlight` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`routeID`),
  KEY `Route0_FK` (`sourceAirport`),
  KEY `Route1_FK` (`destinationAirport`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`routeID`, `sourceAirport`, `destinationAirport`, `codeShare`, `stops`, `InternationalFlight`) VALUES
(1, 'PQQ', 'BHX', 'Y', 2, 1),
(2, 'PVG', 'BHX', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleID` int(4) NOT NULL AUTO_INCREMENT,
  `planeID` int(4) NOT NULL,
  `routeID` int(4) NOT NULL,
  `departDate` date NOT NULL,
  `arriveDate` date NOT NULL,
  `departTime` varchar(10) NOT NULL,
  `arriveTime` varchar(10) NOT NULL,
  PRIMARY KEY (`scheduleID`),
  KEY `Schedule_FK` (`planeID`),
  KEY `Schedule2_FK` (`routeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE IF NOT EXISTS `seat` (
  `seat_id` int(4) NOT NULL AUTO_INCREMENT,
  `seat_class` varchar(16) NOT NULL,
  `seat_number` varchar(3) NOT NULL,
  `occupied` tinyint(1) NOT NULL,
  `PlaneID` int(4) NOT NULL,
  PRIMARY KEY (`seat_id`),
  UNIQUE KEY `Seat_NUM` (`seat_number`),
  KEY `Seat_FK` (`PlaneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `serviceinventory`
--

CREATE TABLE IF NOT EXISTS `serviceinventory` (
  `service_id` int(2) NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL,
  `cost` int(3) NOT NULL,
  `avaliablity` varchar(32) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `serviceinventory`
--

INSERT INTO `serviceinventory` (`service_id`, `item`, `cost`, `avaliablity`) VALUES
(5, 'Tea/Coffee', 4, 'Intenational'),
(7, 'snack pack', 4, 'Intenational'),
(8, 'soft drink', 3, 'All'),
(12, 'wine', 11, 'Intenational');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `ticketID` int(4) NOT NULL AUTO_INCREMENT,
  `customer_id` int(4) NOT NULL,
  `scheduleID` int(4) NOT NULL,
  `seat_number` varchar(3) NOT NULL,
  `sourceAirport` varchar(3) NOT NULL,
  `destinationAirport` varchar(3) NOT NULL,
  `departTime` varchar(64) NOT NULL,
  `arriveTime` varchar(64) NOT NULL,
  `payed` tinyint(1) NOT NULL,
  PRIMARY KEY (`ticketID`),
  KEY `Ticket0_FK` (`customer_id`),
  KEY `Ticket1_FK` (`scheduleID`),
  KEY `Ticket6_FK` (`seat_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airplane`
--
ALTER TABLE `airplane`
  ADD CONSTRAINT `Plane0_FK` FOREIGN KEY (`onefleet`) REFERENCES `fleet` (`fleetID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Cust_FK` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Cust_FK2` FOREIGN KEY (`travel_agent`) REFERENCES `agentprofiles` (`travel_agent`);

--
-- Constraints for table `fleet`
--
ALTER TABLE `fleet`
  ADD CONSTRAINT `Fleet0_FK` FOREIGN KEY (`AirportITIA`) REFERENCES `airport` (`IATA`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `Route0_FK` FOREIGN KEY (`sourceAirport`) REFERENCES `airport` (`IATA`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Route1_FK` FOREIGN KEY (`destinationAirport`) REFERENCES `airport` (`IATA`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `Schedule2_FK` FOREIGN KEY (`routeID`) REFERENCES `route` (`routeID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Schedule_FK` FOREIGN KEY (`planeID`) REFERENCES `airplane` (`PlaneID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `Seat_FK` FOREIGN KEY (`PlaneID`) REFERENCES `airplane` (`PlaneID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `Ticket0_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ticket1_FK` FOREIGN KEY (`scheduleID`) REFERENCES `schedule` (`scheduleID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ticket6_FK` FOREIGN KEY (`seat_number`) REFERENCES `seat` (`seat_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
