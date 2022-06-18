-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2022 at 10:16 AM
-- Server version: 10.3.34-MariaDB-log-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plankjxj_property_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_class_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lease_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_classes`
--

CREATE TABLE `account_classes` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `closed_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_classes`
--

INSERT INTO `account_classes` (`id`, `name`, `category`, `closed_on`, `deleted_at`, `created_at`, `updated_at`) VALUES
('7c4712ab-3ad8-4536-a151-56a2584e349b', 'ASSET', 'DR', NULL, NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('7d79389e-418e-42ad-92de-863bf45fdebd', 'EXPENDITURE', 'DR', NULL, NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('9025cd14-0509-463e-8c58-c6e8ffd97a64', 'LIABILITY', 'CR', NULL, NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('ce0dadee-7eb9-4e9e-ba69-09e9ae00dd1c', 'INCOME', 'CR', NULL, NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_class_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenity_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenity_display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amenity_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `amenity_name`, `amenity_display_name`, `amenity_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('09eb17b0-1480-49d7-84f7-63a846fab181', 'pool', 'Pool', 'Pool', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('13cc2abe-b84f-4c79-bfe3-811b81c934f7', 'wheelchair_access', 'Wheelchair Access', 'Wheelchair Access', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('3639561e-0a3a-4302-80b6-84107b72c6d1', 'a_c', 'A/C', 'A/C', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('4183c532-6243-47ae-8095-d20de7d4162e', 'furnished', 'Furnished', 'Furnished', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('6f238bf3-529f-4090-81f6-cc0d9a97a102', 'parking', 'Parking', 'Parking', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('a2fa458f-604e-413c-95f8-f90b129cf3d1', 'balcony', 'Balcony/Deck', 'Balcony/Deck', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('cc9b03a0-fa58-4269-ada3-e531a1aede6d', 'pets_allowed', 'Pets Allowed', 'Pets Allowed', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('d6298af9-ce7b-4c22-b418-37bf0d59ec49', 'hardwood_floor', 'Hardwood Floor', 'Hardwood Floor', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `amenity_unit`
--

CREATE TABLE `amenity_unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `amenity_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communication_settings`
--

CREATE TABLE `communication_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_template` tinyint(1) NOT NULL DEFAULT 0,
  `sms_template` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communication_settings`
--

INSERT INTO `communication_settings` (`id`, `name`, `display_name`, `email_template`, `sms_template`, `deleted_at`, `created_at`, `updated_at`) VALUES
('2e096e48-9056-411c-b8cf-d2a6c4a9db9a', 'system_summary', 'System Summary', 0, 0, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('6019c4c4-76a7-4b08-a6cf-e5afd96b5ec0', 'New Landlord', 'New Landlord', 1, 0, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('6620db39-262a-474c-b264-cc2b60b6c084', 'new_user_welcome', 'New User Welcome', 1, 0, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('66d40d3e-46d5-495e-b9fe-bc88be1976a8', 'reset_password', 'Reset Password', 1, 0, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('6a7b07c0-3740-4918-92d6-c703b15cf862', 'new_loan_application', 'New Loan Application', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('7bb8a771-67c9-4df3-a97b-8ede1a654c0d', 'payment_received', 'Payment Received', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('9b9137e4-6314-4a80-a31a-b0f8f4508918', 'loan_application_rejected', 'Loan Application Rejected', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('c23d7af4-048c-48b6-a18d-39526d6cbc8b', 'loan_application_approved', 'Loan Application Approved', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_config_settings`
--

CREATE TABLE `email_config_settings` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_gun_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_gun_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mandrill_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_config_settings`
--

INSERT INTO `email_config_settings` (`id`, `protocol`, `smpt_host`, `smpt_username`, `smpt_password`, `smpt_port`, `mail_gun_domain`, `mail_gun_secret`, `mandrill_secret`, `from_name`, `from_email`, `deleted_at`, `created_at`, `updated_at`) VALUES
('f67d7934-e06d-4b8b-9708-c47c699cd275', 'smtp', 'sendmail.gmail.com', 'gmasdfa@gmail.com', 'dsfasdf', '222', '', '', '', '', '', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `display_name`, `subject`, `body`, `tags`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
('1ac84b61-eaa6-4d8c-b9b5-dc01f71c538d', 'New Invoice', 'New Invoice', 'Invoice have been generated', 'Hi {first_name}, Invoice have been generated.', '{first_name}, {middle_name}, {last_name}, {phone}, {period_name}, {invoice_date}, {due_date}, {invoice_number}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('50f16304-20a6-4f4f-934e-6dc369b5536f', 'New Landlord', 'New Landlord', 'New landlord welcome', 'New landlord welcome', '{first_name}, {middle_name}, {last_name}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('56a5d681-4b67-4140-90bc-0c3af8a2dc0a', 'Terminate Lease', 'Terminate Lease', 'TERMINATE_LEASE.', 'TERMINATE_LEASE', '{lease_number}, {start_date}, {rent_amount}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('5e78be2e-5509-4974-80da-1618ebd00acc', 'Over Due Invoice', 'Over Due Invoice', 'Over Due invoice', 'You have an overdue invoice', '{first_name}, {middle_name}, {last_name}, {phone}, {amount_applied}, {repayment_period}, {loan_type}, {interest_rate}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('92880b04-be7f-45bd-b57b-fc0bd6ba3a86', 'New Property', 'New Property', 'NEW_PROPERTY', ' NEW_PROPERTY', '{property_code},{property_name}, {location}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('ada9b6de-b074-4b05-91ab-dbf40e92968b', 'Due Invoice', 'Due Invoice', 'Invoice is due', 'Hello {first_name}, Invoice is due', '{first_name}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('b3c69944-74f5-4d87-82d4-a40fe4dee68f', 'Receive Payment', 'Receive Payment', 'RECEIVE_PAYMENT', ' RECEIVE_PAYMENT', '{amount},{payment_date},{lease_number},{receipt_number}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('b7cc8dc6-e519-4d8e-9bcc-f937a1dc7fe4', 'Reset Password', 'Reset Password', 'RESET_PASSWORD', 'Your token to reset password is: {token}', '{token}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('be4f6fc7-85ce-4111-b5ba-8e9afab9651b', 'New Lease', 'New Lease', 'New Lease created', 'New Lease created', '{lease_number}, {start_date}, {rent_amount},{due_on}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('d2867786-f5e9-45ba-97e5-bb26421a67cf', 'New Vacate Notice', 'New Vacate Notice', 'NEW_VACATE_NOTICE', ' NEW_VACATE_NOTICE', '{vacating_date},{vacating_reason},{unit}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('e9d6b535-d676-4dc3-9436-e651ee6ae1bc', 'New Tenant', 'New Tenant', 'New tenant Welcome', 'Hi {first_name}, Welcome.', '{first_name}, {middle_name}, {last_name}, {phone}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `extra_charges`
--

CREATE TABLE `extra_charges` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_charges`
--

INSERT INTO `extra_charges` (`id`, `extra_charge_name`, `extra_charge_display_name`, `extra_charge_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('351732fc-0f96-4569-99e0-620a8f412382', 'Processing Fee', 'Processing Fee', 'Processing Fee', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('d0fa76ce-8d2c-43e2-b69b-82b966cfbced', 'VAT', 'VAT', 'VAT', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('ef727b20-c6f5-4bb8-aa46-c4c2a9e79de2', 'Service Fee', 'Service Fee', 'Service Fee', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `extra_charge_properties`
--

CREATE TABLE `extra_charge_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `extra_charge_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_charge_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_charge_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_decimal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `company_name`, `company_type`, `email`, `currency`, `phone`, `physical_address`, `postal_address`, `website_url`, `postal_code`, `logo`, `favicon`, `date_format`, `amount_thousand_separator`, `amount_decimal_separator`, `amount_decimal`, `theme`, `language`, `deleted_at`, `created_at`, `updated_at`) VALUES
('e1a4dde1-d8c8-44ed-8379-33f2fbb2bfef', 'Property Management Application', 'Property Management', 'sdbappi69@gmail.com', 'BDT', '+8801763456950', 'Rampura, Dhaka', 'Rampura, Dhaka, Bangladesh', 'www.planet0088.com', '1000', NULL, NULL, 'd-m-Y', ',', '.', '2', NULL, NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `paid_on` datetime DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_items` double NOT NULL DEFAULT 0,
  `sub_total` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0,
  `total_discount` double NOT NULL DEFAULT 0,
  `invoice_amount` double NOT NULL DEFAULT 0,
  `late_fee_charged_on` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lease_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `tax_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `paid_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_account_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_account_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `narration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landlords`
--

CREATE TABLE `landlords` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `late_fees`
--

CREATE TABLE `late_fees` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `late_fee_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `late_fee_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `late_fee_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `late_fees`
--

INSERT INTO `late_fees` (`id`, `late_fee_name`, `late_fee_display_name`, `late_fee_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9a011099-ee28-4ed4-9bfb-9e1058987810', 'Penalty', 'Penalty', 'Penalty', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `late_fee_properties`
--

CREATE TABLE `late_fee_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `late_fee_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grace_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_value` double DEFAULT 0,
  `late_fee_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leases`
--

CREATE TABLE `leases` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landlord_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_type_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_mode_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lease_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_billing_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billed_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terminated_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terminated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent_deposit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waive_penalty` tinyint(1) NOT NULL DEFAULT 0,
  `skip_starting_period` tinyint(1) NOT NULL DEFAULT 0,
  `generate_invoice_on` int(11) DEFAULT NULL,
  `next_period_billing` tinyint(1) NOT NULL DEFAULT 0,
  `agreement_doc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_footer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_payment_method_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease_extra_charges`
--

CREATE TABLE `lease_extra_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_value` double DEFAULT 0,
  `extra_charge_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charge_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease_late_fees`
--

CREATE TABLE `lease_late_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `late_fee_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `late_fee_value` double DEFAULT 0,
  `grace_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease_modes`
--

CREATE TABLE `lease_modes` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_mode_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_mode_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_mode_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lease_modes`
--

INSERT INTO `lease_modes` (`id`, `lease_mode_name`, `lease_mode_display_name`, `lease_mode_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0c92f060-c298-455a-97a9-f5b20b75965f', 'fixed_period', 'Fixed Period', 'Fixed Period', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('e9a639f5-c9e1-48a0-a087-2a211c09174c', 'period_period', 'Period to Period', 'Period to Period', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `lease_settings`
--

CREATE TABLE `lease_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lease_number_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_footer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_invoice_on` int(11) DEFAULT NULL,
  `show_payment_method_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `next_period_billing` tinyint(1) NOT NULL DEFAULT 0,
  `skip_starting_period` tinyint(1) NOT NULL DEFAULT 0,
  `waive_penalty` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lease_settings`
--

INSERT INTO `lease_settings` (`id`, `agent_id`, `lease_number_prefix`, `invoice_number_prefix`, `invoice_footer`, `invoice_terms`, `generate_invoice_on`, `show_payment_method_on_invoice`, `next_period_billing`, `skip_starting_period`, `waive_penalty`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0e905650-0a49-45bb-a57a-2910ac167f43', NULL, 'LS', 'INV', 'xxxx footer', 'yyy terms', 25, 1, 1, 0, 0, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `lease_tenants`
--

CREATE TABLE `lease_tenants` (
  `id` int(10) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease_types`
--

CREATE TABLE `lease_types` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_type_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_type_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lease_types`
--

INSERT INTO `lease_types` (`id`, `lease_type_name`, `lease_type_display_name`, `lease_type_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('84488f16-4094-42f1-88a3-dd7c75d855f4', 'commercial', 'Commercial', 'Commercial', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('dbbc34ca-b82b-41f4-9e86-88fdb14bf11e', 'residential', 'Residential', 'Residential', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `lease_units`
--

CREATE TABLE `lease_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease_utility_charges`
--

CREATE TABLE `lease_utility_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_unit_cost` double DEFAULT 0,
  `utility_base_fee` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease_utility_deposits`
--

CREATE TABLE `lease_utility_deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit_amount` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_id` int(11) NOT NULL,
  `created_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenancies`
--

CREATE TABLE `maintenancies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_01_28_203842_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2018_01_28_203941_create_permissions_table', 1),
(10, '2018_01_28_205009_create_permission_role_table', 1),
(11, '2018_01_30_155315_alter_table_oauth_auth_codes', 1),
(12, '2018_01_30_155318_alter_table_oauth_access_tokens', 1),
(13, '2018_01_30_155318_alter_table_oauth_clients', 1),
(14, '2018_01_30_155318_alter_table_oauth_personal_access_clients', 1),
(15, '2019_08_02_071815_create_accounts_table', 1),
(16, '2019_08_02_073517_create_account_types_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2019_08_28_114622_create_account_classes_table', 1),
(19, '2020_04_14_093340_create_property_categories_table', 1),
(20, '2020_04_14_093352_create_property_types_table', 1),
(21, '2020_05_03_192457_create_invoices_table', 1),
(22, '2020_05_03_192529_create_landlords_table', 1),
(23, '2020_05_03_192558_create_properties_table', 1),
(24, '2020_05_03_192616_create_tenants_table', 1),
(25, '2020_05_03_202833_create_maintenancies_table', 1),
(26, '2020_05_13_083504_create_leases_table', 1),
(27, '2020_05_13_083714_create_units_table', 1),
(28, '2020_05_15_190504_create_utilities_table', 1),
(29, '2020_05_15_190720_create_fees_table', 1),
(30, '2020_05_15_200643_create_amenities_table', 1),
(31, '2020_05_16_221511_create_amenity_unit_table', 1),
(32, '2020_05_16_221541_create_unit_utility_table', 1),
(33, '2020_05_22_094300_create_unit_types_table', 1),
(34, '2020_05_22_094327_create_tenant_types_table', 1),
(35, '2020_05_22_094351_create_lease_types_table', 1),
(36, '2020_05_22_094403_create_lease_modes_table', 1),
(37, '2020_05_22_143845_create_payment_frequencies_table', 1),
(38, '2020_05_22_143913_create_payment_methods_table', 1),
(39, '2020_05_28_184345_create_utility_bills_table', 1),
(40, '2020_12_16_074837_create_payment_method_properties_table', 1),
(41, '2020_12_16_074912_create_property_utility_costs_table', 1),
(42, '2020_12_16_074940_create_extra_charge_properties_table', 1),
(43, '2020_12_16_133847_create_extra_charges_table', 1),
(44, '2020_12_25_073315_create_unit_utility_bills', 1),
(45, '2020_12_28_054727_create_invoice_items_table', 1),
(46, '2020_12_29_084625_create_journals_table', 1),
(47, '2020_12_31_071728_create_ledgers_table', 1),
(48, '2021_01_02_074434_create_lease_units_table', 1),
(49, '2021_01_02_074503_create_lease_tenants_table', 1),
(50, '2021_01_02_074529_create_lease_utility_deposits_table', 1),
(51, '2021_01_02_074538_create_lease_utility_charges_table', 1),
(52, '2021_01_02_074550_create_lease_extra_charges_table', 1),
(53, '2021_02_03_042244_create_tasks_table', 1),
(54, '2021_05_02_084115_create_currencies_table', 1),
(55, '2021_06_03_081259_create_payments_table', 1),
(56, '2021_06_06_042903_create_general_settings_table', 1),
(57, '2021_06_15_134007_create_task_categories', 1),
(58, '2021_06_15_135245_create_vacation_notices', 1),
(59, '2021_06_17_120210_create_property_settings_table', 1),
(60, '2021_06_17_120238_create_tenant_settings_table', 1),
(61, '2021_06_17_120248_create_lease_settings_table', 1),
(62, '2021_06_19_094831_create_email_config_settings_table', 1),
(63, '2021_06_19_094910_create_sms_config_settings_table', 1),
(64, '2021_06_19_095039_create_sms_templates_table', 1),
(65, '2021_06_19_095058_create_email_templates_table', 1),
(66, '2021_06_19_095315_create_communication_settings_table', 1),
(67, '2021_06_20_093201_create_readings_table', 1),
(68, '2021_06_30_050705_create_transactions_table', 1),
(69, '2021_07_10_093644_create_system_notifications_table', 1),
(70, '2021_07_12_232738_create_documents_table', 1),
(71, '2021_07_16_073131_create_periods_table', 1),
(72, '2021_07_16_073935_create_period_properties_table', 1),
(73, '2021_07_27_094644_create_late_fees_table', 1),
(74, '2021_07_27_094811_create_late_fee_properties_table', 1),
(75, '2021_07_27_094908_create_lease_late_fees_table', 1),
(76, '2021_07_30_052233_create_waivers_table', 1),
(77, '2021_08_03_151049_create_payment_method_leases', 1),
(78, '2021_08_25_133913_create_paypal_payments', 1),
(79, '2021_08_26_151512_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`, `user_id`) VALUES
('a90e532aef13c7f4fcdc188c1e52b7f56c6aebb408a39e8d4a6b69136cb124c4d76300234cc4ce4a', '1', NULL, '[\"delete-tenant\",\"create-landlord\",\"edit-profile\",\"edit-tenant\",\"create-tenant\",\"create-payment\",\"view-payment\",\"edit-notice\",\"delete-lease\",\"edit-landlord\",\"create-property\",\"view-report\",\"view-property\",\"view-lease\",\"create-notice\",\"terminate-lease\",\"create-lease\",\"view-notice\",\"approve-payment\",\"delete-property\",\"edit-property\",\"manage-setting\",\"view-reading\",\"view-landlord\",\"delete-landlord\",\"edit-reading\",\"delete-notice\",\"cancel-payment\",\"delete-reading\",\"view-invoice\",\"view-tenant\",\"create-reading\",\"waive-invoice\",\"edit-lease\",\"view-dashboard\"]', 0, '2022-06-18 21:10:41', '2022-06-18 21:10:41', '2022-06-18 22:10:41', '99d0f5ea-6372-4dda-a56c-fe5394ceb92f');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Laravel Admin Client', 'nS0OJ8ENy2ESewUfsKF7Rtv54Fe6uMdtwozLW6Zu', 'users', 'http://localhost', 0, 1, 0, '2022-06-18 21:02:45', '2022-06-18 21:02:45', NULL),
(2, 'Laravel Landlord Client', 'DRj7cXqCDDYakIYObLLYihduiO1HnqxB4ZL5RN8S', 'landlords', 'http://localhost', 0, 1, 0, '2022-06-18 21:02:45', '2022-06-18 21:02:45', NULL),
(3, 'Laravel Tenant Client', 'ujvsT60pL0VOW5o1hQ8yR5B5QJux2mH9QE69d3iU', 'tenants', 'http://localhost', 0, 1, 0, '2022-06-18 21:02:45', '2022-06-18 21:02:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('05d47ba0fe658b8c45c3e903940b591a56bb10609817d1d7257533b996be13a843301cb3c7971206', 'a90e532aef13c7f4fcdc188c1e52b7f56c6aebb408a39e8d4a6b69136cb124c4d76300234cc4ce4a', 0, '2022-06-18 22:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lease_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('approved','pending','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cancel_notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_frequencies`
--

CREATE TABLE `payment_frequencies` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_frequency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_frequency_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_frequency_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_frequencies`
--

INSERT INTO `payment_frequencies` (`id`, `payment_frequency_name`, `payment_frequency_display_name`, `payment_frequency_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('112dbb7e-656a-4170-8715-be62467aac8a', 'monthly', 'Monthly', 'Monthly', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('f0ae13f0-19de-4d15-b000-f1bfc3b26263', 'weekly', 'Weekly', 'Weekly', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `payment_method_name`, `payment_method_display_name`, `payment_method_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('d9813dfd-7d0e-4f89-a414-9109ab39777a', 'cash', 'Cash', 'Cash', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method_leases`
--

CREATE TABLE `payment_method_leases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lease_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method_properties`
--

CREATE TABLE `payment_method_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

CREATE TABLE `paypal_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_seller_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_order_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_referer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `period_properties`
--

CREATE TABLE `period_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `period_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0567b9a5-2899-4b8f-866b-f7e98fc97d2a', 'delete-tenant', 'delete-tenant', 'delete-tenant', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('21736ddc-65a8-44a6-aa45-080e95f0db47', 'create-landlord', 'create-landlord', 'create-landlord', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('2497213a-524d-40d4-9e4a-68379777a3c4', 'edit-profile', 'edit-profile', 'edit-profile', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('2b08f355-4c2a-41d3-91b6-41a8f068bb4c', 'edit-tenant', 'edit-tenant', 'edit-tenant', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('2d35dc8c-4cfc-4dee-b255-c682a707c256', 'create-tenant', 'create-tenant', 'create-tenant', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('382a517e-cca3-440c-8d26-4458cb529f1d', 'create-payment', 'create-payment', 'create-payment', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('4035e8bd-872e-4023-b0e4-517daeaff7db', 'view-payment', 'view-payment', 'view-payment', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('426cebfb-d420-41a2-87d1-4753788ae859', 'edit-notice', 'edit-notice', 'edit-notice', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('4438df8a-6b37-4a47-b5c1-6d6c81f525c4', 'delete-lease', 'delete-lease', 'delete-lease', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('467e573e-deb3-49fe-813c-8393fad5ac73', 'edit-landlord', 'edit-landlord', 'edit-landlord', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('52933ad3-e060-40a6-bbc5-e58aae1dbaba', 'create-property', 'create-property', 'create-property', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('52a4f5aa-acf6-4a85-9d16-e2390c3646dc', 'view-report', 'view-report', 'view-report', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('53036294-b59d-450f-be21-90d532029848', 'view-property', 'view-property', 'view-property', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('55760a58-133c-483b-8768-73bc114808ba', 'view-lease', 'view-lease', 'view-lease', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('5cbf2100-d202-4646-88f7-5a95145bb3cf', 'create-notice', 'create-notice', 'create-notice', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('5fa51755-3d40-4d96-93b6-6c64f2aec067', 'terminate-lease', 'terminate-lease', 'terminate-lease', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('61c34692-d21d-4199-8c61-1378329fdd28', 'create-lease', 'create-lease', 'create-lease', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('623c2c43-0870-4e9e-9fd5-54f8e54b2c2d', 'view-notice', 'view-notice', 'view-notice', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('780dcd91-156d-487a-a34e-57bce9e5b76d', 'approve-payment', 'approve-payment', 'approve-payment', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('9f49c519-3f22-430f-a292-0cee082b3ee3', 'delete-property', 'delete-property', 'delete-property', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('aad982d5-ce70-4e13-ba03-c94d475a6cdc', 'edit-property', 'edit-property', 'edit-property', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('b33d4891-6d09-46e4-99cb-edd42893b3b1', 'manage-setting', 'manage-setting', 'manage-setting', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('b5484a53-1733-4788-8286-4a1a6151db0a', 'view-reading', 'view-reading', 'view-reading', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('b65201f3-8c22-4c70-a10d-6c630fd9ce36', 'view-landlord', 'view-landlord', 'view-landlord', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('bf162859-8192-4d80-84e2-ba03e90e4c05', 'delete-landlord', 'delete-landlord', 'delete-landlord', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('c4b4a110-a606-4bad-8646-989f0c56a29d', 'edit-reading', 'edit-reading', 'edit-reading', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('d1e81a48-b27f-4056-8583-613aeeff6f10', 'delete-notice', 'delete-notice', 'delete-notice', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('d39d5496-83ed-4a3e-8900-737ee9685025', 'cancel-payment', 'cancel-payment', 'cancel-payment', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('d5eee2d1-4b17-4d96-83e7-540d99a9aaf1', 'delete-reading', 'delete-reading', 'delete-reading', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('d78eabc0-9582-428b-a265-3df696d366c4', 'view-invoice', 'view-invoice', 'view-invoice', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('e1c89269-7758-47dd-a96a-733589af2295', 'view-tenant', 'view-tenant', 'view-tenant', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('e7ab62d3-8c9d-40c0-ba57-b2a1db154e92', 'create-reading', 'create-reading', 'create-reading', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('f10283b3-8749-4199-a59a-c217e3826fb1', 'waive-invoice', 'waive-invoice', 'waive-invoice', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43'),
('f8f6cdf0-8793-48df-8d19-ff10c276c78c', 'edit-lease', 'edit-lease', 'edit-lease', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, '0567b9a5-2899-4b8f-866b-f7e98fc97d2a', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(2, '21736ddc-65a8-44a6-aa45-080e95f0db47', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(3, '2497213a-524d-40d4-9e4a-68379777a3c4', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(4, '2b08f355-4c2a-41d3-91b6-41a8f068bb4c', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(5, '2d35dc8c-4cfc-4dee-b255-c682a707c256', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(6, '382a517e-cca3-440c-8d26-4458cb529f1d', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(7, '4035e8bd-872e-4023-b0e4-517daeaff7db', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(8, '426cebfb-d420-41a2-87d1-4753788ae859', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(9, '4438df8a-6b37-4a47-b5c1-6d6c81f525c4', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(10, '467e573e-deb3-49fe-813c-8393fad5ac73', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(11, '52933ad3-e060-40a6-bbc5-e58aae1dbaba', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(12, '52a4f5aa-acf6-4a85-9d16-e2390c3646dc', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(13, '53036294-b59d-450f-be21-90d532029848', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(14, '55760a58-133c-483b-8768-73bc114808ba', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(15, '5cbf2100-d202-4646-88f7-5a95145bb3cf', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(16, '5fa51755-3d40-4d96-93b6-6c64f2aec067', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(17, '61c34692-d21d-4199-8c61-1378329fdd28', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(18, '623c2c43-0870-4e9e-9fd5-54f8e54b2c2d', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(19, '780dcd91-156d-487a-a34e-57bce9e5b76d', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(20, '9f49c519-3f22-430f-a292-0cee082b3ee3', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(21, 'aad982d5-ce70-4e13-ba03-c94d475a6cdc', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(22, 'b33d4891-6d09-46e4-99cb-edd42893b3b1', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(23, 'b5484a53-1733-4788-8286-4a1a6151db0a', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(24, 'b65201f3-8c22-4c70-a10d-6c630fd9ce36', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(25, 'bf162859-8192-4d80-84e2-ba03e90e4c05', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(26, 'c4b4a110-a606-4bad-8646-989f0c56a29d', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(27, 'd1e81a48-b27f-4056-8583-613aeeff6f10', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(28, 'd39d5496-83ed-4a3e-8900-737ee9685025', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(29, 'd5eee2d1-4b17-4d96-83e7-540d99a9aaf1', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(30, 'd78eabc0-9582-428b-a265-3df696d366c4', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(31, 'e1c89269-7758-47dd-a96a-733589af2295', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(32, 'e7ab62d3-8c9d-40c0-ba57-b2a1db154e92', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(33, 'f10283b3-8749-4199-a59a-c217e3826fb1', 'c298e809-5d85-4f2a-857b-c8270658dadb'),
(34, 'f8f6cdf0-8793-48df-8d19-ff10c276c78c', 'c298e809-5d85-4f2a-857b-c8270658dadb');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landlord_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_type_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_commission_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_categories`
--

CREATE TABLE `property_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_settings`
--

CREATE TABLE `property_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_commission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_property_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('2d8c546b-fa4b-4903-861a-91d51a2afc59', 'mixed-use', 'Mixed Use', 'Mixed Use', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('674f8b59-2027-4ffc-bc7a-498a22fab95c', 'apartment', 'Apartment', 'Apartment', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('79239486-5be1-46f7-9533-ac893263559c', 'commercial', 'Commercial', 'Commercial', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('93c101f6-c276-4dc6-b882-a4dc6a855574', 'duplex', 'Duplex', 'Duplex', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('caff5caa-dcdc-48c7-b258-58056ce905df', 'other', 'Other', 'Other', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('f2e6d70a-0037-4898-ba5a-7e601a9a44c0', 'house', 'House', 'House', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `property_utility_costs`
--

CREATE TABLE `property_utility_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `utility_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_unit_cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility_base_fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `readings`
--

CREATE TABLE `readings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reading_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_reading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('c298e809-5d85-4f2a-857b-c8270658dadb', 'Admin', 'Admin', 'site admin', NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `sms_config_settings`
--

CREATE TABLE `sms_config_settings` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `name`, `display_name`, `body`, `tags`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
('13e66d15-41ed-4c97-9f4e-6bdbc890a6a2', 'Due Invoice', 'Due Invoice', 'Hello {first_name}, Invoice is due', '{first_name}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('223ed79f-3c01-4e0a-9bd6-dd21e25373c1', 'New Property', 'New Property', ' NEW_PROPERTY', '{property_code},{property_name}, {location}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('4ade5e14-99a7-4ce5-ba4e-08682b20c124', 'New Landlord', 'New Landlord', 'New landlord welcome', '{first_name}, {middle_name}, {last_name}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('6a28a121-bcc5-43ef-9ecc-1ad5c856a3a7', 'New Invoice', 'New Invoice', 'Hi {first_name}, Invoice have been generated.', '{first_name}, {middle_name}, {last_name}, {phone}, {period_name}, {invoice_date}, {due_date}, {invoice_number}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('76ba9895-b568-4abf-95eb-d5c3f18b67f0', 'New Vacate Notice', 'New Vacate Notice', ' NEW_VACATE_NOTICE', '{vacating_date},{vacating_reason},{unit}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('96b182f4-067e-469e-8db4-f0c655504880', 'New Tenant', 'New Tenant', 'Hi {first_name}, Welcome.', '{first_name}, {middle_name}, {last_name}, {phone}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('c0b2cf97-6a9e-4496-851a-f65fb582603f', 'Terminate Lease', 'Terminate Lease', 'TERMINATE_LEASE', '{lease_number}, {start_date}, {rent_amount},{due_on}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('d20465c2-583c-4124-b5c8-e4ff14c7dce6', 'Receive Payment', 'Receive Payment', ' RECEIVE_PAYMENT', '{amount},{payment_date},{lease_number},{receipt_number}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('dee495fc-8408-421a-8118-93332c50bb6e', 'Reset Password', 'Reset Password', 'Your token to reset password is: {token}', '{token}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('f03e55f4-bbe3-474c-a520-e4afb43d8ebc', 'New Lease', 'New Lease', 'New Lease created', '{lease_number}, {start_date}, {rent_amount},{due_on}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('fc107973-26b6-4cfe-b8f8-0ce16c938b69', 'Over Due Invoice', 'Over Due Invoice', 'You have an overdue invoice', '{first_name}, {middle_name}, {last_name}, {phone}, {amount_applied}, {repayment_period}, {loan_type}, {interest_rate}', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `system_notifications`
--

CREATE TABLE `system_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_email` tinyint(1) NOT NULL DEFAULT 1,
  `send_sms` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_notifications`
--

INSERT INTO `system_notifications` (`id`, `agent_id`, `name`, `display_name`, `send_email`, `send_sms`, `deleted_at`, `created_at`, `updated_at`) VALUES
('050e24f0-0399-4dfb-b814-3022f101653f', NULL, 'Receive Payment', 'Receive Payment', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('0b21aab6-5575-4756-bb2a-d6726a99a40a', NULL, 'Terminate Lease', 'Terminate Lease', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('0db4c5ea-0ff2-49f4-8e62-f183baf91941', NULL, 'New Vacate Notice', 'New Vacate Notice', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('117b4e3d-0520-4134-abd6-a9dd88dd574f', NULL, 'Due Invoice', 'Due Invoice', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('58ce29ca-f45c-4e4f-8abd-b623610453d5', NULL, 'Over Due Invoice', 'Over Due Invoice', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('5cc6c225-f9c1-4a85-8e4e-5d369544bfcc', NULL, 'New Property', 'New Property', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('8ae2d004-95a2-4c08-96c5-0941d1c35daa', NULL, 'New Invoice', 'New Invoice', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('9606a65c-3d48-4430-99c8-d6b6f83ee6b5', NULL, 'New Landlord', 'New Landlord', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('c86ec684-f464-443e-bbd8-c2863d404b9e', NULL, 'New Tenant', 'New Tenant', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('c873a752-8772-45a0-998c-8d06e4039680', NULL, 'New Lease', 'New Lease', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('cec77260-7cda-4bc8-a76b-316184938b1a', NULL, 'Reset Password', 'Reset Password', 1, 1, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_categories`
--

CREATE TABLE `task_categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_type_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_passport_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_industry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_relationship` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent_payment_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent_payment_contact_postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent_payment_contact_physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_set` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenant_settings`
--

CREATE TABLE `tenant_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_number_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_tenant_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_settings`
--

INSERT INTO `tenant_settings` (`id`, `agent_id`, `tenant_number_prefix`, `next_tenant_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
('511c24f7-d168-480d-9a6a-28f9fbbe2c71', NULL, 'TN', NULL, NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_types`
--

CREATE TABLE `tenant_types` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_type_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_type_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_types`
--

INSERT INTO `tenant_types` (`id`, `tenant_type_name`, `tenant_type_display_name`, `tenant_type_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('47e0c634-f410-4508-a0ef-3fb19e3d402e', 'individual', 'Individual', 'Individual', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('a0db1697-29d4-4fbe-be7d-f9973bcb9532', 'business', 'Business', 'Business', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_item_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waiver_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_item_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_type_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rent_amount` double DEFAULT NULL,
  `unit_floor` int(11) DEFAULT NULL,
  `unit_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_rooms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bath_rooms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_rooms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_foot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_types`
--

CREATE TABLE `unit_types` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_type_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_type_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_types`
--

INSERT INTO `unit_types` (`id`, `unit_type_name`, `unit_type_display_name`, `unit_type_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('301a837c-9379-4838-87b1-ec541a23ba26', 'two_bed_apartment', 'Two Bed Room', 'Two Bed Room', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('788f50e5-b2fb-4d54-8783-832cd05a8bb3', 'one_bed_apartment', 'One Bed Room', 'One Bed Room', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('8c8cbe5a-44b1-4ebe-8712-37fe72009af4', 'single_room', 'Single Room', 'Single Room', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('f1f88de2-22e0-4c31-98f2-b641e1466019', 'bed_sitter', 'Bed Sitter', 'Bed Sitter', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `unit_utility`
--

CREATE TABLE `unit_utility` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_utility_bills`
--

CREATE TABLE `unit_utility_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility_bill_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reading_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_reading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `middle_name`, `last_name`, `photo`, `postal_code`, `postal_address`, `physical_address`, `city`, `state`, `country`, `phone`, `email`, `password`, `confirmed`, `confirmation_code`, `created_by`, `updated_by`, `deleted_by`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
('99d0f5ea-6372-4dda-a56c-fe5394ceb92f', 'c298e809-5d85-4f2a-857b-c8270658dadb', 'Admin', NULL, 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@admin.com', '$2y$10$EuTmD5BsTpbQeRSgXGDDMuGgjTFpjj1gtvVjDUuo7QFxiNpnqBNuy', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 21:02:43', '2022-06-18 21:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `utilities`
--

CREATE TABLE `utilities` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utility_display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utilities`
--

INSERT INTO `utilities` (`id`, `utility_name`, `utility_display_name`, `utility_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
('8f9fec4c-90f0-4f44-86ad-6a5a021b436f', 'electricity', 'Electricity', 'Electricity', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('928a1473-1af0-44c1-95f6-b8254eea8406', 'water', 'Water', 'Water', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44'),
('94e01a09-589b-47f1-a3cc-5e789a678faa', 'garbage', 'Garbage', 'Garbage', NULL, '2022-06-18 21:02:44', '2022-06-18 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `utility_bills`
--

CREATE TABLE `utility_bills` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacation_notices`
--

CREATE TABLE `vacation_notices` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lease_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_received` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacating_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacating_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waivers`
--

CREATE TABLE `waivers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lease_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `lease_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_classes`
--
ALTER TABLE `account_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenity_unit`
--
ALTER TABLE `amenity_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amenity_unit_id_unique` (`id`);

--
-- Indexes for table `communication_settings`
--
ALTER TABLE `communication_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config_settings`
--
ALTER TABLE `email_config_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_charges`
--
ALTER TABLE `extra_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_charge_properties`
--
ALTER TABLE `extra_charge_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `journals_id_unique` (`id`);

--
-- Indexes for table `landlords`
--
ALTER TABLE `landlords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `late_fees`
--
ALTER TABLE `late_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `late_fee_properties`
--
ALTER TABLE `late_fee_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leases`
--
ALTER TABLE `leases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lease_extra_charges`
--
ALTER TABLE `lease_extra_charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lease_extra_charges_id_unique` (`id`);

--
-- Indexes for table `lease_late_fees`
--
ALTER TABLE `lease_late_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lease_late_fees_id_unique` (`id`);

--
-- Indexes for table `lease_modes`
--
ALTER TABLE `lease_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lease_settings`
--
ALTER TABLE `lease_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lease_tenants`
--
ALTER TABLE `lease_tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lease_tenants_id_unique` (`id`);

--
-- Indexes for table `lease_types`
--
ALTER TABLE `lease_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lease_units`
--
ALTER TABLE `lease_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lease_units_id_unique` (`id`);

--
-- Indexes for table `lease_utility_charges`
--
ALTER TABLE `lease_utility_charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lease_utility_charges_id_unique` (`id`);

--
-- Indexes for table `lease_utility_deposits`
--
ALTER TABLE `lease_utility_deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lease_utility_deposits_id_unique` (`id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ledgers_id_unique` (`id`);

--
-- Indexes for table `maintenancies`
--
ALTER TABLE `maintenancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_frequencies`
--
ALTER TABLE `payment_frequencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method_leases`
--
ALTER TABLE `payment_method_leases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method_properties`
--
ALTER TABLE `payment_method_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `period_properties`
--
ALTER TABLE `period_properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `period_properties_id_unique` (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_role_id_unique` (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_categories`
--
ALTER TABLE `property_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_settings`
--
ALTER TABLE `property_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_utility_costs`
--
ALTER TABLE `property_utility_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `readings`
--
ALTER TABLE `readings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config_settings`
--
ALTER TABLE `sms_config_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notifications`
--
ALTER TABLE `system_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_categories`
--
ALTER TABLE `task_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_settings`
--
ALTER TABLE `tenant_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_types`
--
ALTER TABLE `tenant_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_utility`
--
ALTER TABLE `unit_utility`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_utility_id_unique` (`id`);

--
-- Indexes for table `unit_utility_bills`
--
ALTER TABLE `unit_utility_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_utility_bills_id_unique` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilities`
--
ALTER TABLE `utilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utility_bills`
--
ALTER TABLE `utility_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacation_notices`
--
ALTER TABLE `vacation_notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waivers`
--
ALTER TABLE `waivers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenity_unit`
--
ALTER TABLE `amenity_unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `extra_charge_properties`
--
ALTER TABLE `extra_charge_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `late_fee_properties`
--
ALTER TABLE `late_fee_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lease_extra_charges`
--
ALTER TABLE `lease_extra_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lease_late_fees`
--
ALTER TABLE `lease_late_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lease_tenants`
--
ALTER TABLE `lease_tenants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lease_units`
--
ALTER TABLE `lease_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lease_utility_charges`
--
ALTER TABLE `lease_utility_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lease_utility_deposits`
--
ALTER TABLE `lease_utility_deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenancies`
--
ALTER TABLE `maintenancies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method_leases`
--
ALTER TABLE `payment_method_leases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method_properties`
--
ALTER TABLE `payment_method_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `period_properties`
--
ALTER TABLE `period_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `property_categories`
--
ALTER TABLE `property_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_utility_costs`
--
ALTER TABLE `property_utility_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_utility`
--
ALTER TABLE `unit_utility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_utility_bills`
--
ALTER TABLE `unit_utility_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
