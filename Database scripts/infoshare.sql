-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 09 Paź 2016, 01:08
-- Wersja serwera: 5.5.27
-- Wersja PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `infoshare`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ar_internal_metadata`
--

CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2016-10-06 00:20:00', '2016-10-06 00:20:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `name`, `userId`, `creationDate`) VALUES
(1, 'Lublin', 1, '2016-10-13 03:12:36'),
(2, 'Warszawa', 1, '2016-09-15 16:23:16'),
(3, 'Katowice', 1, '2016-09-06 07:25:36'),
(4, 'No category', 1, '2016-09-06 07:11:34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories_requests`
--

CREATE TABLE IF NOT EXISTS `categories_requests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Zrzut danych tabeli `categories_requests`
--

INSERT INTO `categories_requests` (`id`, `userId`, `name`, `creationDate`) VALUES
(24, 1, 'Kielce', '2016-09-30 02:42:34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `informations`
--

CREATE TABLE IF NOT EXISTS `informations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `content` varchar(512) NOT NULL,
  `creationDate` datetime NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Zrzut danych tabeli `informations`
--

INSERT INTO `informations` (`id`, `userId`, `categoryId`, `content`, `creationDate`, `public`) VALUES
(1, 1, 1, 'Informacja dla Lublina', '2016-03-04 07:16:03', 1),
(2, 1, 2, 'Informacja dla Warszawy', '2016-03-04 06:05:23', 1),
(3, 1, 1, 'Drugi raz o Lublinie', '2016-03-04 09:13:46', 1),
(4, 1, 3, 'Informacja z Katowic', '2016-03-04 08:25:37', 1),
(64, 1, 4, 'WebService Input', '2016-09-30 02:42:33', 1),
(65, 1, 4, 'WebService Input', '2016-10-01 18:01:37', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `registrationDate` date NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `password`, `email`, `registrationDate`, `confirmed`) VALUES
(1, 'admin', 'admin@freeRide.pl', '2016-03-04', 1),
(15, '275876e34cf609db118f3d84b799a790', 'dummy@infoShare.com', '2016-09-30', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
