-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2011 at 08:55 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cookbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `text` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `date`, `text`, `user_id`, `recipe_id`) VALUES
(1, '2011-04-20 08:31:00', 'commenting on mah comment', 1, 1),
(2, '2011-04-20 08:31:00', '2commenting on mah comment', 1, 1),
(3, '2011-04-20 08:31:00', '3commenting on mah comment', 1, 1),
(4, '2011-04-20 08:31:00', 'commenting on mah comment', 1, 2),
(5, '2011-04-20 08:31:00', 'commenting on mah comment', 1, 2),
(6, '2011-04-20 08:31:00', 'commenting on mah comment', 1, 3),
(7, '2011-04-20 08:31:00', 'commenting on mah comment', 1, 4),
(8, '2011-04-20 08:31:00', '2commenting on mah comment', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` int(11) DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `description`, `cost`) VALUES
(1, '0', NULL, NULL),
(2, 'eggs', NULL, NULL),
(3, 'sugar', NULL, NULL),
(4, 'milk', NULL, NULL),
(5, 'bread', NULL, NULL),
(6, 'mayonaise', NULL, NULL),
(7, 'mustard', NULL, NULL),
(8, 'pickle relish', NULL, NULL),
(9, 'pepper', NULL, NULL),
(10, 'salt', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rating`, `user_id`, `recipe_id`) VALUES
(1, 2, 1, 1),
(2, 2, 1, 2),
(3, 2, 1, 3),
(4, 2, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE IF NOT EXISTS `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `view` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `time`, `description`, `date`, `view`, `user_id`) VALUES
(1, 'test cookies', 30, 'these are the best test cookies', '2011-04-19 09:16:29', 123456, 1),
(2, 'French Toast', 20, 'this is the best test french toast', '2011-04-20 08:17:44', 123456, 1),
(3, 'egg salad', 20, 'this is the best test egg salad', '2011-04-20 08:18:44', 123456, 1),
(4, 'boiled eggs', 30, 'this is the best test boiled eggs', '2011-04-20 08:19:44', 123456, 1);

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE IF NOT EXISTS `requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `unit`, `quantity`, `recipe_id`, `ingredient_id`) VALUES
(1, NULL, '1.000', 2, 2),
(2, 'teaspoon', '0.250', 2, 3),
(3, 'teaspoon', '0.250', 2, 10),
(4, 'cup', '0.250', 2, 4),
(5, 'pieces of', '4.000', 2, 5),
(6, '', '2.000', 3, 2),
(7, 'tablespoon', '0.250', 3, 6),
(8, 'tablespoon', '0.500', 3, 7),
(9, 'tablespoon', '0.500', 3, 8),
(10, 'to taste', '0.000', 3, 9),
(11, 'to taste', '0.000', 3, 10),
(12, 'pieces of', '6.000', 3, 5),
(13, '', '2.000', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tagmaps`
--

CREATE TABLE IF NOT EXISTS `tagmaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tagmaps`
--

INSERT INTO `tagmaps` (`id`, `recipe_id`, `tag_id`) VALUES
(1, 1, 14),
(2, 1, 15),
(3, 2, 1),
(4, 2, 2),
(5, 3, 3),
(6, 3, 4),
(7, 3, 5),
(8, 3, 4),
(9, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`) VALUES
(1, 'breakfeast', NULL),
(2, 'bread', NULL),
(3, 'lunch', NULL),
(4, 'eggs', NULL),
(5, 'sandwhich', NULL),
(6, 'boil', NULL),
(7, 'beef', NULL),
(8, 'snack', NULL),
(9, 'microwave', NULL),
(10, 'asian', NULL),
(11, 'pizza', NULL),
(12, 'mexican', NULL),
(13, 'buritto', NULL),
(14, 'dessert', NULL),
(15, 'cookie', NULL),
(16, 'alcohol', NULL),
(17, 'tuna', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `alias`, `email`, `password`, `admin`) VALUES
(1, 'testshocked59', 'testshocked59@tester.com', '1234', 1);
