-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2024 at 07:39 AM
-- Server version: 10.6.17-MariaDB-cll-lve-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betasskg_rxsaver`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Morbi dignissim dignissim ipsum, eget lacinia odio efficitur ac.', '2023-06-16 01:33:36', '2023-06-16 01:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_details`
--

INSERT INTO `account_details` (`id`, `pharmacy_id`, `bank_name`, `account_holder_name`, `account_no`, `created_at`, `updated_at`) VALUES
(4, 29, 'jazz cash', 'danyal', '1234567812345678', '2023-07-27 10:37:15', '2023-07-27 10:37:15'),
(5, 28, 'jazz cash', 'care', '03002589631', '2023-08-17 12:36:20', '2023-08-17 12:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Basit Ali', 'basitwattoo007@gmail.com', '03001514443', '$2y$10$JzVBDCByX5bMiZ1Fz91Oy.KHvXbCEoCTkb0Zxrf7q8m/nCH34hj/C', 'public/admin/assets/images/users/1687332268.jpg', '2023-06-16 01:33:36', '2023-06-22 14:19:04'),
(3, 'admin', 'wattoovasitt@gmail.com', NULL, '$2y$10$tbAOPpbWgzoAdOYLONSnIuHIMEvYUv0JF2zczcl/qNsfElOGgyNPa', NULL, NULL, '2023-06-22 14:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(8, 'gsk', 'public/admin/assets/images/users/1696589902.jpg', '2023-06-25 10:40:26', '2023-10-06 14:58:22'),
(9, 'Abbott', 'public/admin/assets/images/users/1696589997.png', '2023-10-06 14:59:57', '2023-10-06 14:59:57'),
(10, 'Martin Dow', 'public/admin/assets/images/users/1696590573.png', '2023-10-06 15:09:33', '2023-10-06 15:09:33'),
(11, 'Reckitt', 'public/admin/assets/images/users/1696590639.png', '2023-10-06 15:10:39', '2023-10-06 15:10:39'),
(12, 'Hilton Pharma', 'public/admin/assets/images/users/1696590721.webp', '2023-10-06 15:12:01', '2023-10-06 15:12:01'),
(13, 'Searle Pharma', 'public/admin/assets/images/users/1696590877.jpg', '2023-10-06 15:14:37', '2023-10-06 15:14:37'),
(14, 'Sami Pharmaceuticals', 'public/admin/assets/images/users/1696591063.png', '2023-10-06 15:17:43', '2023-10-06 15:17:43'),
(15, 'Getz', 'public/admin/assets/images/users/1696680850.png', '2023-10-07 16:14:10', '2023-10-07 16:14:10'),
(16, '3S Pharmaceuticals', 'public/admin/assets/images/users/1701683024.png', '2023-12-04 14:43:44', '2023-12-04 14:43:44'),
(17, 'A\'Raf Pharma', 'public/admin/assets/images/users/1701683136.jpeg', '2023-12-04 14:45:36', '2023-12-04 14:45:36'),
(18, 'A.FEROZ & CO', 'public/admin/assets/images/users/1701683304.png', '2023-12-04 14:48:24', '2023-12-04 14:48:24'),
(19, 'A J Mirza Pharma', 'public/admin/assets/images/users/1701683416.jpg', '2023-12-04 14:50:16', '2023-12-04 14:50:16'),
(20, 'AAN Nutra Care (pvt.) ltd', 'public/admin/assets/images/users/1701683919.jpg', '2023-12-04 14:58:39', '2023-12-04 14:58:39'),
(21, 'Abon USA', 'public/admin/assets/images/users/1701684037.jpg', '2023-12-04 15:00:37', '2023-12-04 15:00:37'),
(22, 'Acon Laboratories Inc.USA', 'public/admin/assets/images/users/1701684117.jpg', '2023-12-04 15:01:57', '2023-12-04 15:01:57'),
(23, 'Abqari Dawakhana', 'public/admin/assets/images/users/1701684235.jpg', '2023-12-04 15:03:55', '2023-12-04 15:03:55'),
(24, 'Accurate Medical Supplies', 'public/admin/assets/images/users/1701684284.jpeg', '2023-12-04 15:04:44', '2023-12-04 15:04:44'),
(25, 'ACE Nutrition', 'public/admin/assets/images/users/1701684307.jpg', '2023-12-04 15:05:07', '2023-12-04 15:05:07'),
(26, 'Acme Laboratories Pakistan (Pvt) Ltd.', 'public/admin/assets/images/users/1701684367.png', '2023-12-04 15:06:07', '2023-12-04 15:06:07'),
(27, 'Acti-Med Pharma (Pvt) Ltd.', 'public/admin/assets/images/users/1701684441.png', '2023-12-04 15:07:21', '2023-12-04 15:07:21'),
(28, 'Adamjee Pharma Services', 'public/admin/assets/images/users/1701684498.jpg', '2023-12-04 15:08:18', '2023-12-04 15:08:18'),
(29, 'AGP', 'public/admin/assets/images/users/1701684609.jpeg', '2023-12-04 15:10:09', '2023-12-04 15:10:09'),
(30, 'Aitken Stuart Pakistan', 'public/admin/assets/images/users/1701684644.jpg', '2023-12-04 15:10:44', '2023-12-04 15:10:44'),
(31, 'AJ Research and Pharma', 'public/admin/assets/images/users/1701684687.png', '2023-12-04 15:11:27', '2023-12-04 15:11:27'),
(32, 'Akhai Pharmaceuticals', 'public/admin/assets/images/users/1701684755.jpg', '2023-12-04 15:12:35', '2023-12-04 15:12:35'),
(33, 'Akson Pharmaceuticals (Pvt) Ltd.', 'public/admin/assets/images/users/1701685411.jpeg', '2023-12-04 15:23:31', '2023-12-04 15:23:31'),
(34, 'Al Habib Pharmaceuticals', 'public/admin/assets/images/users/1701685524.jpeg', '2023-12-04 15:25:24', '2023-12-04 15:25:24'),
(35, 'Al-Hameed Agencies (Pvt) Ltd', 'public/admin/assets/images/users/1701685558.jpg', '2023-12-04 15:25:58', '2023-12-04 15:25:58'),
(36, 'Alaq Laboratories', 'public/admin/assets/images/users/1701685579.jpg', '2023-12-04 15:26:19', '2023-12-04 15:26:19'),
(37, 'Albert Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1701685612.jpg', '2023-12-04 15:26:52', '2023-12-04 15:26:52'),
(38, 'Albro Pharmaceuticals', 'public/admin/assets/images/users/1701685634.jpg', '2023-12-04 15:27:14', '2023-12-04 15:27:14'),
(39, 'Alcon Pharma', 'public/admin/assets/images/users/1701685664.jpg', '2023-12-04 15:27:44', '2023-12-04 15:27:44'),
(40, 'Alcon Scientific Service', 'public/admin/assets/images/users/1701685686.jpg', '2023-12-04 15:28:06', '2023-12-04 15:28:06'),
(41, 'Algae Cal Inc', 'public/admin/assets/images/users/1701685804.jpg', '2023-12-04 15:30:04', '2023-12-04 15:30:04'),
(42, 'Ali Industries', 'public/admin/assets/images/users/1701685830.jpg', '2023-12-04 15:30:30', '2023-12-04 15:30:30'),
(43, 'Alina Combine Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1701685864.gif', '2023-12-04 15:31:04', '2023-12-04 15:31:04'),
(44, 'Alkemy Pharmaceutical Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1701685890.jpg', '2023-12-04 15:31:30', '2023-12-04 15:31:30'),
(45, 'Allianze Pharma', 'public/admin/assets/images/users/1701685910.jpg', '2023-12-04 15:31:50', '2023-12-04 15:31:50'),
(46, 'Allmed Labs', 'public/admin/assets/images/users/1701685929.jpg', '2023-12-04 15:32:09', '2023-12-04 15:32:09'),
(47, 'Allmed Medical Gmbh', 'public/admin/assets/images/users/1701685951.jpg', '2023-12-04 15:32:31', '2023-12-04 15:32:31'),
(48, 'Alpha Labs PK', 'public/admin/assets/images/users/1701685970.jpg', '2023-12-04 15:32:50', '2023-12-04 15:32:50'),
(49, 'Amarant Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1701685991.jpg', '2023-12-04 15:33:11', '2023-12-04 15:33:11'),
(50, 'Ameer & Adnan Pharmaceuticals Pvt. Ltd', 'public/admin/assets/images/users/1701686014.jpg', '2023-12-04 15:33:34', '2023-12-04 15:33:34'),
(51, 'Ameer Pharma', 'public/admin/assets/images/users/1701686036.jpg', '2023-12-04 15:33:56', '2023-12-04 15:33:56'),
(52, 'Amgomed Pharma', 'public/admin/assets/images/users/1701686059.jpg', '2023-12-04 15:34:19', '2023-12-04 15:34:19'),
(53, 'Amros Pharmaceuticals', 'public/admin/assets/images/users/1701686084.jpg', '2023-12-04 15:34:44', '2023-12-04 15:34:44'),
(54, 'Amson Vaccines & Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1701686099.jpg', '2023-12-04 15:34:59', '2023-12-04 15:34:59'),
(55, 'Angel', 'public/admin/assets/images/users/1701686121.jpg', '2023-12-04 15:35:21', '2023-12-04 15:35:21'),
(56, 'Angelini Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1701686156.jpg', '2023-12-04 15:35:56', '2023-12-04 15:35:56'),
(57, 'ANGO Industries', 'public/admin/assets/images/users/1701686179.jpg', '2023-12-04 15:36:19', '2023-12-04 15:36:19'),
(58, 'Anhui Anke Biotechnology Co. Ltd, China', 'public/admin/assets/images/users/1701686203.jpg', '2023-12-04 15:36:43', '2023-12-04 15:36:43'),
(59, 'Ankaz Pharmex (Pvt) Ltd.', 'public/admin/assets/images/users/1701686224.jpg', '2023-12-04 15:37:04', '2023-12-04 15:37:04'),
(60, 'Ansell Ltd', 'public/admin/assets/images/users/1701686258.jpg', '2023-12-04 15:37:38', '2023-12-04 15:37:38'),
(61, 'Antec UK', 'public/admin/assets/images/users/1701686272.jpg', '2023-12-04 15:37:52', '2023-12-04 15:37:52'),
(62, 'Anza Pharma', 'public/admin/assets/images/users/1701686299.jpg', '2023-12-04 15:38:19', '2023-12-04 15:38:19'),
(63, 'Apothecary USA', 'public/admin/assets/images/users/1701686321.jpg', '2023-12-04 15:38:41', '2023-12-04 15:38:41'),
(64, 'Aqua pro', 'public/admin/assets/images/users/1701686340.jpg', '2023-12-04 15:39:00', '2023-12-04 15:39:00'),
(65, 'Arfi International Karachi', 'public/admin/assets/images/users/1701686362.jpg', '2023-12-04 15:39:22', '2023-12-04 15:39:22'),
(66, 'Arkray Factory Inc. Japan', 'public/admin/assets/images/users/1701686393.jpg', '2023-12-04 15:39:53', '2023-12-04 15:39:53'),
(67, 'Askari Pharmaceuticals', 'public/admin/assets/images/users/1701686415.jpg', '2023-12-04 15:40:15', '2023-12-04 15:40:15'),
(68, 'Aspen', 'public/admin/assets/images/users/1701686437.jpg', '2023-12-04 15:40:37', '2023-12-04 15:40:37'),
(69, 'Aspin Pharma formerly Janssen-Cilag', 'public/admin/assets/images/users/1701686457.jpg', '2023-12-04 15:40:57', '2023-12-04 15:40:57'),
(70, 'Astrazeneca', 'public/admin/assets/images/users/1701686474.jpg', '2023-12-04 15:41:14', '2023-12-04 15:41:14'),
(71, 'Atco Healthcare Pvt Ltd', 'public/admin/assets/images/users/1701686492.jpg', '2023-12-04 15:41:32', '2023-12-04 15:41:32'),
(72, 'Atco Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1701686535.jpg', '2023-12-04 15:42:15', '2023-12-04 15:42:15'),
(73, 'Aura Crafts', 'public/admin/assets/images/users/1701686573.jpg', '2023-12-04 15:42:53', '2023-12-04 15:42:53'),
(74, 'Aura Crafts Pvt Ltd', 'public/admin/assets/images/users/1701686593.jpg', '2023-12-04 15:43:13', '2023-12-04 15:43:13'),
(75, 'Avalonsource', 'public/admin/assets/images/users/1701686614.jpg', '2023-12-04 15:43:34', '2023-12-04 15:43:34'),
(76, 'Avant Pharmaceuticals', 'public/admin/assets/images/users/1701686635.jpg', '2023-12-04 15:43:55', '2023-12-04 15:43:55'),
(77, 'Avecina Pharmaceuticals', 'public/admin/assets/images/users/1701686655.jpg', '2023-12-04 15:44:15', '2023-12-04 15:44:15'),
(78, 'Avior Pharmaceutical (pvt) Ltd', 'public/admin/assets/images/users/1701686676.jpg', '2023-12-04 15:44:36', '2023-12-04 15:44:36'),
(79, 'Avisacta Health Care', 'public/admin/assets/images/users/1701686694.jpg', '2023-12-04 15:44:54', '2023-12-04 15:44:54'),
(80, 'B & B Import', 'public/admin/assets/images/users/1707894193.jpg', '2024-02-14 12:03:13', '2024-02-14 12:03:13'),
(81, 'B&B Import Pvt Ltd', 'public/admin/assets/images/users/1707894214.jpg', '2024-02-14 12:03:34', '2024-02-14 12:03:34'),
(82, 'B.Braun Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707894232.jpg', '2024-02-14 12:03:52', '2024-02-14 12:03:52'),
(83, 'B.Brothers Pakistan', 'public/admin/assets/images/users/1707894251.jpg', '2024-02-14 12:04:11', '2024-02-14 12:04:11'),
(84, 'Bajwa Pharmaceuticals', 'public/admin/assets/images/users/1707894267.jpg', '2024-02-14 12:04:27', '2024-02-14 12:04:27'),
(85, 'BAP Medical Holland', 'public/admin/assets/images/users/1707894285.jpg', '2024-02-14 12:04:45', '2024-02-14 12:04:45'),
(86, 'Barrett Hodgson Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707894299.jpg', '2024-02-14 12:04:59', '2024-02-14 12:04:59'),
(87, 'Bausch and lomb', 'public/admin/assets/images/users/1707894314.jpg', '2024-02-14 12:05:14', '2024-02-14 12:05:14'),
(88, 'Bayer Health Care Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707894330.jpg', '2024-02-14 12:05:30', '2024-02-14 12:05:30'),
(89, 'Bayer Schering Pharma Ltd', 'public/admin/assets/images/users/1707894345.jpg', '2024-02-14 12:05:45', '2024-02-14 12:05:45'),
(90, 'BC Ceuticals - Switzerland', 'public/admin/assets/images/users/1707894361.jpg', '2024-02-14 12:06:01', '2024-02-14 12:06:01'),
(91, 'Becton Dickinson Pakistan (Private) Limited', 'public/admin/assets/images/users/1707894375.jpg', '2024-02-14 12:06:15', '2024-02-14 12:06:15'),
(92, 'Beijing ShuangLu Pharmaceutical Co., Ltd', 'public/admin/assets/images/users/1707894389.jpg', '2024-02-14 12:06:29', '2024-02-14 12:06:29'),
(93, 'Believia Munddusche', 'public/admin/assets/images/users/1707894407.jpg', '2024-02-14 12:06:47', '2024-02-14 12:06:47'),
(94, 'Benecheck', 'public/admin/assets/images/users/1707894422.jpg', '2024-02-14 12:07:02', '2024-02-14 12:07:02'),
(95, 'Benson Pharmaceuticals', 'public/admin/assets/images/users/1707894440.jpg', '2024-02-14 12:07:20', '2024-02-14 12:07:20'),
(96, 'Beste Pharma (Pvt) Ltd.', 'public/admin/assets/images/users/1707894455.jpg', '2024-02-14 12:07:35', '2024-02-14 12:07:35'),
(97, 'Beurer GmbH Germany', 'public/admin/assets/images/users/1707894484.jpg', '2024-02-14 12:08:04', '2024-02-14 12:08:04'),
(98, 'Beurer', 'public/admin/assets/images/users/1707894498.jpg', '2024-02-14 12:08:18', '2024-02-14 12:08:18'),
(99, 'Bex Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707894520.jpg', '2024-02-14 12:08:40', '2024-02-14 12:08:40'),
(100, 'BF Biosciences Limited', 'public/admin/assets/images/users/1707894539.jpg', '2024-02-14 12:08:59', '2024-02-14 12:08:59'),
(101, 'BIC', 'public/admin/assets/images/users/1707894553.jpg', '2024-02-14 12:09:13', '2024-02-14 12:09:13'),
(102, 'Bin Rasheed Colors & Chemicals Mfg. Co. Pvt. Ltd', 'public/admin/assets/images/users/1707894569.jpg', '2024-02-14 12:09:29', '2024-02-14 12:09:29'),
(103, 'Bio Pharma', 'public/admin/assets/images/users/1707894585.jpg', '2024-02-14 12:09:45', '2024-02-14 12:09:45'),
(114, 'Bio-Labs (Pvt) Ltd.', 'public/admin/assets/images/users/1707895258.jpg', '2024-02-14 12:20:58', '2024-02-14 12:20:58'),
(115, 'Biocare Pharmaceutica', 'public/admin/assets/images/users/1707895271.jpg', '2024-02-14 12:21:11', '2024-02-14 12:21:11'),
(116, 'Biocos Cosmetics', 'public/admin/assets/images/users/1707895298.jpg', '2024-02-14 12:21:38', '2024-02-14 12:21:38'),
(117, 'Biogen Pharma', 'public/admin/assets/images/users/1707895310.jpg', '2024-02-14 12:21:50', '2024-02-14 12:21:50'),
(118, 'Biogenics Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707895325.jpg', '2024-02-14 12:22:05', '2024-02-14 12:22:05'),
(119, 'Biomecanica', 'public/admin/assets/images/users/1707895339.jpg', '2024-02-14 12:22:19', '2024-02-14 12:22:19'),
(120, 'Biomet Inc', 'public/admin/assets/images/users/1707895356.jpg', '2024-02-14 12:22:36', '2024-02-14 12:22:36'),
(121, 'Biorex Pharmaceuticals', 'public/admin/assets/images/users/1707895373.jpg', '2024-02-14 12:22:53', '2024-02-14 12:22:53'),
(122, 'Biotest Pharmaceutical', 'public/admin/assets/images/users/1707895390.jpg', '2024-02-14 12:23:10', '2024-02-14 12:23:10'),
(123, 'Biovista (Pvt) Ltd', 'public/admin/assets/images/users/1707895404.jpg', '2024-02-14 12:23:24', '2024-02-14 12:23:24'),
(124, 'Biozyme Biotechnology', 'public/admin/assets/images/users/1707895421.jpg', '2024-02-14 12:23:41', '2024-02-14 12:23:41'),
(125, 'Blackmores Ltd', 'public/admin/assets/images/users/1707895454.jpg', '2024-02-14 12:24:14', '2024-02-14 12:24:14'),
(126, 'Bliss Industries (Pvt) Ltd', 'public/admin/assets/images/users/1707895469.jpg', '2024-02-14 12:24:29', '2024-02-14 12:24:29'),
(127, 'Blood Uric Acid Kit 6x15\'s', 'public/admin/assets/images/users/1707895484.jpg', '2024-02-14 12:24:44', '2024-02-14 12:24:44'),
(128, 'Bloom Pharmaceuticals', 'public/admin/assets/images/users/1707895503.jpg', '2024-02-14 12:25:03', '2024-02-14 12:25:03'),
(129, 'Bloom Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707895518.jpg', '2024-02-14 12:25:18', '2024-02-14 12:25:18'),
(130, 'Blue Bird', 'public/admin/assets/images/users/1707895533.jpg', '2024-02-14 12:25:33', '2024-02-14 12:25:33'),
(131, 'Bmed Health Care', 'public/admin/assets/images/users/1707895550.jpg', '2024-02-14 12:25:50', '2024-02-14 12:25:50'),
(132, 'BMS Germany', 'public/admin/assets/images/users/1707895567.jpg', '2024-02-14 12:26:07', '2024-02-14 12:26:07'),
(133, 'BNS PHARMACEUTICAL', 'public/admin/assets/images/users/1707895583.jpg', '2024-02-14 12:26:23', '2024-02-14 12:26:23'),
(134, 'Boan Health Product', 'public/admin/assets/images/users/1707895598.jpg', '2024-02-14 12:26:38', '2024-02-14 12:26:38'),
(135, 'Body Shop Pvt Ltd', 'public/admin/assets/images/users/1707895612.jpg', '2024-02-14 12:26:52', '2024-02-14 12:26:52'),
(136, 'Bonjour Communication', 'public/admin/assets/images/users/1707895627.jpg', '2024-02-14 12:27:07', '2024-02-14 12:27:07'),
(137, 'Bosch Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707895640.jpg', '2024-02-14 12:27:20', '2024-02-14 12:27:20'),
(138, 'Brick Laboratories', 'public/admin/assets/images/users/1707895660.jpg', '2024-02-14 12:27:40', '2024-02-14 12:27:40'),
(139, 'Bright Medways', 'public/admin/assets/images/users/1707895673.jpg', '2024-02-14 12:27:53', '2024-02-14 12:27:53'),
(140, 'Bright Vision', 'public/admin/assets/images/users/1707895687.jpg', '2024-02-14 12:28:07', '2024-02-14 12:28:07'),
(141, 'Bristol Mayer Biotech Pakistan', 'public/admin/assets/images/users/1707895703.jpg', '2024-02-14 12:28:23', '2024-02-14 12:28:23'),
(142, 'British Pharmaceuticals', 'public/admin/assets/images/users/1707895719.jpg', '2024-02-14 12:28:39', '2024-02-14 12:28:39'),
(143, 'Brookes Pharmaceutical Labs (Pakistan) Ltd', 'public/admin/assets/images/users/1707895735.jpg', '2024-02-14 12:28:55', '2024-02-14 12:28:55'),
(144, 'Bryon Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707895793.jpg', '2024-02-14 12:29:53', '2024-02-14 12:29:53'),
(145, 'Bsn Medical (Pvt) Ltd', 'public/admin/assets/images/users/1707895829.jpg', '2024-02-14 12:30:29', '2024-02-14 12:30:29'),
(146, 'BSN Medical Pvt Ltd.', 'public/admin/assets/images/users/1707895844.jpg', '2024-02-14 12:30:44', '2024-02-14 12:30:44'),
(147, 'Calgan Pharmaceuticals', 'public/admin/assets/images/users/1707895858.jpg', '2024-02-14 12:30:58', '2024-02-14 12:30:58'),
(148, 'Candid Pharmaceuticals', 'public/admin/assets/images/users/1707895873.jpg', '2024-02-14 12:31:13', '2024-02-14 12:31:13'),
(149, 'Caraway Pharmaceuticals', 'public/admin/assets/images/users/1707895888.jpg', '2024-02-14 12:31:28', '2024-02-14 12:31:28'),
(150, 'Care PHARMA', 'public/admin/assets/images/users/1707895907.jpg', '2024-02-14 12:31:47', '2024-02-14 12:31:47'),
(151, 'Caylex Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707895920.jpg', '2024-02-14 12:32:00', '2024-02-14 12:32:00'),
(152, 'CCL Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707895934.jpg', '2024-02-14 12:32:14', '2024-02-14 12:32:14'),
(153, 'Cedar Pharma', 'public/admin/assets/images/users/1707895948.jpg', '2024-02-14 12:32:28', '2024-02-14 12:32:28'),
(154, 'Cell LABORATORIES LTD', 'public/admin/assets/images/users/1707895963.jpg', '2024-02-14 12:32:43', '2024-02-14 12:32:43'),
(155, 'Cell Laboratories Pvt Ltd', 'public/admin/assets/images/users/1707895978.jpg', '2024-02-14 12:32:58', '2024-02-14 12:32:58'),
(156, 'Cellegene Pharmaceuticals', 'public/admin/assets/images/users/1707895993.jpg', '2024-02-14 12:33:13', '2024-02-14 12:33:13'),
(157, 'Century Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707896007.jpg', '2024-02-14 12:33:27', '2024-02-14 12:33:27'),
(158, 'Certeza', 'public/admin/assets/images/users/1707896021.jpg', '2024-02-14 12:33:41', '2024-02-14 12:33:41'),
(159, 'Changchun Institute of Biological Products Co. Ltd', 'public/admin/assets/images/users/1707896035.jpg', '2024-02-14 12:33:55', '2024-02-14 12:33:55'),
(160, 'Charm Natural', 'public/admin/assets/images/users/1707896050.jpg', '2024-02-14 12:34:10', '2024-02-14 12:34:10'),
(161, 'Chas-A-Mendoza', 'public/admin/assets/images/users/1707896065.jpg', '2024-02-14 12:34:25', '2024-02-14 12:34:25'),
(162, 'Chengdu Tiantaishan Pharmaceutical Co. Ltd. China', 'public/admin/assets/images/users/1707896080.jpg', '2024-02-14 12:34:40', '2024-02-14 12:34:40'),
(163, 'Cheveux Intl', 'public/admin/assets/images/users/1707896094.jpg', '2024-02-14 12:34:54', '2024-02-14 12:34:54'),
(164, 'Chiesi Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707896154.jpg', '2024-02-14 12:35:54', '2024-02-14 12:35:54'),
(165, 'Chong Kun Dang Pharmaceutical Corp. Korea', 'public/admin/assets/images/users/1707896240.jpg', '2024-02-14 12:37:20', '2024-02-14 12:37:20'),
(166, 'Cibex (Pvt) Ltd', 'public/admin/assets/images/users/1707896256.jpg', '2024-02-14 12:37:36', '2024-02-14 12:37:36'),
(167, 'Cirin Pharmaceuticals (Pvt) Ltd.', 'public/admin/assets/images/users/1707896272.jpg', '2024-02-14 12:37:52', '2024-02-14 12:37:52'),
(168, 'Citizen', 'public/admin/assets/images/users/1707896294.jpg', '2024-02-14 12:38:14', '2024-02-14 12:38:14'),
(169, 'Collegene Pharmaceuticals', 'public/admin/assets/images/users/1707896350.jpg', '2024-02-14 12:39:10', '2024-02-14 12:39:10'),
(170, 'ColoPlast, Denmark', 'public/admin/assets/images/users/1707896373.jpg', '2024-02-14 12:39:33', '2024-02-14 12:39:33'),
(171, 'Conatural Beauty (Pvt) Limited', 'public/admin/assets/images/users/1707896407.jpg', '2024-02-14 12:40:07', '2024-02-14 12:40:07'),
(172, 'Continental Chemical Co. (Pvt) Ltd', 'public/admin/assets/images/users/1707896439.jpg', '2024-02-14 12:40:39', '2024-02-14 12:40:39'),
(173, 'Continental Pharmaceuticals', 'public/admin/assets/images/users/1707896465.jpg', '2024-02-14 12:41:05', '2024-02-14 12:41:05'),
(174, 'Convatec', 'public/admin/assets/images/users/1707896487.jpg', '2024-02-14 12:41:27', '2024-02-14 12:41:27'),
(175, 'Cotton Craft (Pvt) Ltd', 'public/admin/assets/images/users/1707896519.jpg', '2024-02-14 12:41:59', '2024-02-14 12:41:59'),
(176, 'CSH Pharmaceuticals', 'public/admin/assets/images/users/1707896570.jpg', '2024-02-14 12:42:50', '2024-02-14 12:42:50'),
(177, 'DADSON', 'public/admin/assets/images/users/1707896633.jpg', '2024-02-14 12:43:53', '2024-02-14 12:43:53'),
(178, 'Danas Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707896663.jpg', '2024-02-14 12:44:23', '2024-02-14 12:44:23'),
(179, 'Daneen Pharma', 'public/admin/assets/images/users/1707896686.jpg', '2024-02-14 12:44:46', '2024-02-14 12:44:46'),
(180, 'Davis Pharmaceuticals Laboratories', 'public/admin/assets/images/users/1707896723.jpg', '2024-02-14 12:45:23', '2024-02-14 12:45:23'),
(181, 'Delta Pharma (Pvt) Ltd. Pak', 'public/admin/assets/images/users/1707896769.jpg', '2024-02-14 12:46:09', '2024-02-14 12:46:09'),
(182, 'Demetech Corporation', 'public/admin/assets/images/users/1707896801.jpg', '2024-02-14 12:46:41', '2024-02-14 12:46:41'),
(183, 'Dentecia', 'public/admin/assets/images/users/1707896823.jpg', '2024-02-14 12:47:03', '2024-02-14 12:47:03'),
(184, 'DERMA HEALTH PHARMA', 'public/admin/assets/images/users/1707896840.jpg', '2024-02-14 12:47:20', '2024-02-14 12:47:20'),
(185, 'Derma Techno Pakistan', 'public/admin/assets/images/users/1707896856.jpg', '2024-02-14 12:47:36', '2024-02-14 12:47:36'),
(186, 'Dermagen Pharma Pakistan (Pvt) Ltd.', 'public/admin/assets/images/users/1707896870.jpg', '2024-02-14 12:47:50', '2024-02-14 12:47:50'),
(187, 'Dhanak', 'public/admin/assets/images/users/1707896893.jpg', '2024-02-14 12:48:13', '2024-02-14 12:48:13'),
(188, 'Don Valley Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707896939.jpg', '2024-02-14 12:48:59', '2024-02-14 12:48:59'),
(189, 'Dosaco Laboratories', 'public/admin/assets/images/users/1707896968.jpg', '2024-02-14 12:49:28', '2024-02-14 12:49:28'),
(190, 'Dr Reckeweg & Co', 'public/admin/assets/images/users/1707896992.jpg', '2024-02-14 12:49:52', '2024-02-14 12:49:52'),
(191, 'Dr. Sethi(Pharma) Industries', 'public/admin/assets/images/users/1707897009.jpg', '2024-02-14 12:50:09', '2024-02-14 12:50:09'),
(192, 'Dr. Willmar Schwabe Germany(Pvt) Ltd', 'public/admin/assets/images/users/1707897035.jpg', '2024-02-14 12:50:35', '2024-02-14 12:50:35'),
(193, 'Dr.Raza Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707897058.jpg', '2024-02-14 12:50:58', '2024-02-14 12:50:58'),
(194, 'Drugs Inn', 'public/admin/assets/images/users/1707897081.jpg', '2024-02-14 12:51:21', '2024-02-14 12:51:21'),
(195, 'Dyson Research Laboratories (pvt) limited.', 'public/admin/assets/images/users/1707897126.jpg', '2024-02-14 12:52:06', '2024-02-14 12:52:06'),
(196, 'Edwin Pharma', 'public/admin/assets/images/users/1707897170.jpg', '2024-02-14 12:52:50', '2024-02-14 12:52:50'),
(197, 'Efroze Chemical Industries (Pvt) Ltd', 'public/admin/assets/images/users/1707897196.jpg', '2024-02-14 12:53:16', '2024-02-14 12:53:16'),
(198, 'Eli-Lilly Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707897219.jpg', '2024-02-14 12:53:39', '2024-02-14 12:53:39'),
(199, 'Elite Pharmaceuticals', 'public/admin/assets/images/users/1707897232.jpg', '2024-02-14 12:53:52', '2024-02-14 12:53:52'),
(200, 'Elko Organization (Pvt) Ltd', 'public/admin/assets/images/users/1707897260.jpg', '2024-02-14 12:54:20', '2024-02-14 12:54:20'),
(201, 'English Pharmaceutical Industries', 'public/admin/assets/images/users/1707897292.jpg', '2024-02-14 12:54:52', '2024-02-14 12:54:52'),
(202, 'Ethical Laboratories Pvt Ltd', 'public/admin/assets/images/users/1707897369.jpg', '2024-02-14 12:56:09', '2024-02-14 12:56:09'),
(203, 'Excel Healthcare Laboratories (Pvt)Ltd.', 'public/admin/assets/images/users/1707897437.jpg', '2024-02-14 12:57:17', '2024-02-14 12:57:17'),
(204, 'Exclusive Medical', 'public/admin/assets/images/users/1707897764.jpg', '2024-02-14 13:02:44', '2024-02-14 13:02:44'),
(205, 'F.B.S & SONS (PVT) LTD', 'public/admin/assets/images/users/1707897822.jpg', '2024-02-14 13:03:42', '2024-02-14 13:03:42'),
(206, 'Father & Sons', 'public/admin/assets/images/users/1707897857.jpg', '2024-02-14 13:04:17', '2024-02-14 13:04:17'),
(207, 'Fazaldin-&-Sons', 'public/admin/assets/images/users/1707897869.jpg', '2024-02-14 13:04:29', '2024-02-14 13:04:29'),
(208, 'Ferozsons Laboratories Ltd', 'public/admin/assets/images/users/1707897900.jpg', '2024-02-14 13:05:00', '2024-02-14 13:05:00'),
(209, 'Focus & Rulz Pharmaceuticals (Pvt.)Ltd', 'public/admin/assets/images/users/1707897944.jpg', '2024-02-14 13:05:44', '2024-02-14 13:05:44'),
(210, 'Galaxy Pharma (Pvt.) Limited', 'public/admin/assets/images/users/1707898072.jpg', '2024-02-14 13:07:52', '2024-02-14 13:07:52'),
(211, 'Garnier', 'public/admin/assets/images/users/1707898131.jpg', '2024-02-14 13:08:51', '2024-02-14 13:08:51'),
(212, 'Genetics Pharmaceuticals', 'public/admin/assets/images/users/1707898182.jpg', '2024-02-14 13:09:42', '2024-02-14 13:09:42'),
(213, 'Genix Pharma', 'public/admin/assets/images/users/1707898213.jpg', '2024-02-14 13:10:13', '2024-02-14 13:10:13'),
(214, 'Genome Pharmaceuticals', 'public/admin/assets/images/users/1707898237.jpg', '2024-02-14 13:10:37', '2024-02-14 13:10:37'),
(215, 'GenTek', 'public/admin/assets/images/users/1707898261.jpg', '2024-02-14 13:11:01', '2024-02-14 13:11:01'),
(216, 'Geofman Pharmaceuticals', 'public/admin/assets/images/users/1707898273.jpg', '2024-02-14 13:11:13', '2024-02-14 13:11:13'),
(217, 'Geriatric Pharmaton', 'public/admin/assets/images/users/1707898320.jpg', '2024-02-14 13:12:00', '2024-02-14 13:12:00'),
(218, 'Glitz Pharma', 'public/admin/assets/images/users/1707898348.jpg', '2024-02-14 13:12:28', '2024-02-14 13:12:28'),
(219, 'Global Pharmaceucticals Pvt Ltd', 'public/admin/assets/images/users/1707898381.jpg', '2024-02-14 13:13:01', '2024-02-14 13:13:01'),
(220, 'Good\' N Natural USA', 'public/admin/assets/images/users/1707898442.jpg', '2024-02-14 13:14:02', '2024-02-14 13:14:02'),
(221, 'Goodman International', 'public/admin/assets/images/users/1707898469.jpg', '2024-02-14 13:14:29', '2024-02-14 13:14:29'),
(222, 'Graton Pharma', 'public/admin/assets/images/users/1707898503.jpg', '2024-02-14 13:15:03', '2024-02-14 13:15:03'),
(223, 'Grays Pharmaceuticals', 'public/admin/assets/images/users/1707898529.jpg', '2024-02-14 13:15:29', '2024-02-14 13:15:29'),
(224, 'GT Pharma Pvt Ltd', 'public/admin/assets/images/users/1707898587.jpg', '2024-02-14 13:16:27', '2024-02-14 13:16:27'),
(225, 'Haji Medicine Co.', 'public/admin/assets/images/users/1707898639.jpg', '2024-02-14 13:17:19', '2024-02-14 13:17:19'),
(226, 'Hakimsons (Impex) (Pvt) Ltd', 'public/admin/assets/images/users/1707898654.jpg', '2024-02-14 13:17:34', '2024-02-14 13:17:34'),
(227, 'Hamaz Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707898681.jpg', '2024-02-14 13:18:01', '2024-02-14 13:18:01'),
(228, 'Hamdard Laboratories (Waqf) Pakistan', 'public/admin/assets/images/users/1707898695.jpg', '2024-02-14 13:18:15', '2024-02-14 13:18:15'),
(229, 'Hansel Pharmaceuticals (Pvt.) Ltd.', 'public/admin/assets/images/users/1707898725.jpg', '2024-02-14 13:18:45', '2024-02-14 13:18:45'),
(230, 'Harmann Pharmaceuticals Labs (Pvt) Ltd.', 'public/admin/assets/images/users/1707898750.jpg', '2024-02-14 13:19:10', '2024-02-14 13:19:10'),
(231, 'Heal The World', 'public/admin/assets/images/users/1707898873.jpg', '2024-02-14 13:21:13', '2024-02-14 13:21:13'),
(232, 'Helicon Pharmaceutical Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707898950.jpg', '2024-02-14 13:22:30', '2024-02-14 13:22:30'),
(233, 'Helix Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707898965.jpg', '2024-02-14 13:22:45', '2024-02-14 13:22:45'),
(234, 'Herbiotics Health Care', 'public/admin/assets/images/users/1707898981.jpg', '2024-02-14 13:23:01', '2024-02-14 13:23:01'),
(235, 'Herbo Natural', 'public/admin/assets/images/users/1707899009.jpg', '2024-02-14 13:23:29', '2024-02-14 13:23:29'),
(236, 'Herbyzone Pvt Ltd.', 'public/admin/assets/images/users/1707899023.jpg', '2024-02-14 13:23:43', '2024-02-14 13:23:43'),
(237, 'Hi-Warble Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707899047.jpg', '2024-02-14 13:24:07', '2024-02-14 13:24:07'),
(238, 'Highnoon Laboratories Ltd.', 'public/admin/assets/images/users/1707899090.jpg', '2024-02-14 13:24:50', '2024-02-14 13:24:50'),
(239, 'Himont Pharma (Pvt) Ltd.', 'public/admin/assets/images/users/1707899117.jpg', '2024-02-14 13:25:17', '2024-02-14 13:25:17'),
(240, 'Horizon Pharmaceuticals (Pvt) Ltd.', 'public/admin/assets/images/users/1707899201.jpg', '2024-02-14 13:26:41', '2024-02-14 13:26:41'),
(241, 'Hyan Pharma', 'public/admin/assets/images/users/1707899252.jpg', '2024-02-14 13:27:32', '2024-02-14 13:27:32'),
(242, 'I.Q. Pharma', 'public/admin/assets/images/users/1707899267.jpg', '2024-02-14 13:27:47', '2024-02-14 13:27:47'),
(243, 'IBL Health Care (Pvt) Ltd', 'public/admin/assets/images/users/1707899296.jpg', '2024-02-14 13:28:16', '2024-02-14 13:28:16'),
(244, 'ICI Pakistan Ltd', 'public/admin/assets/images/users/1707899312.jpg', '2024-02-14 13:28:32', '2024-02-14 13:28:32'),
(245, 'Icon Pharma', 'public/admin/assets/images/users/1707899342.jpg', '2024-02-14 13:29:02', '2024-02-14 13:29:02'),
(246, 'Ideal Pharmaceutical Industries', 'public/admin/assets/images/users/1707899369.jpg', '2024-02-14 13:29:29', '2024-02-14 13:29:29'),
(247, 'Indus Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707899411.jpg', '2024-02-14 13:30:11', '2024-02-14 13:30:11'),
(248, 'Intersurgical UK', 'public/admin/assets/images/users/1707900882.jpg', '2024-02-14 13:54:42', '2024-02-14 13:54:42'),
(249, 'Ipram International', 'public/admin/assets/images/users/1707900915.jpg', '2024-02-14 13:55:15', '2024-02-14 13:55:15'),
(250, 'Irza Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707900969.jpg', '2024-02-14 13:56:09', '2024-02-14 13:56:09'),
(251, 'Johnson-&-Johnson', 'public/admin/assets/images/users/1707901010.jpg', '2024-02-14 13:56:50', '2024-02-14 13:56:50'),
(252, 'Karachi Chemical Industries (Pvt) Ltd', 'public/admin/assets/images/users/1707901065.jpg', '2024-02-14 13:57:45', '2024-02-14 13:57:45'),
(253, 'Karachi Pharmaceuticals Lab', 'public/admin/assets/images/users/1707901099.jpg', '2024-02-14 13:58:19', '2024-02-14 13:58:19'),
(254, 'Kobec Health Sciences', 'public/admin/assets/images/users/1707901136.jpg', '2024-02-14 13:58:56', '2024-02-14 13:58:56'),
(255, 'Lahore Chemical & Pharmaceutical Works (Pvt) Ltd', 'public/admin/assets/images/users/1707901179.jpg', '2024-02-14 13:59:39', '2024-02-14 13:59:39'),
(256, 'Lawrance Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707901204.jpg', '2024-02-14 14:00:04', '2024-02-14 14:00:04'),
(257, 'Le Grand Vertex', 'public/admin/assets/images/users/1707901233.jpg', '2024-02-14 14:00:33', '2024-02-14 14:00:33'),
(258, 'Leads Pharma(Pvt) Ltd. Pakistan', 'public/admin/assets/images/users/1707901266.jpg', '2024-02-14 14:01:06', '2024-02-14 14:01:06'),
(259, 'Leamachemi Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707901294.jpg', '2024-02-14 14:01:34', '2024-02-14 14:01:34'),
(260, 'Leo Pharma', 'public/admin/assets/images/users/1707901318.jpg', '2024-02-14 14:01:58', '2024-02-14 14:01:58'),
(261, 'Life Line Pharmaceuticals', 'public/admin/assets/images/users/1707901359.jpg', '2024-02-14 14:02:39', '2024-02-14 14:02:39'),
(262, 'Linz Pharmaceuticals (Pvt) Ltd.', 'public/admin/assets/images/users/1707901396.jpg', '2024-02-14 14:03:16', '2024-02-14 14:03:16'),
(263, 'Lisko Pakistan (Pvt) Ltd.', 'public/admin/assets/images/users/1707901411.jpg', '2024-02-14 14:03:31', '2024-02-14 14:03:31'),
(264, 'Lundbeck Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707901478.jpg', '2024-02-14 14:04:38', '2024-02-14 14:04:38'),
(265, 'Macter International (Pvt) Ltd', 'public/admin/assets/images/users/1707901517.jpg', '2024-02-14 14:05:17', '2024-02-14 14:05:17'),
(266, 'Maple Pharmaceutical (Pvt) Ltd', 'public/admin/assets/images/users/1707901630.jpg', '2024-02-14 14:07:10', '2024-02-14 14:07:10'),
(267, 'Maqsood Brothers', 'public/admin/assets/images/users/1707901657.jpg', '2024-02-14 14:07:37', '2024-02-14 14:07:37'),
(268, 'Marhaba Laboratories PVT LTD', 'public/admin/assets/images/users/1707901695.jpg', '2024-02-14 14:08:15', '2024-02-14 14:08:15'),
(269, 'Martin Dow Pharmaceuticals (Pak) Ltd', 'public/admin/assets/images/users/1707901737.jpg', '2024-02-14 14:08:57', '2024-02-14 14:08:57'),
(270, 'Mass Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707901792.jpg', '2024-02-14 14:09:52', '2024-02-14 14:09:52'),
(271, 'Master Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707901833.jpg', '2024-02-14 14:10:33', '2024-02-14 14:10:33'),
(272, 'Matrix Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707901863.jpg', '2024-02-14 14:11:03', '2024-02-14 14:11:03'),
(273, 'Maxicare International', 'public/admin/assets/images/users/1707901887.jpg', '2024-02-14 14:11:27', '2024-02-14 14:11:27'),
(274, 'MBL Pharma', 'public/admin/assets/images/users/1707901999.jpg', '2024-02-14 14:13:19', '2024-02-14 14:13:19'),
(275, 'Mcolson Research laboratories', 'public/admin/assets/images/users/1707902040.jpg', '2024-02-14 14:14:00', '2024-02-14 14:14:00'),
(276, 'Mead Johnson & Company', 'public/admin/assets/images/users/1707902065.jpg', '2024-02-14 14:14:25', '2024-02-14 14:14:25'),
(277, 'Medera Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707902104.jpg', '2024-02-14 14:15:04', '2024-02-14 14:15:04'),
(278, 'Medex Pvt Ltd', 'public/admin/assets/images/users/1707902129.jpg', '2024-02-14 14:15:29', '2024-02-14 14:15:29'),
(279, 'Medi Aims Marketing', 'public/admin/assets/images/users/1707902162.jpg', '2024-02-14 14:16:02', '2024-02-14 14:16:02'),
(280, 'Medicaids Pakistan (Pvt) Ltd.', 'public/admin/assets/images/users/1707902187.jpg', '2024-02-14 14:16:27', '2024-02-14 14:16:27'),
(281, 'Mediceena Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707902217.jpg', '2024-02-14 14:16:57', '2024-02-14 14:16:57'),
(282, 'Medicraft Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707902253.jpg', '2024-02-14 14:17:33', '2024-02-14 14:17:33'),
(283, 'Medics', 'public/admin/assets/images/users/1707902281.jpg', '2024-02-14 14:18:01', '2024-02-14 14:18:01'),
(284, 'Medimpex Scientific Office', 'public/admin/assets/images/users/1707902317.jpg', '2024-02-14 14:18:37', '2024-02-14 14:18:37'),
(285, 'Medinet Pharmaceuticals', 'public/admin/assets/images/users/1707902346.jpg', '2024-02-14 14:19:06', '2024-02-14 14:19:06'),
(286, 'MEDINEX PHARMACEUTICAL', 'public/admin/assets/images/users/1707902363.jpg', '2024-02-14 14:19:23', '2024-02-14 14:19:23'),
(287, 'Medisure Pharmaceuticals', 'public/admin/assets/images/users/1707902406.jpg', '2024-02-14 14:20:06', '2024-02-14 14:20:06'),
(288, 'Mega Pharmaceuticals Ltd', 'public/admin/assets/images/users/1707902433.jpg', '2024-02-14 14:20:33', '2024-02-14 14:20:33'),
(289, 'Merck (Pvt) Ltd', 'public/admin/assets/images/users/1707902496.jpg', '2024-02-14 14:21:36', '2024-02-14 14:21:36'),
(290, 'Morganic Pvt Ltd', 'public/admin/assets/images/users/1707902776.jpg', '2024-02-14 14:26:16', '2024-02-14 14:26:16'),
(291, 'MPC Health & Food', 'public/admin/assets/images/users/1707902813.jpg', '2024-02-14 14:26:53', '2024-02-14 14:26:53'),
(292, 'Munawar Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707902851.jpg', '2024-02-14 14:27:31', '2024-02-14 14:27:31'),
(293, 'Mylan Laboratories Limited', 'public/admin/assets/images/users/1707902901.jpg', '2024-02-14 14:28:21', '2024-02-14 14:28:21'),
(294, 'Nawan Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707902949.jpg', '2024-02-14 14:29:09', '2024-02-14 14:29:09'),
(295, 'Nenza Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707902978.jpg', '2024-02-14 14:29:38', '2024-02-14 14:29:38'),
(296, 'Neomedix', 'public/admin/assets/images/users/1707903176.jpg', '2024-02-14 14:32:56', '2024-02-14 14:32:56'),
(297, 'Neophar Healthcare', 'public/admin/assets/images/users/1707903199.jpg', '2024-02-14 14:33:19', '2024-02-14 14:33:19'),
(298, 'Nestle Pakistan', 'public/admin/assets/images/users/1707903215.jpg', '2024-02-14 14:33:35', '2024-02-14 14:33:35'),
(299, 'Neutro Pharma', 'public/admin/assets/images/users/1707903244.jpg', '2024-02-14 14:34:04', '2024-02-14 14:34:04'),
(300, 'Next Pharmaceutical (Pvt) Ltd', 'public/admin/assets/images/users/1707903285.jpg', '2024-02-14 14:34:45', '2024-02-14 14:34:45'),
(301, 'Novartis Pharma (Pak) Ltd', 'public/admin/assets/images/users/1707903345.jpg', '2024-02-14 14:35:45', '2024-02-14 14:35:45'),
(302, 'Novins International (Pvt) Ltd', 'public/admin/assets/images/users/1707903364.jpg', '2024-02-14 14:36:04', '2024-02-14 14:36:04'),
(303, 'Novo Nordisk', 'public/admin/assets/images/users/1707903378.jpg', '2024-02-14 14:36:18', '2024-02-14 14:36:18'),
(304, 'NovoTek Pharma', 'public/admin/assets/images/users/1707903411.jpg', '2024-02-14 14:36:51', '2024-02-14 14:36:51'),
(305, 'Nutrifactor Laboratories', 'public/admin/assets/images/users/1707903448.jpg', '2024-02-14 14:37:28', '2024-02-14 14:37:28'),
(306, 'Nuzzer Pharmaceuticals & Nutritions', 'public/admin/assets/images/users/1707903466.jpg', '2024-02-14 14:37:46', '2024-02-14 14:37:46'),
(307, 'Obs Pharma', 'public/admin/assets/images/users/1707903501.jpg', '2024-02-14 14:38:21', '2024-02-14 14:38:21'),
(308, 'Obsons Pharmaceuticals', 'public/admin/assets/images/users/1707903535.jpg', '2024-02-14 14:38:55', '2024-02-14 14:38:55'),
(309, 'Opal Laboratories', 'public/admin/assets/images/users/1707903578.jpg', '2024-02-14 14:39:38', '2024-02-14 14:39:38'),
(310, 'Ophth Pharma (Pvt) Ltd', 'public/admin/assets/images/users/1707903601.jpg', '2024-02-14 14:40:01', '2024-02-14 14:40:01'),
(311, 'Orient Laboratories (Pvt) Ltd.', 'public/admin/assets/images/users/1707903657.jpg', '2024-02-14 14:40:57', '2024-02-14 14:40:57'),
(312, 'Orta Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707903686.jpg', '2024-02-14 14:41:26', '2024-02-14 14:41:26'),
(313, 'Otsuka Pakistan Ltd', 'public/admin/assets/images/users/1707903707.jpg', '2024-02-14 14:41:47', '2024-02-14 14:41:47'),
(314, 'Pacific Pharmaceuticals Ltd.', 'public/admin/assets/images/users/1707903745.jpg', '2024-02-14 14:42:25', '2024-02-14 14:42:25'),
(315, 'Pakheim International Pharma', 'public/admin/assets/images/users/1707903761.jpg', '2024-02-14 14:42:41', '2024-02-14 14:42:41'),
(316, 'Pearl Pharmaceuticals', 'public/admin/assets/images/users/1707903798.jpg', '2024-02-14 14:43:18', '2024-02-14 14:43:18'),
(317, 'PepsiCo', 'public/admin/assets/images/users/1707903817.jpg', '2024-02-14 14:43:37', '2024-02-14 14:43:37'),
(318, 'Pfizer Pakistan', 'public/admin/assets/images/users/1707903888.jpg', '2024-02-14 14:44:48', '2024-02-14 14:44:48'),
(319, 'Phar-Man Laboratories', 'public/admin/assets/images/users/1707903931.jpg', '2024-02-14 14:45:31', '2024-02-14 14:45:31'),
(320, 'Pharma Five Pvt Ltd', 'public/admin/assets/images/users/1707903959.jpg', '2024-02-14 14:45:59', '2024-02-14 14:45:59'),
(321, 'Pharma Health Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707903976.jpg', '2024-02-14 14:46:16', '2024-02-14 14:46:16'),
(322, 'Pharmacare Laboratories (Pvt) Ltd.', 'public/admin/assets/images/users/1707904005.jpg', '2024-02-14 14:46:45', '2024-02-14 14:46:45'),
(323, 'Pharmachemie (Pch)', 'public/admin/assets/images/users/1707904030.jpg', '2024-02-14 14:47:10', '2024-02-14 14:47:10'),
(324, 'Pharmatec Pakistan (Pvt) Ltd.', 'public/admin/assets/images/users/1707904078.jpg', '2024-02-14 14:47:58', '2024-02-14 14:47:58'),
(325, 'Pharmedic Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707904112.jpg', '2024-02-14 14:48:32', '2024-02-14 14:48:32'),
(326, 'Pharmawise Labs (Pvt) Ltd', 'public/admin/assets/images/users/1707904126.jpg', '2024-02-14 14:48:46', '2024-02-14 14:48:46'),
(327, 'Pharmevo (Pvt) Ltd.', 'public/admin/assets/images/users/1707904142.jpg', '2024-02-14 14:49:02', '2024-02-14 14:49:02'),
(328, 'Pharmix Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707904156.jpg', '2024-02-14 14:49:16', '2024-02-14 14:49:16'),
(329, 'Platinum Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707904184.jpg', '2024-02-14 14:49:44', '2024-02-14 14:49:44'),
(330, 'Pliva Pakistan (Pvt) Ltd.', 'public/admin/assets/images/users/1707904209.jpg', '2024-02-14 14:50:09', '2024-02-14 14:50:09'),
(331, 'Popular Chemical Works (Pvt) Ltd', 'public/admin/assets/images/users/1707904229.jpg', '2024-02-14 14:50:29', '2024-02-14 14:50:29'),
(332, 'Pulse Pharmaceuticals', 'public/admin/assets/images/users/1707904283.jpg', '2024-02-14 14:51:23', '2024-02-14 14:51:23'),
(333, 'Prix Pharmaceutica (Pvt) Ltd', 'public/admin/assets/images/users/1707904296.jpg', '2024-02-14 14:51:36', '2024-02-14 14:51:36'),
(334, 'Primex Pharma', 'public/admin/assets/images/users/1707904310.jpg', '2024-02-14 14:51:50', '2024-02-14 14:51:50'),
(335, 'Qarshi', 'public/admin/assets/images/users/1707904332.jpg', '2024-02-14 14:52:12', '2024-02-14 14:52:12'),
(336, 'Raazee Therapeutics (Pvt) Ltd', 'public/admin/assets/images/users/1707904347.jpg', '2024-02-14 14:52:27', '2024-02-14 14:52:27'),
(337, 'Rakaposhi Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707904361.jpg', '2024-02-14 14:52:41', '2024-02-14 14:52:41'),
(338, 'Rayon International', 'public/admin/assets/images/users/1707904378.jpg', '2024-02-14 14:52:58', '2024-02-14 14:52:58'),
(339, 'Reckitt Benckiser Pakistan Ltd', 'public/admin/assets/images/users/1707904394.jpg', '2024-02-14 14:53:14', '2024-02-14 14:53:14'),
(340, 'Remington Pharmaceuticals', 'public/admin/assets/images/users/1707904410.jpg', '2024-02-14 14:53:30', '2024-02-14 14:53:30'),
(341, 'Reko Pharmacal (Pvt) Ltd', 'public/admin/assets/images/users/1707904426.jpg', '2024-02-14 14:53:46', '2024-02-14 14:53:46'),
(342, 'RG Pharmaceutica (Pvt) Ltd', 'public/admin/assets/images/users/1707904454.jpg', '2024-02-14 14:54:14', '2024-02-14 14:54:14'),
(343, 'ROCHE PAKISTAN LTD', 'public/admin/assets/images/users/1707904475.jpg', '2024-02-14 14:54:35', '2024-02-14 14:54:35'),
(344, 'Saffron Pharmaceuticals (Pvt) Ltd.', 'public/admin/assets/images/users/1707904512.jpg', '2024-02-14 14:55:12', '2024-02-14 14:55:12'),
(345, 'S.J.& G.Fazal Ellahie(Pvt) Ltd', 'public/admin/assets/images/users/1707904530.jpg', '2024-02-14 14:55:30', '2024-02-14 14:55:30'),
(346, 'Saia Healthcare (Pvt) Ltd', 'public/admin/assets/images/users/1707904551.jpg', '2024-02-14 14:55:51', '2024-02-14 14:55:51'),
(347, 'Sanofi Aventis', 'public/admin/assets/images/users/1707904566.jpg', '2024-02-14 14:56:06', '2024-02-14 14:56:06'),
(348, 'Sante (Pvt) Ltd', 'public/admin/assets/images/users/1707904580.jpg', '2024-02-14 14:56:20', '2024-02-14 14:56:20'),
(349, 'Saydon Pharmaceuticals Ind. (Pvt) Ltd', 'public/admin/assets/images/users/1707904595.jpg', '2024-02-14 14:56:35', '2024-02-14 14:56:35'),
(350, 'Schazoo Pharmaceuticals', 'public/admin/assets/images/users/1707904614.jpg', '2024-02-14 14:56:54', '2024-02-14 14:56:54'),
(351, 'Schazoo Zaka (Pvt) Ltd', 'public/admin/assets/images/users/1707904626.jpg', '2024-02-14 14:57:06', '2024-02-14 14:57:06'),
(352, 'Scotmann Pharmaceuticals', 'public/admin/assets/images/users/1707904644.jpg', '2024-02-14 14:57:24', '2024-02-14 14:57:24'),
(353, 'Searle Company Ltd', 'public/admin/assets/images/users/1707904664.jpg', '2024-02-14 14:57:44', '2024-02-14 14:57:44'),
(354, 'Siza International (Pvt) Ltd.', 'public/admin/assets/images/users/1707904937.jpg', '2024-02-14 15:02:17', '2024-02-14 15:02:17'),
(355, 'Slimfit Neutro Pharma', 'public/admin/assets/images/users/1707904954.jpg', '2024-02-14 15:02:34', '2024-02-14 15:02:34'),
(356, 'Star Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707904972.jpg', '2024-02-14 15:02:52', '2024-02-14 15:02:52'),
(357, 'Stiefel Laboratories Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707904997.jpg', '2024-02-14 15:03:17', '2024-02-14 15:03:17'),
(358, 'Surge Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707905011.jpg', '2024-02-14 15:03:31', '2024-02-14 15:03:31'),
(359, 'Swiss Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707905027.jpg', '2024-02-14 15:03:47', '2024-02-14 15:03:47'),
(360, 'Tabros Pharma', 'public/admin/assets/images/users/1707905042.jpg', '2024-02-14 15:04:02', '2024-02-14 15:04:02'),
(361, 'Uniferoz', 'public/admin/assets/images/users/1707905075.jpg', '2024-02-14 15:04:35', '2024-02-14 15:04:35'),
(362, 'Unipharma (Pvt) Ltd.', 'public/admin/assets/images/users/1707905100.jpg', '2024-02-14 15:05:00', '2024-02-14 15:05:00'),
(363, 'Valor Pharmaceuticals', 'public/admin/assets/images/users/1707905146.jpg', '2024-02-14 15:05:46', '2024-02-14 15:05:46'),
(364, 'Venture Pharmaceuticals (Pvt) Ltd.', 'public/admin/assets/images/users/1707905175.jpg', '2024-02-14 15:06:15', '2024-02-14 15:06:15'),
(365, 'Vega Pharmaceuticals (Pvt.) Ltd.', 'public/admin/assets/images/users/1707905200.jpg', '2024-02-14 15:06:40', '2024-02-14 15:06:40'),
(366, 'Wilshire Laboratories (Pvt) Ltd', 'public/admin/assets/images/users/1707905228.jpg', '2024-02-14 15:07:08', '2024-02-14 15:07:08'),
(367, 'Wilson Pharmaceuticals', 'public/admin/assets/images/users/1707905255.jpg', '2024-02-14 15:07:35', '2024-02-14 15:07:35'),
(368, 'Wilson\'s Healthcare Pvt Ltd', 'public/admin/assets/images/users/1707905266.jpg', '2024-02-14 15:07:46', '2024-02-14 15:07:46'),
(369, 'Woodward Pakistan (Pvt) Ltd', 'public/admin/assets/images/users/1707905293.jpg', '2024-02-14 15:08:14', '2024-02-14 15:08:14'),
(370, 'Xenon Pharmaceuticals (Pvt) Ltd', 'public/admin/assets/images/users/1707905326.jpg', '2024-02-14 15:08:46', '2024-02-14 15:08:46'),
(371, 'Zafa Pharmaceutical Labs (Pvt) Ltd', 'public/admin/assets/images/users/1707905340.jpg', '2024-02-14 15:09:00', '2024-02-14 15:09:00'),
(372, 'Z-Jans Pharmaceutical (Pvt) Ltd', 'public/admin/assets/images/users/1707905366.jpg', '2024-02-14 15:09:26', '2024-02-14 15:09:26'),
(373, 'Zaka Healthcare', 'public/admin/assets/images/users/1707905394.jpg', '2024-02-14 15:09:54', '2024-02-14 15:09:54'),
(374, 'Zain Pharmaceutical', 'public/admin/assets/images/users/1707905420.jpg', '2024-02-14 15:10:20', '2024-02-14 15:10:20'),
(375, 'Zain Laboratories', 'public/admin/assets/images/users/1707905435.jpg', '2024-02-14 15:10:35', '2024-02-14 15:10:35'),
(376, 'Zephyr Pharmatec (Pvt) Ltd', 'public/admin/assets/images/users/1707905484.jpg', '2024-02-14 15:11:24', '2024-02-14 15:11:24'),
(377, 'Zenith (Private) Limited', 'public/admin/assets/images/users/1707905498.jpg', '2024-02-14 15:11:38', '2024-02-14 15:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(8, 'Devices And Injectables', 'public/admin/assets/images/users/1696585179.jpg', '2023-10-06 13:39:39', '2023-10-06 13:39:39'),
(9, 'Over The Counter Medicines', 'public/admin/assets/images/users/1696586226.webp', '2023-10-06 13:57:06', '2023-10-06 13:57:06'),
(11, 'Family Care', 'public/admin/assets/images/users/1696586403.png', '2023-10-06 14:00:03', '2023-10-06 14:00:03'),
(12, 'Wellness And Beauty', 'public/admin/assets/images/users/1696586456.jpg', '2023-10-06 14:00:56', '2023-10-06 14:00:56'),
(13, 'Medications', 'public/admin/assets/images/users/1696586494.png', '2023-10-06 14:01:34', '2023-10-06 14:01:34'),
(14, 'Herbals And Alternatives', 'public/admin/assets/images/users/1696586545.png', '2023-10-06 14:02:25', '2023-10-06 14:02:25'),
(15, 'Hormonal And Sexual Health', 'public/admin/assets/images/users/1696586590.jpg', '2023-10-06 14:03:10', '2023-10-06 14:03:10'),
(16, 'Households', 'public/admin/assets/images/users/1696586869.jpg', '2023-10-06 14:07:49', '2023-10-07 21:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_12_17_063251_create_admins_table', 1),
(3, '2021_12_18_062039_password_resets', 1),
(4, '2021_12_20_060915_create_privacy_policies_table', 1),
(5, '2021_12_20_085741_create_term_conditions_table', 1),
(6, '2023_01_10_115236_create_users_table', 1),
(7, '2023_01_18_102651_create_faqs_table', 1),
(8, '2023_01_18_115549_create_abouts_table', 1),
(9, '2023_05_15_125821_create_categories_table', 1),
(10, '2023_05_15_130030_create_sub_categories_table', 1),
(11, '2023_05_15_130625_create_brands_table', 1),
(12, '2023_05_16_060435_create_pharmacies_table', 1),
(13, '2023_05_17_053920_create_products_table', 1),
(14, '2023_05_18_065832_create_product_details_table', 1),
(15, '2023_05_23_064000_create_packages_table', 1),
(16, '2023_05_23_075520_create_offer_products_table', 1),
(17, '2023_05_25_062503_create_account_details_table', 1),
(18, '2023_06_05_103222_add_date_to_offer_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pharmacy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `seen` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `pharmacy_id`, `order_id`, `code`, `title`, `body`, `type`, `seen`, `created_at`, `updated_at`) VALUES
(160, 16, 28, 127, '15366308', 'Approval Request', 'your order has been approved', 'Order Approval', '1', '2023-07-27 11:14:13', '2023-07-27 11:20:49'),
(161, 16, 28, 128, '98760873', 'Approval Request', 'your order has been approved', 'Order Approval', '1', '2023-07-27 11:20:07', '2023-07-27 11:20:16'),
(162, 12, 28, 130, '18934862', 'Approval Request', 'your order has been approved', 'Order Approval', '1', '2023-08-01 18:42:12', '2023-10-04 21:10:36'),
(163, 16, 28, 132, '39818705', 'Approval Request', 'your order has been approved', 'Order Approval', '1', '2023-08-01 18:43:41', '2023-08-01 18:43:45'),
(168, 19, 46, 161, '85312711', 'Approval Request', 'your order has been approved', 'Order Approval', '0', '2024-04-05 15:02:36', '2024-04-05 15:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `offer_products`
--

CREATE TABLE `offer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_products`
--

INSERT INTO `offer_products` (`id`, `product_id`, `date`, `created_at`, `updated_at`) VALUES
(4, 79, '2023-10-13', '2023-10-07 20:50:27', '2023-10-07 20:50:27'),
(6, 80, '2023-10-19', '2023-10-07 22:00:42', '2023-10-07 22:00:42'),
(7, 42, '2023-10-31', '2023-10-07 22:01:12', '2023-10-07 22:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `payment` varchar(100) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `user_id`, `pharmacy_id`, `image`, `payment`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(126, '35455822', 16, 29, 'public/admin/assets/images/users/1690441918.jpg', 'online', '950', 'pending', '2023-07-27 11:11:58', '2023-07-27 11:11:58'),
(127, '15366308', 16, 28, NULL, 'cash', '475', 'approved', '2023-07-27 11:13:54', '2023-07-27 11:14:13'),
(128, '98760873', 16, 28, NULL, 'cash', '1343', 'approved', '2023-07-27 11:19:41', '2023-07-27 11:20:07'),
(130, '18934862', 12, 28, 'public/admin/assets/images/users/1690804676.jpg', 'online', '2800', 'approved', '2023-07-31 15:57:56', '2023-08-01 18:42:12'),
(131, '37214082', 16, 29, 'public/admin/assets/images/users/1690900773.jpg', 'online', '950', 'pending', '2023-08-01 18:39:33', '2023-08-01 18:39:33'),
(132, '39818705', 16, 28, NULL, 'cash', '475', 'approved', '2023-08-01 18:43:15', '2023-08-01 18:43:41'),
(133, '10155709', 16, 28, NULL, 'cash', '2318', 'pending', '2023-10-05 05:54:35', '2023-10-05 05:54:35'),
(134, '93960214', 16, 28, 'public/admin/assets/images/users/1696470939.jpg', 'online', '2318', 'pending', '2023-10-05 05:55:39', '2023-10-05 05:55:39'),
(135, '93692499', 16, 28, NULL, 'cash', '2318', 'pending', '2023-10-05 06:28:07', '2023-10-05 06:28:07'),
(136, '42656291', 16, 28, 'public/admin/assets/images/users/1696472931.jpg', 'online', '2318', 'pending', '2023-10-05 06:28:51', '2023-10-05 06:28:51'),
(137, '47034163', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 14:28:35', '2023-10-05 14:28:35'),
(138, '23091820', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 14:28:43', '2023-10-05 14:28:43'),
(139, '80930153', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 14:29:05', '2023-10-05 14:29:05'),
(140, '43008384', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 14:29:17', '2023-10-05 14:29:17'),
(141, '30068430', 16, 29, 'public/admin/assets/images/users/1696501792.jpg', 'online', '900', 'pending', '2023-10-05 14:29:52', '2023-10-05 14:29:52'),
(142, '85971781', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 14:30:09', '2023-10-05 14:30:09'),
(144, '32421717', 17, 28, 'public/admin/assets/images/users/1696502651.jpg', 'online', '0', 'pending', '2023-10-05 14:44:11', '2023-10-05 14:44:11'),
(145, '87611988', 17, 28, 'public/admin/assets/images/users/1696502739.jpg', 'online', '2850', 'pending', '2023-10-05 14:45:39', '2023-10-05 14:45:39'),
(146, '69453264', 17, 28, 'public/admin/assets/images/users/1696502809.jpg', 'online', '1850', 'pending', '2023-10-05 14:46:49', '2023-10-05 14:46:49'),
(147, '67307700', 17, 28, 'public/admin/assets/images/users/1696502874.jpg', 'online', '1850', 'pending', '2023-10-05 14:47:54', '2023-10-05 14:47:54'),
(148, '90100786', 17, 28, 'public/admin/assets/images/users/1696503292.jpg', 'online', '1850', 'pending', '2023-10-05 14:54:52', '2023-10-05 14:54:52'),
(149, '23198547', 17, 28, 'public/admin/assets/images/users/1696503403.jpg', 'online', '1850', 'pending', '2023-10-05 14:56:43', '2023-10-05 14:56:43'),
(150, '12456288', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 14:59:08', '2023-10-05 14:59:08'),
(151, '35810954', 16, 29, 'public/admin/assets/images/users/1696503689.jpg', 'online', '900', 'pending', '2023-10-05 15:01:29', '2023-10-05 15:01:29'),
(152, '20810143', 16, 29, NULL, 'cash', '900', 'pending', '2023-10-05 15:29:13', '2023-10-05 15:29:13'),
(153, '78810410', 16, 29, NULL, 'cash', '950', 'pending', '2023-10-05 17:40:31', '2023-10-05 17:40:31'),
(154, '73270306', 16, 28, 'public/admin/assets/images/users/1696513505.jpg', 'online', '475', 'pending', '2023-10-05 17:45:05', '2023-10-05 17:45:05'),
(157, '22391714', 16, 30, NULL, 'cash', '123', 'pending', '2023-10-10 16:16:06', '2023-10-10 16:16:06'),
(158, '31299653', 16, 28, NULL, 'cash', '132', 'pending', '2023-10-10 16:20:03', '2023-10-10 16:20:03'),
(159, '91970180', 19, 34, NULL, 'cash', '60.16', 'pending', '2024-04-05 14:08:20', '2024-04-05 14:08:20'),
(160, '86518005', 19, 46, NULL, 'cash', '27.9', 'pending', '2024-04-05 14:57:13', '2024-04-05 14:57:13'),
(161, '85312711', 19, 46, NULL, 'cash', '368', 'approved', '2024-04-05 15:00:53', '2024-04-05 15:02:36'),
(162, '10163527', 19, 46, NULL, 'cash', '368', 'pending', '2024-04-11 23:11:09', '2024-04-11 23:11:09'),
(163, '69867896', 19, 46, NULL, 'cash', '56.96', 'pending', '2024-04-11 23:17:12', '2024-04-11 23:17:12'),
(164, '36609267', 19, 46, NULL, 'cash', '56.96', 'pending', '2024-04-11 23:22:33', '2024-04-11 23:22:33'),
(165, '87801154', 19, 46, NULL, 'cash', '128.8', 'pending', '2024-04-11 23:25:38', '2024-04-11 23:25:38'),
(166, '83703677', 19, 46, NULL, 'cash', '127.5', 'pending', '2024-04-11 23:31:36', '2024-04-11 23:31:36'),
(167, '76325978', 19, 46, NULL, 'cash', '128.8', 'pending', '2024-04-11 23:34:36', '2024-04-11 23:34:36'),
(168, '69288527', 19, 46, NULL, 'cash', '56.96', 'pending', '2024-04-11 23:40:40', '2024-04-11 23:40:40'),
(169, '77108061', 19, 28, NULL, 'cash', '120.9', 'pending', '2024-04-18 12:53:00', '2024-04-18 12:53:00'),
(170, '72379533', 19, 29, NULL, 'cash', '27.9', 'pending', '2024-04-24 14:49:55', '2024-04-24 14:49:55'),
(171, '67435295', 19, 29, NULL, 'cash', '27.9', 'pending', '2024-04-24 14:51:35', '2024-04-24 14:51:35'),
(172, '39041988', 19, 29, NULL, 'cash', '27.9', 'pending', '2024-04-29 19:32:57', '2024-04-29 19:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `sub_total` varchar(255) DEFAULT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_detail_id`, `price`, `quantity`, `sub_total`, `discount_price`, `created_at`, `updated_at`) VALUES
(155, 158, 52, 145, '150', '1', '132', '12', '2023-10-10 16:20:03', '2023-10-10 16:20:03'),
(156, 159, 79, 103, '64', '1', '60.16', '6', '2024-04-05 14:08:20', '2024-04-05 14:08:20'),
(157, 160, 128, 236, '30', '1', '27.9', '7', '2024-04-05 14:57:13', '2024-04-05 14:57:13'),
(158, 161, 131, 237, '400', '1', '368', '8', '2024-04-05 15:00:53', '2024-04-05 15:00:53'),
(159, 162, 131, 237, '400', '1', '368', '8', '2024-04-11 23:11:09', '2024-04-11 23:11:09'),
(160, 163, 75, 243, '64', '1', '56.96', '11', '2024-04-11 23:17:12', '2024-04-11 23:17:12'),
(161, 164, 75, 243, '64', '1', '56.96', '11', '2024-04-11 23:22:33', '2024-04-11 23:22:33'),
(162, 165, 114, 239, '140', '1', '128.8', '8', '2024-04-11 23:25:38', '2024-04-11 23:25:38'),
(163, 166, 95, 241, '150', '1', '127.5', '15', '2024-04-11 23:31:36', '2024-04-11 23:31:36'),
(164, 167, 114, 239, '140', '1', '128.8', '8', '2024-04-11 23:34:36', '2024-04-11 23:34:36'),
(165, 168, 75, 243, '64', '1', '56.96', '11', '2024-04-11 23:40:40', '2024-04-11 23:40:40'),
(166, 169, 59, 83, '130', '1', '120.9', '7', '2024-04-18 12:53:00', '2024-04-18 12:53:00'),
(167, 170, 125, 194, '30', '1', '27.9', '7', '2024-04-24 14:49:55', '2024-04-24 14:49:55'),
(168, 171, 125, 194, '30', '1', '27.9', '7', '2024-04-24 14:51:35', '2024-04-24 14:51:35'),
(169, 172, 125, 194, '30', '1', '27.9', '7', '2024-04-29 19:32:57', '2024-04-29 19:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `validity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `price`, `validity`, `created_at`, `updated_at`) VALUES
(1, 'Silver', '00', '90', '2023-06-16 01:33:36', '2023-11-23 13:15:02'),
(2, 'Gold', '00', '90', '2023-06-16 01:33:36', '2023-12-07 12:57:32'),
(3, 'Premium', '00', '90', '2023-06-16 01:33:36', '2023-12-07 12:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('adnanr55@gmail.com', '1261', NULL),
('adnan@gmail.com', '5088', NULL),
('adnan@gmail.com', '8313', NULL),
('shakar2@gmail.com', '9253', NULL),
('basitwattoo007@gmail.com', 'KpTU3J0WIkxNKhQF6zWg3ULjwGF3gX', NULL),
('daniyalbabar9@gmail.com', '2192', NULL),
('daniyalbabar9@gmail.com', '1604', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'mujah@gmail.com', 'b1bcbc57d7cee074eea15ed879c890eee801190ffa5e94b489adedfff2b29e8b', '[\"*\"]', NULL, '2023-06-23 11:22:56', '2023-06-23 11:22:56'),
(2, 'App\\Models\\User', 6, 'rameez@gmail.com', '7c656f4f26a568ed0f9f27c791f306627267b825cb187cb4c3cc66e45360a249', '[\"*\"]', NULL, '2023-06-23 11:42:29', '2023-06-23 11:42:29'),
(3, 'App\\Models\\User', 7, 'shakar@gmail.com', 'f71ad7f8b037b7ce69fbbc653ff37df1c73e43783110e81837173d57d173d0db', '[\"*\"]', NULL, '2023-06-23 11:49:47', '2023-06-23 11:49:47'),
(7, 'App\\Models\\User', 8, 'ali@gmail.com', '677204f1a46cd5b1b68d6de3aa1cb17645e02bccb83836b76489e909d6740ece', '[\"*\"]', '2023-07-04 09:33:37', '2023-06-23 13:11:07', '2023-07-04 09:33:37'),
(8, 'App\\Models\\User', 8, 'ali@gmail.com', '01b8be9ff5587c829946461fe7e112efc4fc6068ba9f0ab6d289a079176b5ee5', '[\"*\"]', '2023-06-23 14:21:47', '2023-06-23 14:03:30', '2023-06-23 14:21:47'),
(9, 'App\\Models\\User', 9, 'majad@gmail.com', '90d3407bf38fdc1446a7eca1f4b955fadb3324adb44f56d8dbe9fdfe564e2ab1', '[\"*\"]', NULL, '2023-06-24 09:49:16', '2023-06-24 09:49:16'),
(10, 'App\\Models\\User', 10, 'arshad@gmail.com', 'ab15bb381d3b81fc1970d84c4cae69c5a27b192126d2c97bbb0fe6f3fd692edc', '[\"*\"]', NULL, '2023-06-24 09:54:02', '2023-06-24 09:54:02'),
(11, 'App\\Models\\User', 11, 'adnan@gmail.com', 'bc9eea33fb05dac82fb20fca3d5050b15492ef9e0cb59c8e75e9d86998999894', '[\"*\"]', NULL, '2023-06-24 12:33:41', '2023-06-24 12:33:41'),
(12, 'App\\Models\\User', 11, 'adnan@gmail.com', '931f4421ebb808ab38b70941256600ad47d9aeb4ab33a063fecc1071c303cc93', '[\"*\"]', NULL, '2023-06-24 12:36:29', '2023-06-24 12:36:29'),
(13, 'App\\Models\\User', 11, 'adnan@gmail.com', 'ca63c83cf321f56deb979ce7ef3696a61575a8ab06d4983d7028b522ccbc8c35', '[\"*\"]', NULL, '2023-06-24 12:37:21', '2023-06-24 12:37:21'),
(14, 'App\\Models\\User', 11, 'adnan@gmail.com', '9f712aeb6f34f4852963067117a0808b919eba1b4c1f08030cbaf7cdc5f41613', '[\"*\"]', NULL, '2023-06-24 12:47:01', '2023-06-24 12:47:01'),
(15, 'App\\Models\\User', 11, 'adnan@gmail.com', '7476cefb6652dec18fbe814aff8caedc7b89e69a63c8c8a06e9f39b69a6b56a5', '[\"*\"]', NULL, '2023-06-24 14:02:24', '2023-06-24 14:02:24'),
(16, 'App\\Models\\User', 11, 'adnan@gmail.com', 'e51191af7d10d16fe743800b039dd123949bff174effd5049f78c98a98ffa1dd', '[\"*\"]', '2023-06-24 14:17:47', '2023-06-24 14:03:16', '2023-06-24 14:17:47'),
(17, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '7f399ae05923769ff8e037e07f882f0c5639bba418892a771d48e7636e5927c8', '[\"*\"]', NULL, '2023-06-24 14:51:25', '2023-06-24 14:51:25'),
(18, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '43885767b0a568833f9ee16a3a65a27775f9e524bca42d32792e205c41d90579', '[\"*\"]', '2023-06-24 15:01:31', '2023-06-24 14:54:52', '2023-06-24 15:01:31'),
(19, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '689a489e308244fb8312b3878552a2b7f28da860eeec3d4248efb790d7f1cd26', '[\"*\"]', '2023-06-24 15:07:04', '2023-06-24 15:01:43', '2023-06-24 15:07:04'),
(20, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '88f38d33d568aedc610dc93e73cd0e8d856e97120e62f3b9548bdd644f4da59a', '[\"*\"]', '2023-06-24 15:09:16', '2023-06-24 15:07:51', '2023-06-24 15:09:16'),
(21, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'de98fc9af5236ab24c53aa107caab204384438d7dfd45ac31ee4b8f07726e1cf', '[\"*\"]', '2023-06-24 15:20:44', '2023-06-24 15:09:43', '2023-06-24 15:20:44'),
(22, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '0fb2c72a62a72dcfa906a693514db78911363d701c66da9cf03442060878a784', '[\"*\"]', NULL, '2023-06-24 15:22:19', '2023-06-24 15:22:19'),
(23, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'a96c143e8d8b5b94dce9a15542974820411f236b384be9cfd31e5da7549cf521', '[\"*\"]', '2023-07-04 09:51:20', '2023-06-24 15:22:32', '2023-07-04 09:51:20'),
(24, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'c6f8a6048c0a10ec4c881cebfcbcdc4baef69fa36cbe12621fdc63a95951b3ba', '[\"*\"]', NULL, '2023-06-24 15:24:31', '2023-06-24 15:24:31'),
(25, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '3de8b32d60606a47f97573a94d8596ed053adfd23c9148d5d3813093cd2cbd3b', '[\"*\"]', NULL, '2023-06-24 15:24:41', '2023-06-24 15:24:41'),
(26, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'f76cfdbe064baec66f5b2e9b321be58cddba38963cb8e15116fbb25668fc56d4', '[\"*\"]', NULL, '2023-06-24 15:26:48', '2023-06-24 15:26:48'),
(29, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'ab6f27ae4463ae2b0c0bd440e4a7a5555a486e468e2f5cacc214be13d7a7a735', '[\"*\"]', NULL, '2023-06-26 10:41:47', '2023-06-26 10:41:47'),
(30, 'App\\Models\\User', 14, 'daniyalbabar@gmail.com', '38be0e83ab4e172b952d5ac9142bece176ee638626c15dca2f6fcec74d62a246', '[\"*\"]', NULL, '2023-06-26 11:42:29', '2023-06-26 11:42:29'),
(31, 'App\\Models\\User', 15, 'fahadhaidar786@gmail.com', 'a31466b6ddc4b9d3a810ff9175c7d3240151edb5eb07dd84415258b411fbfc93', '[\"*\"]', NULL, '2023-06-26 11:47:07', '2023-06-26 11:47:07'),
(32, 'App\\Models\\User', 15, 'fahadhaidar786@gmail.com', '312ef24bffb743fb07590af643a77999cdf6d16526517a93b6b33c2c4653cd98', '[\"*\"]', NULL, '2023-06-26 12:03:46', '2023-06-26 12:03:46'),
(33, 'App\\Models\\User', 15, 'fahadhaidar786@gmail.com', 'a5da1904b53822d690a1d4263b53e5caf53ac4e72ac396a4f8b2ba4a8a47e63b', '[\"*\"]', NULL, '2023-06-26 12:07:04', '2023-06-26 12:07:04'),
(34, 'App\\Models\\User', 15, 'fahadhaidar786@gmail.com', 'a911dccc9c48b0aacb9697efb821c3afa3c92a4898a6d4d8d4335950db739aea', '[\"*\"]', NULL, '2023-06-26 12:08:39', '2023-06-26 12:08:39'),
(50, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '22a569c3e5cc68ebe8acedaa892426fb5b64b31cb7e040a446e4a74badf432f3', '[\"*\"]', '2023-07-04 10:28:44', '2023-07-04 09:22:16', '2023-07-04 10:28:44'),
(52, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'f601c1cb9d721dae251abf6b783018ed4e4fd28abef64a9958d69e7c6d318500', '[\"*\"]', '2023-07-12 14:09:07', '2023-07-04 10:20:43', '2023-07-12 14:09:07'),
(53, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '84de2bfd6996e5e1a4308eb64cb0cad9d41147140c0a491201ee3cbe9c279797', '[\"*\"]', NULL, '2023-07-04 10:48:42', '2023-07-04 10:48:42'),
(55, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '0c9ede247e1b6246b94edee86fe5439890a2be859dae83b78f92f01ef3fd9610', '[\"*\"]', '2023-07-04 12:55:58', '2023-07-04 12:23:00', '2023-07-04 12:55:58'),
(56, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '745462701ab32ec67f1884fe443436b0ff116303308f0482337a0ba2614ced34', '[\"*\"]', '2023-07-07 17:56:33', '2023-07-04 15:00:25', '2023-07-07 17:56:33'),
(57, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd0a3412996802bd715f0479db730cc4b13251a2a5cd6a9d816357d0ef129fbb3', '[\"*\"]', '2023-07-04 15:57:36', '2023-07-04 15:55:13', '2023-07-04 15:57:36'),
(58, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd56dfd8278baf7906cafb0e052503706150dfe412d5f74b5926874758a30e776', '[\"*\"]', '2023-07-07 10:12:34', '2023-07-04 15:57:51', '2023-07-07 10:12:34'),
(59, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'edb17aeb9ba8d24766ca031318ca5e2406dbb5162e68ad08ad2c947c668545b4', '[\"*\"]', '2023-07-05 12:07:58', '2023-07-05 11:54:29', '2023-07-05 12:07:58'),
(60, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'e035b7a6e3aba25aef19384362c43c9322b276d780d60fce0aa5b7f924f6f1ff', '[\"*\"]', '2023-07-27 11:01:13', '2023-07-05 16:42:52', '2023-07-27 11:01:13'),
(61, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '469fb10b1779d43e8ad0b94b0caf3c659ee15965970ce46fb2d416656cb10f46', '[\"*\"]', '2023-07-27 10:23:23', '2023-07-05 17:01:07', '2023-07-27 10:23:23'),
(62, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'c891c323215ead562e8a5c810fd35627f4385ef50a63b5559acbfd90525ebae2', '[\"*\"]', '2023-07-11 17:15:06', '2023-07-06 14:06:44', '2023-07-11 17:15:06'),
(63, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd0001a4a81882a89d2ec891663a8e6dcc3b05699885a47404eca26ae458630dd', '[\"*\"]', '2023-07-07 09:47:55', '2023-07-07 09:47:37', '2023-07-07 09:47:55'),
(64, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '72c682886cf4a55c3c5ee064e00cfe901ef590e3093ba70e971a1910032a23ea', '[\"*\"]', '2023-07-07 10:20:19', '2023-07-07 10:13:54', '2023-07-07 10:20:19'),
(65, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'ee642cd741aa2b4bd8c93ac0b9a94f78440f9bb17ef0dbf12931881e72a66870', '[\"*\"]', '2023-07-17 09:57:33', '2023-07-07 10:29:39', '2023-07-17 09:57:33'),
(66, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '0dc0b0e224c59fe4ae46f9957093079e66d627ffe932e8493e6a056e222c4163', '[\"*\"]', '2023-07-07 11:41:39', '2023-07-07 11:39:39', '2023-07-07 11:41:39'),
(67, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'aaac1c8b0c2b23a08905091e4b1bece18053da72880412d276a8ad4a1685a885', '[\"*\"]', '2023-07-10 12:01:14', '2023-07-10 10:22:19', '2023-07-10 12:01:14'),
(68, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '7d0b037da1eab06ee5cab298d12095e62107ced59f63ed72334ea46d8e6439b1', '[\"*\"]', '2023-07-11 15:23:55', '2023-07-10 11:14:51', '2023-07-11 15:23:55'),
(69, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3c79b91784132c732ff62e12ce6d952a732f204a0aa22d4e0cff317c3753b3b8', '[\"*\"]', '2023-07-10 11:18:21', '2023-07-10 11:17:50', '2023-07-10 11:18:21'),
(70, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '7a53d2dae9981bb50525c27b4dbcd6571013f78518ae16223a42ba72cf4cc130', '[\"*\"]', '2023-07-10 11:21:47', '2023-07-10 11:21:44', '2023-07-10 11:21:47'),
(71, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '256c10d56989f73f3014227ce1548eeeb59442d7d10a10c9b178a535647b0dee', '[\"*\"]', '2023-07-10 11:39:38', '2023-07-10 11:33:34', '2023-07-10 11:39:38'),
(72, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '32d58041eb26f11caa7216ba76fb8d02af46497101718712722e5f820f2f596c', '[\"*\"]', '2023-07-10 11:40:28', '2023-07-10 11:40:26', '2023-07-10 11:40:28'),
(73, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '1a5e275b4b12accbb0f86c768821cf9892f0bad385006b5e7e0e288da348870a', '[\"*\"]', '2023-07-10 11:58:53', '2023-07-10 11:54:04', '2023-07-10 11:58:53'),
(74, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'bc50c019c95d3994ccde518f42d415ef103415831e9b58921ca3f4da9b6c5e6b', '[\"*\"]', '2023-07-10 12:53:12', '2023-07-10 12:00:14', '2023-07-10 12:53:12'),
(75, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'f7ea4bd6572f4fec5e09dffaf186f541d2422608de8197993f0110c424fd1fa9', '[\"*\"]', '2023-07-18 12:51:36', '2023-07-10 12:07:02', '2023-07-18 12:51:36'),
(76, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'fd0853739ecff45ea06a92acf604d76a1e50935312af007a011be03105210272', '[\"*\"]', '2023-07-10 12:33:48', '2023-07-10 12:33:10', '2023-07-10 12:33:48'),
(77, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '47ad8306236ab59087126f76592bd6912f138ad946ed94070e283ceea0d1d629', '[\"*\"]', '2023-07-10 14:12:33', '2023-07-10 14:12:20', '2023-07-10 14:12:33'),
(78, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'b0c85630f681f651b5d66a5a0cabf63a727993d37e54f37cedbb15b1ab68a0ed', '[\"*\"]', '2023-07-10 14:14:14', '2023-07-10 14:12:35', '2023-07-10 14:14:14'),
(79, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'ef765d6037607b0140e4c97d626bb9919a5ef1fa103662be79216455baebe65f', '[\"*\"]', '2023-07-10 14:22:20', '2023-07-10 14:22:07', '2023-07-10 14:22:20'),
(80, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '4e9f9d7b25a9025f24e997be731a99856a69e09d250691701c8b56bef76b9658', '[\"*\"]', '2023-07-10 14:31:00', '2023-07-10 14:30:37', '2023-07-10 14:31:00'),
(81, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd11ccfd0e9b195429696cf346b4595a779f4464563995cb0e1546b99919a1954', '[\"*\"]', '2023-07-17 14:25:55', '2023-07-10 14:31:05', '2023-07-17 14:25:55'),
(82, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '22f820c9b04c2745fa67dafce2b7bd038a3d1dfe1ee4a3e0e881c8512ba8efd1', '[\"*\"]', '2023-07-10 14:46:36', '2023-07-10 14:44:08', '2023-07-10 14:46:36'),
(83, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '155b6813bed050f447579a8f58807f40ad250186f36739e3d668330be23d91f5', '[\"*\"]', '2023-07-26 15:40:54', '2023-07-10 14:47:01', '2023-07-26 15:40:54'),
(84, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '3b01d20ed7215246c19b49d52b7868e3f5d74bda4069b7215f8827fbd5e767ec', '[\"*\"]', '2023-07-10 16:58:21', '2023-07-10 16:57:32', '2023-07-10 16:58:21'),
(85, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '6713f8c96aa642544cd20a9981455c86db20cdb09219aa543b61556d7bff9b87', '[\"*\"]', '2023-07-11 17:15:23', '2023-07-11 15:36:09', '2023-07-11 17:15:23'),
(86, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'cedffc3987d9dfce3bfd029ec8eae6137f9c3c9a63baaa035cae2a42b56e9c26', '[\"*\"]', '2023-07-13 10:38:29', '2023-07-11 16:14:18', '2023-07-13 10:38:29'),
(87, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'a27ffac190bb5b7fe25f11d52772796cb7887c70aff7a83a2c9d2d55a4df6e38', '[\"*\"]', '2023-07-11 17:18:01', '2023-07-11 17:17:02', '2023-07-11 17:18:01'),
(88, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '55db2ec13ff757afc8a86739082e3bdea04a5e654b250feea80f2ae9fa1cbe1f', '[\"*\"]', '2023-07-12 14:55:22', '2023-07-12 14:09:15', '2023-07-12 14:55:22'),
(89, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'c77df76be746dd35057fc4651ce02613f40dab494f2f4d27b2008d3083f1a543', '[\"*\"]', NULL, '2023-07-15 18:02:26', '2023-07-15 18:02:26'),
(90, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '4160f27d941af6f17acd186591166757f31cf2e8900d6ba34f7c1250827a6c9a', '[\"*\"]', '2023-07-17 14:28:06', '2023-07-17 14:27:08', '2023-07-17 14:28:06'),
(91, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'b40663c31cfe25dbca4b0423fd12b0c7b6b4cebb082db10d504f7ef9ce40594c', '[\"*\"]', '2023-07-17 17:39:30', '2023-07-17 17:38:35', '2023-07-17 17:39:30'),
(92, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '40dcdf786b24d81ca6d29bce076965fbb335a518a3a9a2a47db4d6f8cd257e0f', '[\"*\"]', '2023-07-18 12:20:24', '2023-07-18 11:30:55', '2023-07-18 12:20:24'),
(93, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3b29139a66db44e12e1a527c3793c0ebf4df89c9b232dff76f6e279f466aa440', '[\"*\"]', '2023-07-18 12:56:18', '2023-07-18 12:53:31', '2023-07-18 12:56:18'),
(94, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'e3ec0e68ffb45a8ff0d8565d693545b95dd739ca9b790fd1cb79d57945c1d41f', '[\"*\"]', '2023-07-18 14:42:20', '2023-07-18 14:04:06', '2023-07-18 14:42:20'),
(95, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '5d84d19afecee1dae5e95d9e1f511c9c684316a08868a1ca7b9cabd95774cdc7', '[\"*\"]', '2023-07-19 10:22:04', '2023-07-18 14:44:04', '2023-07-19 10:22:04'),
(96, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '64ecf4f889c4b0fa515e74556c641b11a5fb037342e49089b6c56f4a9d2e949e', '[\"*\"]', '2023-07-18 17:24:34', '2023-07-18 14:53:00', '2023-07-18 17:24:34'),
(97, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5a72ca9390b568024c40242b4d5f366c17a5241fcda986e1e61cbfe2223c578f', '[\"*\"]', '2023-07-18 15:53:29', '2023-07-18 15:12:15', '2023-07-18 15:53:29'),
(98, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'fcfa1668b0830f9f046100f47f6bd1ecf8ecef29e5cd119b1c3cea953569cc94', '[\"*\"]', '2023-07-18 16:55:33', '2023-07-18 15:53:56', '2023-07-18 16:55:33'),
(99, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'eb417cbfa5a640e1a52d92f15d88f19ecc4723ffc9a4947ee9873b5debdc180f', '[\"*\"]', '2023-07-18 17:55:29', '2023-07-18 17:33:50', '2023-07-18 17:55:29'),
(100, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'b6f0518c90f8067498198aa4d5d72b856c1a9462e8087c3e5b9db48d057e6bc4', '[\"*\"]', '2023-07-19 09:18:22', '2023-07-18 17:35:33', '2023-07-19 09:18:22'),
(101, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '75870cb75ae92bd65d34c9133da0756377939df2ee8c11914107ded1e3731740', '[\"*\"]', '2023-07-18 18:13:57', '2023-07-18 18:13:53', '2023-07-18 18:13:57'),
(102, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '027970f2dfc479b9250d3444c9d90b2d4ff8cbba1d22c47335a53162aa475e8d', '[\"*\"]', '2023-07-19 16:52:17', '2023-07-19 09:11:22', '2023-07-19 16:52:17'),
(103, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '94e1d5bdb07af7495b2842ff7e5099aa9f507e2e98ad287efb25e0f2258b6b86', '[\"*\"]', '2023-07-24 11:29:36', '2023-07-22 11:19:32', '2023-07-24 11:29:36'),
(104, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'fe6c1e453eecdcdda2b1e83e98e0d54cff8788c5ba97fa0cace2cb133a2229aa', '[\"*\"]', '2023-07-26 15:58:33', '2023-07-22 15:31:25', '2023-07-26 15:58:33'),
(105, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '590c3e914cc606a9a109c4fcc0ecf163355981fb473671147561ae778c40bfdc', '[\"*\"]', '2023-07-22 20:14:01', '2023-07-22 17:26:07', '2023-07-22 20:14:01'),
(106, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'a068432bb9271f6d6b6e64b6ac5b7124d6dc86dbdfd10c5c075a721968bbb5fc', '[\"*\"]', '2023-07-22 21:20:40', '2023-07-22 20:10:53', '2023-07-22 21:20:40'),
(107, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '39fe200e975593b34814216988a06a77368d57d69e0baed143d833c959b12773', '[\"*\"]', '2023-07-24 10:00:33', '2023-07-24 09:59:59', '2023-07-24 10:00:33'),
(108, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'e8f5eb228b8dd65771dd616e940efd8a232e5a2ab8af29163fe29bbfa1dadf00', '[\"*\"]', '2023-07-24 16:37:36', '2023-07-24 10:40:02', '2023-07-24 16:37:36'),
(109, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '606fd6f7a38524372d5c5c6a4bd486d321c206ab1d63e8ab4de8e96220100de4', '[\"*\"]', '2023-07-24 14:07:42', '2023-07-24 11:27:23', '2023-07-24 14:07:42'),
(110, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '33e17c20829eb976bde28ec5d3b7167a946f5ef6701dc6a8818f2d0adb1bcac1', '[\"*\"]', '2023-07-24 12:09:36', '2023-07-24 12:09:01', '2023-07-24 12:09:36'),
(111, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'c7243c093f9a9af17171161cd16fba0f159bbfc9cc9706405566e62d862fff33', '[\"*\"]', '2023-07-24 12:20:15', '2023-07-24 12:19:09', '2023-07-24 12:20:15'),
(112, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '0dfc8395877489bbfd55ea5e7f6371ada479a7f8db11c831096d776c1c174580', '[\"*\"]', '2023-07-24 12:35:59', '2023-07-24 12:35:32', '2023-07-24 12:35:59'),
(113, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5dff19068297199459d5af39fb2f5e185bb927d37048c28ddd1285e094fb3b96', '[\"*\"]', '2023-07-24 12:39:08', '2023-07-24 12:38:59', '2023-07-24 12:39:08'),
(114, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '038c2d992ed46d18733a5f6098486a606e4e3c7a8f12447d480441b6b9644327', '[\"*\"]', '2023-07-24 12:40:45', '2023-07-24 12:40:15', '2023-07-24 12:40:45'),
(115, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '88f3a94a55e0c3f95991da6627b7a3343e5fdc40db7c5df609003fde58f6b283', '[\"*\"]', '2023-07-24 12:43:21', '2023-07-24 12:42:08', '2023-07-24 12:43:21'),
(116, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3027fd19e5a01e17182ac17cc171c1ba03660b0b51facc850920bd4f6740176f', '[\"*\"]', '2023-07-24 12:44:20', '2023-07-24 12:43:46', '2023-07-24 12:44:20'),
(117, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '308e20a84e04bd6dfeb17e4b53f52b6cfa885315b6caabf9c3691a0ed76ce313', '[\"*\"]', '2023-07-24 12:53:58', '2023-07-24 12:45:34', '2023-07-24 12:53:58'),
(118, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '4e1aa95c2127b767d1d2f93174fed9fb82f275e6ac4cfc7616c2a4bb33acc601', '[\"*\"]', '2023-07-24 16:35:37', '2023-07-24 12:53:55', '2023-07-24 16:35:37'),
(119, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3fa53314b6349532b0e8fb3e7934aa7e9ca40be72ccab76de219d981a5adb563', '[\"*\"]', '2023-07-24 18:15:56', '2023-07-24 12:54:26', '2023-07-24 18:15:56'),
(120, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'c97e2ad9484fd604cc33f99f46f64fcb5aa8663bd436ae368191c7935d4e096c', '[\"*\"]', '2023-07-24 13:00:42', '2023-07-24 12:59:09', '2023-07-24 13:00:42'),
(121, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'df4c03406285d7ecb0996d08fcb836703a81bfbb6081c39fc288665b2e4a5ab7', '[\"*\"]', '2023-07-24 16:39:03', '2023-07-24 16:38:01', '2023-07-24 16:39:03'),
(122, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3da1659236f5e6da9ca0305e40b2947c8033cf31e5053d1d9771481327ece6ca', '[\"*\"]', '2023-07-24 16:48:35', '2023-07-24 16:39:11', '2023-07-24 16:48:35'),
(123, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'cb29bf1ca35db36e8e586cbf527310311fc02d405b68070f84e57e4e4e9a55ab', '[\"*\"]', '2023-07-24 16:54:24', '2023-07-24 16:53:28', '2023-07-24 16:54:24'),
(124, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'aec5771572942848ee25184f947576fe5730c9c7fa3a52816a36a3051c903be2', '[\"*\"]', '2023-07-24 17:02:39', '2023-07-24 16:54:28', '2023-07-24 17:02:39'),
(125, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '285edcba4be6d69885f7964c47aec82c648fe52a56244f498fe156ede25d36b2', '[\"*\"]', NULL, '2023-07-24 16:55:41', '2023-07-24 16:55:41'),
(126, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '130ab811324463cf337b2cb098e11dc03973dcb59c38e7fa044e668d4caa3ab4', '[\"*\"]', NULL, '2023-07-24 16:57:50', '2023-07-24 16:57:50'),
(127, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '2b6c053b036d175a42b0d2586cab3eecb264ea0520ba9cd9f3bd2b2625fc5c71', '[\"*\"]', NULL, '2023-07-24 16:59:06', '2023-07-24 16:59:06'),
(128, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'b8031a98d7730360f81f83a15c2462d5c06b01431c3e62571c912b4c57eac189', '[\"*\"]', NULL, '2023-07-24 17:02:18', '2023-07-24 17:02:18'),
(129, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'edf47d96e78e11ebab3d76f1ce06df5f6645107fb21672a001a8ab3c2551d20a', '[\"*\"]', '2023-07-24 17:04:02', '2023-07-24 17:02:42', '2023-07-24 17:04:02'),
(130, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '55cc864a238c1015ae799989a727be8119a0a4d15d73ba2e8bf28d099b78421f', '[\"*\"]', '2023-07-24 17:16:40', '2023-07-24 17:04:04', '2023-07-24 17:16:40'),
(131, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '59045c0409ed1e96a1267204ae4fb1e9a5604772462688519b83c174323fd2cc', '[\"*\"]', '2023-07-24 18:22:31', '2023-07-24 17:16:45', '2023-07-24 18:22:31'),
(132, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '854a99c34811b867b5ebb7dd3bfc3d0117648fd29659fc575d38b26fb71976a5', '[\"*\"]', '2023-07-24 18:22:17', '2023-07-24 18:16:03', '2023-07-24 18:22:17'),
(133, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3867412b8714d597cdf90575b8678d2126741a2797738f0877645222a5914504', '[\"*\"]', '2023-07-24 18:23:41', '2023-07-24 18:22:33', '2023-07-24 18:23:41'),
(134, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '4234866a5b25f9969495f09705cf762981e83e9b2a76c22e2ad0fa3032133698', '[\"*\"]', '2023-07-25 11:23:21', '2023-07-24 18:23:49', '2023-07-25 11:23:21'),
(135, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '63748e1ba0e63732b7fe484a191892f2f8b0033c2d228390b88bb46e2ad97109', '[\"*\"]', '2023-07-25 16:48:34', '2023-07-25 09:24:58', '2023-07-25 16:48:34'),
(136, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '3e62adeb127ac3970ba5c89a2d485410c38ea9a57499a2cf184bb1c2f02c0398', '[\"*\"]', '2023-07-31 15:58:31', '2023-07-25 10:27:48', '2023-07-31 15:58:31'),
(137, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '09961ed61a6dc1e40ce06919dc4a3cf1a00243d326233108484d80bb3c87f9d6', '[\"*\"]', '2023-07-25 12:37:53', '2023-07-25 11:23:30', '2023-07-25 12:37:53'),
(138, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '6beb3fabdeb409ace57b72981170a627ee8e20b622bf8faedf0f216d79164fcb', '[\"*\"]', '2023-07-25 14:03:12', '2023-07-25 12:40:04', '2023-07-25 14:03:12'),
(139, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'c61875704d4ec9ac6ac9c28e057e0263f259b6427b876f892e15b3139070003f', '[\"*\"]', '2023-07-25 16:48:03', '2023-07-25 14:08:29', '2023-07-25 16:48:03'),
(140, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '0c43edcf99ff5a1ea6f56eb6c3aed4111d349c68ae0b3667b3b2a0d434ac5208', '[\"*\"]', '2023-07-25 16:48:44', '2023-07-25 16:48:42', '2023-07-25 16:48:44'),
(141, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '11544dc58d044a19984e9f6d907f1b5d01115f0c9fca625fa41506d259a143c5', '[\"*\"]', '2023-07-25 16:53:07', '2023-07-25 16:52:51', '2023-07-25 16:53:07'),
(142, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '361df6e757d5323a87972d806c2b7714708dec82122e0336f054c7fbdc4cfccf', '[\"*\"]', '2023-07-26 12:22:59', '2023-07-26 09:44:44', '2023-07-26 12:22:59'),
(143, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '8a8fcaf1e8be7cbee0380ff248aeb1033e5ceca10213a38e41165dc16bd2df60', '[\"*\"]', '2023-07-26 16:10:59', '2023-07-26 12:23:27', '2023-07-26 16:10:59'),
(144, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '213dc34f11d1005f5074805660a6adb5a71c5a7ae319cf9589d1afc9e45a57a9', '[\"*\"]', '2023-07-27 09:36:50', '2023-07-26 16:12:22', '2023-07-27 09:36:50'),
(145, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '1e21acce20195f494108e0f7c5eeb956818de5787f7adafefe882e1f04240e63', '[\"*\"]', '2023-07-27 13:01:58', '2023-07-27 09:36:54', '2023-07-27 13:01:58'),
(146, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '3241df6b00ae5e5fd63a03b53ca5204ebdec120e075a08f35cd95bd0b180f0b2', '[\"*\"]', '2023-07-27 10:21:47', '2023-07-27 09:48:51', '2023-07-27 10:21:47'),
(147, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'a46e905c5c37c33c5e81f1c3ee4b82e1b237fe7c02d309624d2b77dcf6bd607d', '[\"*\"]', '2023-07-27 11:38:32', '2023-07-27 11:36:46', '2023-07-27 11:38:32'),
(148, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', 'bad1703579b6db1e8ea2a54602e7ece3b9dbbf1115cd901bb2a0edf947f2fca6', '[\"*\"]', '2023-07-27 12:06:40', '2023-07-27 11:58:05', '2023-07-27 12:06:40'),
(149, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '75c253ed141af5d8b7f80a389a4aedeed6b49433d94807850413ef240276473e', '[\"*\"]', '2023-07-27 13:01:33', '2023-07-27 12:32:24', '2023-07-27 13:01:33'),
(150, 'App\\Models\\User', 12, 'rameez.ranglerz@gmail.com', '17346c4326a296d4e2328cf80aa7b10a094a387afb9617f714ac2572f5c261fc', '[\"*\"]', '2023-07-31 16:10:00', '2023-07-31 15:45:57', '2023-07-31 16:10:00'),
(151, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '589f4f813a01c954e0c0edc642ef0fefebc3d76af6afb0c7f8aff3f64b8b3f30', '[\"*\"]', '2023-07-31 17:04:37', '2023-07-31 16:53:07', '2023-07-31 17:04:37'),
(152, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '2ed905aeafc09a2e6c4735eacbfbb8fa962349b897a7dcac69e72ea03c4ad6b2', '[\"*\"]', '2023-08-03 21:36:36', '2023-08-01 18:32:31', '2023-08-03 21:36:36'),
(153, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd22d4bd546c129790cd67ef712b8937787429120d160e3ad00080269c2df4075', '[\"*\"]', '2023-08-05 07:16:18', '2023-08-05 07:10:35', '2023-08-05 07:16:18'),
(154, 'App\\Models\\User', 18, 'rameezshakar@gmail.com', '98a9be36b6668252e62c2fef1446de43c0f1be5d9011a396dcf540ff8231fa81', '[\"*\"]', NULL, '2023-09-06 15:19:22', '2023-09-06 15:19:22'),
(155, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', '9f25fb137e276c62671197acfe2f304a37c7732e9c4eac018877ef1bbe6a9949', '[\"*\"]', NULL, '2023-09-29 14:36:38', '2023-09-29 14:36:38'),
(156, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '634976381ab67852824d4a52d6c461ffa03bd4ee533d096d83a08c4f3dd0fa2e', '[\"*\"]', '2023-10-05 05:51:12', '2023-10-04 21:04:15', '2023-10-05 05:51:12'),
(157, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '36a7be753db510b1cfeef4803a554a591dfcb1342635dce97a44e5a1212e1ca1', '[\"*\"]', '2023-10-05 05:59:15', '2023-10-05 05:53:48', '2023-10-05 05:59:15'),
(158, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '62e021d11acc82a958a3e56539acf7b26181ac2456d2e0e9e1a2f0797a0ee020', '[\"*\"]', '2023-10-05 06:51:39', '2023-10-05 06:27:29', '2023-10-05 06:51:39'),
(159, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '44db63484c95a8ea185ccea42ff271cf147cbb7272432c4a048d2183a4622bfc', '[\"*\"]', '2023-10-05 07:02:03', '2023-10-05 06:53:01', '2023-10-05 07:02:03'),
(160, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5fd079a93c1518e66d9e6e525ae5b117e1b27a1413c33fc91b035ade326a4186', '[\"*\"]', '2023-10-05 14:24:32', '2023-10-05 14:23:16', '2023-10-05 14:24:32'),
(161, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '323e03ca1e057a6b97644cf7eae7b1057bc8f084ccd72bc43aa8eee9a1b5209d', '[\"*\"]', '2023-11-16 13:59:31', '2023-10-05 14:24:37', '2023-11-16 13:59:31'),
(162, 'App\\Models\\User', 17, 'naeem.ranglerz@gmail.com', 'bfbdd8c97428713aebd21914a58ae5cb054cd0e2325deabd85963d70121bd88c', '[\"*\"]', '2023-10-05 14:56:43', '2023-10-05 14:33:00', '2023-10-05 14:56:43'),
(163, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5aae2b39efe84ffc8c350187944edf67d6a6ad8d45b4d0fcd4dc3d0dd95b2d0e', '[\"*\"]', '2023-10-10 15:26:57', '2023-10-05 17:38:47', '2023-10-10 15:26:57'),
(164, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '34421b0b622346181eef472ee96188432a70c65d43db9e0ba326c5a40dc1526d', '[\"*\"]', '2023-10-10 15:26:27', '2023-10-10 14:36:31', '2023-10-10 15:26:27'),
(165, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5e258964bbba8ab663f9644084c9d6ceabe9cdcb1d9f777d123d3bfe692001c6', '[\"*\"]', '2024-02-28 12:23:45', '2023-10-10 15:27:05', '2024-02-28 12:23:45'),
(166, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'c5b6921dca18dd0167240cf2baecd10769680a29ab6de2d8d9b01f5c46a29d69', '[\"*\"]', '2023-10-11 20:40:01', '2023-10-10 15:29:50', '2023-10-11 20:40:01'),
(167, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'fd0ed7928c2d5f5b8804113fc0c675ad94bb4665070cf9dcf2a6c3c87219ff5c', '[\"*\"]', '2024-04-04 10:56:22', '2024-04-04 10:40:25', '2024-04-04 10:56:22'),
(168, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '2e5810c8bd71cdc027576daacb5fec8f922b8b21bd649cb188c6f15db3158807', '[\"*\"]', '2024-04-05 11:03:15', '2024-04-04 10:57:00', '2024-04-05 11:03:15'),
(169, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd35b60dc3c726b935cca27adec730ae8f641dbacca1ef4711b144b01ed1af20b', '[\"*\"]', '2024-04-05 11:20:09', '2024-04-05 11:17:56', '2024-04-05 11:20:09'),
(170, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'd717cd1531f62c82b2b6c135fd674dd8650978b632db6f38f7e6819c6ee7f1fd', '[\"*\"]', '2024-04-05 11:20:48', '2024-04-05 11:20:12', '2024-04-05 11:20:48'),
(171, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '17f7929b6ecdd85040ce3c51164fc7029fca397642dc624c108abc5d06f7ab8f', '[\"*\"]', '2024-04-05 11:23:06', '2024-04-05 11:20:51', '2024-04-05 11:23:06'),
(172, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '363cb0a0f9493d79b703b14dba5d0716a5bc351072dc5a2a24d5eb78a48b1bc7', '[\"*\"]', '2024-04-05 11:23:45', '2024-04-05 11:23:09', '2024-04-05 11:23:45'),
(173, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '4fa54be6af1b9a216bff88e5ea7d76be330932650241434eb562c39d18246309', '[\"*\"]', '2024-04-05 11:24:52', '2024-04-05 11:23:48', '2024-04-05 11:24:52'),
(174, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '3778b89a0369886ddd2a5b704788075a8654b4724baa490b5faaf98ed6c433f4', '[\"*\"]', '2024-04-05 11:25:51', '2024-04-05 11:24:55', '2024-04-05 11:25:51'),
(175, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '745f23898f3a20403e1221391df290ef90330af77ac02515b754ecd8b4ea3bb2', '[\"*\"]', '2024-04-05 11:27:03', '2024-04-05 11:25:54', '2024-04-05 11:27:03'),
(176, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'b4413c7218e5de21277bbb68659140a4bc56d3548ccefcb912c0ad8205ed262a', '[\"*\"]', '2024-04-05 11:32:17', '2024-04-05 11:27:06', '2024-04-05 11:32:17'),
(177, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5a66570025d05cb6eaabe9fb2ebc6efee1f3ee5f7e2aab149f6ee694a2059f1c', '[\"*\"]', '2024-04-05 11:41:07', '2024-04-05 11:32:21', '2024-04-05 11:41:07'),
(178, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'cd31161b0f0d7c9845ed23c8a0a86d7fa7f1e7a55d78a9e6abce218fd026fdae', '[\"*\"]', '2024-04-05 11:45:36', '2024-04-05 11:41:11', '2024-04-05 11:45:36'),
(179, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', 'f1f2f2ff254a50cddb3b646ad05a1928041892ac9dabbb61c8d725a6e0a7f790', '[\"*\"]', '2024-04-05 11:50:44', '2024-04-05 11:45:40', '2024-04-05 11:50:44'),
(180, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '927f791c3c44754040577d6115ac579f65a39c0a83f9fa1dd911371d8578b8bb', '[\"*\"]', '2024-04-05 12:29:22', '2024-04-05 11:50:51', '2024-04-05 12:29:22'),
(181, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '5d6c5cd7aa63636db1bde0e0d3ec8def8690cc424f0eca4e4240d81291fc6c22', '[\"*\"]', '2024-04-05 12:39:56', '2024-04-05 12:29:36', '2024-04-05 12:39:56'),
(182, 'App\\Models\\User', 16, 'daniyalbabar9@gmail.com', '9033cacc7d6d2e7b2d8e01db72782f3e836379e5dc94f7f6fd6a653a0f9f83d0', '[\"*\"]', '2024-04-05 12:45:13', '2024-04-05 12:40:00', '2024-04-05 12:45:13'),
(183, 'App\\Models\\User', 19, 'basitwattoo2119@gmail.com', '33e65f44198afba528e279cd4ad61170a952a08adaeab11fe1195bcda85e6482', '[\"*\"]', NULL, '2024-04-05 14:03:26', '2024-04-05 14:03:26'),
(184, 'App\\Models\\User', 19, 'basitwattoo2119@gmail.com', 'c779a5d68f901dab1259855ec1055c415b2cf632a7d91b4e8ea7cd2652b8469e', '[\"*\"]', '2024-04-29 19:48:15', '2024-04-05 14:03:38', '2024-04-29 19:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `branch_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `subscription` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `opening_time` varchar(100) DEFAULT NULL,
  `closing_time` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `branch_name`, `email`, `password`, `branch_no`, `address`, `license`, `phone_no`, `subscription`, `image`, `opening_time`, `closing_time`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(28, 'care', 'care@gmail.com', '$2y$10$yYYmeaX8/Bwyy50ltfC/SOxPbX1wiCfybftDwFge45LpnjKDyRuyS', '1', 'Green Town, Lahore, Pakistan', '123456', '03009000600', '25-10-2023', 'public/admin/assets/images/users/1690439404.jpg', '08:34', '21:35', 31.43461300, 74.30742130, '1', '2023-07-27 10:30:04', '2024-04-05 10:42:15'),
(29, 'shifa', 'shifa@gmail.com', '$2y$10$q6KrrAiWQEk8RSJ2KyyhfupoSH1BEHy.eA27XM3B5SliCHjij15FW', '1', 'MUSTAFA ABAD LALYANI, Mustafabad, Kasur, Punjab, Pakistan', '123456', '15447311665', '26-08-2023', 'public/admin/assets/images/users/1690439549.jpg', '11:31', '12:37', 31.25752070, 74.41740610, '1', '2023-07-27 10:32:29', '2024-04-05 12:43:48'),
(30, 'Care1', 'care1@gmail.com', '$2y$10$tIV5yjYKxapAxxIXmGJhZefhLlmRXKnGfeiPVVD31zWC7bd6asCNq', '1', 'Fareed Town Sahiwal', '456789', '03009637410', '30-08-2023', 'public/admin/assets/images/users/1691644939.jpg', '06:00 AM', '12:00 AM', NULL, NULL, '1', '2023-08-10 09:22:19', '2023-08-10 09:46:29'),
(31, 'Punjab pharmacy', 'ateeqwattoo3@gmail.com', '$2y$10$zwXYWuYNoiUgcHE8njMU6O8RbS.VkoeI53Wpkr/XbyW0jfm6nLrxa', '123', 'Depalpur Bypass Road, Sadr Deewan, Pakistan', '789', '03361601218', NULL, 'public/admin/assets/images/users/1693739951.png', '09:00', '23:00', 31.15300510, 74.45259720, '1', '2023-09-03 15:19:11', '2024-04-11 22:47:05'),
(32, 'Muhammad Ali', 'pharmacy@gmail.com', '$2y$10$JzVBDCByX5bMiZ1Fz91Oy.KHvXbCEoCTkb0Zxrf7q8m/nCH34hj/C', '12345', '546 J3 JOHAR TOWN,LAHORE', '123456', '03348058699', '02-11-2023', 'public/admin/assets/images/users/1687245386.jpg', '06:33 PM', '09:33 PM', NULL, NULL, '1', '2023-09-29 16:33:50', '2023-10-03 15:27:37'),
(34, 'Mughal Pharmacy', 'mt03318706108@gmail.com', '$2y$10$ccLy1.bQEh1yyZhWgwd1TuX5wgHB8CvzIJVsJiU1inWFU8HfZcxee', '051', 'Okara Bypass Road, Kot Jan Muhammad, Okara, Pakistan', '2127', '03318706108', '01-11-2023', 'public/admin/assets/images/users/1696695383.jpeg', '06:00', '23:00', 30.78685700, 73.45972000, '1', '2023-10-07 20:16:23', '2024-04-11 22:46:34'),
(36, 'Alpha pharmacy', 'Dzamii_786@icloud.com', '$2y$10$s1MPlWpx6sAOzikIrw9fZeblwKOQVUB/xc6P4VrTbAarmwK6mHNkK', '1', 'Shop number 6/A, Gulbahar colony street 1, lane 6 cavalry ground, Lahore pakistan', '053520058051985', '03213228180', NULL, 'public/admin/assets/images/users/1701678735.jpg', '07:00 AM', '12:00 AM', NULL, NULL, '1', '2023-12-04 13:32:15', '2023-12-04 13:32:15'),
(37, 'SKET PHARMACY Sheikh Karam Elahi trust hospital', 'Safrani8363@gmail.com', '$2y$10$RcxV3pit6dUlFndhhOLEAOc6/.vD7raF10CTu9y/H/vmVK6toxpEq', '2', 'SKET PHARMACY Sheikh Karam Elahi trust hospital taj mehal park road salamat pura lahore', '05352006984640', '03034004251', NULL, 'public/admin/assets/images/users/1701679343.jpg', '07:00 AM', '10:00 PM', NULL, NULL, '1', '2023-12-04 13:42:23', '2023-12-04 13:42:23'),
(38, 'Medik pharmacy', 'haseebaasim02@gmail.com', '$2y$10$y6jHPcRltleORUlO9hYVR.3o1F84bv274.zly/fhtulvIVFwiJJ7i', '1', 'Medik pharmacy Muhammad plaza arif Chowk samanabad Lahore', '053520064084113', '03204412482', NULL, 'public/admin/assets/images/users/1701680420.jpg', '07:00 AM', '12:00 AM', NULL, NULL, '1', '2023-12-04 14:00:20', '2023-12-04 14:00:20'),
(42, 'Hamza Pharmacy', 'jazibali4666@gmail.com', '$2y$10$wDa1qDKcDxUGQz43AcYWMOR1iRX00cwcKI65gXNL8KWK6G0Mh9xAS', '1', 'Shop No.1, Ishtiaq Center, Usman Chowk, Badami Bagh, Lahore.', '053520062037642', '03334300223', NULL, 'public/admin/assets/images/users/1701858953.jpg', '07:00 AM', '02:00 AM', NULL, NULL, '1', '2023-12-06 15:35:53', '2023-12-06 16:15:30'),
(46, 'AK DISTRIBUTERS', 'wattoobasit@gmail.com', '$2y$10$hEanmtFYZ1FplRfZG8V5BO9VPZQFqrdjQmAcbOhi5Pi7Gu96sZ9C6', '4', 'Bus Stand, Depalpur, Depalpur, Pakistan', 'abcdef12', '03001514443', '10-07-2024', 'public/admin/assets/images/users/1711783318.png', '06:06', '12:00', 30.67244040, 73.65765550, '1', '2024-03-30 11:21:58', '2024-04-11 23:47:48'),
(47, 'HUM DISTRIBUTERS', 'wattoobasitt@gmail.com', '$2y$10$P.iJ8pxemD.2IOwMK0SWJeW3chIsoimIGvcqhWxIUjjwsSHpU9OWG', '5', 'DepalPur Okara By Pass Road, Depalpur, Pakistan', 'abcdef12', '03001514443', NULL, 'public/admin/assets/images/users/1711783522.jpg', '06:24', '12:26', 30.69435870, 73.65267270, '1', '2024-03-30 11:25:22', '2024-04-11 22:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Morbi dignissim dignissim ipsum, eget lacinia odio efficitur ac.', '2023-06-16 01:33:36', '2023-06-16 01:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pharmacy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `pharmacy_id`, `category_id`, `sub_category_id`, `brand_id`, `description`, `type`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(42, 'ENO Fruit (Lemon) 5g 72 Sachets', 30, 9, 31, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696680025.webp', '1', '2023-10-07 16:00:25', '2023-10-07 16:00:25'),
(51, 'Nestle Cerelac (3 Fruits & Wheat) 175g Baby Cereal', 34, 11, 13, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696684911.webp', '1', '2023-10-07 17:21:51', '2023-10-07 21:05:37'),
(52, 'Hamdard Safi 175ml Syrup', 28, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696696099.webp', '1', '2023-10-07 20:28:19', '2023-10-07 21:04:05'),
(53, 'Hamdard Safi 175ml Syrup', 29, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696696099.webp', '1', '2023-10-07 20:28:20', '2023-10-07 21:04:43'),
(55, 'Hamdard Safi 175ml Syrup', 31, 14, 17, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696696099.webp', '1', '2023-10-07 20:28:20', '2023-10-07 20:28:20'),
(56, 'Hamdard Safi 175ml Syrup', 32, 14, 17, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696696099.webp', '1', '2023-10-07 20:28:20', '2023-10-07 20:28:20'),
(58, 'Hamdard Safi 175ml Syrup', 34, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696696099.webp', '1', '2023-10-07 20:28:20', '2023-10-07 21:03:29'),
(59, 'Gestofill 120ml Syrup', 28, 14, 16, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696696477.webp', '1', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(60, 'Gestofill 120ml Syrup', 29, 14, 16, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696696477.webp', '1', '2023-10-07 20:34:37', '2023-10-07 21:02:33'),
(61, 'Gestofill 120ml Syrup', 30, 14, 16, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696696477.webp', '1', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(62, 'Gestofill 120ml Syrup', 31, 14, 16, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696696477.webp', '1', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(63, 'Gestofill 120ml Syrup', 32, 14, 16, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696696477.webp', '1', '2023-10-07 20:34:37', '2023-10-07 21:01:57'),
(65, 'Gestofill 120ml Syrup', 34, 14, 16, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696696477.webp', '1', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(66, 'Flagyl (400mg) 200 Tablets', 28, 13, 26, NULL, NULL, 'Tablets', 'public/admin/assets/images/users/1696696875.webp', '1', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(67, 'Flagyl (400mg) 200 Tablets', 29, 13, 26, NULL, NULL, 'Tablets', 'public/admin/assets/images/users/1696696875.webp', '1', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(68, 'Flagyl (400mg) 200 Tablets', 30, 13, 26, 8, NULL, 'Tablets', 'public/admin/assets/images/users/1696696875.webp', '1', '2023-10-07 20:41:15', '2023-10-07 21:01:41'),
(69, 'Flagyl (400mg) 200 Tablets', 31, 13, 26, 8, NULL, 'Tablets', 'public/admin/assets/images/users/1696696875.webp', '1', '2023-10-07 20:41:15', '2023-10-07 21:00:53'),
(70, 'Flagyl (400mg) 200 Tablets', 32, 13, 26, NULL, NULL, 'Tablets', 'public/admin/assets/images/users/1696696875.webp', '1', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(72, 'Flagyl (400mg) 200 Tablets', 34, 13, 26, 8, NULL, 'Tablets', 'public/admin/assets/images/users/1696696875.webp', '1', '2023-10-07 20:41:15', '2023-10-07 21:59:54'),
(73, 'Artifen (50mg) 100 Tablets', 28, 13, 25, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696697084.png', '1', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(74, 'Artifen (50mg) 100 Tablets', 29, 13, 25, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696697084.png', '1', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(75, 'Artifen (50mg) 100 Tablets', 46, 13, 25, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696697084.png', '1', '2023-10-07 20:44:44', '2024-04-11 22:56:00'),
(76, 'Artifen (50mg) 100 Tablets', 31, 13, 25, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696697084.png', '1', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(77, 'Artifen (50mg) 100 Tablets', 32, 13, 25, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696697084.png', '1', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(79, 'Artifen (50mg) 100 Tablets', 34, 13, 25, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696697084.png', '1', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(80, 'Fexet (60mg) 20 Tablets', 28, 13, 27, 15, NULL, 'Tablets', 'public/admin/assets/images/users/1696697361.png', '1', '2023-10-07 20:49:21', '2023-10-07 20:49:21'),
(81, 'Fexet (60mg) 20 Tablets', 29, 13, 27, 15, NULL, 'Tablets', 'public/admin/assets/images/users/1696697361.png', '1', '2023-10-07 20:49:21', '2023-10-07 20:49:21'),
(82, 'Fexet (60mg) 20 Tablets', 46, 13, 27, 15, NULL, 'Tablets', 'public/admin/assets/images/users/1696697361.png', '1', '2023-10-07 20:49:21', '2024-04-11 22:55:39'),
(83, 'Fexet (60mg) 20 Tablets', 31, 13, 27, 15, NULL, 'Tablets', 'public/admin/assets/images/users/1696697361.png', '1', '2023-10-07 20:49:21', '2023-10-07 20:49:21'),
(84, 'Fexet (60mg) 20 Tablets', 32, 13, 27, 15, NULL, 'Tablets', 'public/admin/assets/images/users/1696697361.png', '1', '2023-10-07 20:49:21', '2023-10-07 20:49:21'),
(86, 'Fexet (60mg) 20 Tablets', 34, 13, 27, 15, NULL, 'Tablets', 'public/admin/assets/images/users/1696697361.png', '1', '2023-10-07 20:49:21', '2023-10-07 20:49:21'),
(87, 'Montika (10mg) 14 Tablets', 28, 13, 28, 14, NULL, 'Tablets', 'public/admin/assets/images/users/1696697704.webp', '1', '2023-10-07 20:55:04', '2023-10-07 20:55:04'),
(88, 'Montika (10mg) 14 Tablets', 29, 13, 28, 14, NULL, 'Tablets', 'public/admin/assets/images/users/1696697704.webp', '1', '2023-10-07 20:55:04', '2023-10-07 20:55:04'),
(89, 'Montika (10mg) 14 Tablets', 30, 13, 28, 14, NULL, 'Tablets', 'public/admin/assets/images/users/1696697704.webp', '1', '2023-10-07 20:55:04', '2023-10-07 20:55:04'),
(90, 'Montika (10mg) 14 Tablets', 31, 13, 28, 14, NULL, 'Tablets', 'public/admin/assets/images/users/1696697704.webp', '1', '2023-10-07 20:55:04', '2023-10-07 20:55:04'),
(91, 'Montika (10mg) 14 Tablets', 32, 13, 28, 14, NULL, 'Tablets', 'public/admin/assets/images/users/1696697704.webp', '1', '2023-10-07 20:55:04', '2023-10-07 20:55:04'),
(93, 'Montika (10mg) 14 Tablets', 34, 13, 28, 14, NULL, 'Tablets', 'public/admin/assets/images/users/1696697704.webp', '1', '2023-10-07 20:55:04', '2023-10-07 20:55:04'),
(94, 'Hamdard Safi 175ml Syrup', 29, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696698777.webp', '1', '2023-10-07 21:12:57', '2023-10-07 21:58:04'),
(95, 'Hamdard Safi 175ml Syrup', 46, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696698777.webp', '1', '2023-10-07 21:12:57', '2024-04-11 22:55:11'),
(96, 'Hamdard Safi 175ml Syrup', 31, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696698777.webp', '1', '2023-10-07 21:12:57', '2023-10-07 21:57:51'),
(97, 'Hamdard Safi 175ml Syrup', 32, 14, 17, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696698777.webp', '1', '2023-10-07 21:12:57', '2023-10-07 21:57:36'),
(99, 'Hamdard Safi 175ml Syrup', 34, 14, 17, NULL, NULL, 'Syrup', 'public/admin/assets/images/users/1696698777.webp', '1', '2023-10-07 21:12:57', '2023-10-07 21:12:57'),
(100, 'ENO Fruit (Lemon) 5g 72 Sachets', 28, 9, 31, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696699381.webp', '1', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(101, 'ENO Fruit (Lemon) 5g 72 Sachets', 29, 9, 31, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696699381.webp', '1', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(102, 'ENO Fruit (Lemon) 5g 72 Sachets', 31, 9, 31, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696699381.webp', '1', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(103, 'ENO Fruit (Lemon) 5g 72 Sachets', 32, 9, 31, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696699381.webp', '1', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(105, 'ENO Fruit (Lemon) 5g 72 Sachets', 34, 9, 31, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696699381.webp', '1', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(106, 'Risek (20mg) 21 Capsules', 28, 9, 31, 15, NULL, 'Capsules', 'public/admin/assets/images/users/1696699615.webp', '1', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(107, 'Risek (20mg) 21 Capsules', 29, 9, 31, 15, NULL, 'Capsules', 'public/admin/assets/images/users/1696699615.webp', '1', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(108, 'Risek (20mg) 21 Capsules', 46, 9, 31, 15, NULL, 'Capsules', 'public/admin/assets/images/users/1696699615.webp', '1', '2023-10-07 21:26:55', '2024-04-11 22:53:44'),
(109, 'Risek (20mg) 21 Capsules', 31, 9, 31, 15, NULL, 'Capsules', 'public/admin/assets/images/users/1696699615.webp', '1', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(110, 'Risek (20mg) 21 Capsules', 32, 9, 31, 15, NULL, 'Capsules', 'public/admin/assets/images/users/1696699615.webp', '1', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(111, 'Risek (20mg) 21 Capsules', 34, 9, 31, 15, NULL, 'Capsules', 'public/admin/assets/images/users/1696699615.webp', '1', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(112, 'Rondec C 120ml Cough Syrup', 28, 9, 29, 9, NULL, 'Syrup', 'public/admin/assets/images/users/1696699839.webp', '1', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(113, 'Rondec C 120ml Cough Syrup', 29, 9, 29, 9, NULL, 'Syrup', 'public/admin/assets/images/users/1696699839.webp', '1', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(114, 'Rondec C 120ml Cough Syrup', 46, 9, 29, 9, NULL, 'Syrup', 'public/admin/assets/images/users/1696699839.webp', '1', '2023-10-07 21:30:39', '2024-04-11 22:53:17'),
(115, 'Rondec C 120ml Cough Syrup', 31, 9, 29, 9, NULL, 'Syrup', 'public/admin/assets/images/users/1696699839.webp', '1', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(116, 'Rondec C 120ml Cough Syrup', 32, 9, 29, 9, NULL, 'Syrup', 'public/admin/assets/images/users/1696699839.webp', '1', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(117, 'Rondec C 120ml Cough Syrup', 34, 9, 29, 9, NULL, 'Syrup', 'public/admin/assets/images/users/1696699839.webp', '1', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(118, 'Actidil (1.25mg/5ml) 60ml Syrup', 28, 9, 32, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696700065.webp', '1', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(119, 'Actidil (1.25mg/5ml) 60ml Syrup', 29, 9, 32, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696700065.webp', '1', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(120, 'Actidil (1.25mg/5ml) 60ml Syrup', 30, 9, 32, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696700065.webp', '1', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(121, 'Actidil (1.25mg/5ml) 60ml Syrup', 31, 9, 32, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696700065.webp', '1', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(122, 'Actidil (1.25mg/5ml) 60ml Syrup', 46, 9, 32, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696700065.webp', '1', '2023-10-07 21:34:26', '2024-04-11 22:52:45'),
(123, 'Actidil (1.25mg/5ml) 60ml Syrup', 34, 9, 32, 8, NULL, 'Syrup', 'public/admin/assets/images/users/1696700065.webp', '1', '2023-10-07 21:34:26', '2023-10-07 21:34:26'),
(124, 'Brufen (400mg) 250 Tablets', 28, 9, 33, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696700358.png', '1', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(125, 'Brufen (400mg) 250 Tablets', 29, 9, 33, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696700358.png', '1', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(126, 'Brufen (400mg) 250 Tablets', 30, 9, 33, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696700358.png', '1', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(127, 'Brufen (400mg) 250 Tablets', 31, 9, 33, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696700358.png', '1', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(128, 'Brufen (400mg) 250 Tablets', 46, 9, 33, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696700358.png', '1', '2023-10-07 21:39:18', '2024-04-05 14:54:16'),
(129, 'Brufen (400mg) 250 Tablets', 34, 9, 33, 9, NULL, 'Tablets', 'public/admin/assets/images/users/1696700358.png', '1', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(130, 'Nestle Cerelac (3 Fruits & Wheat) 175g Baby Cereal', 28, 11, 13, NULL, NULL, 'Suspension', 'public/admin/assets/images/users/1696700566.webp', '1', '2023-10-07 21:42:46', '2023-10-07 21:42:46'),
(131, 'Nestle Cerelac (3 Fruits & Wheat) 175g Baby Cereal', 46, 11, 13, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696700566.webp', '1', '2023-10-07 21:42:46', '2024-04-05 14:58:20'),
(132, 'Nestle Cerelac (3 Fruits & Wheat) 175g Baby Cereal', 47, 11, 13, 8, NULL, 'Suspension', 'public/admin/assets/images/users/1696700566.webp', '1', '2023-10-07 21:42:46', '2024-04-05 14:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `total_stock` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `units`, `quantity`, `price`, `discount`, `total_stock`, `created_at`, `updated_at`) VALUES
(66, 42, 'mg', '5000', '657', '15', '100', '2023-10-07 16:00:25', '2023-10-07 16:00:25'),
(79, 55, 'ml', '175', '150', '10', '25', '2023-10-07 20:28:20', '2023-10-07 20:28:20'),
(80, 56, 'ml', '175', '150', '10', '25', '2023-10-07 20:28:20', '2023-10-07 20:28:20'),
(83, 59, 'ml', '120', '130', '7', '23', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(85, 61, 'ml', '120', '130', '7', '23', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(86, 62, 'ml', '120', '130', '7', '23', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(89, 65, 'ml', '120', '130', '7', '23', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(90, 66, 'mg', '400', '32', '0', '40', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(91, 67, 'mg', '400', '32', '0', '40', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(94, 70, 'mg', '400', '32', '0', '40', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(98, 74, 'mg', '50', '64', '6', '35', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(101, 77, 'mg', '50', '64', '6', '35', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(103, 79, 'mg', '50', '64', '6', '35', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(121, 90, 'mg', '10', '460', '9', '20', '2023-10-07 20:56:48', '2023-10-07 20:56:48'),
(123, 88, 'mg', '10', '460', '12', '20', '2023-10-07 20:57:16', '2023-10-07 20:57:16'),
(124, 87, 'mg', '10', '460', '4', '20', '2023-10-07 20:57:33', '2023-10-07 20:57:33'),
(129, 91, 'mg', '10', '460', '7', '20', '2023-10-07 20:59:08', '2023-10-07 20:59:08'),
(131, 73, 'mg', '50', '64', '7', '35', '2023-10-07 20:59:54', '2023-10-07 20:59:54'),
(132, 76, 'mg', '50', '64', '12', '35', '2023-10-07 21:00:17', '2023-10-07 21:00:17'),
(134, 69, 'mg', '400', '32', '5', '40', '2023-10-07 21:00:53', '2023-10-07 21:00:53'),
(136, 68, 'mg', '400', '32', '6', '40', '2023-10-07 21:01:41', '2023-10-07 21:01:41'),
(137, 63, 'ml', '120', '130', '10', '23', '2023-10-07 21:01:57', '2023-10-07 21:01:57'),
(139, 60, 'ml', '120', '130', '9', '23', '2023-10-07 21:02:33', '2023-10-07 21:02:33'),
(142, 58, 'ml', '175', '150', '10', '25', '2023-10-07 21:03:29', '2023-10-07 21:03:29'),
(143, 84, 'mg', '60', '172', '5', '42', '2023-10-07 21:03:44', '2023-10-07 21:03:44'),
(145, 52, 'ml', '175', '150', '12', '25', '2023-10-07 21:04:24', '2023-10-07 21:04:24'),
(146, 53, 'ml', '175', '150', '15', '25', '2023-10-07 21:04:43', '2023-10-07 21:04:43'),
(147, 51, 'mg', '1075', '400', '14', '15', '2023-10-07 21:05:37', '2023-10-07 21:05:37'),
(153, 99, 'ml', '175', '150', '15', '20', '2023-10-07 21:12:57', '2023-10-07 21:12:57'),
(155, 101, 'mg', '5000', '657', '15', '25', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(156, 102, 'mg', '5000', '657', '15', '25', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(161, 107, 'mg', '20', '183', '7', '50', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(164, 110, 'mg', '20', '183', '7', '50', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(167, 113, 'ml', '120', '140', '7', '20', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(171, 117, 'ml', '120', '140', '7', '20', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(173, 119, 'ml', '60', '36', '7', '30', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(174, 120, 'ml', '60', '36', '7', '30', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(180, 126, 'mg', '400', '30', '4', '40', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(183, 129, 'mg', '400', '30', '4', '40', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(184, 130, 'mg', '1075', '400', '12', '10', '2023-10-07 21:42:46', '2023-10-07 21:42:46'),
(193, 127, 'mg', '400', '30', '9', '40', '2023-10-07 21:53:10', '2023-10-07 21:53:10'),
(194, 125, 'mg', '400', '30', '7', '40', '2023-10-07 21:53:20', '2023-10-07 21:53:20'),
(195, 124, 'mg', '400', '30', '5', '40', '2023-10-07 21:53:31', '2023-10-07 21:53:31'),
(196, 123, 'ml', '60', '36', '10', '30', '2023-10-07 21:53:45', '2023-10-07 21:53:45'),
(198, 121, 'ml', '60', '36', '12', '30', '2023-10-07 21:54:14', '2023-10-07 21:54:14'),
(199, 118, 'ml', '60', '36', '6', '30', '2023-10-07 21:54:39', '2023-10-07 21:54:39'),
(200, 116, 'ml', '120', '140', '9', '20', '2023-10-07 21:54:56', '2023-10-07 21:54:56'),
(203, 115, 'ml', '120', '140', '10', '20', '2023-10-07 21:55:32', '2023-10-07 21:55:32'),
(204, 112, 'ml', '120', '140', '12', '20', '2023-10-07 21:55:43', '2023-10-07 21:55:43'),
(205, 111, 'mg', '20', '183', '5', '50', '2023-10-07 21:55:58', '2023-10-07 21:55:58'),
(206, 109, 'mg', '20', '183', '0', '50', '2023-10-07 21:56:12', '2023-10-07 21:56:12'),
(207, 106, 'mg', '20', '183', '5', '50', '2023-10-07 21:56:23', '2023-10-07 21:56:23'),
(208, 105, 'mg', '5000', '657', '15', '25', '2023-10-07 21:56:34', '2023-10-07 21:56:34'),
(210, 103, 'mg', '5000', '657', '12', '25', '2023-10-07 21:56:58', '2023-10-07 21:56:58'),
(211, 100, 'mg', '5000', '657', '18', '25', '2023-10-07 21:57:10', '2023-10-07 21:57:10'),
(212, 97, 'ml', '175', '150', '12', '20', '2023-10-07 21:57:36', '2023-10-07 21:57:36'),
(213, 96, 'ml', '175', '150', '10', '20', '2023-10-07 21:57:51', '2023-10-07 21:57:51'),
(214, 94, 'ml', '175', '150', '7', '20', '2023-10-07 21:58:04', '2023-10-07 21:58:04'),
(215, 93, 'mg', '10', '460', '12', '22', '2023-10-07 21:58:22', '2023-10-07 21:58:22'),
(217, 89, 'mg', '10', '460', '13', '20', '2023-10-07 21:58:43', '2023-10-07 21:58:43'),
(219, 86, 'mg', '60', '172', '5', '42', '2023-10-07 21:59:00', '2023-10-07 21:59:00'),
(220, 80, 'mg', '60', '172', '7', '42', '2023-10-07 21:59:13', '2023-10-07 21:59:13'),
(221, 81, 'mg', '60', '172', '7', '42', '2023-10-07 21:59:24', '2023-10-07 21:59:24'),
(222, 83, 'mg', '60', '172', '5', '42', '2023-10-07 21:59:33', '2023-10-07 21:59:33'),
(223, 72, 'mg', '400', '32', '0', '40', '2023-10-07 21:59:54', '2023-10-07 21:59:54'),
(235, 132, 'mg', '1075', '400', '5', '10', '2024-04-05 14:54:00', '2024-04-05 14:54:00'),
(236, 128, 'mg', '400', '30', '7', '40', '2024-04-05 14:54:16', '2024-04-05 14:54:16'),
(237, 131, 'mg', '1075', '400', '8', '10', '2024-04-05 14:58:20', '2024-04-05 14:58:20'),
(238, 122, 'ml', '60', '36', '14', '30', '2024-04-11 22:52:45', '2024-04-11 22:52:45'),
(239, 114, 'ml', '120', '140', '8', '20', '2024-04-11 22:53:17', '2024-04-11 22:53:17'),
(240, 108, 'mg', '20', '183', '7', '50', '2024-04-11 22:53:44', '2024-04-11 22:53:44'),
(241, 95, 'ml', '175', '150', '15', '20', '2024-04-11 22:55:11', '2024-04-11 22:55:11'),
(242, 82, 'mg', '60', '172', '7', '42', '2024-04-11 22:55:39', '2024-04-11 22:55:39'),
(243, 75, 'mg', '50', '64', '11', '35', '2024-04-11 22:56:00', '2024-04-11 22:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_instructions`
--

CREATE TABLE `product_instructions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_instructions`
--

INSERT INTO `product_instructions` (`id`, `product_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(29, 42, 'Product Information', 'Uses; neutralizes stomach acidity and is used to relieve heartburn, indigestion or an upset stomach.', '2023-10-07 16:00:25', '2023-10-07 16:00:25'),
(42, 55, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 20:28:20', '2023-10-07 20:28:20'),
(43, 56, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 20:28:20', '2023-10-07 20:28:20'),
(46, 59, 'Product Information', 'An effective herabal remedy Effective for acidity and heartburn Effective for indigestion and loss of appetite Effective in constipation, nausea, flatulence and dyspepsia All Natural Product', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(48, 61, 'Product Information', 'An effective herabal remedy Effective for acidity and heartburn Effective for indigestion and loss of appetite Effective in constipation, nausea, flatulence and dyspepsia All Natural Product', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(49, 62, 'Product Information', 'An effective herabal remedy Effective for acidity and heartburn Effective for indigestion and loss of appetite Effective in constipation, nausea, flatulence and dyspepsia All Natural Product', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(52, 65, 'Product Information', 'An effective herabal remedy Effective for acidity and heartburn Effective for indigestion and loss of appetite Effective in constipation, nausea, flatulence and dyspepsia All Natural Product', '2023-10-07 20:34:37', '2023-10-07 20:34:37'),
(53, 66, 'Product Information', 'Flagyl 400 is an anti-infective medicine. It is used for the treatment of infections caused by bacteria and parasites. It is effective for the treatment of infection in different body parts, such as infection of the blood, stomach, intestine, tooth, skin,', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(54, 67, 'Product Information', 'Flagyl 400 is an anti-infective medicine. It is used for the treatment of infections caused by bacteria and parasites. It is effective for the treatment of infection in different body parts, such as infection of the blood, stomach, intestine, tooth, skin,', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(57, 70, 'Product Information', 'Flagyl 400 is an anti-infective medicine. It is used for the treatment of infections caused by bacteria and parasites. It is effective for the treatment of infection in different body parts, such as infection of the blood, stomach, intestine, tooth, skin,', '2023-10-07 20:41:15', '2023-10-07 20:41:15'),
(61, 74, 'Product Information', 'Rheumatoid Arthritis, Osteoarthritis, Ankylosing Spondylitis, Acute Gout, Acute Musculo-Skeletal Disorders such as Periarthritis (for example frozen shoulder), Tendinitis, Tenosynovitis and Bursitis, other painful conditions resulting from; Trauma, includ', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(64, 77, 'Product Information', 'Rheumatoid Arthritis, Osteoarthritis, Ankylosing Spondylitis, Acute Gout, Acute Musculo-Skeletal Disorders such as Periarthritis (for example frozen shoulder), Tendinitis, Tenosynovitis and Bursitis, other painful conditions resulting from; Trauma, includ', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(66, 79, 'Product Information', 'Rheumatoid Arthritis, Osteoarthritis, Ankylosing Spondylitis, Acute Gout, Acute Musculo-Skeletal Disorders such as Periarthritis (for example frozen shoulder), Tendinitis, Tenosynovitis and Bursitis, other painful conditions resulting from; Trauma, includ', '2023-10-07 20:44:44', '2023-10-07 20:44:44'),
(84, 90, 'Product Information', 'For prophylaxis and chronic treatment of Asthma. The prevention of exercise-induced bronchoconstriction. Allergic Rhinitis, Seasonal Allergic Rhinitis, Perennial Allergic Rhinitis.', '2023-10-07 20:56:48', '2023-10-07 20:56:48'),
(86, 88, 'Product Information', 'For prophylaxis and chronic treatment of Asthma. The prevention of exercise-induced bronchoconstriction. Allergic Rhinitis, Seasonal Allergic Rhinitis, Perennial Allergic Rhinitis.', '2023-10-07 20:57:16', '2023-10-07 20:57:16'),
(87, 87, 'Product Information', 'For prophylaxis and chronic treatment of Asthma. The prevention of exercise-induced bronchoconstriction. Allergic Rhinitis, Seasonal Allergic Rhinitis, Perennial Allergic Rhinitis.', '2023-10-07 20:57:33', '2023-10-07 20:57:33'),
(92, 91, 'Product Information', 'For prophylaxis and chronic treatment of Asthma. The prevention of exercise-induced bronchoconstriction. Allergic Rhinitis, Seasonal Allergic Rhinitis, Perennial Allergic Rhinitis.', '2023-10-07 20:59:08', '2023-10-07 20:59:08'),
(94, 73, 'Product Information', 'Rheumatoid Arthritis, Osteoarthritis, Ankylosing Spondylitis, Acute Gout, Acute Musculo-Skeletal Disorders such as Periarthritis (for example frozen shoulder), Tendinitis, Tenosynovitis and Bursitis, other painful conditions resulting from; Trauma, includ', '2023-10-07 20:59:54', '2023-10-07 20:59:54'),
(95, 76, 'Product Information', 'Rheumatoid Arthritis, Osteoarthritis, Ankylosing Spondylitis, Acute Gout, Acute Musculo-Skeletal Disorders such as Periarthritis (for example frozen shoulder), Tendinitis, Tenosynovitis and Bursitis, other painful conditions resulting from; Trauma, includ', '2023-10-07 21:00:17', '2023-10-07 21:00:17'),
(97, 69, 'Product Information', 'Flagyl 400 is an anti-infective medicine. It is used for the treatment of infections caused by bacteria and parasites. It is effective for the treatment of infection in different body parts, such as infection of the blood, stomach, intestine, tooth, skin,', '2023-10-07 21:00:53', '2023-10-07 21:00:53'),
(99, 68, 'Product Information', 'Flagyl 400 is an anti-infective medicine. It is used for the treatment of infections caused by bacteria and parasites. It is effective for the treatment of infection in different body parts, such as infection of the blood, stomach, intestine, tooth, skin,', '2023-10-07 21:01:41', '2023-10-07 21:01:41'),
(100, 63, 'Product Information', 'An effective herabal remedy Effective for acidity and heartburn Effective for indigestion and loss of appetite Effective in constipation, nausea, flatulence and dyspepsia All Natural Product', '2023-10-07 21:01:57', '2023-10-07 21:01:57'),
(102, 60, 'Product Information', 'An effective herabal remedy Effective for acidity and heartburn Effective for indigestion and loss of appetite Effective in constipation, nausea, flatulence and dyspepsia All Natural Product', '2023-10-07 21:02:33', '2023-10-07 21:02:33'),
(105, 58, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:03:29', '2023-10-07 21:03:29'),
(106, 84, 'Product Information', 'It is indicated Symptomatic relief of seasonal allergic rhinitis and Symptomatic relief of chronic idiopathic urticaria.', '2023-10-07 21:03:44', '2023-10-07 21:03:44'),
(108, 52, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:04:24', '2023-10-07 21:04:24'),
(109, 53, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:04:43', '2023-10-07 21:04:43'),
(110, 51, 'Product Information', 'NESTLÉ CERELAC recipes contain iron that helps in cognitive development of babies from 6 months onwards, along with their healthy physical growth', '2023-10-07 21:05:37', '2023-10-07 21:05:37'),
(116, 99, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:12:57', '2023-10-07 21:12:57'),
(118, 101, 'Product Information', 'Uses; neutralizes stomach acidity and is used to relieve heartburn, indigestion or an upset stomach.', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(119, 102, 'Product Information', 'Uses; neutralizes stomach acidity and is used to relieve heartburn, indigestion or an upset stomach.', '2023-10-07 21:23:01', '2023-10-07 21:23:01'),
(124, 107, 'Product Information', 'Omeprazole is a proton pump inhibitor drug that works by inhibiting secretion of gastric acid by irreversibly blocking the enzyme system of hydrogen/potassium adenosine triphosphatase, the “proton pump” of the gastric parietal cell. This drug is used', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(127, 110, 'Product Information', 'Omeprazole is a proton pump inhibitor drug that works by inhibiting secretion of gastric acid by irreversibly blocking the enzyme system of hydrogen/potassium adenosine triphosphatase, the “proton pump” of the gastric parietal cell. This drug is used', '2023-10-07 21:26:55', '2023-10-07 21:26:55'),
(130, 113, 'Product Information', 'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and s', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(134, 117, 'Product Information', 'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and s', '2023-10-07 21:30:39', '2023-10-07 21:30:39'),
(136, 119, 'Product Information', 'Triprolidine is an antihistamine used to relieve symptoms of allergy, hay fever, and the common cold. These symptoms include rash, watery eyes, itchy eyes/nose/throat/skin, cough, runny nose, and sneezing.', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(137, 120, 'Product Information', 'Triprolidine is an antihistamine used to relieve symptoms of allergy, hay fever, and the common cold. These symptoms include rash, watery eyes, itchy eyes/nose/throat/skin, cough, runny nose, and sneezing.', '2023-10-07 21:34:25', '2023-10-07 21:34:25'),
(143, 126, 'Product Information', 'It is indicated in Rheumatic and muscular pain, sprains, strains.', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(146, 129, 'Product Information', 'It is indicated in Rheumatic and muscular pain, sprains, strains.', '2023-10-07 21:39:18', '2023-10-07 21:39:18'),
(147, 130, 'Product Information', 'NESTLÉ CERELAC recipes contain iron that helps in cognitive development of babies from 6 months onwards, along with their healthy physical growth', '2023-10-07 21:42:46', '2023-10-07 21:42:46'),
(156, 127, 'Product Information', 'It is indicated in Rheumatic and muscular pain, sprains, strains.', '2023-10-07 21:53:10', '2023-10-07 21:53:10'),
(157, 125, 'Product Information', 'It is indicated in Rheumatic and muscular pain, sprains, strains.', '2023-10-07 21:53:20', '2023-10-07 21:53:20'),
(158, 124, 'Product Information', 'It is indicated in Rheumatic and muscular pain, sprains, strains.', '2023-10-07 21:53:31', '2023-10-07 21:53:31'),
(159, 123, 'Product Information', 'Triprolidine is an antihistamine used to relieve symptoms of allergy, hay fever, and the common cold. These symptoms include rash, watery eyes, itchy eyes/nose/throat/skin, cough, runny nose, and sneezing.', '2023-10-07 21:53:45', '2023-10-07 21:53:45'),
(161, 121, 'Product Information', 'Triprolidine is an antihistamine used to relieve symptoms of allergy, hay fever, and the common cold. These symptoms include rash, watery eyes, itchy eyes/nose/throat/skin, cough, runny nose, and sneezing.', '2023-10-07 21:54:14', '2023-10-07 21:54:14'),
(162, 118, 'Product Information', 'Triprolidine is an antihistamine used to relieve symptoms of allergy, hay fever, and the common cold. These symptoms include rash, watery eyes, itchy eyes/nose/throat/skin, cough, runny nose, and sneezing.', '2023-10-07 21:54:39', '2023-10-07 21:54:39'),
(163, 116, 'Product Information', 'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and s', '2023-10-07 21:54:56', '2023-10-07 21:54:56'),
(166, 115, 'Product Information', 'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and s', '2023-10-07 21:55:33', '2023-10-07 21:55:33'),
(167, 112, 'Product Information', 'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and s', '2023-10-07 21:55:43', '2023-10-07 21:55:43'),
(168, 111, 'Product Information', 'Omeprazole is a proton pump inhibitor drug that works by inhibiting secretion of gastric acid by irreversibly blocking the enzyme system of hydrogen/potassium adenosine triphosphatase, the “proton pump” of the gastric parietal cell. This drug is used', '2023-10-07 21:55:58', '2023-10-07 21:55:58'),
(169, 109, 'Product Information', 'Omeprazole is a proton pump inhibitor drug that works by inhibiting secretion of gastric acid by irreversibly blocking the enzyme system of hydrogen/potassium adenosine triphosphatase, the “proton pump” of the gastric parietal cell. This drug is used', '2023-10-07 21:56:12', '2023-10-07 21:56:12'),
(170, 106, 'Product Information', 'Omeprazole is a proton pump inhibitor drug that works by inhibiting secretion of gastric acid by irreversibly blocking the enzyme system of hydrogen/potassium adenosine triphosphatase, the “proton pump” of the gastric parietal cell. This drug is used', '2023-10-07 21:56:23', '2023-10-07 21:56:23'),
(171, 105, 'Product Information', 'Uses; neutralizes stomach acidity and is used to relieve heartburn, indigestion or an upset stomach.', '2023-10-07 21:56:34', '2023-10-07 21:56:34'),
(173, 103, 'Product Information', 'Uses; neutralizes stomach acidity and is used to relieve heartburn, indigestion or an upset stomach.', '2023-10-07 21:56:58', '2023-10-07 21:56:58'),
(174, 100, 'Product Information', 'Uses; neutralizes stomach acidity and is used to relieve heartburn, indigestion or an upset stomach.', '2023-10-07 21:57:10', '2023-10-07 21:57:10'),
(175, 97, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:57:36', '2023-10-07 21:57:36'),
(176, 96, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:57:51', '2023-10-07 21:57:51'),
(177, 94, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2023-10-07 21:58:04', '2023-10-07 21:58:04'),
(178, 93, 'Product Information', 'For prophylaxis and chronic treatment of Asthma. The prevention of exercise-induced bronchoconstriction. Allergic Rhinitis, Seasonal Allergic Rhinitis, Perennial Allergic Rhinitis.', '2023-10-07 21:58:22', '2023-10-07 21:58:22'),
(180, 89, 'Product Information', 'For prophylaxis and chronic treatment of Asthma. The prevention of exercise-induced bronchoconstriction. Allergic Rhinitis, Seasonal Allergic Rhinitis, Perennial Allergic Rhinitis.', '2023-10-07 21:58:43', '2023-10-07 21:58:43'),
(182, 86, 'Product Information', 'It is indicated Symptomatic relief of seasonal allergic rhinitis and Symptomatic relief of chronic idiopathic urticaria.', '2023-10-07 21:59:00', '2023-10-07 21:59:00'),
(183, 80, 'Product Information', 'It is indicated Symptomatic relief of seasonal allergic rhinitis and Symptomatic relief of chronic idiopathic urticaria.', '2023-10-07 21:59:13', '2023-10-07 21:59:13'),
(184, 81, 'Product Information', 'It is indicated Symptomatic relief of seasonal allergic rhinitis and Symptomatic relief of chronic idiopathic urticaria.', '2023-10-07 21:59:24', '2023-10-07 21:59:24'),
(185, 83, 'Product Information', 'It is indicated Symptomatic relief of seasonal allergic rhinitis and Symptomatic relief of chronic idiopathic urticaria.', '2023-10-07 21:59:33', '2023-10-07 21:59:33'),
(186, 72, 'Product Information', 'Flagyl 400 is an anti-infective medicine. It is used for the treatment of infections caused by bacteria and parasites. It is effective for the treatment of infection in different body parts, such as infection of the blood, stomach, intestine, tooth, skin,', '2023-10-07 21:59:54', '2023-10-07 21:59:54'),
(194, 132, 'Product Information', 'NESTLÉ CERELAC recipes contain iron that helps in cognitive development of babies from 6 months onwards, along with their healthy physical growth', '2024-04-05 14:54:00', '2024-04-05 14:54:00'),
(195, 128, 'Product Information', 'It is indicated in Rheumatic and muscular pain, sprains, strains.', '2024-04-05 14:54:16', '2024-04-05 14:54:16'),
(196, 131, 'Product Information', 'NESTLÉ CERELAC recipes contain iron that helps in cognitive development of babies from 6 months onwards, along with their healthy physical growth', '2024-04-05 14:58:20', '2024-04-05 14:58:20'),
(197, 122, 'Product Information', 'Triprolidine is an antihistamine used to relieve symptoms of allergy, hay fever, and the common cold. These symptoms include rash, watery eyes, itchy eyes/nose/throat/skin, cough, runny nose, and sneezing.', '2024-04-11 22:52:45', '2024-04-11 22:52:45'),
(198, 114, 'Product Information', 'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and s', '2024-04-11 22:53:17', '2024-04-11 22:53:17'),
(199, 108, 'Product Information', 'Omeprazole is a proton pump inhibitor drug that works by inhibiting secretion of gastric acid by irreversibly blocking the enzyme system of hydrogen/potassium adenosine triphosphatase, the “proton pump” of the gastric parietal cell. This drug is used', '2024-04-11 22:53:44', '2024-04-11 22:53:44'),
(200, 95, 'Product Information', 'It is commonly used for the diagnosis or treatment of blood impurity, skin eruptions, acne, pimples, heat rashes, skin blemishes. It has some side effects such as No Side Effects. The salts Herbs are involved in the preparation of Syr Safi.', '2024-04-11 22:55:11', '2024-04-11 22:55:11'),
(201, 82, 'Product Information', 'It is indicated Symptomatic relief of seasonal allergic rhinitis and Symptomatic relief of chronic idiopathic urticaria.', '2024-04-11 22:55:39', '2024-04-11 22:55:39'),
(202, 75, 'Product Information', 'Rheumatoid Arthritis, Osteoarthritis, Ankylosing Spondylitis, Acute Gout, Acute Musculo-Skeletal Disorders such as Periarthritis (for example frozen shoulder), Tendinitis, Tenosynovitis and Bursitis, other painful conditions resulting from; Trauma, includ', '2024-04-11 22:56:00', '2024-04-11 22:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `title`, `created_at`, `updated_at`) VALUES
(8, 8, 'Devices', '2023-10-06 14:14:04', '2023-10-06 14:14:04'),
(9, 8, 'Drips', '2023-10-06 14:14:24', '2023-10-06 14:14:24'),
(10, 8, 'injectables', '2023-10-06 14:14:57', '2023-10-06 14:14:57'),
(11, 8, 'supportive Appliances', '2023-10-06 14:16:23', '2023-10-06 14:16:23'),
(12, 8, 'Surgical And Solotions', '2023-10-06 14:17:04', '2023-10-06 14:17:04'),
(13, 11, 'Baby Care', '2023-10-06 14:17:41', '2023-10-06 14:17:41'),
(14, 11, 'Elderly care', '2023-10-06 14:18:09', '2023-10-06 14:18:09'),
(15, 11, 'Mother Care', '2023-10-06 14:18:29', '2023-10-06 14:18:29'),
(16, 14, 'Alternative Medicines', '2023-10-06 14:19:09', '2023-10-06 14:19:09'),
(17, 14, 'Herbal drugs', '2023-10-06 14:19:36', '2023-10-06 14:19:36'),
(18, 15, 'Female Hormonal And Reproductive Care', '2023-10-06 14:20:36', '2023-10-06 14:20:36'),
(19, 15, 'Female Hygiene', '2023-10-06 14:21:49', '2023-10-06 14:21:49'),
(20, 15, 'Male Hormonal And Reproductive Care', '2023-10-06 14:22:35', '2023-10-06 14:22:35'),
(21, 16, 'Consumers', '2023-10-06 14:22:59', '2023-10-06 14:22:59'),
(22, 16, 'Cosmetics', '2023-10-06 14:23:12', '2023-10-06 14:23:12'),
(23, 16, 'Edibles And Beverages', '2023-10-06 14:23:50', '2023-10-06 14:23:50'),
(24, 16, 'Households', '2023-10-06 14:24:08', '2023-10-06 14:24:08'),
(25, 13, 'Bone And Joint Point', '2023-10-06 14:24:40', '2023-10-06 14:24:40'),
(26, 13, 'Cardiac Care', '2023-10-06 14:25:01', '2023-10-06 14:25:01'),
(27, 13, 'Derma Care', '2023-10-06 14:25:19', '2023-10-06 14:25:19'),
(28, 13, 'Ent care', '2023-10-06 14:25:33', '2023-10-06 14:25:33'),
(29, 9, 'Ent And Eye', '2023-10-06 14:25:59', '2023-10-06 14:25:59'),
(30, 9, 'First Aid', '2023-10-06 14:26:17', '2023-10-06 14:26:17'),
(31, 9, 'Gastric', '2023-10-06 14:26:48', '2023-10-06 14:26:48'),
(32, 9, 'General Aid', '2023-10-06 14:27:14', '2023-10-06 14:27:14'),
(33, 9, 'Pain And Fever', '2023-10-06 14:27:32', '2023-10-06 14:27:32'),
(34, 9, 'Topicals', '2023-10-06 14:27:46', '2023-10-06 14:27:46'),
(35, 12, 'Hair And Nails Care', '2023-10-06 14:28:24', '2023-10-06 14:28:24'),
(36, 12, 'Oral Hygiene', '2023-10-06 14:28:47', '2023-10-06 14:28:47'),
(37, 12, 'Skin Care', '2023-10-06 14:29:04', '2023-10-06 14:29:04'),
(38, 12, 'Supplements', '2023-10-06 14:29:35', '2023-10-06 14:29:35'),
(39, 12, 'Weight management', '2023-10-06 14:30:18', '2023-10-06 14:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `term_conditions`
--

CREATE TABLE `term_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_conditions`
--

INSERT INTO `term_conditions` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Morbi dignissim dignissim ipsum, eget lacinia odio efficitur ac.', '2023-06-16 01:33:36', '2023-06-16 01:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `fcm` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone_no`, `address`, `latitude`, `longitude`, `is_active`, `fcm`, `created_at`, `updated_at`) VALUES
(3, 'muhammad ali', 'aliashraf20026@gmail.com', '$2y$10$JzVBDCByX5bMiZ1Fz91Oy.KHvXbCEoCTkb0Zxrf7q8m/nCH34hj/C', '03348058699', '546 J3 JOHAR TOWN,LAHORE', NULL, NULL, '1', NULL, '2023-06-20 19:17:17', '2023-06-20 19:17:17'),
(5, 'mujahid', 'mujah@gmail.com', '$2y$10$TN1KjW9g4eDSe9aOA//NduliZx8kHLVPJRTP0h1u3CZrCR9oevS7y', '2345678', 'lahore', NULL, NULL, '0', NULL, '2023-06-23 11:22:56', '2023-06-23 11:22:56'),
(6, 'rameez', 'rameez@gmail.com', '$2y$10$El/n9bRTpAADzeyie.42P.aIJsk163EFYfguUoXj2e24C9Kj8X7lu', '2345678', 'lahore', NULL, NULL, '0', NULL, '2023-06-23 11:42:29', '2023-06-23 11:42:29'),
(7, 'rameez', 'shakar@gmail.com', '$2y$10$L.OxKAuc1XHxAp5glXQsRO4DXhL/DEho1jPF8/PqZbMNZDPYt/hh6', '2345678', 'lahore', NULL, NULL, '0', NULL, '2023-06-23 11:49:47', '2023-06-23 11:49:47'),
(8, 'shakar', 'ali@gmail.com', '$2y$10$CzAhrhvl5mQUGudsPYbSc.C6uyEykwCnVm0IZhAJjNYJ8wdr94okC', '03216556987', 'lahore', NULL, NULL, '1', NULL, '2023-06-23 12:09:46', '2023-06-23 13:26:42'),
(9, 'majad', 'majad@gmail.com', '$2y$10$txPRarzjriVhhkZeSxaAEea3BIPU7nGlio7u6EpD/jBNTT0PuJQQu', '2345678', 'lahore', NULL, NULL, '1', NULL, '2023-06-24 09:49:16', '2023-06-24 09:49:16'),
(10, 'arshad', 'arshad@gmail.com', '$2y$10$3NI4CVCiF1Pteww64NXg.OAxecJUumiKnTd6jBvcKHLPDAzfOQ4ga', '2345678', 'lahore', NULL, NULL, '1', NULL, '2023-06-24 09:54:02', '2023-06-24 09:54:02'),
(11, 'adnan', 'adnan@gmail.com', '$2y$10$aF2IxldffYk4J077BuspYeZ8v4R6fGzZJLTENZLq9S9QhkWzqmcjW', '2345678', 'lahore', NULL, NULL, '1', NULL, '2023-06-24 12:33:41', '2023-06-24 12:35:46'),
(12, 'Rameez', 'rameez.ranglerz@gmail.com', '$2y$10$1MdVk.GJ6SDVJi16x8LQ2.d7IZyZfJL.vH/gv4cxZmhUM/34uO4GO', '2345678', 'lahore', NULL, NULL, '1', NULL, '2023-06-24 14:51:25', '2023-07-04 09:51:20'),
(13, 'rameez', 'shakar2@gmail.com', '$2y$10$fZ5e4NLg5cwEZCh8LPfXt.ottQAcNzxkLlWTNlYpASlLLc6RJKr7O', '2345678', 'lahore', NULL, NULL, '1', NULL, '2023-06-24 15:32:49', '2023-06-24 15:32:49'),
(14, 'Danial', 'daniyalbabar@gmail.com', '$2y$10$t/j1dE4d4ZeIwSAMR4Ff8eOXMHWGxFLyUhHetXuQgre6h0NgOZusa', '1234567890', 'lahore', NULL, NULL, '1', NULL, '2023-06-26 11:42:29', '2023-06-26 11:42:29'),
(15, 'Danial', 'fahadhaidar786@gmail.com', '$2y$10$YFmNDp/F6.xj663JwwRTcOURTrSDLlNRbxasxWLmneOVnOugcPb4m', '03487729425', NULL, NULL, NULL, '1', NULL, '2023-06-26 11:47:07', '2023-06-26 11:47:07'),
(16, 'Danial', 'daniyalbabar9@gmail.com', '$2y$10$N6gIV41biwVRqmbKpw1zmOxtTX05xDW.TPtp8K2C/Y.cmXR8wTvgC', '03457232962', NULL, NULL, NULL, '1', 'cDIJqOkBQiixHZvP2RD1TC:APA91bF1OJ6hIow6VXLL_YWcj2m1H8fOrWWyfbbq_2HRIeVaYuZiHViioT_CEW34DbHfL2WSxs85QkB_OZFHrBstSbC-Td-IBnWVURra5aZBu0IcWiSWw0FV3jczXDrQBh_d2Rds5gTk', '2023-07-03 10:11:29', '2024-04-04 10:57:00'),
(17, 'shakar', 'naeem.ranglerz@gmail.com', '$2y$10$8ctmBx/60bvWUJNhOF846Oa/7hDWH3/VRaAgL86P6Fyw1Smn3Czri', '03216556987', 'lahore', NULL, NULL, '1', NULL, '2023-07-03 10:43:00', '2023-07-04 10:24:04'),
(18, 'Shahroz', 'rameezshakar@gmail.com', '$2y$10$7Z2fHJ7HvijtvdOzd3Z3CuzZgC3nJAQWPQbO7FXYWwuyWdkE0nu/C', '2345678', 'lahore', NULL, NULL, '1', NULL, '2023-09-06 15:19:22', '2023-09-06 15:19:22'),
(19, 'Basit', 'basitwattoo2119@gmail.com', '$2y$10$zaf/hYC06N7iwGKK/mJQx.wL.PdVbLNlwHru.f15UY371hd5d/rfq', '03001514443', NULL, NULL, NULL, '1', 'fO2DOAGBSV2l761lbLNkPw:APA91bGf6Iv2MAJAY9X62ueJj2_kAyJNgV5VS34zl5uIUa4PKrs08zxog3WofGzKMqy5PYGbsWnTh8q0k8zj77qaFwyAxsGAWcXZhnQFrC-cAbR1REXz05BFWnnDIWJ2sNsWg4SFzvLP', '2024-04-05 14:03:26', '2024-04-05 14:03:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_details_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `offer_products`
--
ALTER TABLE `offer_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_detail_id_foreign` (`product_detail_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_instructions`
--
ALTER TABLE `product_instructions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_instructions_product_id_foreign` (`product_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `term_conditions`
--
ALTER TABLE `term_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `offer_products`
--
ALTER TABLE `offer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `product_instructions`
--
ALTER TABLE `product_instructions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `term_conditions`
--
ALTER TABLE `term_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_details`
--
ALTER TABLE `account_details`
  ADD CONSTRAINT `account_details_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offer_products`
--
ALTER TABLE `offer_products`
  ADD CONSTRAINT `offer_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_detail_id_foreign` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_instructions`
--
ALTER TABLE `product_instructions`
  ADD CONSTRAINT `product_instructions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
