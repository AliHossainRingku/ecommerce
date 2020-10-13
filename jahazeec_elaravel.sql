-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 28, 2019 at 03:32 PM
-- Server version: 10.2.27-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jahazeec_elaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_11_26_110633_create_tbl_admin_table', 1),
(2, '2018_11_27_073650_create_tbl_category_table', 1),
(3, '2018_11_30_180632_create_tbl_brand_table', 1),
(4, '2018_12_02_143916_create_tbl_product_table', 1),
(5, '2018_12_10_173814_create_tbl_order_table', 1),
(6, '2018_12_16_055838_create_tbl_customer_table', 1),
(7, '2018_12_16_061350_create_tbl_slider_table', 1),
(8, '2018_12_16_175627_create_tbl_shipping_table', 1),
(9, '2018_12_18_035020_create_tbl_payment_table', 1),
(10, '2018_12_18_035226_create_tbl_order_details_table', 1),
(16, '2019_03_10_140707_create_tbl_category_type_table', 2),
(18, '2019_03_12_063205_create_tbl_super_category_table', 3),
(19, '2019_04_17_081930_create_tbl_sub_category_table', 4),
(20, '2019_01_12_070723_create_tbl_corporate_order_details_table', 5),
(21, '2019_01_12_070810_create_tbl_corporate_order_table', 5),
(22, '2019_01_12_070956_create_tbl_corporate_customer_table', 5),
(23, '2019_01_12_071104_create_tbl_corporate_shipping_table', 5),
(24, '2019_01_12_071142_create_tbl_corporate_payment_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'alihossain.csecu@gmail.com', '654321', 'Ali Hossain', '01737859493', '2019-01-14 18:00:00', '2019-01-15 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_description`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'None', 'scsc', 1, NULL, NULL),
(2, 'Papertech', 'Papertech', 1, NULL, NULL),
(3, 'Double', 'Double', 1, NULL, NULL),
(4, 'Idea', 'Idea', 1, NULL, NULL),
(5, 'Bashundhra', 'Bashundhra', 1, NULL, NULL),
(6, 'Fresh', 'Fresh', 1, NULL, NULL),
(7, 'Century', 'sdsd', 1, NULL, NULL),
(8, 'Tk Paper', 'nkbbk', 1, NULL, NULL),
(9, 'Ambor Paper', 'bb', 1, NULL, NULL),
(10, 'Matador', 'nkkncakc', 1, NULL, NULL),
(11, 'Link', 'sac', 1, NULL, NULL),
(12, 'RFL', 'scknc', 1, NULL, NULL),
(13, 'Econo', 'axajx', 1, NULL, NULL),
(14, 'Faber Castle', 'nk', 1, NULL, NULL),
(15, 'Uni-fine', 'vsv', 1, NULL, NULL),
(16, 'Deli', 'nans', 1, NULL, NULL),
(17, 'Livo', 'Livo', 1, NULL, NULL),
(18, 'Uniliver', 'Uniliver', 1, NULL, NULL),
(19, 'ACI', 'ACI', 1, NULL, NULL),
(20, 'Fay', 'Fay', 1, NULL, NULL),
(21, 'Godrej', 'Godrej', 1, NULL, NULL),
(22, 'Casio', 'saca', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `super_category_id` int(10) DEFAULT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_description`, `super_category_id`, `publication_status`, `created_at`, `updated_at`) VALUES
(101, 'Paper', 'dgdg', 1, 1, '2019-03-12 08:36:00', '2019-03-12 08:36:00'),
(102, 'Writing Supplies', 'nnnn', 1, 1, '2019-03-14 04:58:24', '2019-03-14 04:58:24'),
(103, 'Office Essentials', 'nnkknk', 1, 1, '2019-03-14 04:58:42', '2019-03-14 04:58:42'),
(104, 'Notebook & Diary', 'ckncnnkcnk', 1, 1, '2019-04-22 04:12:52', '2019-04-22 04:12:52'),
(105, 'Desk Organizer', 'ckncnnkcnk', 1, 1, '2019-04-22 04:13:17', '2019-04-22 04:13:17'),
(106, 'File & Folder', 'scsc', 1, 1, '2019-04-22 04:19:05', '2019-04-22 04:19:05'),
(107, 'Board & Display', 'scsc', 1, 1, '2019-04-22 04:20:08', '2019-04-22 04:20:08'),
(108, 'Others', 'vdvdv', 1, 1, '2019-04-22 04:20:55', '2019-04-22 04:20:55'),
(201, 'Cleaning', 'DSDN', 2, 1, '2019-04-22 17:30:34', '2019-04-22 17:30:34'),
(301, 'Snacks', 'SHHSH', 3, 1, '2019-04-22 17:38:41', '2019-04-22 17:38:41'),
(401, 'Gifts', 'DDDD', 4, 1, '2019-04-22 17:39:20', '2019-04-22 17:39:20'),
(501, 'Printing & Press', 'sdD', 5, 1, '2019-04-22 17:39:30', '2019-04-22 17:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_corporate_customer`
--

CREATE TABLE `tbl_corporate_customer` (
  `corporate_customer_id` int(10) UNSIGNED NOT NULL,
  `corporate_customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_customer_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_customer_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_corporate_order`
--

CREATE TABLE `tbl_corporate_order` (
  `corporate_order_id` int(10) UNSIGNED NOT NULL,
  `corporate_customer_id` int(10) UNSIGNED DEFAULT NULL,
  `corporate_shipping_id` int(10) UNSIGNED DEFAULT NULL,
  `corporate_payment_id` int(10) UNSIGNED DEFAULT NULL,
  `company_name` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corporate_order_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corporate_order_status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_corporate_order`
--

INSERT INTO `tbl_corporate_order` (`corporate_order_id`, `corporate_customer_id`, `corporate_shipping_id`, `corporate_payment_id`, `company_name`, `company_email`, `company_mobile`, `file`, `corporate_order_total`, `corporate_order_status`, `created_at`, `updated_at`) VALUES
(52, NULL, NULL, NULL, 'Shapla Mango Co.', 'ringku_ctg@yahoo.com', '01721883813', 'public/rfq_uploaded_file/52.png', NULL, 0, '2019-05-21 08:32:12', '2019-05-21 08:32:12'),
(54, NULL, NULL, NULL, 'Saimun Traders', 'sumon@yahoo.com', '01822272575', NULL, NULL, 0, '2019-05-21 08:48:33', '2019-05-21 08:48:33'),
(55, NULL, NULL, NULL, 'Jahazee Corp.', 'alihossain.csecu@gmail.com', '01721883813', NULL, NULL, 0, '2019-05-29 18:34:24', '2019-05-29 18:34:24'),
(56, NULL, NULL, NULL, 'Jahazee Corp.', 'alihossain.csecu@gmail.com', '01721883813', 'public/rfq_uploaded_file/56.png', NULL, 0, '2019-05-29 18:34:59', '2019-05-29 18:34:59'),
(57, NULL, NULL, NULL, 'Dhaka College', 'dhaka@college.com', '01822273876', 'public/rfq_uploaded_file/57.png', NULL, 0, '2019-07-04 23:15:44', '2019-07-04 23:15:44'),
(59, NULL, NULL, NULL, 'Ali Hossain Group', 'ringku_ctg@yahoo.com', '01737859493', NULL, NULL, 0, '2019-07-14 10:10:50', '2019-07-14 10:10:50'),
(60, NULL, NULL, NULL, 'Sumon Enterprize', 'ringku_ctg@yahoo.com', '01737859493', NULL, NULL, 0, '2019-07-22 16:52:36', '2019-07-22 16:52:36'),
(61, NULL, NULL, NULL, 'Ali Hossain Group', 'ringku_ctg@yahoo.com', '01737859493', NULL, NULL, 0, '2019-07-22 16:57:05', '2019-07-22 16:57:05'),
(62, NULL, NULL, NULL, 'Ali Hossain Group', 'alihossain.csecu@gmail.com', '0173999344', 'public/rfq_uploaded_file/62.png', NULL, 0, '2019-07-22 17:04:40', '2019-07-22 17:04:40'),
(63, NULL, NULL, NULL, 'Ali Hossain', 'alihossain.csecu@gmail.com', '01737859493', 'public/rfq_uploaded_file/63.png', NULL, 0, '2019-07-30 18:37:37', '2019-07-30 18:37:37'),
(64, NULL, NULL, NULL, 'Shapla Mango Co.', 'ringku_ctg@yahoo.com', '01721883813', NULL, NULL, 0, '2019-09-01 07:27:06', '2019-09-01 07:27:06'),
(65, NULL, NULL, NULL, 'Shapla Mango Co.', 'ringku_ctg@yahoo.com', '01721883813', 'public/rfq_uploaded_file/65.png', NULL, 0, '2019-09-01 09:15:56', '2019-09-01 09:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_corporate_order_details`
--

CREATE TABLE `tbl_corporate_order_details` (
  `corporate_order_details_id` int(10) UNSIGNED NOT NULL,
  `corporate_order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_specification` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) DEFAULT NULL,
  `product_price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_corporate_order_details`
--

INSERT INTO `tbl_corporate_order_details` (`corporate_order_details_id`, `corporate_order_id`, `product_id`, `product_name`, `product_specification`, `product_quantity`, `product_price`, `created_at`, `updated_at`) VALUES
(91, 52, NULL, NULL, NULL, 1, NULL, '2019-05-21 08:32:13', '2019-05-21 08:32:13'),
(95, 54, NULL, 'Napa 100mg', '100PCS', 100, 2.50, '2019-05-21 08:48:33', '2019-05-21 08:48:33'),
(96, 54, NULL, 'Betablocker', '50mg', 300, 7.50, '2019-05-21 08:48:33', '2019-05-21 08:48:33'),
(97, 54, NULL, 'Brush', 'Floor Cleaner', 2, 120.00, '2019-05-21 08:48:33', '2019-05-21 08:48:33'),
(98, 56, NULL, 'Air Freshner', 'ACI 300ml', 10, 180.00, '2019-05-29 18:34:59', '2019-05-29 18:34:59'),
(99, 56, NULL, 'Pencil Battery', 'Sunlight', 12, 15.00, '2019-05-29 18:34:59', '2019-05-29 18:34:59'),
(100, 56, NULL, 'Offset Paper', 'Double A', 5, 385.00, '2019-05-29 18:34:59', '2019-05-29 18:34:59'),
(101, 57, NULL, NULL, NULL, 1, NULL, '2019-07-04 23:15:44', '2019-07-04 23:15:44'),
(103, 59, NULL, 'Hilux Biscuit', '12Pckt', 5, 70.00, '2019-07-14 10:10:50', '2019-07-14 10:10:50'),
(104, 59, NULL, 'Chanacur', 'Ruchi Jhal', 3, 60.00, '2019-07-14 10:10:50', '2019-07-14 10:10:50'),
(105, 59, NULL, 'Olympic Battery', 'Pencil', 12, 15.00, '2019-07-14 10:10:50', '2019-07-14 10:10:50'),
(106, 62, NULL, NULL, NULL, 1, NULL, '2019-07-22 17:04:40', '2019-07-22 17:04:40'),
(107, 63, NULL, NULL, NULL, 1, NULL, '2019-07-30 18:37:37', '2019-07-30 18:37:37'),
(108, 64, NULL, NULL, NULL, 1, NULL, '2019-09-01 07:27:06', '2019-09-01 07:27:06'),
(109, 65, NULL, NULL, NULL, 1, NULL, '2019-09-01 09:15:56', '2019-09-01 09:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_corporate_payment`
--

CREATE TABLE `tbl_corporate_payment` (
  `corporate_payment_id` int(10) UNSIGNED NOT NULL,
  `corporate_payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_payment_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_corporate_shipping`
--

CREATE TABLE `tbl_corporate_shipping` (
  `corporate_shipping_id` int(10) UNSIGNED NOT NULL,
  `corporate_shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_shipping_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `corporate_shipping_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_mobile`, `customer_status`, `created_at`, `updated_at`) VALUES
(0, 'no name', 'noemail@no.com', '', 'no', 1, NULL, NULL),
(1, 'Ali Hossain', 'alihossain.csecu@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '01737859493', 0, NULL, NULL),
(2, 'Kamal Uddin', 'kamal.csecu@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '01822272575', 0, NULL, NULL),
(3, 'Giash Uddin', 'giash@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '01737859493', 0, NULL, NULL),
(5, 'AASDD', 'asad@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '0175559495', 0, NULL, NULL),
(6, 'Saif Uddin', 'saifkh2010@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '01718346484', 0, NULL, NULL),
(8, 'Shamsuddin Patwary', 'shamsuddin@gmail.com', '508df4cb2f4d8f80519256258cfb975f', '01737758843', 0, NULL, NULL),
(9, 'Sabbir Ahmed', 'sabbir@gmail.com', '508df4cb2f4d8f80519256258cfb975f', '01738859595', 0, NULL, NULL),
(10, 'Abdur Rahaman', 'arhahman@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '01822272573', 0, NULL, NULL),
(11, 'Khaja Nijamuddin', 'khaja@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '01737859493', 0, NULL, NULL),
(12, 'Mohammad Habibullah', 'mdh70273@gmail.com', 'bfa8ce70825d6b4fa5744e73e989129e', '01795395747', 0, NULL, NULL),
(13, 'GYdMaCQtmWlL', 'maarenaxual@gmail.com', '8f67303cd4fe12f7358c71e1d638cb29', '8247319427', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `order_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(82, 0, 82, 82, '725', 1, '2019-07-11 19:47:26', '2019-07-11 19:47:26'),
(83, 0, 83, 83, '95', 0, '2019-09-09 11:14:12', '2019-09-09 11:14:12'),
(84, 0, 84, 84, '280', 0, '2019-09-13 14:58:44', '2019-09-13 14:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(165, 82, 10205003, 'Stander Plastic Scale 15cm', 5.00, 10, '2019-07-11 19:47:26', '2019-07-11 19:47:26'),
(166, 82, 20102008, 'Dettol Antiseptic Liquid 100ml', 45.00, 15, '2019-07-11 19:47:26', '2019-07-11 19:47:26'),
(167, 83, 10202011, 'Deli Black Pencil HB 12Pcs', 65.00, 1, '2019-09-09 11:14:12', '2019-09-09 11:14:12'),
(168, 83, 10203024, 'Faber Castell Highlighter Pen', 30.00, 1, '2019-09-09 11:14:12', '2019-09-09 11:14:12'),
(169, 84, 20103001, 'Good Knight Power Active Machine', 140.00, 2, '2019-09-13 14:58:44', '2019-09-13 14:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'bcash', 1, NULL, NULL),
(2, 'cheque', 1, NULL, NULL),
(3, 'cheque', 0, NULL, NULL),
(4, 'hand', 1, NULL, NULL),
(5, 'cheque', 1, NULL, NULL),
(6, 'bcash', 0, NULL, NULL),
(7, 'bcash', 0, NULL, NULL),
(8, 'hand', 0, NULL, NULL),
(9, 'cheque', 0, NULL, NULL),
(10, 'cheque', 0, NULL, NULL),
(11, 'hand', 0, NULL, NULL),
(12, 'bcash', 0, NULL, NULL),
(13, 'bcash', 0, NULL, NULL),
(14, 'bcash', 0, NULL, NULL),
(15, 'cheque', 1, NULL, NULL),
(16, 'cheque', 0, NULL, NULL),
(17, 'bcash', 0, NULL, NULL),
(18, 'bcash', 0, NULL, NULL),
(19, 'bcash', 0, NULL, NULL),
(20, 'bcash', 0, NULL, NULL),
(21, 'cheque', 0, NULL, NULL),
(22, 'hand', 0, NULL, NULL),
(23, 'hand', 0, NULL, NULL),
(24, 'bcash', 0, NULL, NULL),
(25, 'bcash', 0, NULL, NULL),
(26, 'bcash', 0, NULL, NULL),
(27, 'bcash', 1, NULL, NULL),
(28, 'hand', 0, NULL, NULL),
(29, 'cheque', 1, NULL, NULL),
(30, 'cheque', 0, NULL, NULL),
(31, 'cheque', 0, NULL, NULL),
(32, 'cheque', 0, NULL, NULL),
(33, 'cheque', 0, NULL, NULL),
(34, 'cheque', 0, NULL, NULL),
(35, 'cheque', 0, NULL, NULL),
(36, 'cheque', 0, NULL, NULL),
(37, 'cheque', 0, NULL, NULL),
(38, 'cheque', 0, NULL, NULL),
(39, 'cheque', 0, NULL, NULL),
(40, 'cheque', 0, NULL, NULL),
(41, 'cheque', 0, NULL, NULL),
(42, 'cheque', 0, NULL, NULL),
(43, 'cheque', 0, NULL, NULL),
(44, 'bcash', 0, NULL, NULL),
(45, 'bcash', 0, NULL, NULL),
(46, 'bcash', 0, NULL, NULL),
(47, 'bcash', 0, NULL, NULL),
(48, 'bcash', 0, NULL, NULL),
(49, 'bcash', 0, NULL, NULL),
(50, 'bcash', 0, NULL, NULL),
(51, 'bcash', 0, NULL, NULL),
(52, 'cheque', 1, NULL, NULL),
(53, 'bcash', 0, NULL, NULL),
(54, 'cheque', 0, NULL, NULL),
(55, 'bcash', 0, NULL, NULL),
(56, 'bcash', 0, NULL, NULL),
(57, 'hand', 0, NULL, NULL),
(58, 'hand', 0, NULL, NULL),
(59, 'bcash', 0, NULL, NULL),
(60, 'bcash', 0, NULL, NULL),
(61, 'hand', 0, NULL, NULL),
(62, 'bcash', 0, NULL, NULL),
(63, 'cheque', 0, NULL, NULL),
(64, 'hand', 0, NULL, NULL),
(65, 'bcash', 0, NULL, NULL),
(66, 'hand', 0, NULL, NULL),
(67, 'bcash', 0, NULL, NULL),
(68, 'bcash', 0, NULL, NULL),
(69, 'bcash', 0, NULL, NULL),
(70, 'bcash', 0, NULL, NULL),
(71, 'bcash', 0, NULL, NULL),
(72, 'bcash', 0, NULL, NULL),
(73, 'bcash', 0, NULL, NULL),
(74, 'bcash', 0, NULL, NULL),
(75, 'bcash', 0, NULL, NULL),
(76, 'hand', 0, NULL, NULL),
(77, 'hand', 0, NULL, NULL),
(78, 'hand', 0, NULL, NULL),
(79, 'hand', 0, NULL, NULL),
(80, 'hand', 0, NULL, NULL),
(81, 'hand', 0, NULL, NULL),
(82, 'bcash', 0, '2019-07-11 19:47:26', '2019-07-11 19:47:26'),
(83, 'hand', 0, '2019-09-09 11:14:12', '2019-09-09 11:14:12'),
(84, 'hand', 0, '2019-09-13 14:58:44', '2019-09-13 14:58:44'),
(85, 'hand', 1, '2019-09-17 16:45:29', '2019-09-17 16:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_printing_order`
--

CREATE TABLE `tbl_printing_order` (
  `printing_order_id` int(10) UNSIGNED NOT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attach` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_printing_order`
--

INSERT INTO `tbl_printing_order` (`printing_order_id`, `project_name`, `quantity`, `project_description`, `company_name`, `contact_person_name`, `company_mobile`, `company_email`, `district`, `postal_code`, `file_attach`, `created_at`, `updated_at`) VALUES
(1, 'jsaa', 'vdv', 'svsv', 'ssv', 'svsv', 'svsv', 'svs', 'svsv', 'svsv', 'C:\\xampp\\tmp\\phpD778.tmp', NULL, NULL),
(2, 'jsaa', 'vdv', 'svsv', 'ssv', 'svsv', 'svsv', 'svs', 'svsv', 'svsv', 'C:\\xampp\\tmp\\phpD253.tmp', NULL, NULL),
(3, 'jsaa', 'vdv', 'svsv', 'ssv', 'svsv', 'svsv', 'svs', 'svsv', 'svsv', 'C:\\xampp\\tmp\\phpC88C.tmp', NULL, NULL),
(4, 'Question', '100', 'SHSHSA ADDD', 'Bamni High SChool', 'Ali Hossain', '01828823828313', 'alihossain.cecu@gmail.com', 'Noakhali', '3850', 'C:\\xampp\\tmp\\phpC6F2.tmp', NULL, NULL),
(5, 'Amader Project', '120', 'ALI HOSSAIN YESTTT', 'Jahazee Corp.', 'KAMAL', '01822272575', 'alihossain.csecu@gmail.com', 'Noakhali', '1292', '/tmp/phpYVLfr4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_printing_order_details`
--

CREATE TABLE `tbl_printing_order_details` (
  `printing_order_details_id` int(10) UNSIGNED NOT NULL,
  `printing_order_id` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_long_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `offer` double(8,2) DEFAULT 0.00,
  `product_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `sub_category_id`, `brand_id`, `product_short_description`, `product_long_description`, `product_price`, `offer`, `product_picture`, `product_size`, `product_color`, `publication_status`, `created_at`, `updated_at`) VALUES
(10101001, 'Papertech A4 Offset Paper 100GSM', 10101, 1, 'Papertech A4 Offset Paper 100GSM', 'Papertech A4 Offset Paper 100GSM', 385.00, 0.00, 'public/images/10101001.png', NULL, NULL, 1, '2019-06-18 10:04:29', '2019-06-18 10:04:29'),
(10101002, 'Papertech A4 Offset Paper 80GSM', 10101, 1, 'Papertech A4 Offset Paper 80GSM', 'Papertech A4 Offset Paper 80GSM', 290.00, 0.00, 'public/images/10101002.png', NULL, NULL, 1, '2019-06-18 10:04:53', '2019-06-18 10:04:53'),
(10101003, 'Papertech A4 Offset Paper 70GSM', 10101, 1, 'Papertech A4 Offset Paper 70GSM', 'Papertech A4 Offset Paper 70GSM', 270.00, 0.00, 'public/images/10101003.png', NULL, NULL, 1, '2019-06-18 10:05:12', '2019-06-18 10:05:12'),
(10101004, 'Papertech A4 Offset Paper 65GSM', 10101, 1, 'Papertech A4 Offset Paper 65GSM', 'Papertech A4 Offset Paper 65GSM', 245.00, 0.00, 'public/images/10101004.png', NULL, NULL, 1, '2019-06-18 10:05:31', '2019-06-18 10:05:31'),
(10101005, 'Papertech Legal Offset Paper 80GSM', 10101, 1, 'Papertech Legal Offset Paper 80GSM', 'Papertech Legal Offset Paper 80GSM', 380.00, 0.00, 'public/images/10101005.png', NULL, NULL, 1, '2019-06-18 10:06:02', '2019-06-18 10:06:02'),
(10101006, 'Papertech A3 Offset Paper 80GSM', 10101, 1, 'Papertech A3 Offset Paper 80GSM', 'Papertech A3 Offset Paper 80GSM', 0.00, NULL, 'public/images/10101006.jpg', NULL, NULL, 1, '2019-06-18 10:06:23', '2019-06-18 10:06:23'),
(10101007, 'Double A Offset Paper A4 Size 100GSM Local', 10101, 1, 'Double A Offset Paper A4 Size 100GSM Local', 'Double A Offset Paper A4 Size 100GSM Local', 370.00, NULL, 'public/images/10101007.png', NULL, NULL, 1, '2019-06-18 10:06:43', '2019-06-18 10:06:43'),
(10101008, 'Double A Offset Paper A4 Size 80GSM Local', 10101, 1, 'Double A Offset Paper A4 Size 80GSM Local', 'Double A Offset Paper A4 Size 80GSM Local', 290.00, NULL, 'public/images/10101008.png', NULL, NULL, 1, '2019-06-18 10:07:06', '2019-06-18 10:07:06'),
(10101009, 'Double A Offset Paper A4 Size 70GSM Local', 10101, 1, 'Double A Offset Paper A4 Size 70GSM Local', 'Double A Offset Paper A4 Size 70GSM Local', 240.00, 0.00, 'public/images/10101009.png', NULL, NULL, 1, '2019-06-18 10:08:23', '2019-06-18 10:08:23'),
(10101010, 'Double A Offset Paper A4 Size 65GSM Local', 10101, 1, 'Double A Offset Paper A4 Size 65GSM Local', 'Double A Offset Paper A4 Size 65GSM Local', 230.00, NULL, 'public/images/10101010.png', NULL, NULL, 1, '2019-06-18 10:08:44', '2019-06-18 10:08:44'),
(10101011, 'Double A Offset Paper Legal Size 100GSM Local', 10101, 1, 'Double A Offset Paper Legal Size 100GSM Local', 'Double A Offset Paper Legal Size 100GSM Local', 450.00, 0.00, 'public/images/10101011.png', NULL, NULL, 1, '2019-06-18 10:09:04', '2019-06-18 10:09:04'),
(10101012, 'Double A Offset Paper Legal Size 80GSM Local', 10101, 1, 'Double A Offset Paper Legal Size 80GSM Local', 'Double A Offset Paper Legal Size 80GSM Local', 440.00, 0.00, 'public/images/10101012.png', NULL, NULL, 1, '2019-06-18 10:09:22', '2019-06-18 10:09:22'),
(10101013, 'Double A Offset Paper A4 80GSM Original', 10101, 1, 'Double A Offset Paper A4 80GSM Original', 'Double A Offset Paper A4 80GSM Original', 415.00, 0.00, 'public/images/10101013.png', NULL, NULL, 1, '2019-06-18 10:09:47', '2019-06-18 10:09:47'),
(10101014, 'Double A Offset Paper A3 80GSM Original', 10101, 1, 'Double A Offset Paper A3 80GSM Original', 'Double A Offset Paper A3 80GSM Original', 1050.00, 0.00, 'public/images/10101014.png', NULL, NULL, 1, '2019-06-18 10:10:23', '2019-06-18 10:10:23'),
(10101015, 'Double A Offset Paper Legal 80GSM Original', 10101, 1, 'Double A Offset Paper Legal 80GSM Original', 'Double A Offset Paper Legal 80GSM Original', 610.00, 0.00, 'public/images/10101015.png', NULL, NULL, 1, '2019-06-18 10:10:48', '2019-06-18 10:10:48'),
(10101016, 'Idea A4 Offset Paper 80GSM', 10101, 1, 'Idea A4 Offset Paper 80GSM', 'Idea A4 Offset Paper 80GSM', 305.00, 0.00, 'public/images/10101016.png', NULL, NULL, 1, '2019-06-18 10:11:10', '2019-06-18 10:11:10'),
(10101017, 'Idea A4 Offset Paper 65GSM', 10101, 1, 'Idea A4 Offset Paper 65GSM', 'Idea A4 Offset Paper 65GSM', 235.00, 0.00, 'public/images/10101017.png', NULL, NULL, 1, '2019-06-18 10:11:33', '2019-06-18 10:11:33'),
(10101018, 'Bashundhara A4 Offset Paper 80GSM', 10101, 1, 'Bashundhara A4 Offset Paper 80GSM', 'Bashundhara A4 Offset Paper 80GSM', 315.00, 0.00, 'public/images/10101018.png', NULL, NULL, 1, '2019-06-18 10:11:51', '2019-06-18 10:11:51'),
(10101019, 'Bashundhara A4 Offset Paper 65GSM', 10101, 1, 'Bashundhara A4 Offset Paper 65GSM', 'Bashundhara A4 Offset Paper 65GSM', 235.00, 0.00, 'public/images/10101019.png', NULL, NULL, 1, '2019-06-18 10:12:19', '2019-06-18 10:12:19'),
(10101020, 'Bashundhara Legal Offset Paper 80GSM', 10101, 1, 'Bashundhara Legal Offset Paper 80GSM', 'Bashundhara Legal Offset Paper 80GSM', 390.00, 0.00, 'public/images/10101020.png', NULL, NULL, 1, '2019-06-18 10:12:38', '2019-06-18 10:12:38'),
(10101021, 'Bashundhara A3 Offset Paper 80GSM', 10101, 1, 'Bashundhara A3 Offset Paper 80GSM', 'Bashundhara A3 Offset Paper 80GSM', 0.00, 0.00, 'public/images/10101021.png', NULL, NULL, 0, '2019-06-18 10:13:06', '2019-06-18 10:13:06'),
(10101022, 'Fresh A4 Offset Paper 80GSM', 10101, 1, 'Fresh A4 Offset Paper 80GSM', 'Fresh A4 Offset Paper 80GSM', 300.00, 0.00, 'public/images/10101022.png', NULL, NULL, 1, '2019-06-18 10:13:29', '2019-06-18 10:13:29'),
(10101023, 'Fresh A4 Offset Paper 65GSM', 10101, 1, 'Fresh A4 Offset Paper 65GSM', 'Fresh A4 Offset Paper 65GSM', 245.00, 0.00, 'public/images/10101023.png', NULL, NULL, 1, '2019-06-18 10:13:51', '2019-06-18 10:13:51'),
(10101024, 'PaperOne A4 Offset Paper 80GSM', 10101, 1, 'PaperOne A4 Offset Paper 80GSM', 'PaperOne A4 Offset Paper 80GSM', 395.00, 0.00, 'public/images/10101024.png', NULL, NULL, 1, '2019-06-18 10:14:30', '2019-06-18 10:14:30'),
(10101025, 'Century Offset Paper A4 80GSM', 10101, 1, 'Century Offset Paper A4 80GSM', 'Century Offset Paper A4 80GSM', 300.00, 0.00, 'public/images/10101025.png', NULL, NULL, 1, '2019-06-18 10:14:49', '2019-06-18 10:14:49'),
(10101026, 'Century Offset Paper A4 70GSM', 10101, 1, 'Century Offset Paper A4 70GSM', 'Century Offset Paper A4 70GSM', 250.00, 0.00, 'public/images/10101026.png', NULL, NULL, 1, '2019-06-18 10:15:11', '2019-06-18 10:15:11'),
(10101027, 'Century Offset Paper Legal 80GSM', 10101, 1, 'Century Offset Paper Legal 80GSM', 'Century Offset Paper Legal 80GSM', 360.00, 0.00, 'public/images/10101027.png', NULL, NULL, 1, '2019-06-18 10:15:35', '2019-06-18 10:15:35'),
(10102001, '23*36 TK Paper', 10102, 1, '23*36 TK Paper', '23*36 TK Paper', 340.00, 0.00, 'public/images/10102001.png', NULL, NULL, 1, '2019-06-18 10:50:26', '2019-06-18 10:50:26'),
(10102002, '22*35 TK Paper', 10102, 1, '22*35 TK Paper', '22*35 TK Paper', 290.00, 0.00, 'public/images/10102002.png', NULL, NULL, 1, '2019-06-18 10:51:18', '2019-06-18 10:51:18'),
(10102003, '21*34 TK Paper', 10102, 1, '21*34 TK Paper', '21*34 TK Paper', 235.00, 0.00, 'public/images/10102003.png', NULL, NULL, 1, '2019-06-18 10:52:20', '2019-06-18 10:52:20'),
(10102004, '23*36 Ambor Paper', 10102, 1, '23*36 Ambor Paper', '23*36 Ambor Paper', 340.00, 0.00, 'public/images/10102004.png', NULL, NULL, 1, '2019-06-18 10:52:46', '2019-06-18 10:52:46'),
(10102005, '22*35 Ambor Paper', 10102, 1, '22*35 Ambor Paper', '22*35 Ambor Paper', 305.00, 0.00, 'public/images/10102005.png', NULL, NULL, 1, '2019-06-18 10:53:11', '2019-06-18 10:53:11'),
(10102006, '21*34 Ambor Paper', 10102, 1, '21*34 Ambor Paper', '21*34 Ambor Paper', 245.00, 0.00, 'public/images/10102006.png', NULL, NULL, 1, '2019-06-18 10:53:36', '2019-06-18 10:53:36'),
(10103001, 'Art Paper 120GSM', 10103, 1, 'Art Paper 120GSM', 'Art Paper 120GSM', 7.00, 0.00, 'public/images/10103001.png', NULL, NULL, 1, '2019-06-18 10:54:05', '2019-06-18 10:54:05'),
(10103002, 'Art Paper 150GSM', 10103, 1, 'Art Paper 150GSM', 'Art Paper 150GSM', 8.00, 0.00, 'public/images/10103002.png', NULL, NULL, 1, '2019-06-18 10:54:32', '2019-06-18 10:54:32'),
(10103003, 'Color Art Paper A4 Size 100 Pcs Pack', 10103, 1, 'Color Art Paper A4 Size 100 Pcs Pack', 'Color Art Paper A4 Size 100 Pcs Pack', 395.00, 0.00, 'public/images/10103003.png', NULL, NULL, 1, '2019-06-18 10:55:11', '2019-06-18 10:55:11'),
(10103004, 'Color Art Paper', 10103, 1, 'Color Art Paper', 'Color Art Paper', 12.00, 0.00, 'public/images/10103004.png', NULL, NULL, 1, '2019-06-18 10:55:49', '2019-06-18 10:55:49'),
(10103005, 'Chart Paper', 10103, 1, 'Chart Paper', 'Chart Paper', 13.00, 0.00, 'public/images/10103005.png', NULL, NULL, 1, '2019-06-18 10:56:07', '2019-06-18 10:56:07'),
(10103006, 'Poster Paper', 10103, 1, 'Poster Paper', 'Poster Paper', 3.00, 0.00, 'public/images/10103006.png', NULL, NULL, 1, '2019-06-18 10:56:37', '2019-06-18 10:56:37'),
(10103007, 'Kraft Paper 70GSM', 10103, 1, 'Kraft Paper 70GSM', 'Kraft Paper 70GSM', 5.00, 0.00, 'public/images/10103007.png', NULL, NULL, 1, '2019-06-18 10:56:58', '2019-06-18 10:56:58'),
(10103008, 'Kraft Paper 80 GSM', 10103, 1, 'Kraft Paper 80 GSM', 'Kraft Paper 80 GSM', 7.00, 0.00, 'public/images/10103008.png', NULL, NULL, 1, '2019-06-18 10:57:19', '2019-06-18 10:57:19'),
(10103009, 'Advanced HP A4 Photo Paper', 10103, 1, 'Advanced HP A4 Photo Paper', 'Advanced HP A4 Photo Paper', 0.00, 0.00, 'public/images/10103009.png', NULL, NULL, 0, '2019-06-18 10:57:45', '2019-06-18 10:57:45'),
(10103010, 'Epson Premium Glossy Photo Paper A4', 10103, 1, 'Epson Premium Glossy Photo Paper A4', 'Epson Premium Glossy Photo Paper A4', 0.00, 0.00, 'public/images/10103010.png', NULL, NULL, 0, '2019-06-18 10:58:06', '2019-06-18 10:58:06'),
(10103011, 'Kodak Glossy A4 Photo Paper', 10103, 1, 'Kodak Glossy A4 Photo Paper', 'Kodak Glossy A4 Photo Paper', 0.00, 0.00, 'public/images/10103011.png', NULL, NULL, 0, '2019-06-18 10:58:25', '2019-06-18 10:58:25'),
(10103012, 'Continuous Dot Printing Paper, 1 Ply', 10103, 1, 'Continuous Dot Printing Paper, 1 Ply', 'Continuous Dot Printing Paper, 1 Ply', 540.00, 0.00, 'public/images/10103012.png', NULL, NULL, 1, '2019-06-18 10:58:46', '2019-06-18 10:58:46'),
(10103013, 'Continuous Dot Printing Paper, 2 Ply', 10103, 1, 'Continuous Dot Printing Paper, 2 Ply', 'Continuous Dot Printing Paper, 2 Ply', 830.00, 0.00, 'public/images/10103013.png', NULL, NULL, 1, '2019-06-18 10:59:10', '2019-06-18 10:59:10'),
(10103014, 'Continuous Dot Printing Paper, 3 Ply', 10103, 1, 'Continuous Dot Printing Paper, 3 Ply', 'Continuous Dot Printing Paper, 3 Ply', 840.00, 0.00, 'public/images/10103014.png', NULL, NULL, 1, '2019-06-18 10:59:48', '2019-06-18 10:59:48'),
(10103015, 'Continuous Dot Printing Paper, 4 Ply', 10103, 1, 'Continuous Dot Printing Paper, 4 Ply', 'Continuous Dot Printing Paper, 4 Ply', 860.00, 0.00, 'public/images/10103015.png', NULL, NULL, 1, '2019-06-18 11:00:18', '2019-06-18 11:00:18'),
(10103016, 'Kores Carbon Paper A4 Size', 10103, 1, 'Kores Carbon Paper A4 Size', 'Kores Carbon Paper A4 Size', 265.00, 0.00, 'public/images/10103016.png', NULL, NULL, 1, '2019-06-18 11:00:43', '2019-06-18 11:00:43'),
(10103017, 'Kores Carbon Paper Double A4 Size', 10103, 1, 'Kores Carbon Paper Double A4 Size', 'Kores Carbon Paper Double A4 Size', 285.00, 0.00, 'public/images/10103017.png', NULL, NULL, 1, '2019-06-18 11:01:05', '2019-06-18 11:01:05'),
(10103018, 'Kores Carbon Paper A4 Size Blue', 10103, 1, 'Kores Carbon Paper A4 Size Blue', 'Kores Carbon Paper A4 Size Blue', 270.00, 0.00, 'public/images/10103018.png', NULL, NULL, 1, '2019-06-18 11:15:26', '2019-06-18 11:15:26'),
(10103019, 'Padma Carbon Paper **** Nopic', 10103, 1, 'Padma Carbon Paper', 'Padma Carbon Paper', 0.00, 0.00, 'public/images/10103019.png', NULL, NULL, 0, '2019-06-18 11:16:10', '2019-06-18 11:16:10'),
(10103020, 'Carbon Paper ***********Nopic', 10103, 1, 'Carbon Paper', 'Carbon Paper', 0.00, 0.00, 'public/images/10103020.png', NULL, NULL, 0, '2019-06-18 11:17:02', '2019-06-18 11:17:02'),
(10103021, 'Graph Paper Large Size', 10103, 1, 'Graph Paper Large Size', 'Graph Paper Large Size', 4.00, 0.00, 'public/images/10103021.png', NULL, NULL, 1, '2019-06-18 11:21:06', '2019-06-18 11:21:06'),
(10103022, 'Graph Paper A4 Size 100 Pcs Pack', 10103, 1, 'Graph Paper A4 Size 100 Pcs Pack', 'Graph Paper A4 Size 100 Pcs Pack', 75.00, 0.00, 'public/images/10103022.png', NULL, NULL, 1, '2019-06-18 11:21:31', '2019-06-18 11:21:31'),
(10103023, 'Pattern Paper', 10103, 1, 'Pattern Paper', 'Pattern Paper', 19.50, 0.00, 'public/images/10103023.png', NULL, NULL, 1, '2019-06-18 11:21:51', '2019-06-18 11:21:51'),
(10201001, 'Matador All-Time Ball Pen 12Pcs', 10201, 10, 'Matador All-Time Ball Pen 12Pcs', 'Matador All-Time Ball Pen 12Pcs', 55.00, 0.00, 'public/images/10201001.png', NULL, NULL, 1, '2019-06-18 11:26:50', '2019-06-18 11:26:50'),
(10201002, 'Matador Hi-Scool Ball Pen Black 12Pcs', 10201, 1, 'Matador Hi-Scool Ball Pen Black 12Pcs', 'Matador Hi-Scool Ball Pen Black 12Pcs', 50.00, 0.00, 'public/images/10201002.png', NULL, NULL, 1, '2019-06-18 11:27:45', '2019-06-18 11:27:45'),
(10201003, 'Matador Hi-Scool Ball Pen Color 12Pcs', 10201, 1, 'Matador Hi-Scool Ball Pen Color 12Pcs', 'Matador Hi-Scool Ball Pen Color 12Pcs', 52.00, 0.00, 'public/images/10201003.png', NULL, NULL, 1, '2019-06-18 11:28:05', '2019-06-18 11:28:05'),
(10201004, 'Matador Pin-Point Ball Pen Black 12Pcs', 10201, 1, 'Matador Pin-Point Ball Pen Black 12Pcs', 'Matador Pin-Point Ball Pen Black 12Pcs', 50.00, 0.00, 'public/images/10201004.png', NULL, NULL, 1, '2019-06-18 11:28:32', '2019-06-18 11:28:32'),
(10201005, 'Matador Orbit Ball Pen Black 12Pcs', 10201, 1, 'Matador Orbit Ball Pen Black 12Pcs', 'Matador Orbit Ball Pen Black 12Pcs', 50.00, 0.00, 'public/images/10201005.png', NULL, NULL, 1, '2019-06-18 11:28:50', '2019-06-18 11:28:50'),
(10201006, 'Matador Radiant Ball Pen Black 6Pcs', 10201, 1, 'Matador Radiant Ball Pen Black 6Pcs', 'Matador Radiant Ball Pen Black 6Pcs', 51.00, 0.00, 'public/images/10201006.png', NULL, NULL, 1, '2019-06-18 11:32:12', '2019-06-18 11:32:12'),
(10201007, 'Matador Glory Ball Pen Black 12Pcs', 10201, 10, 'Matador Glory Ball Pen Black 12Pcs', 'Matador Glory Ball Pen Black 12Pcs', 55.00, 0.00, 'public/images/10201007.png', NULL, NULL, 1, '2019-06-18 11:32:43', '2019-06-18 11:32:43'),
(10201008, 'Matador Envoy Ball Pen Black 6Pcs', 10201, 1, 'Matador Envoy Ball Pen Black 6Pcs', 'Matador Envoy Ball Pen Black 6Pcs', 51.00, 0.00, 'public/images/10201008.png', NULL, NULL, 1, '2019-06-18 11:33:11', '2019-06-18 11:33:11'),
(10201009, 'Matador i-teen Ball Pen Black 6Pcs', 10201, 10, 'Matador i-teen Ball Pen Black 6Pcs', 'Matador i-teen Ball Pen Black 6Pcs', 51.00, 0.00, 'public/images/10201009.png', NULL, NULL, 1, '2019-06-18 11:33:31', '2019-06-18 11:33:31'),
(10201010, 'Matador i-teen Rio Ball Pen Black 6Pcs', 10201, 10, 'Matador i-teen Rio Ball Pen Black 6Pcs', 'Matador i-teen Rio Ball Pen Black 6Pcs', 51.00, 0.00, 'public/images/10201010.png', NULL, NULL, 1, '2019-06-18 11:33:55', '2019-06-18 11:33:55'),
(10201011, 'Matador Pencilic Ball Pen Black 12Pcs', 10201, 10, 'Matador Pencilic Ball Pen Black 12Pcs', 'Matador Pencilic Ball Pen Black 12Pcs', 50.00, 0.00, 'public/images/10201011.png', NULL, NULL, 1, '2019-06-18 11:34:25', '2019-06-18 11:34:25'),
(10201012, 'Linc Ball Pen Black', 10201, 11, 'Linc Ball Pen Black', 'Linc Ball Pen Black', 8.50, 0.00, 'public/images/10201012.png', NULL, NULL, 1, '2019-06-18 11:34:49', '2019-06-18 11:34:49'),
(10201013, 'Linc Ball Pen Color', 10201, 11, 'Linc Ball Pen Color', 'Linc Ball Pen Color', 8.50, 0.00, 'public/images/10201013.png', NULL, NULL, 1, '2019-06-18 11:35:17', '2019-06-18 11:35:17'),
(10201014, 'Max Riter Ball Pen Black', 10201, 1, 'Max Riter Ball Pen Black', 'Max Riter Ball Pen Black', 14.00, 0.00, 'public/images/10201014.png', NULL, NULL, 1, '2019-06-18 11:35:44', '2019-06-18 11:35:44'),
(10201015, 'Good Luck Super Point Ball Pen Black 12 Pcs', 10201, 1, 'Good Luck Super Point Ball Pen Black 12 Pcs', 'Good Luck Super Point Ball Pen Black 12 Pcs', 48.00, 0.00, 'public/images/10201015.png', NULL, NULL, 1, '2019-06-18 11:36:08', '2019-06-18 11:36:08'),
(10201016, 'Good Luck Fine Point Ball Pen Blue 12Pcs', 10201, 1, 'Good Luck Fine Point Ball Pen Blue 12Pcs', 'Good Luck Fine Point Ball Pen Blue 12Pcs', 48.00, 0.00, 'public/images/10201016.png', NULL, NULL, 1, '2019-06-18 11:36:30', '2019-06-18 11:36:30'),
(10201017, 'Good Luck Forever Ball Pen Black 12Pcs', 10201, 12, 'Good Luck Forever Ball Pen Black 12Pcs', 'Good Luck Forever Ball Pen Black 12Pcs', 55.00, 0.00, 'public/images/10201017.png', NULL, NULL, 1, '2019-06-18 11:37:08', '2019-06-18 11:37:08'),
(10201018, 'Good Luck Topper Ball Pen Black 12Pcs', 10201, 1, 'Good Luck Topper Ball Pen Black 12Pcs', 'Good Luck Topper Ball Pen Black 12Pcs', 48.00, 0.00, 'public/images/10201018.png', NULL, NULL, 1, '2019-06-18 11:37:44', '2019-06-18 11:37:44'),
(10201019, 'Good Luck Ultima Ball Pen Black 6Pcs', 10201, 12, 'Good Luck Ultima Ball Pen Black 6Pcs', 'Good Luck Ultima Ball Pen Black 6Pcs', 51.00, 0.00, 'public/images/10201019.png', NULL, NULL, 1, '2019-06-18 11:38:13', '2019-06-18 11:38:13'),
(10201020, 'Econo FX Ball Pen Black 12Pcs', 10201, 1, 'Econo FX Ball Pen Black 12Pcs', 'Econo FX Ball Pen Black 12Pcs', 50.00, 0.00, 'public/images/10201020.png', NULL, NULL, 1, '2019-06-18 11:38:37', '2019-06-18 11:38:37'),
(10201021, 'Econo FX Ball Pen Red 12Pcs', 10201, 1, 'Econo FX Ball Pen Red 12Pcs', 'Econo FX Ball Pen Red 12Pcs', 50.00, 0.00, 'public/images/10201021.png', NULL, NULL, 1, '2019-06-18 11:39:10', '2019-06-18 11:39:10'),
(10201022, 'Econo Castle Pencil Pen 12Pcs', 10201, 13, 'Econo Castle Pencil Pen 12Pcs', 'Econo Castle Pencil Pen 12Pcs', 40.00, 0.00, 'public/images/10201022.png', NULL, NULL, 1, '2019-06-18 11:39:31', '2019-06-18 11:39:31'),
(10201023, 'Montex Ball Pen', 10201, 1, 'Montex Ball Pen', 'Montex Ball Pen', 25.00, 0.00, 'public/images/10201023.png', NULL, NULL, 1, '2019-06-18 11:40:10', '2019-06-18 11:40:10'),
(10201024, 'Good Luck Fast Gel Pen 6Pcs', 10201, 12, 'Good Luck Fast Gel Pen 6Pcs', 'Good Luck Fast Gel Pen 6Pcs', 51.00, 0.00, 'public/images/10201024.png', NULL, NULL, 1, '2019-06-18 11:51:35', '2019-06-18 11:51:35'),
(10201025, 'Matador Neon Gel Pen 6Pcs', 10201, 1, 'Matador Neon Gel Pen 6Pcs', 'Matador Neon Gel Pen 6Pcs', 60.00, 0.00, 'public/images/10201025.png', NULL, NULL, 1, '2019-06-18 11:52:05', '2019-06-18 11:52:05'),
(10201026, 'Matador Sakura Gel Pen', 10201, 1, 'Matador Sakura Gel Pen', 'Matador Sakura Gel Pen', 30.00, 0.00, 'public/images/10201026.png', NULL, NULL, 1, '2019-06-18 11:52:26', '2019-06-18 11:52:26'),
(10201027, 'Matador Fiction Gel Pen', 10201, 1, 'Matador Fiction Gel Pen', 'Matador Fiction Gel Pen', 30.00, 0.00, 'public/images/10201027.png', NULL, NULL, 1, '2019-06-18 11:52:51', '2019-06-18 11:52:51'),
(10201028, 'Matador i-teen Gel Pen Black', 10201, 10, 'Matador i-teen Gel Pen Black', 'Matador i-teen Gel Pen Black', 8.50, 0.00, 'public/images/10201028.png', NULL, NULL, 1, '2019-06-18 11:53:14', '2019-06-18 11:53:14'),
(10201029, 'Matador i-teen Gel Pen Color', 10201, 10, 'Matador i-teen Gel Pen Color', 'Matador i-teen Gel Pen Color', 8.50, 0.00, 'public/images/10201029.png', NULL, NULL, 1, '2019-06-18 11:55:16', '2019-06-18 11:55:16'),
(10201030, 'Linc Ocean Gel Pen Black', 10201, 11, 'Linc Ocean Gel Pen Black', 'Linc Ocean Gel Pen Black', 8.50, 0.00, 'public/images/10201030.png', NULL, NULL, 1, '2019-06-18 11:55:52', '2019-06-18 11:55:52'),
(10201031, 'Linc Ocean Gel Pen Color', 10201, 11, 'Linc Ocean Gel Pen Color', 'Linc Ocean Gel Pen Color', 8.50, 0.00, 'public/images/10201031.png', NULL, NULL, 1, '2019-06-18 11:56:20', '2019-06-18 11:56:20'),
(10201032, 'Montax Gel Pen Black', 10201, 1, 'Montax Gel Pen Black', 'Montax Gel Pen Black', 12.00, NULL, 'public/images/10201032.png', NULL, NULL, 1, '2019-06-18 11:56:47', '2019-06-18 11:56:47'),
(10201033, 'Montax Gel Pen Color', 10201, 1, 'Montax Gel Pen Color', 'Montax Gel Pen Color', 12.00, NULL, 'public/images/10201033.png', NULL, NULL, 1, '2019-06-18 11:57:21', '2019-06-18 11:57:21'),
(10201034, 'Matador Premio Gel Pen', 10201, 1, 'Matador Premio Gel Pen', 'Matador Premio Gel Pen', 0.00, 0.00, 'public/images/10201034.png', NULL, NULL, 0, '2019-06-18 11:57:45', '2019-06-18 11:57:45'),
(10201035, 'Uni Sign Pen Black 12Pcs', 10201, 15, 'Uni Sign Pen Black 12Pcs', 'Uni Sign Pen Black 12Pcs', 45.00, 0.00, 'public/images/10201035.png', NULL, NULL, 1, '2019-06-18 16:19:19', '2019-06-18 16:19:19'),
(10201036, 'Uni Sign Pen 12 Color 12Pcs', 10201, 1, 'Uni Sign Pen 12 Color 12Pcs', 'Uni Sign Pen 12 Color 12Pcs', 45.00, 0.00, 'public/images/10201036.png', NULL, NULL, 1, '2019-06-18 16:20:00', '2019-06-18 16:20:00'),
(10201037, 'Uni Sign Pen Blue Color 12Pcs', 10201, 1, 'Uni Sign Pen Blue Color 12Pcs', 'Uni Sign Pen Blue Color 12Pcs', 45.00, 0.00, 'public/images/10201037.png', NULL, NULL, 1, '2019-06-18 16:20:24', '2019-06-18 16:20:24'),
(10202001, 'Matador Genius Pencil HB 12Pcs', 10202, 10, 'Matador Genius Pencil HB 12Pcs', 'Matador Genius Pencil HB 12Pcs', 80.00, 0.00, 'public/images/10202001.png', NULL, NULL, 1, '2019-06-18 15:38:48', '2019-06-18 15:38:48'),
(10202002, 'Matador Genius Pencil 2B 12Pcs', 10202, 10, 'Matador Genius Pencil 2B 12Pcs', 'Matador Genius Pencil 2B 12Pcs', 80.00, 0.00, 'public/images/10202002.png', NULL, NULL, 1, '2019-06-18 15:39:13', '2019-06-18 15:39:13'),
(10202003, 'Matador Venus Pencil 2B 12Pcs', 10202, 10, 'Matador Venus Pencil 2B 12Pcs', 'Matador Venus Pencil 2B 12Pcs', 85.00, 0.00, 'public/images/10202003.png', NULL, NULL, 1, '2019-06-18 15:39:44', '2019-06-18 15:39:44'),
(10202004, 'Matador Venus Pencil HB 12Pcs', 10202, 10, 'Matador Venus Pencil HB 12Pcs', 'Matador Venus Pencil HB 12Pcs', 85.00, 0.00, 'public/images/10202004.png', NULL, NULL, 1, '2019-06-18 15:40:07', '2019-06-18 15:40:07'),
(10202005, 'Matador Venus Pencil 4B 12Pcs', 10202, 10, 'Matador Venus Pencil 4B 12Pcs', 'Matador Venus Pencil 4B 12Pcs', 108.00, 0.00, 'public/images/10202005.png', NULL, NULL, 1, '2019-06-18 15:40:32', '2019-06-18 15:40:32'),
(10202006, 'Matador i-teen Pencil HB 12Pcs', 10202, 10, 'Matador i-teen Pencil HB 12Pcs', 'Matador i-teen Pencil HB 12Pcs', 85.00, 0.00, 'public/images/10202006.png', NULL, NULL, 1, '2019-06-18 15:41:07', '2019-06-18 15:41:07'),
(10202007, 'Matador i-teen Pencil 2B 12Pcs', 10202, 10, 'Matador i-teen Pencil 2B 12Pcs', 'Matador i-teen Pencil 2B 12Pcs', 85.00, 0.00, 'public/images/10202007.png', NULL, NULL, 1, '2019-06-18 15:41:51', '2019-06-18 15:41:51'),
(10202008, 'Matador Pluto Pencil HB 12Pcs', 10202, 10, 'Matador Pluto Pencil HB 12Pcs', 'Matador Pluto Pencil HB 12Pcs', 68.00, 0.00, 'public/images/10202008.png', NULL, NULL, 1, '2019-06-18 15:42:23', '2019-06-18 15:42:23'),
(10202009, 'Matador Trio Pencil HB 12Pcs', 10202, 1, 'Matador Trio Pencil HB 12Pcs', 'Matador Trio Pencil HB 12Pcs', 72.00, 0.00, 'public/images/10202009.png', NULL, NULL, 1, '2019-06-18 15:42:47', '2019-06-18 15:42:47'),
(10202010, 'Matador Neon Pencil Dark+ 12Pcs', 10202, 10, 'Matador Neon Pencil Dark+ 12Pcs', 'Matador Neon Pencil Dark+ 12Pcs', 80.00, 0.00, 'public/images/10202010.png', NULL, NULL, 1, '2019-06-18 15:43:16', '2019-06-18 15:43:16'),
(10202011, 'Deli Black Pencil HB 12Pcs', 10202, 16, 'Deli Black Pencil HB 12Pcs', 'Deli Black Pencil HB 12Pcs', 65.00, 0.00, 'public/images/10202011.png', NULL, NULL, 1, '2019-06-18 15:43:49', '2019-06-18 15:43:49'),
(10202012, 'Deli Black Pencil 2B 12Pcs', 10202, 16, 'Deli Black Pencil 2B 12Pcs', 'Deli Black Pencil 2B 12Pcs', 70.00, 0.00, 'public/images/10202012.png', NULL, NULL, 1, '2019-06-18 15:45:53', '2019-06-18 15:45:53'),
(10202013, 'Nataraj Pencil HB 12Pcs', 10202, 1, 'Nataraj Pencil HB 12Pcs', 'Nataraj Pencil HB 12Pcs', 65.00, 0.00, 'public/images/10202013.png', NULL, NULL, 1, '2019-06-18 15:49:57', '2019-06-18 15:49:57'),
(10202014, 'Nataraj Pencil 2B 12Pcs', 10202, 1, 'Nataraj Pencil 2B 12Pcs', 'Nataraj Pencil 2B 12Pcs', 65.00, 0.00, 'public/images/10202014.png', NULL, NULL, 1, '2019-06-18 15:50:21', '2019-06-18 15:50:21'),
(10202015, 'Petra Pencil HB 12Pcs', 10202, 1, 'Petra Pencil HB 12Pcs', 'Petra Pencil HB 12Pcs', 72.00, 0.00, 'public/images/10202015.png', NULL, NULL, 1, '2019-06-18 15:50:54', '2019-06-18 15:50:54'),
(10202016, 'Petra Pencil 2B 12Pcs', 10202, 1, 'Petra Pencil 2B 12Pcs', 'Petra Pencil 2B 12Pcs', 72.00, 0.00, 'public/images/10202016.png', NULL, NULL, 1, '2019-06-18 15:51:23', '2019-06-18 15:51:23'),
(10202017, 'Livo Pencil HB 12Pcs', 10202, 17, 'Livo Pencil HB 12Pcs', 'Livo Pencil HB 12Pcs', 82.00, 0.00, 'public/images/10202017.png', NULL, NULL, 1, '2019-06-18 15:52:05', '2019-06-18 15:52:05'),
(10202018, 'Livo Pencil 2B 12Pcs', 10202, 17, 'Livo Pencil 2B 12Pcs', 'Livo Pencil 2B 12Pcs', 82.00, 0.00, 'public/images/10202018.png', NULL, NULL, 1, '2019-06-18 15:52:41', '2019-06-18 15:52:41'),
(10202019, 'Livo Pencil 4B 12Pcs', 10202, 17, 'Livo Pencil 4B 12Pcs', 'Livo Pencil 4B 12Pcs', 140.00, 0.00, 'public/images/10202019.png', NULL, NULL, 1, '2019-06-18 15:53:11', '2019-06-18 15:53:11'),
(10202020, 'Livo Pencil 6B 12Pcs', 10202, 17, 'Livo Pencil 6B 12Pcs', 'Livo Pencil 6B 12Pcs', 140.00, 0.00, 'public/images/10202020.png', NULL, NULL, 1, '2019-06-18 15:53:42', '2019-06-18 15:53:42'),
(10202021, 'Livo Pencil 8B 12Pcs', 10202, 17, 'Livo Pencil 8B 12Pcs', 'Livo Pencil 8B 12Pcs', 0.00, 0.00, 'public/images/10202021.png', NULL, NULL, 0, '2019-06-18 15:54:11', '2019-06-18 15:54:11'),
(10202022, 'Faber Castell Pencil 2B 12Pcs', 10202, 14, 'Faber Castell Pencil 2B 12Pcs', 'Faber Castell Pencil 2B 12Pcs', 95.00, 0.00, 'public/images/10202022.png', NULL, NULL, 1, '2019-06-18 15:54:57', '2019-06-18 15:54:57'),
(10202023, 'Faber Castell Pencil HB 12Pcs', 10202, 14, 'Faber Castell Pencil HB 12Pcs', 'Faber Castell Pencil HB 12Pcs', 95.00, 0.00, 'public/images/10202023.png', NULL, NULL, 1, '2019-06-18 15:55:22', '2019-06-18 15:55:22'),
(10202024, 'Moharaj Pencil HB 12Pcs', 10202, 1, 'Moharaj Pencil HB 12Pcs', 'Moharaj Pencil HB 12Pcs', 40.00, 0.00, 'public/images/10202024.png', NULL, NULL, 1, '2019-06-18 15:55:51', '2019-06-18 15:55:51'),
(10203001, 'Uni-fine White Board Marker 500 Black', 10203, 15, 'Uni-fine White Board Marker 500 Black', 'Uni-fine White Board Marker 500 Black', 32.00, 0.00, 'public/images/10203001.png', NULL, NULL, 1, '2019-06-18 14:41:47', '2019-06-18 14:41:47'),
(10203002, 'Uni-fine White Board Marker 500 Color', 10203, 15, 'Uni-fine White Board Marker 500 Color', 'Uni-fine White Board Marker 500 Color', 32.00, 0.00, 'public/images/10203002.png', NULL, NULL, 1, '2019-06-18 14:43:00', '2019-06-18 14:43:00'),
(10203003, 'Uni-fine Parmanent Marker 70 Black', 10203, 15, 'Uni-fine Parmanent Marker 70 Black', 'Uni-fine Parmanent Marker 70 Black', 30.00, 0.00, 'public/images/10203003.png', NULL, NULL, 1, '2019-06-18 14:43:33', '2019-06-18 14:43:33'),
(10203004, 'Uni-fine Parmanent Marker 70 Color', 10203, 15, 'Uni-fine Parmanent Marker 70 Color', 'Uni-fine Parmanent Marker 70 Color', 30.00, 0.00, 'public/images/10203004.png', NULL, NULL, 1, '2019-06-18 14:44:06', '2019-06-18 14:44:06'),
(10203005, 'Red Leaf Parmanent Marker 707 Black', 10203, 1, 'Red Leaf Parmanent Marker 707 Black', 'Red Leaf Parmanent Marker 707 Black', 46.00, 0.00, 'public/images/10203005.png', NULL, NULL, 1, '2019-06-18 14:44:39', '2019-06-18 14:44:39'),
(10203006, 'Red Leaf Parmanent Marker 707 Color', 10203, 1, 'Red Leaf Parmanent Marker 707 Color', 'Red Leaf Parmanent Marker 707 Color', 47.00, 0.00, 'public/images/10203006.png', NULL, NULL, 1, '2019-06-18 14:45:10', '2019-06-18 14:45:10'),
(10203007, 'Red Leaf White Board Marker 737 Black', 10203, 1, 'Red Leaf White Board Marker 737 Black', 'Red Leaf White Board Marker 737 Black', 52.00, NULL, 'public/images/10203007.png', NULL, NULL, 1, '2019-06-18 14:45:47', '2019-06-18 14:45:47'),
(10203008, 'Red Leaf White Board Marker 737 Color', 10203, 1, 'Red Leaf White Board Marker 737 Color', 'Red Leaf White Board Marker 737 Color', 52.00, NULL, 'public/images/10203008.png', NULL, NULL, 1, '2019-06-18 14:46:11', '2019-06-18 14:46:11'),
(10203009, 'Sigma Flo White Board Marker Black', 10203, 1, 'Sigma Flo White Board Marker Black', 'Sigma Flo White Board Marker Black', 52.00, 0.00, 'public/images/10203009.png', NULL, NULL, 1, '2019-06-18 14:46:47', '2019-06-18 14:46:47'),
(10203010, 'Sigma Flo White Board Marker Color', 10203, 1, 'Sigma Flo White Board Marker Color', 'Sigma Flo White Board Marker Color', 52.00, 0.00, 'public/images/10203010.png', NULL, NULL, 1, '2019-06-18 14:47:21', '2019-06-18 14:47:21'),
(10203011, 'Deli White Board Marker Black', 10203, 16, 'Deli White Board Marker Black', 'Deli White Board Marker Black', 32.00, 0.00, 'public/images/10203011.png', NULL, NULL, 1, '2019-06-18 14:47:54', '2019-06-18 14:47:54'),
(10203012, 'Deli White Board Marker Color', 10203, 16, 'Deli White Board Marker Color', 'Deli White Board Marker Color', 32.00, 0.00, 'public/images/10203012.png', NULL, NULL, 1, '2019-06-18 14:48:48', '2019-06-18 14:48:48'),
(10203013, 'Deli Parmanent Marker Black', 10203, 16, 'Deli Parmanent Marker Black', 'Deli Parmanent Marker Black', 30.00, 0.00, 'public/images/10203013.png', NULL, NULL, 1, '2019-06-18 14:49:33', '2019-06-18 14:49:33'),
(10203014, 'Deli Parmanent Marker Color', 10203, 16, 'Deli Parmanent Marker Color', 'Deli Parmanent Marker Color', 30.00, 0.00, 'public/images/10203014.png', NULL, NULL, 1, '2019-06-18 14:50:37', '2019-06-18 14:50:37'),
(10203015, 'Petra Mira White Board Marker', 10203, 1, 'Petra Mira White Board Marker', 'Petra Mira White Board Marker', 27.00, 0.00, 'public/images/10203015.png', NULL, NULL, 1, '2019-06-18 15:21:44', '2019-06-18 15:21:44'),
(10203016, 'Petra Mira Parmanent Marker', 10203, 1, 'Petra Mira Parmanent Marker', 'Petra Mira Parmanent Marker', 20.00, 0.00, 'public/images/10203016.png', NULL, NULL, 1, '2019-06-18 15:22:23', '2019-06-18 15:22:23'),
(10203017, 'Matador Mark Pro White Board Marker 3000---No pic', 10203, 1, 'Matador Mark Pro White Board Marker 3000', 'Matador Mark Pro White Board Marker 3000', 0.00, 0.00, 'public/images/10203017.png', NULL, NULL, 0, '2019-06-18 15:23:35', '2019-06-18 15:23:35'),
(10203018, 'Matador Mark Pro Parmanent Marker 5000---Nopic', 10203, 10, 'Matador Mark Pro Parmanent Marker 5000', 'Matador Mark Pro Parmanent Marker 5000', 0.00, 0.00, 'public/images/10203018.png', NULL, NULL, 0, '2019-06-18 15:24:12', '2019-06-18 15:24:12'),
(10203019, 'Gxin CD Marker Pen Black', 10203, 1, 'Gxin CD Marker Pen Black', 'Gxin CD Marker Pen Black', 20.00, 0.00, 'public/images/10203019.png', NULL, NULL, 1, '2019-06-18 15:24:45', '2019-06-18 15:24:45'),
(10203020, 'Gxin CD Marker Pen Color', 10203, 1, 'Gxin CD Marker Pen Color', 'Gxin CD Marker Pen Color', 20.00, 0.00, 'public/images/10203020.png', NULL, NULL, 1, '2019-06-18 15:25:15', '2019-06-18 15:25:15'),
(10203021, 'Staedtler Highlighter Pen Yellow', 10203, 1, 'Staedtler Highlighter Pen Yellow', 'Staedtler Highlighter Pen Yellow', 24.00, 0.00, 'public/images/10203021.png', NULL, NULL, 1, '2019-06-18 15:30:46', '2019-06-18 15:30:46'),
(10203022, 'Staedtler Highlighter Pen Green', 10203, 1, 'Staedtler Highlighter Pen Green', 'Staedtler Highlighter Pen Green', 24.00, 0.00, 'public/images/10203022.png', NULL, NULL, 1, '2019-06-18 15:31:14', '2019-06-18 15:31:14'),
(10203023, 'Good Luck Highlighter Pen', 10203, 12, 'Good Luck Highlighter Pen', 'Good Luck Highlighter Pen', 22.00, 0.00, 'public/images/10203023.png', NULL, NULL, 1, '2019-06-18 15:31:40', '2019-06-18 15:31:40'),
(10203024, 'Faber Castell Highlighter Pen', 10203, 1, 'Faber Castell Highlighter Pen', 'Faber Castell Highlighter Pen', 30.00, 0.00, 'public/images/10203024.png', NULL, NULL, 1, '2019-06-18 15:32:09', '2019-06-18 15:32:09'),
(10203025, 'Power Highlighter Pen Various Color', 10203, 1, 'Power Highlighter Pen Various Color', 'Power Highlighter Pen Various Color', 30.00, 0.00, 'public/images/10203025.png', NULL, NULL, 1, '2019-06-18 15:32:47', '2019-06-18 15:32:47'),
(10203026, 'Red Leaf Highlighter Pen Various Color', 10203, 1, 'Red Leaf Highlighter Pen Various Color', 'Red Leaf Highlighter Pen Various Color', 0.00, 0.00, 'public/images/10203026.png', NULL, NULL, 0, '2019-06-18 15:33:13', '2019-06-18 15:33:13'),
(10203027, 'Petra Premium Highlighter Pen Various Color', 10203, 1, 'Petra Premium Highlighter Pen Various Color', 'Petra Premium Highlighter Pen Various Color', 0.00, 0.00, 'public/images/10203027.png', NULL, NULL, 0, '2019-06-18 15:33:38', '2019-06-18 15:33:38'),
(10203028, 'Matador Mark Pro Highlighter Pen', 10203, 10, 'Matador Mark Pro Highlighter Pen', 'Matador Mark Pro Highlighter Pen', 23.00, 0.00, 'public/images/10203028.png', NULL, NULL, 1, '2019-06-18 15:34:09', '2019-06-18 15:34:09'),
(10203029, 'Luxor mini Highlighter Pen', 10203, 1, 'Luxor mini Highlighter Pen', 'Luxor mini Highlighter Pen', 13.00, 0.00, 'public/images/10203029.png', NULL, NULL, 1, '2019-06-18 15:34:31', '2019-06-18 15:34:31'),
(10203030, 'Uni Correction Pen', 10203, 15, 'Uni Correction Pen', 'Uni Correction Pen', 45.00, 0.00, 'public/images/10203030.png', NULL, NULL, 1, '2019-06-18 16:16:33', '2019-06-18 16:16:33'),
(10203031, 'Petra Correction Pen', 10203, 1, 'Petra Correction Pen', 'Petra Correction Pen', 30.00, 0.00, 'public/images/10203031.png', NULL, NULL, 1, '2019-06-18 16:16:55', '2019-06-18 16:16:55'),
(10203032, 'Huajie Correction Pen', 10203, 1, 'Huajie Correction Pen', 'Huajie Correction Pen', 28.00, 0.00, 'public/images/10203032.png', NULL, NULL, 1, '2019-06-18 16:17:19', '2019-06-18 16:17:19'),
(10203033, 'Daito Correction Fluid', 10203, 1, 'Daito Correction Fluid', 'Daito Correction Fluid', 45.00, 0.00, 'public/images/10203033.png', NULL, NULL, 1, '2019-06-18 16:17:39', '2019-06-18 16:17:39'),
(10203034, 'Deli Correction Pen', 10203, 16, 'Deli Correction Pen', 'Deli Correction Pen', 45.00, 0.00, 'public/images/10203034.png', NULL, NULL, 1, '2019-06-18 16:18:02', '2019-06-18 16:18:02'),
(10203035, 'Matador Officemate Correction Pen', 10203, 10, 'Matador Officemate Correction Pen', 'Matador Officemate Correction Pen', 35.00, 0.00, 'public/images/10203035.png', NULL, NULL, 1, '2019-06-18 16:18:27', '2019-06-18 16:18:27'),
(10204001, 'Matador Envoy Eraser', 10204, 10, 'Matador Envoy Eraser', 'Matador Envoy Eraser', 0.00, 0.00, 'public/images/10204001.png', NULL, NULL, 0, '2019-06-18 16:24:52', '2019-06-18 16:24:52'),
(10204002, 'Matador i-teen Eraser Big', 10204, 10, 'Matador i-teen Eraser Big', 'Matador i-teen Eraser Big', 7.50, 0.00, 'public/images/10204002.png', NULL, NULL, 1, '2019-06-18 16:25:19', '2019-06-18 16:25:19'),
(10204003, 'Matador i-teen Eraser Small', 10204, 10, 'Matador i-teen Eraser Small', 'Matador i-teen Eraser Small', 4.50, 0.00, 'public/images/10204003.png', NULL, NULL, 1, '2019-06-18 16:25:49', '2019-06-18 16:25:49'),
(10204004, 'Matador Neon Eraser Large', 10204, 10, 'Matador Neon Eraser Large', 'Matador Neon Eraser Large', 8.50, 0.00, 'public/images/10204004.png', NULL, NULL, 1, '2019-06-18 16:26:16', '2019-06-18 16:26:16'),
(10204005, 'Matador Neon Eraser Small', 10204, 10, 'Matador Neon Eraser Small', 'Matador Neon Eraser Small', 4.50, 0.00, 'public/images/10204005.png', NULL, NULL, 1, '2019-06-18 16:26:45', '2019-06-18 16:26:45'),
(10204006, 'Matador Twinkle Eraser', 10204, 10, 'Matador Twinkle Eraser', 'Matador Twinkle Eraser', 8.50, 0.00, 'public/images/10204006.png', NULL, NULL, 1, '2019-06-18 16:27:11', '2019-06-18 16:27:11'),
(10204007, 'Good Luck Eraser Treme', 10204, 12, 'Good Luck Eraser Treme', 'Good Luck Eraser Treme', 4.50, 0.00, 'public/images/10204007.png', NULL, NULL, 1, '2019-06-18 16:27:46', '2019-06-18 16:27:46'),
(10204008, 'Good Luck Eraser Spark', 10204, 12, 'Good Luck Eraser Spark', 'Good Luck Eraser Spark', 4.50, 0.00, 'public/images/10204008.png', NULL, NULL, 1, '2019-06-18 16:28:15', '2019-06-18 16:28:15'),
(10204009, 'Nataraj Eraser', 10204, 1, 'Nataraj Eraser', 'Nataraj Eraser', 4.50, 0.00, 'public/images/10204009.png', NULL, NULL, 1, '2019-06-18 16:28:44', '2019-06-18 16:28:44'),
(10204010, 'Deli Eraser Black', 10204, 16, 'Deli Eraser Black', 'Deli Eraser Black', 8.50, 0.00, 'public/images/10204010.png', NULL, NULL, 1, '2019-06-18 16:29:12', '2019-06-18 16:29:12'),
(10204011, 'Deli Eraser', 10204, 16, 'Deli Eraser', 'Deli Eraser', 13.00, 0.00, 'public/images/10204011.png', NULL, NULL, 1, '2019-06-18 16:29:45', '2019-06-18 16:29:45'),
(10204012, 'Matador Sharpmax Sharpener', 10204, 10, 'Matador Sharpmax Sharpener', 'Matador Sharpmax Sharpener', 4.50, 0.00, 'public/images/10204012.png', NULL, NULL, 1, '2019-06-18 16:30:22', '2019-06-18 16:30:22'),
(10204013, 'Nataraj Sharpener', 10204, 1, 'Nataraj Sharpener', 'Nataraj Sharpener', 4.50, 0.00, 'public/images/10204013.png', NULL, NULL, 1, '2019-06-18 16:30:48', '2019-06-18 16:30:48'),
(10204014, 'Good Luck Sharpener Tiny', 10204, 12, 'Good Luck Sharpener Tiny', 'Good Luck Sharpener Tiny', 4.50, 0.00, 'public/images/10204014.png', NULL, NULL, 1, '2019-06-18 16:31:11', '2019-06-18 16:31:11'),
(10205001, 'Matador All-Time Scale 15cm', 10205, 10, 'Matador All-Time Scale 15cm', 'Matador All-Time Scale 15cm', 8.00, 0.00, 'public/images/10205001.jpg', NULL, NULL, 1, '2019-06-18 16:34:27', '2019-06-18 16:34:27'),
(10205002, 'Matador All-Time Scale 30cm', 10205, 10, 'Matador All-Time Scale 30cm', 'Matador All-Time Scale 30cm', 14.00, 0.00, 'public/images/10205002.jpg', NULL, NULL, 1, '2019-06-18 16:34:56', '2019-06-18 16:34:56'),
(10205003, 'Stander Plastic Scale 15cm', 10205, 1, 'Stander Plastic Scale 15cm', 'Stander Plastic Scale 15cm', 5.00, 0.00, 'public/images/10205003.jpg', NULL, NULL, 1, '2019-06-18 16:35:48', '2019-06-18 16:35:48'),
(10205004, 'Stander Plastic Scale 30cm', 10205, 1, 'Stander Plastic Scale 30cm', 'Stander Plastic Scale 30cm', 9.00, 0.00, 'public/images/10205004.jpg', NULL, NULL, 1, '2019-06-18 16:36:33', '2019-06-18 16:36:33'),
(10205005, 'Color Scale 30cm', 10205, 1, 'Color Scale 30cm', 'Color Scale 30cm', 10.00, 0.00, 'public/images/10205005.jpg', NULL, NULL, 1, '2019-06-18 16:37:01', '2019-06-18 16:37:01'),
(10205006, 'Wood Scale Low Quality', 10205, 1, 'Wood Scale Low Quality*', 'Wood Scale Low Quality*', 8.00, NULL, 'public/images/10205006.jpg', NULL, NULL, 1, '2019-06-18 16:37:31', '2019-06-18 16:37:31'),
(10205007, 'Wood Scale High Quality', 10205, 1, 'Wood Scale High Quality*', 'Wood Scale High Quality*', 12.00, NULL, 'public/images/10205007.png', NULL, NULL, 1, '2019-06-18 16:38:21', '2019-06-18 16:38:21'),
(10205008, 'Steel Scale 15cm', 10205, 1, 'Steel Scale 15cm', 'Steel Scale 15cm', 10.00, 0.00, 'public/images/10205008.png', NULL, NULL, 1, '2019-06-18 16:42:11', '2019-06-18 16:42:11'),
(10205009, 'Steel Scale 30cm', 10205, 1, 'Steel Scale 30cm', 'Steel Scale 30cm', 18.00, 0.00, 'public/images/10205009.png', NULL, NULL, 1, '2019-06-18 16:42:37', '2019-06-18 16:42:37'),
(10205010, 'T Scale', 10205, 1, 'T Scale', 'T Scale', 85.00, 0.00, 'public/images/10205010.png', NULL, NULL, 1, '2019-06-18 16:43:09', '2019-06-18 16:43:09'),
(10205011, 'Matador i-teen Geometry Box', 10205, 10, 'Matador i-teen Geometry Box', 'Matador i-teen Geometry Box', 85.00, 0.00, 'public/images/10205011.png', NULL, NULL, 1, '2019-06-18 16:44:42', '2019-06-18 16:44:42'),
(10205012, 'Matador i-teen Smart Geometry Tools', 10205, 10, 'Matador i-teen Smart Geometry Tools', 'Matador i-teen Smart Geometry Tools', 125.00, 0.00, 'public/images/10205012.png', NULL, NULL, 1, '2019-06-18 16:45:14', '2019-06-18 16:45:14'),
(10205013, 'Max Geometry Box', 10205, 1, 'Max Geometry Box', 'Max Geometry Box', 60.00, 0.00, 'public/images/10205013.png', NULL, NULL, 1, '2019-06-18 16:45:42', '2019-06-18 16:45:42'),
(10205014, 'Marshal Geometry Box', 10205, 1, 'Marshal Geometry Box', 'Marshal Geometry Box', 60.00, 0.00, 'public/images/10205014.png', NULL, NULL, 1, '2019-06-18 16:46:17', '2019-06-18 16:46:17'),
(10205015, 'Livo Geometry Box', 10205, 17, 'Livo Geometry Box', 'Livo Geometry Box', 85.00, 0.00, 'public/images/10205015.png', NULL, NULL, 1, '2019-06-18 16:46:56', '2019-06-18 16:46:56'),
(10205016, 'Faber Castell Geometry Box', 10205, 14, 'Faber Castell Geometry Box', 'Faber Castell Geometry Box', 165.00, 0.00, 'public/images/10205016.png', NULL, NULL, 1, '2019-06-18 16:47:30', '2019-06-18 16:47:30'),
(10205017, 'Nataraj Geometry Box', 10205, 1, 'Nataraj Geometry Box', 'Nataraj Geometry Box', 150.00, 0.00, 'public/images/10205017.png', NULL, NULL, 1, '2019-06-18 16:47:54', '2019-06-18 16:47:54'),
(10301001, 'Matador Officemate Stapler Big', 10301, 10, 'Matador Officemate Stapler Big', 'Matador Officemate Stapler Big', 90.00, 0.00, 'public/images/10301001.png', NULL, NULL, 1, '2019-06-19 12:22:46', '2019-06-19 12:22:46'),
(10301002, 'Matador Officemate Stapler Small', 10301, 10, 'Matador Officemate Stapler Small', 'Matador Officemate Stapler Small', 40.00, 0.00, 'public/images/10301002.png', NULL, NULL, 1, '2019-06-19 12:23:10', '2019-06-19 12:23:10'),
(10301003, 'Matador Officemate Stapler mini 24/6', 10301, 10, 'Matador Officemate Stapler mini 24/6', 'Matador Officemate Stapler mini 24/6', 45.00, 0.00, 'public/images/10301003.png', NULL, NULL, 1, '2019-06-19 12:23:30', '2019-06-19 12:23:30'),
(10301004, 'Deli Stapler 0306 for 24/6', 10301, 16, 'Deli Stapler 0306 for 24/6', 'Deli Stapler 0306 for 24/6', 90.00, 0.00, 'public/images/10301004.png', NULL, NULL, 1, '2019-06-19 12:23:57', '2019-06-19 12:23:57'),
(10301005, 'Deli Stapler 303 for 24/6', 10301, 1, 'Deli Stapler 303 for 24/6', 'Deli Stapler 303 for 24/6', 45.00, 0.00, 'public/images/10301005.png', NULL, NULL, 1, '2019-06-19 12:24:22', '2019-06-19 12:24:22'),
(10301006, 'Deli Stapler 221 for #10', 10301, 16, 'Deli Stapler 221 for #10', 'Deli Stapler 221 for #10', 65.00, 0.00, 'public/images/10301006.png', NULL, NULL, 1, '2019-06-19 12:24:45', '2019-06-19 12:24:45'),
(10301007, 'Deli Stapler 222 for #10', 10301, 16, 'Deli Stapler 222 for #10', 'Deli Stapler 222 for #10', 40.00, 0.00, 'public/images/10301007.png', NULL, NULL, 1, '2019-06-19 12:25:08', '2019-06-19 12:25:08'),
(10301008, 'Deli Stapler 393 for 23/17', 10301, 16, 'Deli Stapler 393 for 23/17', 'Deli Stapler 393 for 23/17', 1180.00, 0.00, 'public/images/10301008.png', NULL, NULL, 1, '2019-06-19 12:25:35', '2019-06-19 12:25:35'),
(10301009, 'Deli Stapler 394 for 23/17', 10301, 16, 'Deli Stapler 394 for 23/17', 'Deli Stapler 394 for 23/17', 630.00, 0.00, 'public/images/10301009.png', NULL, NULL, 1, '2019-06-19 12:26:01', '2019-06-19 12:26:01'),
(10301010, 'Kangaro Stapler HD-45 for 24/6', 10301, 1, 'Kangaro Stapler HD-45 for 24/6', 'Kangaro Stapler HD-45 for 24/6', 120.00, 0.00, 'public/images/10301010.png', NULL, NULL, 1, '2019-06-19 12:26:25', '2019-06-19 12:26:25'),
(10301011, 'Kangaro Stapler HP-45 for 24/6', 10301, 1, 'Kangaro Stapler HP-45 for 24/6', 'Kangaro Stapler HP-45 for 24/6', 245.00, 0.00, 'public/images/10301011.png', NULL, NULL, 1, '2019-06-19 12:26:53', '2019-06-19 12:26:53'),
(10301012, 'Kangaro Stapler Mini HD-45 for #10', 10301, 1, 'Kangaro Stapler Mini HD-45 for #10', 'Kangaro Stapler Mini HD-45 for #10', 70.00, 0.00, 'public/images/10301012.png', NULL, NULL, 1, '2019-06-19 12:27:20', '2019-06-19 12:27:20'),
(10301013, 'Kangaro Stapler Mini HD-45 for 24/6', 10301, 1, 'Kangaro Stapler Mini HD-45 for 24/6', 'Kangaro Stapler Mini HD-45 for 24/6', 70.00, 0.00, 'public/images/10301013.png', NULL, NULL, 1, '2019-06-19 12:27:48', '2019-06-19 12:27:48'),
(10301014, 'Kangaro Stapler 23/17', 10301, 1, 'Kangaro Stapler 23/17', 'Kangaro Stapler 23/17', 1590.00, 0.00, 'public/images/10301014.png', NULL, NULL, 1, '2019-06-19 12:28:11', '2019-06-19 12:28:11'),
(10301015, 'Deli Punch Machine 136', 10301, 16, 'Deli Punch Machine 136', 'Deli Punch Machine 136', 88.00, 0.00, 'public/images/10301015.png', NULL, NULL, 1, '2019-06-19 12:29:09', '2019-06-19 12:29:09'),
(10301016, 'Deli Punch Machine 0137', 10301, 16, 'Deli Punch Machine 0137', 'Deli Punch Machine 0137', 170.00, 0.00, 'public/images/10301016.png', NULL, NULL, 1, '2019-06-19 12:29:34', '2019-06-19 12:29:34'),
(10301017, 'Kangaro Punch Machine DP-280', 10301, 1, 'Kangaro Punch Machine DP-280', 'Kangaro Punch Machine DP-280', 90.00, 0.00, 'public/images/10301017.png', NULL, NULL, 1, '2019-06-19 12:30:02', '2019-06-19 12:30:02'),
(10301018, 'Kangaro Punch Machine DP-600', 10301, 1, 'Kangaro Punch Machine DP-600', 'Kangaro Punch Machine DP-600', 180.00, 0.00, 'public/images/10301018.png', NULL, NULL, 1, '2019-06-19 12:30:33', '2019-06-19 12:30:33'),
(10301019, 'Matador Officemate Punch Machine', 10301, 10, 'Matador Officemate Punch Machine', 'Matador Officemate Punch Machine', 95.00, 0.00, 'public/images/10301019.png', NULL, NULL, 1, '2019-06-19 12:30:59', '2019-06-19 12:30:59'),
(10301020, 'Matador Officemate Pin Remover', 10301, 10, 'Matador Officemate Pin Remover', 'Matador Officemate Pin Remover', 28.00, 0.00, 'public/images/10301020.png', NULL, NULL, 1, '2019-06-19 20:24:05', '2019-06-19 20:24:05'),
(10301021, 'Deli Pin Remover', 10301, 16, 'Deli Pin Remover', 'Deli Pin Remover', 35.00, 0.00, 'public/images/10301021.png', NULL, NULL, 1, '2019-06-19 20:24:56', '2019-06-19 20:24:56'),
(10301022, 'Kangaro Pin Remover', 10301, 1, 'Kangaro Pin Remover', 'Kangaro Pin Remover', 35.00, 0.00, 'public/images/10301022.png', NULL, NULL, 1, '2019-06-19 20:25:28', '2019-06-19 20:25:28'),
(10302001, 'Deli Stapler Pin #10', 10302, 16, 'Deli Stapler Pin #10', 'Deli Stapler Pin #10', 12.00, 0.00, 'public/images/10302001.png', NULL, NULL, 1, '2019-06-19 12:33:28', '2019-06-19 12:33:28'),
(10302002, 'Deli Stapler Pin 24/6', 10302, 16, 'Deli Stapler Pin 24/6', 'Deli Stapler Pin 24/6', 15.00, 0.00, 'public/images/10302002.png', NULL, NULL, 1, '2019-06-19 12:33:55', '2019-06-19 12:33:55'),
(10302003, 'Kangaro Stapler Pin #10', 10302, 1, 'Kangaro Stapler Pin #10', 'Kangaro Stapler Pin #10', 15.00, 0.00, 'public/images/10302003.png', NULL, NULL, 1, '2019-06-19 12:34:31', '2019-06-19 12:34:31'),
(10302004, 'Kangaro Stapler Pin 24/6', 10302, 1, 'Kangaro Stapler Pin 24/6', 'Kangaro Stapler Pin 24/6', 20.00, 0.00, 'public/images/10302004.png', NULL, NULL, 1, '2019-06-19 12:34:59', '2019-06-19 12:34:59'),
(10302005, 'Kangaro Stapler Pin 23/17', 10302, 1, 'Kangaro Stapler Pin 23/17', 'Kangaro Stapler Pin 23/17', 95.00, 0.00, 'public/images/10302005.png', NULL, NULL, 1, '2019-06-19 12:35:29', '2019-06-19 12:35:29'),
(10302006, 'Great Wall 369 Stapler Pin', 10302, 1, 'Great Wall 369 Stapler Pin', 'Great Wall 369 Stapler Pin', 15.00, 0.00, 'public/images/10302006.png', NULL, NULL, 1, '2019-06-19 12:35:51', '2019-06-19 12:35:51'),
(10302007, 'Helicon Stapler Pin #10', 10302, 1, 'Helicon Stapler Pin #10', 'Helicon Stapler Pin #10', 12.00, 0.00, 'public/images/10302007.png', NULL, NULL, 1, '2019-06-19 12:36:13', '2019-06-19 12:36:13'),
(10302008, 'Helicon Stapler Pin 24/6', 10302, 1, 'Helicon Stapler Pin 24/6', 'Helicon Stapler Pin 24/6', 15.00, 0.00, 'public/images/10302008.png', NULL, NULL, 1, '2019-06-19 12:36:39', '2019-06-19 12:36:39'),
(10302009, 'Matador Stapler Pin 24/6', 10302, 10, 'Matador Stapler Pin 24/6', 'Matador Stapler Pin 24/6', 16.00, 0.00, 'public/images/10302009.png', NULL, NULL, 1, '2019-06-19 12:37:01', '2019-06-19 12:37:01'),
(10302010, 'Matador Stapler Pin #10', 10302, 10, 'Matador Stapler Pin #10', 'Matador Stapler Pin #10', 13.00, 0.00, 'public/images/10302010.png', NULL, NULL, 1, '2019-06-19 12:37:36', '2019-06-19 12:37:36'),
(10302011, 'Good Luck Stapler Pin 24/6', 10302, 12, 'Good Luck Stapler Pin 24/6', 'Good Luck Stapler Pin 24/6', 15.00, 0.00, 'public/images/10302011.png', NULL, NULL, 1, '2019-06-19 12:38:11', '2019-06-19 12:38:11'),
(10302012, 'Good Luck Stapler Pin #10', 10302, 12, 'Good Luck Stapler Pin #10', 'Good Luck Stapler Pin #10', 13.00, 0.00, 'public/images/10302012.png', NULL, NULL, 1, '2019-06-19 12:38:37', '2019-06-19 12:38:37'),
(10302013, 'Deli Office Pin', 10302, 16, 'Deli Office Pin', 'Deli Office Pin', 18.00, 0.00, 'public/images/10302013.png', NULL, NULL, 1, '2019-06-19 15:44:39', '2019-06-19 15:44:39'),
(10302014, 'DL Office Pin 777', 10302, 1, 'DL Office Pin 777', 'DL Office Pin 777', 18.00, 0.00, 'public/images/10302014.png', NULL, NULL, 1, '2019-06-19 15:45:07', '2019-06-19 15:45:07'),
(10302015, 'Office Pin,Nickle Plated,50gm  --- Nopic', 10302, 1, 'Office Pin,Nickle Plated,50gm', 'Office Pin,Nickle Plated,50gm', 0.00, 0.00, 'public/images/10302015.png', NULL, NULL, 0, '2019-06-19 15:45:36', '2019-06-19 15:45:36'),
(10302016, 'ABEL Board Pin', 10302, 1, 'ABEL Board Pin', 'ABEL Board Pin', 20.00, 0.00, 'public/images/10302016.png', NULL, NULL, 1, '2019-06-19 20:11:30', '2019-06-19 20:11:30'),
(10302017, 'Steel Board Pin', 10302, 1, 'Steel Board Pin', 'Steel Board Pin', 10.00, 0.00, 'public/images/10302017.png', NULL, NULL, 1, '2019-06-19 20:12:00', '2019-06-19 20:12:00'),
(10302018, 'Deli Board Pin', 10302, 16, 'Deli Board Pin', 'Deli Board Pin', 22.00, 0.00, 'public/images/10302018.png', NULL, NULL, 1, '2019-06-19 20:12:48', '2019-06-19 20:12:48'),
(10302019, 'Deli Gems Clip', 10302, 16, 'Deli Gems Clip', 'Deli Gems Clip', 32.00, 0.00, 'public/images/10302019.png', NULL, NULL, 1, '2019-06-19 20:13:41', '2019-06-19 20:13:41'),
(10302020, 'WAB Gems Clip', 10302, 1, 'WAB Gems Clip', 'WAB Gems Clip', 10.00, 0.00, 'public/images/10302020.png', NULL, NULL, 1, '2019-06-19 20:14:30', '2019-06-19 20:14:30'),
(10302021, 'ABEL Gems Clip', 10302, 1, 'ABEL Gems Clip', 'ABEL Gems Clip', 20.00, 0.00, 'public/images/10302021.png', NULL, NULL, 1, '2019-06-19 20:15:08', '2019-06-19 20:15:08'),
(10302022, 'Binder Clip 15mm 12Pcs', 10302, 1, 'Binder Clip 15mm 12Pcs', 'Binder Clip 15mm 12Pcs', 0.00, 0.00, 'public/images/10302022.png', NULL, NULL, 0, '2019-06-19 20:16:28', '2019-06-19 20:16:28'),
(10302023, 'Binder Clip 19mm 12Pcs', 10302, 1, 'Binder Clip 19mm 12Pcs', 'Binder Clip 19mm 12Pcs', 25.00, 0.00, 'public/images/10302023.png', NULL, NULL, 1, '2019-06-19 20:17:04', '2019-06-19 20:17:04'),
(10302024, 'Binder Clip 25mm 12Pcs', 10302, 1, 'Binder Clip 25mm 12Pcs', 'Binder Clip 25mm 12Pcs', 35.00, 0.00, 'public/images/10302024.png', NULL, NULL, 1, '2019-06-19 20:17:41', '2019-06-19 20:17:41');
INSERT INTO `tbl_product` (`product_id`, `product_name`, `sub_category_id`, `brand_id`, `product_short_description`, `product_long_description`, `product_price`, `offer`, `product_picture`, `product_size`, `product_color`, `publication_status`, `created_at`, `updated_at`) VALUES
(10302025, 'Binder Clip 32mm 12Pcs', 10302, 1, 'Binder Clip 32mm 12Pcs', 'Binder Clip 32mm 12Pcs', 40.00, 0.00, 'public/images/10302025.png', NULL, NULL, 1, '2019-06-19 20:18:24', '2019-06-19 20:18:24'),
(10302026, 'Binder Clip 41mm 12Pcs', 10302, 1, 'Binder Clip 41mm 12Pcs', 'Binder Clip 41mm 12Pcs', 65.00, 0.00, 'public/images/10302026.png', NULL, NULL, 1, '2019-06-19 20:19:20', '2019-06-19 20:19:20'),
(10302027, 'Binder Clip 51mm 12Pcs', 10302, 1, 'Binder Clip 51mm 12Pcs', 'Binder Clip 51mm 12Pcs', 90.00, 0.00, 'public/images/10302027.png', NULL, NULL, 1, '2019-06-19 20:19:57', '2019-06-19 20:19:57'),
(10303001, 'Deli Anti Cutter 2041', 10303, 16, 'Deli Anti Cutter 2041', 'Deli Anti Cutter 2041', 80.00, 0.00, 'public/images/10303001.png', NULL, NULL, 1, '2019-06-19 20:32:49', '2019-06-19 20:32:49'),
(10303002, 'Deli Anti Cutter 2061', 10303, 16, 'Deli Anti Cutter 2061', 'Deli Anti Cutter 2061', 60.00, 0.00, 'public/images/10303002.png', NULL, NULL, 1, '2019-06-19 20:38:26', '2019-06-19 20:38:26'),
(10303003, 'Deli Anti Cutter 2031', 10303, 16, 'Deli Anti Cutter 2031', 'Deli Anti Cutter 2031', 40.00, 0.00, 'public/images/10303003.png', NULL, NULL, 1, '2019-06-19 20:38:59', '2019-06-19 20:38:59'),
(10303004, 'Haixin HX 16 Ani Cutter', 10303, 1, 'Haixin HX 16 Ani Cutter', 'Haixin HX 16 Ani Cutter', 0.00, 0.00, 'public/images/10303004.png', NULL, NULL, 0, '2019-06-19 20:40:28', '2019-06-19 20:40:28'),
(10303005, 'Matador Officemate Knife Small', 10303, 1, 'Matador Officemate Knife Small', 'Matador Officemate Knife Small', 42.00, 0.00, 'public/images/10303005.png', NULL, NULL, 1, '2019-06-19 20:41:10', '2019-06-19 20:41:10'),
(10303006, 'Matador Officemate Knife Big', 10303, 10, 'Matador Officemate Knife Big', 'Matador Officemate Knife Big', 85.00, 0.00, 'public/images/10303006.png', NULL, NULL, 1, '2019-06-19 20:42:30', '2019-06-19 20:42:30'),
(10303007, 'Deli Scissor 6021', 10303, 16, 'Deli Scissor 6021', 'Deli Scissor 6021', 35.00, 0.00, 'public/images/10303007.png', NULL, NULL, 1, '2019-06-19 20:51:07', '2019-06-19 20:51:07'),
(10303008, 'Deli Scissor 6009', 10303, 16, 'Deli Scissor 6009', 'Deli Scissor 6009', 60.00, 0.00, 'public/images/10303008.png', NULL, NULL, 1, '2019-06-19 20:51:46', '2019-06-19 20:51:46'),
(10303009, 'Deli Scissor 6010', 10303, 16, 'Deli Scissor 6010', 'Deli Scissor 6010', 78.00, 0.00, 'public/images/10303009.png', NULL, NULL, 1, '2019-06-19 20:52:24', '2019-06-19 20:52:24'),
(10303010, 'Deli Scissor 6014', 10303, 16, 'Deli Scissor 6014', 'Deli Scissor 6014', 85.00, 0.00, 'public/images/10303010.png', NULL, NULL, 1, '2019-06-19 20:53:10', '2019-06-19 20:53:10'),
(10303011, 'Pakistani Scissor Steel Original', 10303, 1, 'Pakistani Scissor Steel Original', 'Pakistani Scissor Steel Original', 40.00, 0.00, 'public/images/10303011.png', NULL, NULL, 1, '2019-06-19 20:53:50', '2019-06-19 20:53:50'),
(10303012, 'Pakistani Scissor Steel Copy', 10303, 1, 'Pakistani Scissor Steel Copy', 'Pakistani Scissor Steel Copy', 35.00, 0.00, 'public/images/10303012.png', NULL, NULL, 1, '2019-06-19 20:54:17', '2019-06-19 20:54:17'),
(10304001, 'Altico Super Glue', 10304, 1, 'Altico Super Glue', 'Altico Super Glue', 16.00, 0.00, 'public/images/10304001.png', NULL, NULL, 1, '2019-06-19 21:03:24', '2019-06-19 21:03:24'),
(10304002, 'Master Gum 70gm', 10304, 1, 'Master Gum 70gm', 'Master Gum 70gm', 8.00, 0.00, 'public/images/10304002.png', NULL, NULL, 1, '2019-06-19 21:04:00', '2019-06-19 21:04:00'),
(10304003, 'Master Gum 150gm', 10304, 1, 'Master Gum 150gm', 'Master Gum 150gm', 15.00, 0.00, 'public/images/10304003.png', NULL, NULL, 1, '2019-06-19 21:04:52', '2019-06-19 21:04:52'),
(10304004, 'Master Gum 500gm', 10304, 1, 'Master Gum 500gm', 'Master Gum 500gm', 45.00, 0.00, 'public/images/10304004.png', NULL, NULL, 1, '2019-06-19 21:06:58', '2019-06-19 21:06:58'),
(10304005, 'Master Gum 1000gm', 10304, 1, 'Master Gum 1000gm', 'Master Gum 1000gm', 45.00, 0.00, 'public/images/10304005.png', NULL, NULL, 1, '2019-06-19 21:07:21', '2019-06-19 21:07:21'),
(10304006, 'Favicol Gum 100gm', 10304, 1, 'Favicol Gum 100gm', 'Favicol Gum 100gm', 0.00, 0.00, 'public/images/10304006.png', NULL, NULL, 0, '2019-06-19 21:08:03', '2019-06-19 21:08:03'),
(10304007, 'Favicol Gum 250gm', 10304, 1, 'Favicol Gum 250gm', 'Favicol Gum 250gm', 0.00, 0.00, 'public/images/10304007.png', NULL, NULL, 0, '2019-06-19 22:26:43', '2019-06-19 22:26:43'),
(10304008, 'Favicol Gum 1kg', 10304, 1, 'Favicol Gum 1kg', 'Favicol Gum 1kg', 0.00, 0.00, 'public/images/10304008.png', NULL, NULL, 0, '2019-06-19 22:27:05', '2019-06-19 22:27:05'),
(10304009, 'Hopson Gum 100gm', 10304, 1, 'Hopson Gum 100gm', 'Hopson Gum 100gm', 0.00, 0.00, 'public/images/10304009.png', NULL, NULL, 0, '2019-06-19 22:27:24', '2019-06-19 22:27:24'),
(10304010, 'Favicol MR Gum Tube 22.5gm', 10304, 1, 'Favicol MR Gum Tube 22.5gm', 'Favicol MR Gum Tube 22.5gm', 18.00, 0.00, 'public/images/10304010.png', NULL, NULL, 1, '2019-06-19 22:27:48', '2019-06-19 22:27:48'),
(10304011, 'Favicol MR Gum Tube 50gm', 10304, 1, 'Favicol MR Gum Tube 50gm', 'Favicol MR Gum Tube 50gm', 35.00, 0.00, 'public/images/10304011.png', NULL, NULL, 1, '2019-06-19 22:28:20', '2019-06-19 22:28:20'),
(10304012, 'Favicol MR Gum Tube 100gm', 10304, 1, 'Favicol MR Gum Tube 100gm', 'Favicol MR Gum Tube 100gm', 60.00, 0.00, 'public/images/10304012.png', NULL, NULL, 1, '2019-06-19 22:28:43', '2019-06-19 22:28:43'),
(10304013, 'Deli Water Glue or Kippy Gum', 10304, 1, 'Deli Water Glue or Kippy Gum', 'Deli Water Glue or Kippy Gum', 0.00, 0.00, 'public/images/10304013.png', NULL, NULL, 0, '2019-06-19 22:29:11', '2019-06-19 22:29:11'),
(10304014, 'Mondete 19 Water Glue or Kippy Gum', 10304, 1, 'Mondete 19 Water Glue or Kippy Gum', 'Mondete 19 Water Glue or Kippy Gum', 35.00, 0.00, 'public/images/10304014.png', NULL, NULL, 1, '2019-06-19 22:29:40', '2019-06-19 22:29:40'),
(10304015, 'TOP Kippy Glue', 10304, 1, 'TOP Kippy Glue', 'TOP Kippy Glue', 16.00, 0.00, 'public/images/10304015.png', NULL, NULL, 1, '2019-06-19 22:30:10', '2019-06-19 22:30:10'),
(10304016, 'Favistick Gum 8gm', 10304, 1, 'Favistick Gum 8gm', 'Favistick Gum 8gm', 35.00, 0.00, 'public/images/10304016.png', NULL, NULL, 1, '2019-06-19 22:30:38', '2019-06-19 22:30:38'),
(10304017, 'Favistick Gum 15gm', 10304, 1, 'Favistick Gum 15gm', 'Favistick Gum 15gm', 45.00, 0.00, 'public/images/10304017.png', NULL, NULL, 1, '2019-06-19 22:31:05', '2019-06-19 22:31:05'),
(10304018, 'Glue Gun Machine Big', 10304, 1, 'Glue Gun Machine Big', 'Glue Gun Machine Big', 190.00, 0.00, 'public/images/10304018.png', NULL, NULL, 1, '2019-06-19 22:31:31', '2019-06-19 22:31:31'),
(10304019, 'Glue Gun Machine Small', 10304, 1, 'Glue Gun Machine Small', 'Glue Gun Machine Small', 165.00, 0.00, 'public/images/10304019.png', NULL, NULL, 1, '2019-06-19 22:31:58', '2019-06-19 22:31:58'),
(10304020, 'Glue Gun Stick Big', 10304, 1, 'Glue Gun Stick Big', 'Glue Gun Stick Big', 10.00, 0.00, 'public/images/10304020.png', NULL, NULL, 1, '2019-06-19 22:32:24', '2019-06-19 22:32:24'),
(10304021, 'Glue Gun Stick Small', 10304, 1, 'Glue Gun Stick Small', 'Glue Gun Stick Small', 8.00, 0.00, 'public/images/10304021.png', NULL, NULL, 1, '2019-06-19 22:33:07', '2019-06-19 22:33:07'),
(10304022, '1/2\" inch Transparent Tape', 10304, 1, '1/2\" inch Transparent Tape', '1/2\" inch Transparent Tape', 7.00, 0.00, 'public/images/10304022.png', NULL, NULL, 1, '2019-06-19 22:34:05', '2019-06-19 22:34:05'),
(10304023, '3/4\" inch Transparent Tape', 10304, 1, '3/4\" inch Transparent Tape', '3/4\" inch Transparent Tape', 9.00, 0.00, 'public/images/10304023.png', NULL, NULL, 1, '2019-06-19 22:34:31', '2019-06-19 22:34:31'),
(10304024, 'SCOTIA Transparent Tape 1\"', 10304, 1, 'SCOTIA Transparent Tape 1\"', 'SCOTIA Transparent Tape 1\"', 22.00, 0.00, 'public/images/10304024.png', NULL, NULL, 1, '2019-06-19 22:34:54', '2019-06-19 22:34:54'),
(10304025, 'SCOTIA Transparent Tape 2\"', 10304, 1, 'SCOTIA Transparent Tape 2\"', 'SCOTIA Transparent Tape 2\"', 45.00, 0.00, 'public/images/10304025.png', NULL, NULL, 1, '2019-06-19 22:35:18', '2019-06-19 22:35:18'),
(10304026, 'SCOTIA Transparent Tape 2.5\"', 10304, 1, 'SCOTIA Transparent Tape 2.5\"', 'SCOTIA Transparent Tape 2.5\"', 55.00, 0.00, 'public/images/10304026.png', NULL, NULL, 1, '2019-06-19 22:35:40', '2019-06-19 22:35:40'),
(10304027, 'SCOTIA Transparent Tape 3\"', 10304, 1, 'SCOTIA Transparent Tape 3\"', 'SCOTIA Transparent Tape 3\"', 70.00, 0.00, 'public/images/10304027.png', NULL, NULL, 1, '2019-06-19 22:36:04', '2019-06-19 22:36:04'),
(10304028, 'Pakaging Tape (Khaki) 2\"', 10304, 1, 'Pakaging Tape (Khaki) 2\"', 'Pakaging Tape (Khaki) 2\"', 45.00, 0.00, 'public/images/10304028.png', NULL, NULL, 1, '2019-06-19 22:36:24', '2019-06-19 22:36:24'),
(10304029, 'Pakaging Tape (Khaki) 2.5\"', 10304, 1, 'Pakaging Tape (Khaki) 2.5\"', 'Pakaging Tape (Khaki) 2.5\"', 55.00, 0.00, 'public/images/10304029.png', NULL, NULL, 1, '2019-06-19 22:36:47', '2019-06-19 22:36:47'),
(10304030, 'Pakaging Tape (Khaki) 3\"', 10304, 1, 'Pakaging Tape (Khaki) 3\"', 'Pakaging Tape (Khaki) 3\"', 70.00, 0.00, 'public/images/10304030.png', NULL, NULL, 1, '2019-06-19 22:37:11', '2019-06-19 22:37:11'),
(10304031, 'Maskin Tape 3/4', 10304, 1, 'Maskin Tape 3/4', 'Maskin Tape 3/4', 15.00, 0.00, 'public/images/10304031.png', NULL, NULL, 1, '2019-06-19 22:37:31', '2019-06-19 22:37:31'),
(10304032, 'Maskin Tape 1\"', 10304, 1, 'Maskin Tape 1\"', 'Maskin Tape 1\"', 18.00, 0.00, 'public/images/10304032.png', NULL, NULL, 1, '2019-06-19 22:38:04', '2019-06-19 22:38:04'),
(10304033, 'Maskin Tape 2\"', 10304, 1, 'Maskin Tape 2\"', 'Maskin Tape 2\"', 25.00, 0.00, 'public/images/10304033.png', NULL, NULL, 1, '2019-06-19 22:38:26', '2019-06-19 22:38:26'),
(10304034, 'Both Side Tape 1/2\"', 10304, 1, 'Both Side Tape 1/2\"', 'Both Side Tape 1/2\"', 25.00, 0.00, 'public/images/10304034.png', NULL, NULL, 1, '2019-06-19 22:38:53', '2019-06-19 22:38:53'),
(10304035, 'Both Side Tape 1\"', 10304, 1, 'Both Side Tape 1\"', 'Both Side Tape 1\"', 42.00, 0.00, 'public/images/10304035.png', NULL, NULL, 1, '2019-06-19 22:39:19', '2019-06-19 22:39:19'),
(10304036, 'Both Side Tape 2\"', 10304, 1, 'Both Side Tape 2\"', 'Both Side Tape 2\"', 75.00, 0.00, 'public/images/10304036.png', NULL, NULL, 1, '2019-06-19 22:39:44', '2019-06-19 22:39:44'),
(10304037, 'Binding Tape 2\" Various Color 6pcs/pack', 10304, 1, 'Binding Tape 2\" Various Color 6pcs/pack', 'Binding Tape 2\" Various Color 6pcs/pack', 192.00, 0.00, 'public/images/10304037.png', NULL, NULL, 1, '2019-06-19 22:40:14', '2019-06-19 22:40:14'),
(10304038, 'Binding Tape 2\" Various Color 1pcs/pack', 10304, 1, 'Binding Tape 2\" Various Color 1pcs/pack', 'Binding Tape 2\" Various Color 1pcs/pack', 35.00, 0.00, 'public/images/10304038.png', NULL, NULL, 1, '2019-06-19 22:40:44', '2019-06-19 22:40:44'),
(10304039, 'Louis Tape', 10304, 1, 'Louis Tape', 'Louis Tape', 15.00, 0.00, 'public/images/10304039.png', NULL, NULL, 1, '2019-06-19 22:41:11', '2019-06-19 22:41:11'),
(10304040, 'OSAKA Tape Original', 10304, 1, 'OSAKA Tape Original', 'OSAKA Tape Original', 15.00, 0.00, 'public/images/10304040.png', NULL, NULL, 1, '2019-06-19 22:41:45', '2019-06-19 22:41:45'),
(10304041, 'OSAKA Tape Local', 10304, 1, 'OSAKA Tape Local', 'OSAKA Tape Local', 12.00, 0.00, 'public/images/10304041.png', NULL, NULL, 1, '2019-06-19 22:42:20', '2019-06-19 22:42:20'),
(10305001, 'Artline Stamp Pad', 10305, 1, 'Artline Stamp Pad', 'Artline Stamp Pad', 58.00, 0.00, 'public/images/10305001.png', NULL, NULL, 1, '2019-06-20 06:58:45', '2019-06-20 06:58:45'),
(10305002, 'Artline Stamp Pad Original', 10305, 1, 'Artline Stamp Pad Original', 'Artline Stamp Pad Original', 125.00, 0.00, 'public/images/10305002.png', NULL, NULL, 1, '2019-06-20 06:59:15', '2019-06-20 06:59:15'),
(10305003, 'Sony Stamp Pad Big', 10305, 1, 'Sony Stamp Pad Big', 'Sony Stamp Pad Big', 45.00, 0.00, 'public/images/10305003.png', NULL, NULL, 1, '2019-06-20 06:59:37', '2019-06-20 06:59:37'),
(10305004, 'Sony Stamp Pad Small', 10305, 1, 'Sony Stamp Pad Small', 'Sony Stamp Pad Small', 35.00, 0.00, 'public/images/10305004.png', NULL, NULL, 1, '2019-06-20 06:59:58', '2019-06-20 06:59:58'),
(10305005, 'Horse Stamp Pad Big', 10305, 1, 'Horse Stamp Pad Big', 'Horse Stamp Pad Big', 110.00, 0.00, 'public/images/10305005.png', NULL, NULL, 1, '2019-06-20 07:00:22', '2019-06-20 07:00:22'),
(10305006, 'Horse Stamp Pad Small', 10305, 1, 'Horse Stamp Pad Small', 'Horse Stamp Pad Small', 95.00, 0.00, 'public/images/10305006.png', NULL, NULL, 1, '2019-06-20 07:00:45', '2019-06-20 07:00:45'),
(10305007, 'Topster Stamp Pad', 10305, 1, 'Topster Stamp Pad', 'Topster Stamp Pad', 95.00, 0.00, 'public/images/10305007.png', NULL, NULL, 1, '2019-06-20 07:01:07', '2019-06-20 07:01:07'),
(10305008, 'Artline Stamp Pad Ink Various Color', 10305, 1, 'Artline Stamp Pad Ink Various Color', 'Artline Stamp Pad Ink Various Color', 15.00, 0.00, 'public/images/10305008.png', NULL, NULL, 1, '2019-06-20 07:01:31', '2019-06-20 07:01:31'),
(10305009, 'Horse Stamp Pad Ink Various Color', 10305, 1, 'Horse Stamp Pad Ink Various Color', 'Horse Stamp Pad Ink Various Color', 25.00, 0.00, 'public/images/10305009.jpg', NULL, NULL, 0, '2019-06-20 07:02:02', '2019-06-20 07:02:02'),
(10305010, 'Shiny Stamp Pad Ink Red Original', 10305, 1, 'Shiny Stamp Pad Ink Red Original', 'Shiny Stamp Pad Ink Red Original', 115.00, 0.00, 'public/images/10305010.png', NULL, NULL, 1, '2019-06-20 07:03:31', '2019-06-20 07:03:31'),
(10305011, 'Shiny Stamp Pad Ink Blue Original', 10305, 1, 'Shiny Stamp Pad Ink Blue Original', 'Shiny Stamp Pad Ink Blue Original', 115.00, 0.00, 'public/images/10305011.png', NULL, NULL, 1, '2019-06-20 07:03:55', '2019-06-20 07:03:55'),
(10305012, 'Shiny Stamp Pad Ink Various Color Original', 10305, 1, 'Shiny Stamp Pad Ink Various Color Original', 'Shiny Stamp Pad Ink Various Color Original', 115.00, 0.00, 'public/images/10305012.png', NULL, NULL, 1, '2019-06-20 07:04:16', '2019-06-20 07:04:16'),
(10305013, 'Shiny Stamp Pad Ink Black Original', 10305, 1, 'Shiny Stamp Pad Ink Black Original', 'Shiny Stamp Pad Ink Black Original', 115.00, 0.00, 'public/images/10305013.png', NULL, NULL, 1, '2019-06-20 07:04:41', '2019-06-20 07:04:41'),
(10305014, 'Shiny Stamp Pad Ink Red Copy', 10305, 1, 'Shiny Stamp Pad Ink Red Copy', 'Shiny Stamp Pad Ink Red Copy', 85.00, 0.00, 'public/images/10305014.png', NULL, NULL, 1, '2019-06-20 07:05:04', '2019-06-20 07:05:04'),
(10305015, 'Shiny Stamp Pad Ink Blue Copy', 10305, 1, 'Shiny Stamp Pad Ink Blue Copy', 'Shiny Stamp Pad Ink Blue Copy', 85.00, 0.00, 'public/images/10305015.png', NULL, NULL, 1, '2019-06-20 07:05:28', '2019-06-20 07:05:28'),
(10305016, 'Shiny Stamp Pad Ink Black Copy', 10305, 1, 'Shiny Stamp Pad Ink Black Copy', 'Shiny Stamp Pad Ink Black Copy', 85.00, 0.00, 'public/images/10305016.png', NULL, NULL, 1, '2019-06-20 07:06:21', '2019-06-20 07:06:21'),
(10305017, 'Shiny Stamp Pad Ink Violet Copy', 10305, 1, 'Shiny Stamp Pad Ink Violet Copy', 'Shiny Stamp Pad Ink Violet Copy', 85.00, 0.00, 'public/images/10305017.png', NULL, NULL, 1, '2019-06-20 07:06:44', '2019-06-20 07:06:44'),
(10306001, 'Mega  Calculator CD-120', 10306, 1, 'Mega  Calculator CD-120', 'Mega  Calculator CD-120', 360.00, 0.00, 'public/images/10306001.png', NULL, NULL, 1, '2019-06-20 10:24:04', '2019-06-20 10:24:04'),
(10306002, 'Mega Calculator 9024', 10306, 1, 'Mega Calculator 9024', 'Mega Calculator 9024', 410.00, 0.00, 'public/images/10306002.png', NULL, NULL, 1, '2019-06-20 10:24:30', '2019-06-20 10:24:30'),
(10306003, 'Mega Calculator 9025', 10306, 1, 'Mega Calculator 9025', 'Mega Calculator 9025', 470.00, 0.00, 'public/images/10306003.png', NULL, NULL, 1, '2019-06-20 10:24:50', '2019-06-20 10:24:50'),
(10306004, 'Mega Calculator 930', 10306, 1, 'Mega Calculator 930', 'Mega Calculator 930', 300.00, 0.00, 'public/images/10306004.png', NULL, NULL, 1, '2019-06-20 10:25:10', '2019-06-20 10:25:10'),
(10306005, 'Deli Calculator 39203', 10306, 1, 'Deli Calculator 39203', 'Deli Calculator 39203', 480.00, 0.00, 'public/images/10306005.png', NULL, NULL, 1, '2019-06-20 10:25:34', '2019-06-20 10:25:34'),
(10306006, 'Deli Calculator 1629', 10306, 1, 'Deli Calculator 1629', 'Deli Calculator 1629', 575.00, 0.00, 'public/images/10306006.png', NULL, NULL, 1, '2019-06-20 10:25:52', '2019-06-20 10:25:52'),
(10306007, 'Deli Calculator 1672', 10306, 16, 'Deli Calculator 1672', 'Deli Calculator 1672', 655.00, 0.00, 'public/images/10306007.png', NULL, NULL, 1, '2019-06-20 10:26:36', '2019-06-20 10:26:36'),
(10306008, 'Deli Calculator 1630', 10306, 16, 'Deli Calculator 1630', 'Deli Calculator 1630', 625.00, 0.00, 'public/images/10306008.png', NULL, NULL, 1, '2019-06-20 10:27:01', '2019-06-20 10:27:01'),
(10306009, 'Deli Calculator M19810', 10306, 16, 'Deli Calculator M19810', 'Deli Calculator M19810', 295.00, 0.00, 'public/images/10306009.png', NULL, NULL, 1, '2019-06-20 10:27:26', '2019-06-20 10:27:26'),
(10306010, 'Deli Calculator M01010', 10306, 16, 'Deli Calculator M01010', 'Deli Calculator M01010', 420.00, 0.00, 'public/images/10306010.png', NULL, NULL, 1, '2019-06-20 10:28:08', '2019-06-20 10:28:08'),
(10306011, 'Casio Scientific Calculator Fx-82 MS', 10306, 22, 'Casio Scientific Calculator Fx-82 MS', 'Casio Scientific Calculator Fx-82 MS', 625.00, 0.00, 'public/images/10306011.png', NULL, NULL, 1, '2019-06-20 10:28:58', '2019-06-20 10:28:58'),
(10306012, 'Casio Scientific Calculator Fx-100 MS', 10306, 22, 'Casio Scientific Calculator Fx-100 MS', 'Casio Scientific Calculator Fx-100 MS', 870.00, 0.00, 'public/images/10306012.png', NULL, NULL, 1, '2019-06-20 10:29:22', '2019-06-20 10:29:22'),
(10306013, 'Casio Scientific Calculator Fx-570 MS', 10306, 22, 'Casio Scientific Calculator Fx-570 MS', 'Casio Scientific Calculator Fx-570 MS', 890.00, 0.00, 'public/images/10306013.png', NULL, NULL, 1, '2019-06-20 10:29:58', '2019-06-20 10:29:58'),
(10306014, 'Casio Scientific Calculator Fx-991 MS', 10306, 22, 'Casio Scientific Calculator Fx-991 MS', 'Casio Scientific Calculator Fx-991 MS', 1050.00, 0.00, 'public/images/10306014.png', NULL, NULL, 1, '2019-06-20 10:30:25', '2019-06-20 10:30:25'),
(10306015, 'Casio Scientific Calculator Fx-991 ES', 10306, 22, 'Casio Scientific Calculator Fx-991 ES', 'Casio Scientific Calculator Fx-991 ES', 1170.00, 0.00, 'public/images/10306015.png', NULL, NULL, 1, '2019-06-20 10:30:50', '2019-06-20 10:30:50'),
(10306016, 'Casio Scientific Calculator Fx-991 ES Plus', 10306, 22, 'Casio Scientific Calculator Fx-991 ES Plus', 'Casio Scientific Calculator Fx-991 ES Plus', 1170.00, 0.00, 'public/images/10306016.png', NULL, NULL, 1, '2019-06-20 10:31:19', '2019-06-20 10:31:19'),
(10306017, 'Casio Scientific Calculator Fx-991 EX', 10306, 22, 'Casio Scientific Calculator Fx-991 EX', 'Casio Scientific Calculator Fx-991 EX', 1480.00, 0.00, 'public/images/10306017.png', NULL, NULL, 1, '2019-06-20 10:32:00', '2019-06-20 10:32:00'),
(10307001, '6\"*4\" Envelope Yellow 100Pcs', 10307, 1, '6\"*4\" Envelope Yellow 100Pcs', '6\"*4\" Envelope Yellow 100Pcs', 40.00, 0.00, 'public/images/10307001.png', NULL, NULL, 1, '2019-06-20 10:34:25', '2019-06-20 10:34:25'),
(10307002, '6\"*4\" Envelope White 100Pcs', 10307, 1, '6\"*4\" Envelope White 100Pcs', '6\"*4\" Envelope White 100Pcs', 40.00, 0.00, 'public/images/10307002.png', NULL, NULL, 1, '2019-06-20 10:34:51', '2019-06-20 10:34:51'),
(10307003, '9\"*6\" Envelope White 100Pcs', 10307, 1, '9\"*6\" Envelope White 100Pcs', '9\"*6\" Envelope White 100Pcs', 75.00, 0.00, 'public/images/10307003.png', NULL, NULL, 1, '2019-06-20 10:35:08', '2019-06-20 10:35:08'),
(10307004, '9\"*4\" Envelope Yellow 100Pcs', 10307, 1, '9\"*4\" Envelope Yellow 100Pcs', '9\"*4\" Envelope Yellow 100Pcs', 60.00, 0.00, 'public/images/10307004.png', NULL, NULL, 1, '2019-06-20 10:35:35', '2019-06-20 10:35:35'),
(10307005, '9\"*4\" Envelope White 100Pcs', 10307, 1, '9\"*4\" Envelope White 100Pcs', '9\"*4\" Envelope White 100Pcs', 60.00, 0.00, 'public/images/10307005.png', NULL, NULL, 1, '2019-06-20 10:35:52', '2019-06-20 10:35:52'),
(10307006, '9\"*4\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '9\"*4\" Envelope Brown (Khaki) 100Pcs', '9\"*4\" Envelope Brown (Khaki) 100Pcs', 115.00, 0.00, 'public/images/10307006.png', NULL, NULL, 1, '2019-06-20 10:37:00', '2019-06-20 10:37:00'),
(10307007, '10\"*4\" Envelope Yellow 100Pcs', 10307, 1, '10\"*4\" Envelope Yellow 100Pcs', '10\"*4\" Envelope Yellow 100Pcs', 70.00, 0.00, 'public/images/10307007.png', NULL, NULL, 1, '2019-06-20 10:37:41', '2019-06-20 10:37:41'),
(10307008, '10\"*4\" Envelope White 100Pcs', 10307, 1, '10\"*4\" Envelope White 100Pcs', '10\"*4\" Envelope White 100Pcs', 70.00, 0.00, 'public/images/10307008.png', NULL, NULL, 1, '2019-06-20 10:37:59', '2019-06-20 10:37:59'),
(10307009, '10\"*4\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '10\"*4\" Envelope Brown (Khaki) 100Pcs', '10\"*4\" Envelope Brown (Khaki) 100Pcs', 140.00, 0.00, 'public/images/10307009.png', NULL, NULL, 1, '2019-06-20 10:38:21', '2019-06-20 10:38:21'),
(10307010, '11\"*5\" Envelope Yellow 100Pcs', 10307, 1, '11\"*5\" Envelope Yellow 100Pcs', '11\"*5\" Envelope Yellow 100Pcs', 75.00, 0.00, 'public/images/10307010.png', NULL, NULL, 1, '2019-06-20 10:39:00', '2019-06-20 10:39:00'),
(10307011, '11\"*5\" Envelope White 100Pcs', 10307, 1, '11\"*5\" Envelope White 100Pcs', '11\"*5\" Envelope White 100Pcs', 75.00, 0.00, 'public/images/10307011.png', NULL, NULL, 1, '2019-06-20 10:39:25', '2019-06-20 10:39:25'),
(10307012, '11\"*5\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '11\"*5\" Envelope Brown (Khaki) 100Pcs', '11\"*5\" Envelope Brown (Khaki) 100Pcs', 145.00, 0.00, 'public/images/10307012.png', NULL, NULL, 1, '2019-06-20 10:39:52', '2019-06-20 10:39:52'),
(10307013, '6\"*12\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '6\"*12\" Envelope Brown (Khaki) 100Pcs', '6\"*12\" Envelope Brown (Khaki) 100Pcs', 150.00, 0.00, 'public/images/10307013.png', NULL, NULL, 1, '2019-06-20 10:40:17', '2019-06-20 10:40:17'),
(10307014, '6\"*12\" Envelope White 100Pcs', 10307, 1, '6\"*12\" Envelope White 100Pcs', '6\"*12\" Envelope White 100Pcs', 250.00, 0.00, 'public/images/10307014.png', NULL, NULL, 1, '2019-06-20 10:40:43', '2019-06-20 10:40:43'),
(10307015, '9\"*12\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '9\"*12\" Envelope Brown (Khaki) 100Pcs', '9\"*12\" Envelope Brown (Khaki) 100Pcs', 255.00, 0.00, 'public/images/10307015.png', NULL, NULL, 1, '2019-06-20 10:41:03', '2019-06-20 10:41:03'),
(10307016, '10\"*12\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '10\"*12\" Envelope Brown (Khaki) 100Pcs', '10\"*12\" Envelope Brown (Khaki) 100Pcs', 260.00, 0.00, 'public/images/10307016.png', NULL, NULL, 1, '2019-06-20 10:41:22', '2019-06-20 10:41:22'),
(10307017, '10\"*14\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '10\"*14\" Envelope Brown (Khaki) 100Pcs', '10\"*14\" Envelope Brown (Khaki) 100Pcs', 285.00, 0.00, 'public/images/10307017.png', NULL, NULL, 1, '2019-06-20 10:41:47', '2019-06-20 10:41:47'),
(10307018, '15\"*12\" Envelope Brown (Khaki) 100Pcs', 10307, 1, '15\"*12\" Envelope Brown (Khaki) 100Pcs', '15\"*12\" Envelope Brown (Khaki) 100Pcs', 400.00, 0.00, 'public/images/10307018.png', NULL, NULL, 1, '2019-06-20 10:42:10', '2019-06-20 10:42:10'),
(10401001, 'Register Khata No-120', 10401, 1, 'Register Khata No-120', 'Register Khata No-120', 25.00, NULL, 'public/images/10401001.jpg', NULL, NULL, 1, '2019-06-20 15:06:13', '2019-06-20 15:06:13'),
(10401002, 'Register Khata No-200', 10401, 1, 'Register Khata No-200', 'Register Khata No-200', 33.00, NULL, 'public/images/10401002.jpg', NULL, NULL, 1, '2019-06-20 15:07:04', '2019-06-20 15:07:04'),
(10401003, 'Register Khata No-320', 10401, 1, 'Register Khata No-320', 'Register Khata No-320', 56.00, NULL, 'public/images/10401003.jpg', NULL, NULL, 1, '2019-06-20 15:07:22', '2019-06-20 15:07:22'),
(10401004, 'Register Khata No-400', 10401, 1, 'Register Khata No-400', 'Register Khata No-400', 65.00, NULL, 'public/images/10401004.jpg', NULL, NULL, 1, '2019-06-20 15:07:42', '2019-06-20 15:07:42'),
(10401005, 'Register Khata No-500', 10401, 1, 'Register Khata No-500', 'Register Khata No-500', 80.00, NULL, 'public/images/10401005.jpg', NULL, NULL, 1, '2019-06-20 15:08:04', '2019-06-20 15:08:04'),
(10401006, 'Register Khata No-600', 10401, 1, 'Register Khata No-600', 'Register Khata No-600', 102.00, NULL, 'public/images/10401006.jpg', NULL, NULL, 1, '2019-06-20 15:10:27', '2019-06-20 15:10:27'),
(10401007, 'Register Khata No-800', 10401, 1, 'Register Khata No-800', 'Register Khata No-800', 145.00, NULL, 'public/images/10401007.jpg', NULL, NULL, 1, '2019-06-20 15:10:47', '2019-06-20 15:10:47'),
(10401008, 'Register Khata No-1000', 10401, 1, 'Register Khata No-1000', 'Register Khata No-1000', 175.00, NULL, 'public/images/10401008.jpg', NULL, NULL, 1, '2019-06-20 15:11:12', '2019-06-20 15:11:12'),
(10401009, 'Day Book No-160', 10401, 1, 'Day Book No-160', 'Day Book No-160', 25.00, 0.00, 'public/images/10401009.png', NULL, NULL, 1, '2019-06-20 15:11:36', '2019-06-20 15:11:36'),
(10401010, 'Day Book No-200', 10401, 1, 'Day Book No-200', 'Day Book No-200', 30.00, 0.00, 'public/images/10401010.png', NULL, NULL, 1, '2019-06-20 15:11:54', '2019-06-20 15:11:54'),
(10401011, 'Day Book No-320', 10401, 1, 'Day Book No-320', 'Day Book No-320', 45.00, 0.00, 'public/images/10401011.png', NULL, NULL, 1, '2019-06-20 15:12:11', '2019-06-20 15:12:11'),
(10401012, 'Day Book No-400', 10401, 1, 'Day Book No-400', 'Day Book No-400', 50.00, 0.00, 'public/images/10401012.png', NULL, NULL, 1, '2019-06-20 15:12:28', '2019-06-20 15:12:28'),
(10401013, 'Day Book No-500', 10401, 1, 'Day Book No-500', 'Day Book No-500', 55.00, 0.00, 'public/images/10401013.png', NULL, NULL, 1, '2019-06-20 15:12:43', '2019-06-20 15:12:43'),
(10401014, 'Day Book No-600', 10401, 1, 'Day Book No-600', 'Day Book No-600', 80.00, 0.00, 'public/images/10401014.png', NULL, NULL, 1, '2019-06-20 15:13:00', '2019-06-20 15:13:00'),
(10401015, 'Day Book No-800', 10401, 1, 'Day Book No-800', 'Day Book No-800', 105.00, 0.00, 'public/images/10401015.png', NULL, NULL, 1, '2019-06-20 15:13:22', '2019-06-20 15:13:22'),
(10401016, 'Day Book No-1000', 10401, 1, 'Day Book No-1000', 'Day Book No-1000', 130.00, 0.00, 'public/images/10401016.png', NULL, NULL, 1, '2019-06-20 15:13:45', '2019-06-20 15:13:45'),
(10401017, 'Day Book No-1200', 10401, 1, 'Day Book No-1200', 'Day Book No-1200', 145.00, 0.00, 'public/images/10401017.png', NULL, NULL, 1, '2019-06-20 15:14:06', '2019-06-20 15:14:06'),
(10401018, 'Half Binding Register Khata No-200', 10401, 1, 'Half Binding Register Khata No-200', 'Half Binding Register Khata No-200', 25.00, NULL, 'public/images/10401018.jpg', NULL, NULL, 1, '2019-06-20 15:14:25', '2019-06-20 15:14:25'),
(10401019, 'Half Binding Register Khata No-320', 10401, 1, 'Half Binding Register Khata No-320', 'Half Binding Register Khata No-320', 35.00, NULL, 'public/images/10401019.jpg', NULL, NULL, 1, '2019-06-20 15:17:58', '2019-06-20 15:17:58'),
(10401020, 'Half Binding Register Khata No-400', 10401, 1, 'Half Binding Register Khata No-400', 'Half Binding Register Khata No-400', 40.00, NULL, 'public/images/10401020.jpg', NULL, NULL, 1, '2019-06-20 15:18:19', '2019-06-20 15:18:19'),
(10401021, 'Half Binding Register Khata No-500', 10401, 1, 'Half Binding Register Khata No-500', 'Half Binding Register Khata No-500', 55.00, NULL, 'public/images/10401021.jpg', NULL, NULL, 1, '2019-06-20 15:18:36', '2019-06-20 15:18:36'),
(10401022, 'Half Binding Register Khata No-600', 10401, 1, 'Half Binding Register Khata No-600', 'Half Binding Register Khata No-600', 65.00, NULL, 'public/images/10401022.jpg', NULL, NULL, 1, '2019-06-20 15:19:01', '2019-06-20 15:19:01'),
(10401023, 'Half Binding Register Khata No-800', 10401, 1, 'Half Binding Register Khata No-800', 'Half Binding Register Khata No-800', 80.00, NULL, 'public/images/10401023.jpg', NULL, NULL, 1, '2019-06-20 15:19:21', '2019-06-20 15:19:21'),
(10401024, 'Half Binding Register Khata No-1000', 10401, 1, 'Half Binding Register Khata No-1000', 'Half Binding Register Khata No-1000', 105.00, NULL, 'public/images/10401024.jpg', NULL, NULL, 1, '2019-06-20 15:19:37', '2019-06-20 15:19:37'),
(10401025, 'Ledger Book White 2 Dista', 10401, 1, 'Ledger Book White 2 Dista', 'Ledger Book White 2 Dista', 60.00, NULL, 'public/images/10401025.jpg', NULL, NULL, 1, '2019-06-20 15:20:44', '2019-06-20 15:20:44'),
(10401026, 'Ledger Book White 3 Dista', 10401, 1, 'Ledger Book White 3 Dista', 'Ledger Book White 3 Dista', 85.00, NULL, 'public/images/10401026.jpg', NULL, NULL, 1, '2019-06-20 15:21:04', '2019-06-20 15:21:04'),
(10401027, 'Ledger Book White 4 Dista', 10401, 1, 'Ledger Book White 4 Dista', 'Ledger Book White 4 Dista', 105.00, NULL, 'public/images/10401027.jpg', NULL, NULL, 1, '2019-06-20 15:21:22', '2019-06-20 15:21:22'),
(10401028, 'Ledger Book White 5 Dista', 10401, 1, 'Ledger Book White 5 Dista', 'Ledger Book White 5 Dista', 135.00, NULL, 'public/images/10401028.jpg', NULL, NULL, 1, '2019-06-20 15:21:42', '2019-06-20 15:21:42'),
(10401029, 'Ledger Book White 6 Dista', 10401, 1, 'Ledger Book White 6 Dista', 'Ledger Book White 6 Dista', 155.00, NULL, 'public/images/10401029.jpg', NULL, NULL, 1, '2019-06-20 15:21:59', '2019-06-20 15:21:59'),
(10401030, 'Ledger Book White 8 Dista', 10401, 1, 'Ledger Book White 8 Dista', 'Ledger Book White 8 Dista', 210.00, NULL, 'public/images/10401030.jpg', NULL, NULL, 1, '2019-06-20 15:22:48', '2019-06-20 15:22:48'),
(10401031, 'Ledger Book White 10 Dista', 10401, 1, 'Ledger Book White 10 Dista', 'Ledger Book White 10 Dista', 255.00, NULL, 'public/images/10401031.jpg', NULL, NULL, 1, '2019-06-20 15:24:13', '2019-06-20 15:24:13'),
(10401032, 'Ledger Book Color 2 Dista', 10401, 1, 'Ledger Book Color 2 Dista', 'Ledger Book Color 2 Dista', 105.00, NULL, 'public/images/10401032.jpg', NULL, NULL, 1, '2019-06-20 15:29:15', '2019-06-20 15:29:15'),
(10401033, 'Ledger Book Color 3 Dista', 10401, 1, 'Ledger Book Color 3 Dista', 'Ledger Book Color 3 Dista', 165.00, NULL, 'public/images/10401033.jpg', NULL, NULL, 1, '2019-06-20 15:30:04', '2019-06-20 15:30:04'),
(10401034, 'Ledger Book Color 4 Dista', 10401, 1, 'Ledger Book Color 4 Dista', 'Ledger Book Color 4 Dista', 195.00, NULL, 'public/images/10401034.jpg', NULL, NULL, 1, '2019-06-20 15:30:23', '2019-06-20 15:30:23'),
(10401035, 'Ledger Book Color 5 Dista', 10401, 1, 'Ledger Book Color 5 Dista', 'Ledger Book Color 5 Dista', 245.00, NULL, 'public/images/10401035.jpg', NULL, NULL, 1, '2019-06-20 15:30:44', '2019-06-20 15:30:44'),
(10401036, 'Ledger Book Color 6 Dista', 10401, 1, 'Ledger Book Color 6 Dista', 'Ledger Book Color 6 Dista', 305.00, NULL, 'public/images/10401036.jpg', NULL, NULL, 1, '2019-06-20 15:31:03', '2019-06-20 15:31:03'),
(10401037, 'Ledger Book Color 8 Dista', 10401, 1, 'Ledger Book Color 8 Dista', 'Ledger Book Color 8 Dista', 380.00, NULL, 'public/images/10401037.jpg', NULL, NULL, 1, '2019-06-20 15:31:21', '2019-06-20 15:31:21'),
(10401038, 'Ledger Book Color 10 Dista', 10401, 1, 'Ledger Book Color 10 Dista', 'Ledger Book Color 10 Dista', 470.00, NULL, 'public/images/10401038.jpg', NULL, NULL, 1, '2019-06-20 15:31:43', '2019-06-20 15:31:43'),
(10401039, 'Cash Book White 2 Dista', 10401, 1, 'Cash Book White 2 Dista', 'Cash Book White 2 Dista', 60.00, 0.00, 'public/images/10401039.png', NULL, NULL, 0, '2019-06-20 15:32:04', '2019-06-20 15:32:04'),
(10401040, 'Cash Book White 3 Dista', 10401, 1, 'Cash Book White 3 Dista', 'Cash Book White 3 Dista', 85.00, 0.00, 'public/images/10401040.png', NULL, NULL, 0, '2019-06-20 15:32:26', '2019-06-20 15:32:26'),
(10401041, 'Cash Book White 4 Dista', 10401, 1, 'Cash Book White 4 Dista', 'Cash Book White 4 Dista', 110.00, 0.00, 'public/images/10401041.png', NULL, NULL, 0, '2019-06-20 15:32:44', '2019-06-20 15:32:44'),
(10401042, 'Cash Book White 5 Dista', 10401, 1, 'Cash Book White 5 Dista', 'Cash Book White 5 Dista', 135.00, 0.00, 'public/images/10401042.png', NULL, NULL, 0, '2019-06-20 15:33:02', '2019-06-20 15:33:02'),
(10401043, 'Cash Book White 6 Dista', 10401, 1, 'Cash Book White 6 Dista', 'Cash Book White 6 Dista', 155.00, 0.00, 'public/images/10401043.png', NULL, NULL, 0, '2019-06-20 15:33:27', '2019-06-20 15:33:27'),
(10401044, 'Cash Book White 8 Dista', 10401, 1, 'Cash Book White 8 Dista', 'Cash Book White 8 Dista', 210.00, 0.00, 'public/images/10401044.png', NULL, NULL, 0, '2019-06-20 15:33:44', '2019-06-20 15:33:44'),
(10401045, 'Cash Book White 10 Dista', 10401, 1, 'Cash Book White 10 Dista', 'Cash Book White 10 Dista', 255.00, 0.00, 'public/images/10401045.png', NULL, NULL, 0, '2019-06-20 15:34:14', '2019-06-20 15:34:14'),
(10401046, 'Cash Book Color 2 Dista', 10401, 1, 'Cash Book Color 2 Dista', 'Cash Book Color 2 Dista', 105.00, NULL, 'public/images/10401046.jpg', NULL, NULL, 1, '2019-06-20 15:35:10', '2019-06-20 15:35:10'),
(10401047, 'Cash Book Color 3 Dista', 10401, 1, 'Cash Book Color 3 Dista', 'Cash Book Color 3 Dista', 165.00, NULL, 'public/images/10401047.jpg', NULL, NULL, 1, '2019-06-20 15:36:27', '2019-06-20 15:36:27'),
(10401048, 'Cash Book Color 4 Dista', 10401, 1, 'Cash Book Color 4 Dista', 'Cash Book Color 4 Dista', 195.00, NULL, 'public/images/10401048.jpg', NULL, NULL, 1, '2019-06-20 15:36:52', '2019-06-20 15:36:52'),
(10401049, 'Cash Book Color 5 Dista', 10401, 1, 'Cash Book Color 5 Dista', 'Cash Book Color 5 Dista', 245.00, NULL, 'public/images/10401049.jpg', NULL, NULL, 1, '2019-06-20 15:37:13', '2019-06-20 15:37:13'),
(10401050, 'Cash Book Color 6 Dista', 10401, 1, 'Cash Book Color 6 Dista', 'Cash Book Color 6 Dista', 305.00, NULL, 'public/images/10401050.jpg', NULL, NULL, 1, '2019-06-20 15:37:34', '2019-06-20 15:37:34'),
(10401051, 'Cash Book Color 8 Dista', 10401, 1, 'Cash Book Color 8 Dista', 'Cash Book Color 8 Dista', 380.00, NULL, 'public/images/10401051.jpg', NULL, NULL, 1, '2019-06-20 15:38:49', '2019-06-20 15:38:49'),
(10401052, 'Cash Book Color 10 Dista', 10401, 1, 'Cash Book Color 10 Dista', 'Cash Book Color 10 Dista', 470.00, NULL, 'public/images/10401052.jpg', NULL, NULL, 1, '2019-06-20 15:39:12', '2019-06-20 15:39:12'),
(10401053, 'Stock Book White 2 Dista', 10401, 1, 'Stock Book White 2 Dista', 'Stock Book White 2 Dista', 60.00, 0.00, 'public/images/10401053.png', NULL, NULL, 0, '2019-06-20 15:39:31', '2019-06-20 15:39:31'),
(10401054, 'Stock Book White 3 Dista', 10401, 1, 'Stock Book White 3 Dista', 'Stock Book White 3 Dista', 85.00, 0.00, 'public/images/10401054.png', NULL, NULL, 0, '2019-06-20 15:39:50', '2019-06-20 15:39:50'),
(10401055, 'Stock Book White 4 Dista', 10401, 1, 'Stock Book White 4 Dista', 'Stock Book White 4 Dista', 110.00, 0.00, 'public/images/10401055.png', NULL, NULL, 0, '2019-06-20 15:40:10', '2019-06-20 15:40:10'),
(10401056, 'Stock Book White 5 Dista', 10401, 1, 'Stock Book White 5 Dista', 'Stock Book White 5 Dista', 135.00, 0.00, 'public/images/10401056.png', NULL, NULL, 0, '2019-06-20 15:43:33', '2019-06-20 15:43:33'),
(10401057, 'Stock Book White 6 Dista', 10401, 1, 'Stock Book White 6 Dista', 'Stock Book White 6 Dista', 155.00, 0.00, 'public/images/10401057.png', NULL, NULL, 0, '2019-06-20 15:43:49', '2019-06-20 15:43:49'),
(10401058, 'Stock Book White 8 Dista', 10401, 1, 'Stock Book White 8 Dista', 'Stock Book White 8 Dista', 210.00, 0.00, 'public/images/10401058.png', NULL, NULL, 0, '2019-06-20 15:44:10', '2019-06-20 15:44:10'),
(10401059, 'Stock Book White 10 Dista', 10401, 1, 'Stock Book White 10 Dista', 'Stock Book White 10 Dista', 255.00, 0.00, 'public/images/10401059.png', NULL, NULL, 0, '2019-06-20 15:44:33', '2019-06-20 15:44:33'),
(10401060, 'Stock Book Color 2 Dista', 10401, 1, 'Stock Book Color 2 Dista', 'Stock Book Color 2 Dista', 105.00, NULL, 'public/images/10401060.jpg', NULL, NULL, 1, '2019-06-20 15:45:06', '2019-06-20 15:45:06'),
(10401061, 'Stock Book Color 3 Dista', 10401, 1, 'Stock Book Color 3 Dista', 'Stock Book Color 3 Dista', 165.00, NULL, 'public/images/10401061.jpg', NULL, NULL, 1, '2019-06-20 15:45:25', '2019-06-20 15:45:25'),
(10401062, 'Stock Book Color 4 Dista', 10401, 1, 'Stock Book Color 4 Dista', 'Stock Book Color 4 Dista', 195.00, NULL, 'public/images/10401062.jpg', NULL, NULL, 1, '2019-06-20 15:45:45', '2019-06-20 15:45:45'),
(10401063, 'Stock Book Color 5 Dista', 10401, 1, 'Stock Book Color 5 Dista', 'Stock Book Color 5 Dista', 245.00, NULL, 'public/images/10401063.jpg', NULL, NULL, 1, '2019-06-20 15:46:07', '2019-06-20 15:46:07'),
(10401064, 'Stock Book Color 6 Dista', 10401, 1, 'Stock Book Color 6 Dista', 'Stock Book Color 6 Dista', 305.00, NULL, 'public/images/10401064.jpg', NULL, NULL, 1, '2019-06-20 15:46:27', '2019-06-20 15:46:27'),
(10401065, 'Stock Book Color 8 Dista', 10401, 1, 'Stock Book Color 8 Dista', 'Stock Book Color 8 Dista', 380.00, NULL, 'public/images/10401065.jpg', NULL, NULL, 1, '2019-06-20 15:46:47', '2019-06-20 15:46:47'),
(10401066, 'Stock Book Color 10 Dista', 10401, 1, 'Stock Book Color 10 Dista', 'Stock Book Color 10 Dista', 470.00, NULL, 'public/images/10401066.jpg', NULL, NULL, 1, '2019-06-20 15:47:07', '2019-06-20 15:47:07'),
(10402001, 'China Note Book A6', 10402, 1, 'China Note Book A6', 'China Note Book A6', 110.00, 0.00, 'public/images/10402001.png', NULL, NULL, 1, '2019-07-15 09:32:22', '2019-07-15 09:32:22'),
(10402002, 'China Note Book A5', 10402, 1, 'China Note Book A5', 'China Note Book A5', 170.00, 0.00, 'public/images/10402002.png', NULL, NULL, 1, '2019-07-15 09:32:45', '2019-07-15 09:32:45'),
(10402003, 'China Note Book B5', 10402, 1, 'China Note Book B5', 'China Note Book B5', 220.00, 0.00, 'public/images/10402003.png', NULL, NULL, 1, '2019-07-15 09:33:05', '2019-07-15 09:33:05'),
(10404001, 'ICT Practical Khata CTG Publication(9-10)', 10404, 1, 'ICT Practical Khata CTG Publication(9-10)', 'ICT Practical Khata CTG Publication(9-10)', 90.00, 0.00, 'public/images/10404001.png', NULL, NULL, 1, '2019-06-20 15:49:34', '2019-06-20 15:49:34'),
(10404002, 'ICT Practical Khata CTG Publication(11-12)', 10404, 1, 'ICT Practical Khata CTG Publication(11-12)', 'ICT Practical Khata CTG Publication(11-12)', 90.00, 0.00, 'public/images/10404002.png', NULL, NULL, 1, '2019-06-20 15:50:05', '2019-06-20 15:50:05'),
(10404003, 'ICT Practical Khata Udoyon', 10404, 1, 'ICT Practical Khata Udoyon', 'ICT Practical Khata Udoyon', 70.00, 0.00, 'public/images/10404003.png', NULL, NULL, 1, '2019-06-20 15:55:36', '2019-06-20 15:55:36'),
(10404004, 'Physics Practical Khata 96 Pages', 10404, 1, 'Physics Practical Khata 96 Pages', 'Physics Practical Khata 96 Pages', 55.00, 0.00, 'public/images/10404004.png', NULL, NULL, 1, '2019-06-20 15:56:06', '2019-06-20 15:56:06'),
(10404005, 'Physics Practical Khata 120 Pages', 10404, 1, 'Physics Practical Khata 120 Pages', 'Physics Practical Khata 120 Pages', 70.00, 0.00, 'public/images/10404005.png', NULL, NULL, 1, '2019-06-20 15:56:34', '2019-06-20 15:56:34'),
(10404006, 'Chemistry Practical Khata 96 Pages', 10404, 1, 'Chemistry Practical Khata 96 Pages', 'Chemistry Practical Khata 96 Pages', 55.00, 0.00, 'public/images/10404006.png', NULL, NULL, 1, '2019-06-20 15:56:56', '2019-06-20 15:56:56'),
(10404007, 'Chemistry Practical Khata 120 Pages', 10404, 1, 'Chemistry Practical Khata 120 Pages', 'Chemistry Practical Khata 120 Pages', 70.00, 0.00, 'public/images/10404007.png', NULL, NULL, 1, '2019-06-20 15:57:28', '2019-06-20 15:57:28'),
(10404008, 'Higher Math Practical Khata 96 Pages', 10404, 1, 'Higher Math Practical Khata 96 Pages', 'Higher Math Practical Khata 96 Pages', 55.00, 0.00, 'public/images/10404008.png', NULL, NULL, 1, '2019-06-20 15:57:47', '2019-06-20 15:57:47'),
(10404009, 'Higher Math Practical Khata 120 Pages', 10404, 1, 'Higher Math Practical Khata 120 Pages', 'Higher Math Practical Khata 120 Pages', 65.00, 0.00, 'public/images/10404009.png', NULL, NULL, 1, '2019-06-20 15:58:17', '2019-06-20 15:58:17'),
(10404010, 'Biology Practical Khata Legal Size 20 Card', 10404, 1, 'Biology Practical Khata Legal Size 20 Card', 'Biology Practical Khata Legal Size 20 Card', 75.00, 0.00, 'public/images/10404010.png', NULL, NULL, 1, '2019-06-20 15:58:49', '2019-06-20 15:58:49'),
(10404011, 'Biology Practical Khata  A4 Size 12 Card', 10404, 1, 'Biology Practical Khata  A4 Size 12 Card', 'Biology Practical Khata  A4 Size 12 Card', 70.00, 0.00, 'public/images/10404011.png', NULL, NULL, 1, '2019-06-20 15:59:38', '2019-06-20 15:59:38'),
(10404012, 'Krishi Shikkha Practical Khata 12 Card', 10404, 1, 'Krishi Shikkha Practical Khata 12 Card', 'Krishi Shikkha Practical Khata 12 Card', 55.00, 0.00, 'public/images/10404012.png', NULL, NULL, 1, '2019-06-20 16:00:20', '2019-06-20 16:00:20'),
(10404013, 'Krishi Shikkha Practical Khata 20 Card', 10404, 1, 'Krishi Shikkha Practical Khata 20 Card', 'Krishi Shikkha Practical Khata 20 Card', 65.00, 0.00, 'public/images/10404013.png', NULL, NULL, 1, '2019-06-20 16:00:47', '2019-06-20 16:00:47'),
(10404014, 'Gahistho Biggan Practical Khata', 10404, 1, 'Gahistho Biggan Practical Khata', 'Gahistho Biggan Practical Khata', 65.00, 0.00, 'public/images/10404014.png', NULL, NULL, 1, '2019-06-20 16:01:16', '2019-06-20 16:01:16'),
(10404015, 'Gahistho Orthoniti Practical Khata', 10404, 1, 'Gahistho Orthoniti Practical Khata', 'Gahistho Orthoniti Practical Khata', 65.00, 0.00, 'public/images/10404015.png', NULL, NULL, 1, '2019-06-20 16:01:39', '2019-06-20 16:01:39'),
(10404016, 'Physical Education & Sports Practical Khata', 10404, 1, 'Physical Education & Sports Practical Khata', 'Physical Education & Sports Practical Khata', 60.00, 0.00, 'public/images/10404016.png', NULL, NULL, 1, '2019-06-20 16:02:06', '2019-06-20 16:02:06'),
(10501001, 'Deli Pen Holder 908', 10501, 16, 'Deli Pen Holder 908', 'Deli Pen Holder 908', 95.00, 0.00, 'public/images/10501001.png', NULL, NULL, 1, '2019-06-20 10:44:21', '2019-06-20 10:44:21'),
(10501002, 'Deli Pen Holder 909', 10501, 16, 'Deli Pen Holder 909', 'Deli Pen Holder 909', 95.00, 0.00, 'public/images/10501002.png', NULL, NULL, 1, '2019-06-20 10:45:05', '2019-06-20 10:45:05'),
(10501003, 'Pen Holder Kajea', 10501, 1, 'Pen Holder Kajea', 'Pen Holder Kajea', 130.00, 0.00, 'public/images/10501003.png', NULL, NULL, 1, '2019-06-20 10:45:26', '2019-06-20 10:45:26'),
(10501004, 'Pen Stand Good Luck', 10501, 12, 'Pen Stand Good Luck', 'Pen Stand Good Luck', 0.00, 0.00, 'public/images/10501004.png', NULL, NULL, 0, '2019-06-20 10:45:57', '2019-06-20 10:45:57'),
(10501005, 'Pen Stand YS 310', 10501, 1, 'Pen Stand YS 310', 'Pen Stand YS 310', 135.00, 0.00, 'public/images/10501005.png', NULL, NULL, 1, '2019-06-20 10:46:30', '2019-06-20 10:46:30'),
(10501006, 'Pen Stand YS 314', 10501, 1, 'Pen Stand YS 314', 'Pen Stand YS 314', 170.00, 0.00, 'public/images/10501006.png', NULL, NULL, 1, '2019-06-20 10:46:55', '2019-06-20 10:46:55'),
(10501007, 'Pen Stand YS 315', 10501, 1, 'Pen Stand YS 315', 'Pen Stand YS 315', 140.00, 0.00, 'public/images/10501007.png', NULL, NULL, 1, '2019-06-20 10:47:21', '2019-06-20 10:47:21'),
(10501008, 'Pen Stand YS Movable', 10501, 1, 'Pen Stand YS Movable', 'Pen Stand YS Movable', 175.00, 0.00, 'public/images/10501008.png', NULL, NULL, 1, '2019-06-20 10:47:49', '2019-06-20 10:47:49'),
(10502001, 'Deli Card Box', 10502, 16, 'Deli Card Box', 'Deli Card Box', 65.00, 0.00, 'public/images/10502001.png', NULL, NULL, 1, '2019-06-20 10:48:45', '2019-06-20 10:48:45'),
(10502002, 'Deli Card Holder', 10502, 16, 'Deli Card Holder', 'Deli Card Holder', 65.00, 0.00, 'public/images/10502002.png', NULL, NULL, 1, '2019-06-20 10:49:10', '2019-06-20 10:49:10'),
(10502003, 'Memo  Box or Slip Box Plastic', 10502, 1, 'Memo  Box or Slip Box Plastic', 'Memo  Box or Slip Box Plastic', 90.00, 0.00, 'public/images/10502003.png', NULL, NULL, 1, '2019-06-20 10:49:40', '2019-06-20 10:49:40'),
(10502004, 'Memo  Box or Slip Box Leather', 10502, 1, 'Memo  Box or Slip Box Leather', 'Memo  Box or Slip Box Leather', 110.00, 0.00, 'public/images/10502004.png', NULL, NULL, 1, '2019-06-20 10:50:01', '2019-06-20 10:50:01'),
(10503001, 'Paper Weight Square Shape', 10503, 1, 'Paper Weight Square Shape', 'Paper Weight Square Shape', 100.00, 0.00, 'public/images/10503001.png', NULL, NULL, 1, '2019-06-20 10:50:55', '2019-06-20 10:50:55'),
(10503002, 'Paper Weight Circle Shape', 10503, 1, 'Paper Weight Circle Shape', 'Paper Weight Circle Shape', 100.00, 0.00, 'public/images/10503002.png', NULL, NULL, 1, '2019-06-20 10:51:21', '2019-06-20 10:51:21'),
(10503003, 'Paper Weight Cylender Shappe', 10503, 1, 'Paper Weight Cylender Shappe', 'Paper Weight Cylender Shappe', 100.00, 0.00, 'public/images/10503003.png', NULL, NULL, 1, '2019-06-20 10:51:44', '2019-06-20 10:51:44'),
(10601001, 'VIP Court File with lemeneting', 10601, 1, 'VIP Court File with lemeneting', 'VIP Court File with lemeneting', 20.00, 0.00, 'public/images/10601001.png', NULL, NULL, 1, '2019-06-20 13:35:48', '2019-06-20 13:35:48'),
(10601002, 'VIP Court File without Lemeneting', 10601, 1, 'VIP Court File without Lemeneting', 'VIP Court File without Lemeneting', 15.00, 0.00, 'public/images/10601002.png', NULL, NULL, 1, '2019-06-20 13:36:16', '2019-06-20 13:36:16'),
(10601003, 'Matador Plastic Court File', 10601, 1, 'Matador Plastic Court File', 'Matador Plastic Court File', 45.00, NULL, 'public/images/10601003.png', NULL, NULL, 1, '2019-06-20 13:36:38', '2019-06-20 13:36:38'),
(10601004, 'Matador A4 Report File', 10601, 1, 'Matador A4 Report File', 'Matador A4 Report File', 15.00, 0.00, 'public/images/10601004.png', NULL, NULL, 1, '2019-06-20 13:37:03', '2019-06-20 13:37:03'),
(10601005, 'Matador FC Report File', 10601, 1, 'Matador FC Report File', 'Matador FC Report File', 0.00, 0.00, 'public/images/10601005.png', NULL, NULL, 0, '2019-06-20 13:37:28', '2019-06-20 13:37:28'),
(10601006, 'Beli A4 Report File', 10601, 1, 'Beli A4 Report File', 'Beli A4 Report File', 15.00, 0.00, 'public/images/10601006.png', NULL, NULL, 1, '2019-06-20 13:37:49', '2019-06-20 13:37:49'),
(10601007, 'Beli FC Report File', 10601, 1, 'Beli FC Report File', 'Beli FC Report File', 18.00, 0.00, 'public/images/10601007.png', NULL, NULL, 1, '2019-06-20 13:38:08', '2019-06-20 13:38:08'),
(10601008, 'Good Luck A4 Report File', 10601, 12, 'Good Luck A4 Report File', 'Good Luck A4 Report File', 15.00, 0.00, 'public/images/10601008.png', NULL, NULL, 1, '2019-06-20 13:38:34', '2019-06-20 13:38:34'),
(10601009, 'Good Luck FC Report File', 10601, 12, 'Good Luck FC Report File', 'Good Luck FC Report File', 18.00, NULL, 'public/images/10601009.png', NULL, NULL, 1, '2019-06-20 13:38:59', '2019-06-20 13:38:59'),
(10601010, 'FC Report File Paper Type', 10601, 1, 'FC Report File Paper Type', 'FC Report File Paper Type', 12.00, 0.00, 'public/images/10601010.png', NULL, NULL, 1, '2019-06-20 13:39:33', '2019-06-20 13:39:33'),
(10601011, 'Ring File 3\" inch Board Type', 10601, 1, 'Ring File 3\" inch Board Type', 'Ring File 3\" inch Board Type', 90.00, 0.00, 'public/images/10601011.png', NULL, NULL, 1, '2019-06-20 13:39:52', '2019-06-20 13:39:52'),
(10601012, 'Ring File 2\" inch Board Type', 10601, 1, 'Ring File 2\" inch Board Type', 'Ring File 2\" inch Board Type', 65.00, 0.00, 'public/images/10601012.png', NULL, NULL, 1, '2019-06-20 13:40:28', '2019-06-20 13:40:28'),
(10601013, 'Matador Single Clip File', 10601, 10, 'Matador Single Clip File', 'Matador Single Clip File', 0.00, 0.00, 'public/images/10601013.png', NULL, NULL, 0, '2019-06-20 13:40:54', '2019-06-20 13:40:54'),
(10601014, 'Matador Double Clip File', 10601, 10, 'Matador Double Clip File', 'Matador Double Clip File', 60.00, 0.00, 'public/images/10601014.png', NULL, NULL, 1, '2019-06-20 13:41:24', '2019-06-20 13:41:24'),
(10601015, 'Good Luck Single Clip File', 10601, 12, 'Good Luck Single Clip File', 'Good Luck Single Clip File', 0.00, 0.00, 'public/images/10601015.png', NULL, NULL, 0, '2019-06-20 13:41:46', '2019-06-20 13:41:46'),
(10601016, 'Good Luck Double Clip File', 10601, 12, 'Good Luck Double Clip File', 'Good Luck Double Clip File', 0.00, 0.00, 'public/images/10601016.png', NULL, NULL, 0, '2019-06-20 13:42:07', '2019-06-20 13:42:07'),
(10601017, 'Good Luck 2 Ring File', 10601, 1, 'Good Luck 2 Ring File', 'Good Luck 2 Ring File', 65.00, 0.00, 'public/images/10601017.png', NULL, NULL, 1, '2019-06-20 13:42:37', '2019-06-20 13:42:37'),
(10602001, 'Good Luck File Organizer 3 Station', 10602, 12, 'Good Luck File Organizer 3 Station', 'Good Luck File Organizer 3 Station', 245.00, 0.00, 'public/images/10602001.png', NULL, NULL, 1, '2019-06-20 13:43:24', '2019-06-20 13:43:24'),
(10602002, 'Good Luck Box File Organizer', 10602, 12, 'Good Luck Box File Organizer', 'Good Luck Box File Organizer', 95.00, 0.00, 'public/images/10602002.png', NULL, NULL, 1, '2019-06-20 13:43:47', '2019-06-20 13:43:47'),
(10602003, 'File Organizer Paper Type', 10602, 1, 'File Organizer Paper Type', 'File Organizer Paper Type', 60.00, 0.00, 'public/images/10602003.png', NULL, NULL, 1, '2019-06-20 13:44:15', '2019-06-20 13:44:15'),
(10602004, 'File Organizer Lemeneting Type', 10602, 1, 'File Organizer Lemeneting Type', 'File Organizer Lemeneting Type', 65.00, 0.00, 'public/images/10602004.png', NULL, NULL, 1, '2019-06-20 13:44:42', '2019-06-20 13:44:42'),
(10602005, 'Box File (Dakna System)', 10602, 1, 'Box File (Dakna System)', 'Box File (Dakna System)', 65.00, 0.00, 'public/images/10602005.png', NULL, NULL, 1, '2019-06-20 13:45:02', '2019-06-20 13:45:02'),
(10701001, 'Deli Single Clip Board', 10701, 16, 'Deli Single Clip Board', 'Deli Single Clip Board', 20.00, 0.00, 'public/images/10701001.png', NULL, NULL, 1, '2019-06-20 11:36:15', '2019-06-20 11:36:15'),
(10701002, 'Deli Double Clip Board', 10701, 16, 'Deli Double Clip Board', 'Deli Double Clip Board', 30.00, 0.00, 'public/images/10701002.png', NULL, NULL, 1, '2019-06-20 11:36:39', '2019-06-20 11:36:39'),
(10701003, 'Standard Single Clip Board', 10701, 1, 'Standard Single Clip Board', 'Standard Single Clip Board', 45.00, 0.00, 'public/images/10701003.png', NULL, NULL, 1, '2019-06-20 11:37:33', '2019-06-20 11:37:33'),
(10701004, 'Standard Double Clip Board', 10701, 1, 'Standard Double Clip Board', 'Standard Double Clip Board', 68.00, 0.00, 'public/images/10701004.png', NULL, NULL, 1, '2019-06-20 11:37:51', '2019-06-20 11:37:51');
INSERT INTO `tbl_product` (`product_id`, `product_name`, `sub_category_id`, `brand_id`, `product_short_description`, `product_long_description`, `product_price`, `offer`, `product_picture`, `product_size`, `product_color`, `publication_status`, `created_at`, `updated_at`) VALUES
(10701005, 'Good Luck Clip Board', 10701, 1, 'Good Luck Clip Board', 'Good Luck Clip Board', 70.00, 0.00, 'public/images/10701005.png', NULL, NULL, 1, '2019-06-20 11:38:14', '2019-06-20 11:38:14'),
(10702001, '4 feet *8 feet Notice Board', 10702, 1, '4 feet *8 feet Notice Board', '4 feet *8 feet Notice Board', 2080.00, 0.00, 'public/images/10702001.png', NULL, NULL, 1, '2019-06-20 11:32:28', '2019-06-20 11:32:28'),
(10702002, '4 feet *6 feet Notice Board', 10702, 1, '4 feet *6 feet Notice Board', '4 feet *6 feet Notice Board', 1560.00, 0.00, 'public/images/10702002.png', NULL, NULL, 1, '2019-06-20 11:32:55', '2019-06-20 11:32:55'),
(10702003, '4 feet *5 feet Notice Board', 10702, 1, '4 feet *5 feet Notice Board', '4 feet *5 feet Notice Board', 1300.00, 0.00, 'public/images/10702003.png', NULL, NULL, 1, '2019-06-20 11:33:44', '2019-06-20 11:33:44'),
(10702004, '4 feet *4 feet Notice Board', 10702, 1, '4 feet *4 feet Notice Board', '4 feet *4 feet Notice Board', 1040.00, 0.00, 'public/images/10702004.png', NULL, NULL, 1, '2019-06-20 11:34:22', '2019-06-20 11:34:22'),
(10702005, '3 feet *4 feet Notice Board', 10702, 1, '3 feet *4 feet Notice Board', '3 feet *4 feet Notice Board', 780.00, 0.00, 'public/images/10702005.png', NULL, NULL, 1, '2019-06-20 11:34:41', '2019-06-20 11:34:41'),
(10702006, '2.5 feet *4 feet Notice Board', 10702, 1, '2.5 feet *4 feet Notice Board', '2.5 feet *4 feet Notice Board', 650.00, 0.00, 'public/images/10702006.png', NULL, NULL, 1, '2019-06-20 11:35:12', '2019-06-20 11:35:12'),
(10702007, '2 feet *3 feet Notice Board', 10702, 1, '2 feet *3 feet Notice Board', '2 feet *3 feet Notice Board', 390.00, 0.00, 'public/images/10702007.png', NULL, NULL, 1, '2019-06-20 11:35:30', '2019-06-20 11:35:30'),
(10703001, '4 feet*8 feet White Board', 10703, 1, '4 feet*8 feet White Board', '4 feet*8 feet White Board', 2080.00, 0.00, 'public/images/10703001.png', NULL, NULL, 1, '2019-06-20 11:29:41', '2019-06-20 11:29:41'),
(10703002, '4 feet*6 feet White Board', 10703, 1, '4 feet*6 feet White Board', '4 feet*6 feet White Board', 1560.00, 0.00, 'public/images/10703002.png', NULL, NULL, 1, '2019-06-20 11:30:12', '2019-06-20 11:30:12'),
(10703003, '4 feet*5 feet White Board', 10703, 1, '4 feet*5 feet White Board', '4 feet*5 feet White Board', 1300.00, 0.00, 'public/images/10703003.png', NULL, NULL, 1, '2019-06-20 11:30:30', '2019-06-20 11:30:30'),
(10703004, '4 feet*4 feet White Board', 10703, 1, '4 feet*4 feet White Board', '4 feet*4 feet White Board', 1040.00, 0.00, 'public/images/10703004.png', NULL, NULL, 1, '2019-06-20 11:30:52', '2019-06-20 11:30:52'),
(10703005, '3 feet*4 feet White Board', 10703, 1, '3 feet*4 feet White Board', '3 feet*4 feet White Board', 780.00, 0.00, 'public/images/10703005.png', NULL, NULL, 1, '2019-06-20 11:31:10', '2019-06-20 11:31:10'),
(10703006, '2.5 feet*4 feet White Board', 10703, 1, '2.5 feet*4 feet White Board', '2.5 feet*4 feet White Board', 650.00, 0.00, 'public/images/10703006.png', NULL, NULL, 1, '2019-06-20 11:31:44', '2019-06-20 11:31:44'),
(10703007, '2 feet*3 feet White Board', 10703, 1, '2 feet*3 feet White Board', '2 feet*3 feet White Board', 390.00, 0.00, 'public/images/10703007.png', NULL, NULL, 1, '2019-06-20 11:32:04', '2019-06-20 11:32:04'),
(10801001, 'Olympic Gold Pencil Battery AA', 10801, 1, 'Olympic Gold Pencil Battery AA', 'Olympic Gold Pencil Battery AA', 12.00, 0.00, 'public/images/10801001.png', NULL, NULL, 1, '2019-06-20 11:40:39', '2019-06-20 11:40:39'),
(10801002, 'Olympic Pencil Battery AA', 10801, 1, 'Olympic Pencil Battery AA', 'Olympic Pencil Battery AA', 13.50, NULL, 'public/images/10801002.png', NULL, NULL, 1, '2019-06-20 11:41:07', '2019-06-20 11:41:07'),
(10801003, 'Olympic Battery AAA', 10801, 1, 'Olympic Battery AAA', 'Olympic Battery AAA', 22.00, 0.00, 'public/images/10801003.png', NULL, NULL, 1, '2019-06-20 11:41:36', '2019-06-20 11:41:36'),
(10801004, 'Sony Pencil Battery AA', 10801, 1, 'Sony Pencil Battery AA', 'Sony Pencil Battery AA', 14.00, NULL, 'public/images/10801004.png', NULL, NULL, 1, '2019-06-20 11:42:05', '2019-06-20 11:42:05'),
(10801005, 'Sony Pencil Battery AAA', 10801, 1, 'Sony Pencil Battery AAA', 'Sony Pencil Battery AAA', 24.00, 0.00, 'public/images/10801005.png', NULL, NULL, 1, '2019-06-20 11:42:26', '2019-06-20 11:42:26'),
(10801006, 'Sunlight Pencil Battery AA', 10801, 1, 'Sunlight Pencil Battery AA', 'Sunlight Pencil Battery AA', 14.00, 0.00, 'public/images/10801006.png', NULL, NULL, 1, '2019-06-20 11:42:47', '2019-06-20 11:42:47'),
(10801007, 'Sunlight Pencil Battery AAA', 10801, 1, 'Sunlight Pencil Battery AAA', 'Sunlight Pencil Battery AAA', 23.00, 0.00, 'public/images/10801007.png', NULL, NULL, 1, '2019-06-20 11:43:05', '2019-06-20 11:43:05'),
(10802001, 'KIKO Lock 70mm', 10802, 1, 'KIKO Lock 70mm', 'KIKO Lock 70mm', 165.00, 0.00, 'public/images/10802001.png', NULL, NULL, 1, '2019-06-20 11:44:24', '2019-06-20 11:44:24'),
(10802002, 'KIKO Lock 60mm', 10802, 1, 'KIKO Lock 60mm', 'KIKO Lock 60mm', 155.00, 0.00, 'public/images/10802002.png', NULL, NULL, 1, '2019-06-20 11:44:46', '2019-06-20 11:44:46'),
(10802003, 'KIKO Lock 50mm', 10802, 1, 'KIKO Lock 50mm', 'KIKO Lock 50mm', 130.00, 0.00, 'public/images/10802003.png', NULL, NULL, 1, '2019-06-20 11:45:07', '2019-06-20 11:45:07'),
(10802004, 'KIKO Lock 40mm', 10802, 1, 'KIKO Lock 40mm', 'KIKO Lock 40mm', 110.00, 0.00, 'public/images/10802004.png', NULL, NULL, 1, '2019-06-20 11:46:13', '2019-06-20 11:46:13'),
(10802005, 'KIKO Lock 30mm', 10802, 1, 'KIKO Lock 30mm', 'KIKO Lock 30mm', 80.00, 0.00, 'public/images/10802005.png', NULL, NULL, 1, '2019-06-20 11:46:36', '2019-06-20 11:46:36'),
(10802006, 'BETOX Lock 70mm', 10802, 1, 'BETOX Lock 70mm', 'BETOX Lock 70mm', 190.00, 0.00, 'public/images/10802006.png', NULL, NULL, 1, '2019-06-20 11:47:15', '2019-06-20 11:47:15'),
(10802007, 'BETOX Lock 60mm', 10802, 1, 'BETOX Lock 60mm', 'BETOX Lock 60mm', 175.00, 0.00, 'public/images/10802007.png', NULL, NULL, 1, '2019-06-20 11:47:42', '2019-06-20 11:47:42'),
(10802008, 'BETOX Lock 50mm', 10802, 1, 'BETOX Lock 50mm', 'BETOX Lock 50mm', 160.00, 0.00, 'public/images/10802008.png', NULL, NULL, 1, '2019-06-20 11:49:04', '2019-06-20 11:49:04'),
(10802009, 'BETOX Lock 40mm', 10802, 1, 'BETOX Lock 40mm', 'BETOX Lock 40mm', 120.00, 0.00, 'public/images/10802009.png', NULL, NULL, 1, '2019-06-20 11:49:32', '2019-06-20 11:49:32'),
(10802010, 'BETOX Lock 30mm', 10802, 1, 'BETOX Lock 30mm', 'BETOX Lock 30mm', 95.00, 0.00, 'public/images/10802010.png', NULL, NULL, 1, '2019-06-20 11:49:53', '2019-06-20 11:49:53'),
(10802011, 'MOBAJ Lock 70mm', 10802, 1, 'MOBAJ Lock 70mm', 'MOBAJ Lock 70mm', 495.00, 0.00, 'public/images/10802011.png', NULL, NULL, 1, '2019-06-20 11:50:20', '2019-06-20 11:50:20'),
(10802012, 'MOBAJ Lock 60mm', 10802, 1, 'MOBAJ Lock 60mm', 'MOBAJ Lock 60mm', 445.00, 0.00, 'public/images/10802012.png', NULL, NULL, 1, '2019-06-20 11:50:50', '2019-06-20 11:50:50'),
(10802013, 'MOBAJ Lock 50mm', 10802, 1, 'MOBAJ Lock 50mm', 'MOBAJ Lock 50mm', 380.00, 0.00, 'public/images/10802013.png', NULL, NULL, 1, '2019-06-20 11:51:17', '2019-06-20 11:51:17'),
(10802014, 'TC Lock 63mm', 10802, 1, 'TC Lock 63mm', 'TC Lock 63mm', 140.00, 0.00, 'public/images/10802014.png', NULL, NULL, 1, '2019-06-20 11:51:45', '2019-06-20 11:51:45'),
(10802015, 'TC Lock 50mm', 10802, 1, 'TC Lock 50mm', 'TC Lock 50mm', 110.00, 0.00, 'public/images/10802015.png', NULL, NULL, 1, '2019-06-20 11:52:10', '2019-06-20 11:52:10'),
(10802016, 'TC Lock 38mm', 10802, 1, 'TC Lock 38mm', 'TC Lock 38mm', 70.00, 0.00, 'public/images/10802016.png', NULL, NULL, 1, '2019-06-20 11:52:33', '2019-06-20 11:52:33'),
(10802017, 'TC Lock 32mm', 10802, 1, 'TC Lock 32mm', 'TC Lock 32mm', 45.00, 0.00, 'public/images/10802017.png', NULL, NULL, 1, '2019-06-20 11:52:57', '2019-06-20 11:52:57'),
(10802018, 'TC Lock 25mm', 10802, 1, 'TC Lock 25mm', 'TC Lock 25mm', 35.00, 0.00, 'public/images/10802018.png', NULL, NULL, 1, '2019-06-20 11:53:21', '2019-06-20 11:53:21'),
(10802019, 'TC Lock 20mm', 10802, 1, 'TC Lock 20mm', 'TC Lock 20mm', 30.00, 0.00, 'public/images/10802019.png', NULL, NULL, 1, '2019-06-20 11:53:44', '2019-06-20 11:53:44'),
(10802020, 'TC Lock Golden 63mm', 10802, 1, 'TC Lock Golden 63mm', 'TC Lock Golden 63mm', 160.00, 0.00, 'public/images/10802020.png', NULL, NULL, 1, '2019-06-20 11:54:18', '2019-06-20 11:54:18'),
(10802021, 'TC Lock Golden 50mm', 10802, 1, 'TC Lock Golden 50mm', 'TC Lock Golden 50mm', 110.00, 0.00, 'public/images/10802021.png', NULL, NULL, 1, '2019-06-20 11:54:38', '2019-06-20 11:54:38'),
(10802022, 'TC Lock Golden 38mm', 10802, 1, 'TC Lock Golden 38mm', 'TC Lock Golden 38mm', 90.00, 0.00, 'public/images/10802022.png', NULL, NULL, 1, '2019-06-20 11:55:05', '2019-06-20 11:55:05'),
(10802023, 'TC Lock Golden 32mm', 10802, 1, 'TC Lock Golden 32mm', 'TC Lock Golden 32mm', 65.00, 0.00, 'public/images/10802023.png', NULL, NULL, 1, '2019-06-20 11:55:36', '2019-06-20 11:55:36'),
(10802024, 'TC Lock Golden 25mm', 10802, 1, 'TC Lock Golden 25mm', 'TC Lock Golden 25mm', 48.00, 0.00, 'public/images/10802024.png', NULL, NULL, 1, '2019-06-20 11:56:11', '2019-06-20 11:56:11'),
(10802025, 'TC Lock Golden 20mm', 10802, 1, 'TC Lock Golden 20mm', 'TC Lock Golden 20mm', 40.00, 0.00, 'public/images/10802025.png', NULL, NULL, 1, '2019-06-20 11:56:34', '2019-06-20 11:56:34'),
(20101001, 'ACI Angelic Air Freshener Amazonia Flavour', 20101, 19, 'ACI Angelic Air Freshener Amazonia Flavour', 'ACI Angelic Air Freshener Amazonia Flavour', 195.00, 0.00, 'public/images/20101001.png', NULL, NULL, 1, '2019-06-19 10:09:00', '2019-06-19 10:09:00'),
(20101002, 'ACI Angelic Air Freshener Citrus Burst Fragrance', 20101, 19, 'ACI Angelic Air Freshener Citrus Burst Fragrance', 'ACI Angelic Air Freshener Citrus Burst Fragrance', 195.00, 0.00, 'public/images/20101002.png', NULL, NULL, 1, '2019-06-19 10:09:31', '2019-06-19 10:09:31'),
(20101003, 'ACI Angelic Air Freshener Green Valley Fragrance', 20101, 19, 'ACI Angelic Air Freshener Green Valley Fragrance', 'ACI Angelic Air Freshener Green Valley Fragrance', 195.00, 0.00, 'public/images/20101003.png', NULL, NULL, 1, '2019-06-19 10:11:59', '2019-06-19 10:11:59'),
(20101004, 'ACI Angelic Air Freshener Sparking Orange Flavour', 20101, 19, 'ACI Angelic Air Freshener Sparking Orange Flavour', 'ACI Angelic Air Freshener Sparking Orange Flavour', 195.00, 0.00, 'public/images/20101004.png', NULL, NULL, 1, '2019-06-19 10:12:25', '2019-06-19 10:12:25'),
(20101005, 'ACI Angelic Air Freshener Orchid Breez Flavour', 20101, 19, 'ACI Angelic Air Freshener Orchid Breez Flavour', 'ACI Angelic Air Freshener Orchid Breez Flavour', 195.00, 0.00, 'public/images/20101005.png', NULL, NULL, 1, '2019-06-19 10:12:48', '2019-06-19 10:12:48'),
(20101006, 'Fay Air Freshener Narcissus', 20101, 20, 'Fay Air Freshener Narcissus', 'Fay Air Freshener Narcissus', 192.00, 0.00, 'public/images/20101006.png', NULL, NULL, 1, '2019-06-19 10:13:23', '2019-06-19 10:13:23'),
(20101007, 'Fay Air Freshener Lime Flavour', 20101, 1, 'Fay Air Freshener Lime Flavour', 'Fay Air Freshener Lime Flavour', 192.00, 0.00, 'public/images/20101007.png', NULL, NULL, 1, '2019-06-19 10:13:45', '2019-06-19 10:13:45'),
(20101008, 'Fay Air Freshener Jasmine Fragrance', 20101, 20, 'Fay Air Freshener Jasmine Fragrance', 'Fay Air Freshener Jasmine Fragrance', 192.00, 0.00, 'public/images/20101008.png', NULL, NULL, 1, '2019-06-19 10:14:13', '2019-06-19 10:14:13'),
(20101009, 'Fay Air Freshener Sea Mineral Fragrance', 20101, 20, 'Fay Air Freshener Sea Mineral Fragrance', 'Fay Air Freshener Sea Mineral Fragrance', 192.00, 0.00, 'public/images/20101009.png', NULL, NULL, 1, '2019-06-19 10:14:38', '2019-06-19 10:14:38'),
(20101010, 'Fay Air Freshener Anti Tobacco', 20101, 20, 'Fay Air Freshener Anti Tobacco', 'Fay Air Freshener Anti Tobacco', 192.00, 0.00, 'public/images/20101010.png', NULL, NULL, 1, '2019-06-19 10:15:09', '2019-06-19 10:15:09'),
(20101011, 'Fay Air Freshener Lavender', 20101, 20, 'Fay Air Freshener Lavender', 'Fay Air Freshener Lavender', 192.00, 0.00, 'public/images/20101011.png', NULL, NULL, 1, '2019-06-19 10:15:41', '2019-06-19 10:15:41'),
(20101012, 'Godrej aer Air Freshener, Fresh Lush Green', 20101, 21, 'Godrej aer Air Freshener, Fresh Lush Green', 'Godrej aer Air Freshener, Fresh Lush Green', 185.00, 0.00, 'public/images/20101012.png', NULL, NULL, 1, '2019-06-19 10:16:42', '2019-06-19 10:16:42'),
(20101013, 'Godrej aer Air Freshener, Musk After Smoke', 20101, 21, 'Godrej aer Air Freshener, Musk After Smoke', 'Godrej aer Air Freshener, Musk After Smoke', 185.00, 0.00, 'public/images/20101013.png', NULL, NULL, 1, '2019-06-19 10:17:08', '2019-06-19 10:17:08'),
(20101014, 'Godrej aer Air Freshener, Petal Crush Pink', 20101, 21, 'Godrej aer Air Freshener, Petal Crush Pink', 'Godrej aer Air Freshener, Petal Crush Pink', 185.00, 0.00, 'public/images/20101014.png', NULL, NULL, 1, '2019-06-19 10:17:46', '2019-06-19 10:17:46'),
(20101015, 'Godrej aer Air Freshener, Cool Room Spray', 20101, 21, 'Godrej aer Air Freshener, Cool Room Spray', 'Godrej aer Air Freshener, Cool Room Spray', 185.00, 0.00, 'public/images/20101015.png', NULL, NULL, 1, '2019-06-19 10:18:22', '2019-06-19 10:18:22'),
(20101016, 'Godrej aer Bright Tangy Delight Blocks', 20101, 21, 'Godrej aer Bright Tangy Delight Blocks', 'Godrej aer Bright Tangy Delight Blocks', 0.00, 0.00, 'public/images/20101016.png', NULL, NULL, 0, '2019-06-19 10:18:53', '2019-06-19 10:18:53'),
(20101017, 'Godrej aer Pocket Bundle', 20101, 21, 'Godrej aer Pocket Bundle', 'Godrej aer Pocket Bundle', 0.00, 0.00, 'public/images/20101017.png', NULL, NULL, 0, '2019-06-19 10:19:20', '2019-06-19 10:19:20'),
(20101018, 'AirWick Air Freshener', 20101, 1, 'AirWick Air Freshener', 'AirWick Air Freshener', 0.00, 0.00, 'public/images/20101018.png', NULL, NULL, 0, '2019-06-19 10:19:54', '2019-06-19 10:19:54'),
(20101019, 'Odonil Air Freshener', 20101, 1, 'Odonil Air Freshener', 'Odonil Air Freshener', 0.00, 0.00, 'public/images/20101019.png', NULL, NULL, 0, '2019-06-19 10:20:18', '2019-06-19 10:20:18'),
(20101020, 'Paris Air Freshener', 20101, 1, 'Paris Air Freshener', 'Paris Air Freshener', 190.00, 0.00, 'public/images/20101020.png', NULL, NULL, 1, '2019-06-19 10:20:47', '2019-06-19 10:20:47'),
(20101021, 'Wave Air Freshener', 20101, 1, 'Wave Air Freshener', 'Wave Air Freshener', 180.00, 0.00, 'public/images/20101021.png', NULL, NULL, 1, '2019-06-19 10:21:17', '2019-06-19 10:21:17'),
(20101022, 'Spring Air Freshener', 20101, 1, 'Spring Air Freshener', 'Spring Air Freshener', 185.00, 0.00, 'public/images/20101022.png', NULL, NULL, 1, '2019-06-19 10:21:53', '2019-06-19 10:21:53'),
(20101023, 'Spring Air Freshener Anti Tobacco', 20101, 1, 'Spring Air Freshener Anti Tobacco', 'Spring Air Freshener Anti Tobacco', 190.00, 0.00, 'public/images/20101023.png', NULL, NULL, 1, '2019-06-19 10:22:23', '2019-06-19 10:22:23'),
(20101024, 'Fresh N Fresh Air Freshener', 20101, 1, 'Fresh N Fresh Air Freshener', 'Fresh N Fresh Air Freshener', 180.00, 0.00, 'public/images/20101024.png', NULL, NULL, 1, '2019-06-19 10:22:59', '2019-06-19 10:22:59'),
(20101025, 'AirWick Air Freshener Gel', 20101, 1, 'AirWick Air Freshener Gel', 'AirWick Air Freshener Gel', 0.00, 0.00, 'public/images/20101025.png', NULL, NULL, 0, '2019-06-19 10:23:21', '2019-06-19 10:23:21'),
(20102001, 'Savlon Antiseptic Liquid 5Ltr', 20102, 1, 'Savlon Antiseptic Liquid 5Ltr', 'Savlon Antiseptic Liquid 5Ltr', 695.00, 0.00, 'public/images/20102001.png', NULL, NULL, 1, '2019-06-19 10:56:12', '2019-06-19 10:56:12'),
(20102002, 'Savlon Antiseptic Liquid 1Ltr', 20102, 1, 'Savlon Antiseptic Liquid 1Ltr', 'Savlon Antiseptic Liquid 1Ltr', 215.00, 0.00, 'public/images/20102002.png', NULL, NULL, 1, '2019-06-19 10:56:47', '2019-06-19 10:56:47'),
(20102003, 'Savlon Antiseptic Liquid 500ml', 20102, 1, 'Savlon Antiseptic Liquid 500ml', 'Savlon Antiseptic Liquid 500ml', 125.00, 0.00, 'public/images/20102003.png', NULL, NULL, 1, '2019-06-19 10:57:24', '2019-06-19 10:57:24'),
(20102004, 'Savlon Antiseptic Liquid 112ml', 20102, 1, 'Savlon Antiseptic Liquid 112ml', 'Savlon Antiseptic Liquid 112ml', 0.00, 0.00, 'public/images/20102004.png', NULL, NULL, 0, '2019-06-19 10:57:56', '2019-06-19 10:57:56'),
(20102005, 'Dettol Antiseptic Liquid 5Ltr', 20102, 1, 'Dettol Antiseptic Liquid 5Ltr', 'Dettol Antiseptic Liquid 5Ltr', 1185.00, 0.00, 'public/images/20102005.png', NULL, NULL, 1, '2019-06-19 10:58:32', '2019-06-19 10:58:32'),
(20102006, 'Dettol Antiseptic Liquid 750ml', 20102, 1, 'Dettol Antiseptic Liquid 750ml', 'Dettol Antiseptic Liquid 750ml', 215.00, 0.00, 'public/images/20102006.png', NULL, NULL, 1, '2019-06-19 10:58:59', '2019-06-19 10:58:59'),
(20102007, 'Dettol Antiseptic Liquid 500ml', 20102, 1, 'Dettol Antiseptic Liquid 500ml', 'Dettol Antiseptic Liquid 500ml', 145.00, 0.00, 'public/images/20102007.png', NULL, NULL, 1, '2019-06-19 10:59:38', '2019-06-19 10:59:38'),
(20102008, 'Dettol Antiseptic Liquid 100ml', 20102, 1, 'Dettol Antiseptic Liquid 100ml', 'Dettol Antiseptic Liquid 100ml', 45.00, 0.00, 'public/images/20102008.png', NULL, NULL, 1, '2019-06-19 11:00:04', '2019-06-19 11:00:04'),
(20103001, 'Good Knight Power Active Machine', 20103, 1, 'Good Night Power Active Machine', 'Good Night Power Active Machine', 140.00, NULL, 'public/images/20103001.png', NULL, NULL, 1, '2019-06-19 10:43:19', '2019-06-19 10:43:19'),
(20103002, 'Good Knight Turbo Machine', 20103, 1, 'Good Night Turbo Machine', 'Good Night Turbo Machine', 155.00, NULL, 'public/images/20103002.png', NULL, NULL, 1, '2019-06-19 10:43:39', '2019-06-19 10:43:39'),
(20103003, 'Good Knight Turbo Machine with Cable', 20103, 1, 'Good Night Turbo Machine with Cable', 'Good Night Turbo Machine with Cable', 215.00, NULL, 'public/images/20103003.png', NULL, NULL, 1, '2019-06-19 10:44:10', '2019-06-19 10:44:10'),
(20103004, 'Good Knight Xpress Machine', 20103, 1, 'Good Night Xpress Machine', 'Good Night Xpress Machine', 200.00, NULL, 'public/images/20103004.png', NULL, NULL, 1, '2019-06-19 10:44:47', '2019-06-19 10:44:47'),
(20103005, 'Good Knight Silver Refill', 20103, 1, 'Good Night Silver Refill', 'Good Night Silver Refill', 100.00, NULL, 'public/images/20103005.png', NULL, NULL, 1, '2019-06-19 10:46:21', '2019-06-19 10:46:21'),
(20103006, 'Good Night Xpress Refill---Nopic', 20103, 1, 'Good Night Xpress Refill', 'Good Night Xpress Refill', 130.00, 0.00, 'public/images/20103006.png', NULL, NULL, 0, '2019-06-19 10:47:37', '2019-06-19 10:47:37'),
(20103007, 'Good Knight Power Active Refill', 20103, 1, 'Good Night Power Active Refill', 'Good Night Power Active Refill', 115.00, NULL, 'public/images/20103007.png', NULL, NULL, 1, '2019-06-19 10:48:22', '2019-06-19 10:48:22'),
(20103009, 'ACI Aerosol Spray-800ml', 20103, 19, 'ACI Aerosol Insect-800ml', 'ACI Aerosol Insect-800ml', 410.00, NULL, 'public/images/20103009.png', NULL, NULL, 1, '2019-06-19 10:49:58', '2019-06-19 10:49:58'),
(20103010, 'ACI Aerosol Spray-475ml', 20103, 19, 'ACI Aerosol Insect-475ml', 'ACI Aerosol Insect-475ml', 280.00, NULL, 'public/images/20103010.png', NULL, NULL, 1, '2019-06-19 10:50:22', '2019-06-19 10:50:22'),
(20103011, 'ACI Aerosol Spray-350ml', 20103, 19, 'ACI Aerosol Insect-350ml', 'ACI Aerosol Insect-350ml', 225.00, NULL, 'public/images/20103011.png', NULL, NULL, 1, '2019-06-19 10:52:13', '2019-06-19 10:52:13'),
(20103012, 'ACI Aerosol Spray-250ml', 20103, 19, 'ACI Aerosol Insect-250ml', 'ACI Aerosol Insect-250ml', 155.00, NULL, 'public/images/20103012.png', NULL, NULL, 1, '2019-06-19 10:52:40', '2019-06-19 10:52:40'),
(20103013, 'Godrej Hit Anti Roach Gel 20gm', 20103, 21, 'Godrej Hit Anti Roach Gel 20gm', 'Godrej Hit Anti Roach Gel 20gm', 198.00, 0.00, 'public/images/20103013.png', NULL, NULL, 1, '2019-06-19 10:53:10', '2019-06-19 10:53:10'),
(20103014, 'Godrej Hit Lime Mosquitoes & Flies Spray', 20103, 21, 'Godrej Hit Lime Mosquitoes & Flies Spray', 'Godrej Hit Lime Mosquitoes & Flies Spray', 295.00, 0.00, 'public/images/20103014.png', NULL, NULL, 1, '2019-06-19 10:53:53', '2019-06-19 10:53:53'),
(20103015, 'Godrej Hit Cockroaches Spray', 20103, 21, 'Godrej Hit Cockroaches Spray', 'Godrej Hit Cockroaches Spray', 305.00, 0.00, 'public/images/20103015.png', NULL, NULL, 1, '2019-06-19 10:54:17', '2019-06-19 10:54:17'),
(20104001, 'Fresh Facial White Tissue 100*2Ply', 20104, 6, 'Fresh Facial White Tissue 100*2Ply', 'Fresh Facial White Tissue 100*2Ply', 52.00, 0.00, 'public/images/20104001.png', NULL, NULL, 1, '2019-06-19 10:26:06', '2019-06-19 10:26:06'),
(20104002, 'Fresh Facial White Tissue 120*2Ply', 20104, 6, 'Fresh Facial White Tissue 120*2Ply', 'Fresh Facial White Tissue 120*2Ply', 60.00, 0.00, 'public/images/20104002.png', NULL, NULL, 1, '2019-06-19 10:26:37', '2019-06-19 10:26:37'),
(20104003, 'Fresh Facial White Tissue 150*2Ply', 20104, 1, 'Fresh Facial White Tissue 150*2Ply', 'Fresh Facial White Tissue 150*2Ply', 75.00, 0.00, 'public/images/20104003.png', NULL, NULL, 1, '2019-06-19 10:27:03', '2019-06-19 10:27:03'),
(20104004, 'Fresh Facial Tissue Perfume 120*2Ply', 20104, 6, 'Fresh Facial Tissue Perfume 120*2Ply', 'Fresh Facial Tissue Perfume 120*2Ply', 60.00, 0.00, 'public/images/20104004.png', NULL, NULL, 1, '2019-06-19 10:27:32', '2019-06-19 10:27:32'),
(20104005, 'Fresh Facial Tissue Perfume 60*2Ply', 20104, 6, 'Fresh Facial Tissue Perfume 60*2Ply', 'Fresh Facial Tissue Perfume 60*2Ply', 42.00, 0.00, 'public/images/20104005.png', NULL, NULL, 1, '2019-06-19 10:28:02', '2019-06-19 10:28:02'),
(20104006, 'Fresh hand Towel 250*1Ply', 20104, 1, 'Fresh hand Towel 250*1Ply', 'Fresh hand Towel 250*1Ply', 75.00, 0.00, 'public/images/20104006.png', NULL, NULL, 1, '2019-06-19 10:28:25', '2019-06-19 10:28:25'),
(20104007, 'Fresh Kitchen Towel', 20104, 6, 'Fresh Kitchen Towel', 'Fresh Kitchen Towel', 110.00, 0.00, 'public/images/20104007.png', NULL, NULL, 1, '2019-06-19 10:33:23', '2019-06-19 10:33:23'),
(20104008, 'Fresh Toilet Tissue White', 20104, 6, 'Fresh Toilet Tissue White', 'Fresh Toilet Tissue White', 16.00, 0.00, 'public/images/20104008.png', NULL, NULL, 1, '2019-06-19 10:33:51', '2019-06-19 10:33:51'),
(20104009, 'Fresh Toilet Tissue Gold', 20104, 6, 'Fresh Toilet Tissue Gold', 'Fresh Toilet Tissue Gold', 25.00, 0.00, 'public/images/20104009.png', NULL, NULL, 1, '2019-06-19 10:34:22', '2019-06-19 10:34:22'),
(20104010, 'Bashundhara Facial Tissue 60*2Ply', 20104, 5, 'Bashundhara Facial Tissue 60*2Ply', 'Bashundhara Facial Tissue 60*2Ply', 45.00, 0.00, 'public/images/20104010.png', NULL, NULL, 1, '2019-06-19 10:34:57', '2019-06-19 10:34:57'),
(20104011, 'Bashundhara Facial Tissue 100*2Ply', 20104, 5, 'Bashundhara Facial Tissue 100*2Ply', 'Bashundhara Facial Tissue 100*2Ply', 52.00, 0.00, 'public/images/20104011.png', NULL, NULL, 1, '2019-06-19 10:35:24', '2019-06-19 10:35:24'),
(20104012, 'Bashundhara Facial Tissue 120*2Ply', 20104, 5, 'Bashundhara Facial Tissue 120*2Ply', 'Bashundhara Facial Tissue 120*2Ply', 60.00, 0.00, 'public/images/20104012.png', NULL, NULL, 1, '2019-06-19 10:35:51', '2019-06-19 10:35:51'),
(20104013, 'Bashundhara Facial Tissue 150*2Ply', 20104, 5, 'Bashundhara Facial Tissue 150*2Ply', 'Bashundhara Facial Tissue 150*2Ply', 75.00, 0.00, 'public/images/20104013.png', NULL, NULL, 1, '2019-06-19 10:36:20', '2019-06-19 10:36:20'),
(20104014, 'Bashundhara Paper Napkin 100*1Ply', 20104, 5, 'Bashundhara Paper Napkin 100*1Ply', 'Bashundhara Paper Napkin 100*1Ply', 52.00, 0.00, 'public/images/20104014.png', NULL, NULL, 1, '2019-06-19 10:36:53', '2019-06-19 10:36:53'),
(20104015, 'Bashundhara Paper Napkin 80*1Ply *', 20104, 5, 'Bashundhara Paper Napkin 80*1Ply *', 'Bashundhara Paper Napkin 80*1Ply *', 45.00, 0.00, 'public/images/20104015.png', NULL, NULL, 1, '2019-06-19 10:37:20', '2019-06-19 10:37:20'),
(20104016, 'Bashundhara Toilet Tissue White', 20104, 5, 'Bashundhara Toilet Tissue White', 'Bashundhara Toilet Tissue White', 16.00, 0.00, 'public/images/20104016.png', NULL, NULL, 1, '2019-06-19 10:38:00', '2019-06-19 10:38:00'),
(20104017, 'Bashundhara Toilet Tissue Gold', 20104, 5, 'Bashundhara Toilet Tissue Gold', 'Bashundhara Toilet Tissue Gold', 25.00, 0.00, 'public/images/20104017.png', NULL, NULL, 1, '2019-06-19 10:38:33', '2019-06-19 10:38:33'),
(20104018, 'Bashundhara Kitchen Towel', 20104, 5, 'Bashundhara Kitchen Towel', 'Bashundhara Kitchen Towel', 110.00, 0.00, 'public/images/20104018.png', NULL, NULL, 1, '2019-06-19 10:39:11', '2019-06-19 10:39:11'),
(20104019, 'Bashundhara Hand Towel 250*1Ply', 20104, 5, 'Bashundhara Hand Towel 250*1Ply', 'Bashundhara Hand Towel 250*1Ply', 74.00, 0.00, 'public/images/20104019.png', NULL, NULL, 1, '2019-06-19 10:39:39', '2019-06-19 10:39:39'),
(20104020, 'Bashundhara paper Towel 250*1Ply', 20104, 5, 'Bashundhara paper Towel 250*1Ply', 'Bashundhara paper Towel 250*1Ply', 74.00, 0.00, 'public/images/20104020.png', NULL, NULL, 1, '2019-06-19 10:40:04', '2019-06-19 10:40:04'),
(20105001, 'Wheel Soap', 20105, 18, 'Wheel Soap', 'Wheel Soap', 19.00, 0.00, 'public/images/20105001.jpg', NULL, NULL, 1, '2019-06-18 19:25:32', '2019-06-18 19:25:32'),
(20105002, 'Lifebouy Soap', 20105, 18, 'Lifebouy Soap', 'Lifebouy Soap', 28.00, 0.00, 'public/images/20105002.jpg', NULL, NULL, 1, '2019-06-18 19:26:12', '2019-06-18 19:26:12'),
(20105003, 'Lux Soap 75gm', 20105, 18, 'Lux Soap 75gm', 'Lux Soap 75gm', 24.00, 0.00, 'public/images/20105003.jpg', NULL, NULL, 1, '2019-06-18 19:27:05', '2019-06-18 19:27:05'),
(20105004, 'Lux Soap 100gm', 20105, 18, 'Lux Soap 100gm', 'Lux Soap 100gm', 33.00, 0.00, 'public/images/20105004.jpg', NULL, NULL, 1, '2019-06-18 19:27:41', '2019-06-18 19:27:41'),
(20105005, 'Sevlon Soap', 20105, 18, 'Sevlon Soap', 'Sevlon Soap', 35.00, 0.00, 'public/images/20105005.jpg', NULL, NULL, 1, '2019-06-18 19:28:08', '2019-06-18 19:28:08'),
(20105006, 'Dettol Soap 75gm', 20105, 1, 'Dettol Soap 75gm', 'Dettol Soap 75gm', 34.00, 0.00, 'public/images/20105006.jpg', NULL, NULL, 1, '2019-06-18 19:28:40', '2019-06-18 19:28:40'),
(20105007, 'Dettol Soap 125gm', 20105, 1, 'Dettol Soap 125gm', 'Dettol Soap 125gm', 0.00, 0.00, 'public/images/20105007.jpg', NULL, NULL, 0, '2019-06-18 19:29:02', '2019-06-18 19:29:02'),
(20105008, 'Lifebouy Hand Wash Pump', 20105, 1, 'Lifebouy Hand Wash Pump', 'Lifebouy Hand Wash Pump', 90.00, 0.00, 'public/images/20105008.jpg', NULL, NULL, 1, '2019-06-18 19:35:45', '2019-06-18 19:35:45'),
(20105009, 'Lifebouy Hand Wash Pack', 20105, 1, 'Lifebouy Hand Wash Pack', 'Lifebouy Hand Wash Pack', 55.00, 0.00, 'public/images/20105009.jpg', NULL, NULL, 1, '2019-06-18 19:36:10', '2019-06-18 19:36:10'),
(20105010, 'Dettol Hand Wash Gold 200ml', 20105, 1, 'Dettol Hand Wash Gold 200ml', 'Dettol Hand Wash Gold 200ml', 0.00, 0.00, 'public/images/20105010.jpg', NULL, NULL, 0, '2019-06-18 19:36:42', '2019-06-18 19:36:42'),
(20105011, 'Dettol Hand Wash Refill 170ml', 20105, 1, 'Dettol Hand Wash Refill 170ml', 'Dettol Hand Wash Refill 170ml', 0.00, 0.00, 'public/images/20105011.jpg', NULL, NULL, 0, '2019-06-18 19:37:10', '2019-06-18 19:37:10'),
(20105012, 'Savlon Hand Wash Pump', 20105, 1, 'Savlon Hand Wash Pump', 'Savlon Hand Wash Pump', 0.00, 0.00, 'public/images/20105012.jpg', NULL, NULL, 0, '2019-06-18 19:37:52', '2019-06-18 19:37:52'),
(20105013, 'Savlon Hand Wash Refill Pack', 20105, 1, 'Savlon Hand Wash Refill Pack', 'Savlon Hand Wash Refill Pack', 0.00, 0.00, 'public/images/20105013.jpg', NULL, NULL, 0, '2019-06-18 19:38:31', '2019-06-18 19:38:31'),
(20105014, 'Savlon Hand Wash Active 1Ltr', 20105, 1, 'Savlon Hand Wash Active 1Ltr', 'Savlon Hand Wash Active 1Ltr', 0.00, 0.00, 'public/images/20105014.jpg', NULL, NULL, 0, '2019-06-18 19:39:32', '2019-06-18 19:39:32'),
(20105015, 'Savlon Hand Wash Liquid 1Ltr,Aloevera', 20105, 1, 'Savlon Hand Wash Liquid 1Ltr,Aloevera', 'Savlon Hand Wash Liquid 1Ltr,Aloevera', 90.00, 0.00, 'public/images/20105015.jpg', NULL, NULL, 1, '2019-06-18 19:41:20', '2019-06-18 19:41:20'),
(20105016, 'Sepnil Hand Wash 200ml', 20105, 1, 'Sepnil Hand Wash 200ml', 'Sepnil Hand Wash 200ml', 90.00, 0.00, 'public/images/20105016.png', NULL, NULL, 1, '2019-06-18 19:56:34', '2019-06-18 19:56:34'),
(20105017, 'Sepnil Hand Wash  Refill 180ml', 20105, 1, 'Sepnil Hand Wash  Refill 180ml', 'Sepnil Hand Wash  Refill 180ml', 0.00, 0.00, 'public/images/20105017.png', NULL, NULL, 0, '2019-06-18 19:57:06', '2019-06-18 19:57:06'),
(20106001, 'Wheel Detergent 200gm', 20106, 1, 'Wheel Detergent 200gm', 'Wheel Detergent 200gm', 16.00, 0.00, 'public/images/20106001.png', NULL, NULL, 1, '2019-06-19 09:58:22', '2019-06-19 09:58:22'),
(20106002, 'Wheel Detergent 500gm', 20106, 1, 'Wheel Detergent 500gm', 'Wheel Detergent 500gm', 42.00, 0.00, 'public/images/20106002.png', NULL, NULL, 1, '2019-06-19 09:58:47', '2019-06-19 09:58:47'),
(20106003, 'Vim Powder 500gm', 20106, 1, 'Vim Powder 500gm', 'Vim Powder 500gm', 30.00, 0.00, 'public/images/20106003.png', NULL, NULL, 1, '2019-06-19 09:59:13', '2019-06-19 09:59:13'),
(20106004, 'Surf Excel 200gm', 20106, 1, 'Surf Excel 200gm', 'Surf Excel 200gm', 40.00, 0.00, 'public/images/20106004.png', NULL, NULL, 1, '2019-06-19 09:59:37', '2019-06-19 09:59:37'),
(20106005, 'Surf Excel 500gm', 20106, 1, 'Surf Excel 500gm', 'Surf Excel 500gm', 95.00, 0.00, 'public/images/20106005.png', NULL, NULL, 1, '2019-06-19 10:00:03', '2019-06-19 10:00:03'),
(20106006, 'Surf Excel 1kg', 20106, 1, 'Surf Excel 1kg', 'Surf Excel 1kg', 200.00, 0.00, 'public/images/20106006.png', NULL, NULL, 1, '2019-06-19 10:04:11', '2019-06-19 10:04:11'),
(20106007, 'Jet Powder 220gm', 20106, 1, 'Jet Powder 220gm', 'Jet Powder 220gm', 50.00, 0.00, 'public/images/20106007.png', NULL, NULL, 1, '2019-06-19 10:04:54', '2019-06-19 10:04:54'),
(20106008, 'Jet Powder 400gm', 20106, 1, 'Jet Powder 400gm', 'Jet Powder 400gm', 90.00, 0.00, 'public/images/20106008.png', NULL, NULL, 1, '2019-06-19 10:05:25', '2019-06-19 10:05:25'),
(20106009, 'Jet Powder 1kg', 20106, 1, 'Jet Powder 1kg', 'Jet Powder 1kg', 190.00, 0.00, 'public/images/20106009.png', NULL, NULL, 1, '2019-06-19 10:05:49', '2019-06-19 10:05:49'),
(20106010, 'Rin Powder 200gm', 20106, 1, 'Rin Powder 200gm', 'Rin Powder 200gm', 25.00, 0.00, 'public/images/20106010.png', NULL, NULL, 1, '2019-06-19 10:06:45', '2019-06-19 10:06:45'),
(20106011, 'Rin Powder 500gm', 20106, 1, 'Rin Powder 500gm', 'Rin Powder 500gm', 60.00, 0.00, 'public/images/20106011.png', NULL, NULL, 1, '2019-06-19 10:07:15', '2019-06-19 10:07:15'),
(20106012, 'Rin Powder 1kg', 20106, 1, 'Rin Powder 1kg', 'Rin Powder 1kg', 110.00, 0.00, 'public/images/20106012.png', NULL, NULL, 1, '2019-06-19 10:07:40', '2019-06-19 10:07:40'),
(20107001, 'FIXOL Floor & Tiles Cleaner 1ltr', 20107, 1, 'FIXOL Floor & Tiles Cleaner 1ltr', 'FIXOL Floor & Tiles Cleaner 1ltr', 80.00, 0.00, 'public/images/20107001.png', NULL, NULL, 1, '2019-06-20 13:53:10', '2019-06-20 13:53:10'),
(20107002, 'Harpic Power Plus 500ml', 20107, 1, 'Harpic Power Plus 500ml', 'Harpic Power Plus 500ml', 105.00, 0.00, 'public/images/20107002.png', NULL, NULL, 1, '2019-06-20 13:53:36', '2019-06-20 13:53:36'),
(20107003, 'Harpic Power Plus 750ml', 20107, 1, 'Harpic Power Plus 750ml', 'Harpic Power Plus 750ml', 125.00, 0.00, 'public/images/20107003.png', NULL, NULL, 1, '2019-06-20 13:54:03', '2019-06-20 13:54:03'),
(20107004, 'Mr. Brasso Glass Cleaner Spary 350ml', 20107, 1, 'Mr. Brasso Glass & Household Cleaner Spary 350ml', 'Mr. Brasso Glass & Household Cleaner Spary 350ml', 125.00, NULL, 'public/images/20107004.png', NULL, NULL, 1, '2019-06-20 13:54:53', '2019-06-20 13:54:53'),
(20107005, 'Mr. Brasso Glass Cleaner Refill 350ml', 20107, 1, 'Mr. Brasso Glass & Household Cleaner Refill 350ml', 'Mr. Brasso Glass & Household Cleaner Refill 350ml', 100.00, NULL, 'public/images/20107005.png', NULL, NULL, 1, '2019-06-20 13:55:21', '2019-06-20 13:55:21'),
(20107006, 'Dish Washing Sponje majoni', 20107, 1, 'Dish Washing Sponje majoni', 'Dish Washing Sponje majoni', 0.00, 0.00, 'public/images/20107006.png', NULL, NULL, 0, '2019-06-20 13:56:11', '2019-06-20 13:56:11'),
(20107007, 'Dish Washing Stainless Steel majoni', 20107, 1, 'Dish washing Stainless Steel majoni', 'Dish washing Stainless Steel majoni', 0.00, 0.00, 'public/images/20107007.png', NULL, NULL, 0, '2019-06-20 13:56:50', '2019-06-20 13:56:50'),
(20107008, 'Flower Broom (Ful Jharu)', 20107, 1, 'Flower Broom (Ful Jharu)', 'Flower Broom (Ful Jharu)', 45.00, 0.00, 'public/images/20107008.png', NULL, NULL, 1, '2019-06-20 13:57:15', '2019-06-20 13:57:15'),
(20107009, 'Stick Broom (shola Jharu)', 20107, 1, 'Stick Broom (shola Jharu)', 'Stick Broom (shola Jharu)', 30.00, 0.00, 'public/images/20107009.png', NULL, NULL, 1, '2019-06-20 13:57:37', '2019-06-20 13:57:37'),
(20107010, 'Plastic Broom', 20107, 1, 'Plastic Broom', 'Plastic Broom', 95.00, 0.00, 'public/images/20107010.png', NULL, NULL, 1, '2019-06-20 13:58:03', '2019-06-20 13:58:03'),
(20107011, 'ACI Stainless Steel Majoni', 20107, 19, 'ACI Stainless Steel Majoni', 'ACI Stainless Steel Majoni', 0.00, 0.00, 'public/images/20107011.png', NULL, NULL, 0, '2019-06-20 13:58:37', '2019-06-20 13:58:37'),
(20107012, 'Cleaning Long Plastic Mop Brush', 20107, 1, 'Cleaning Long Plastic Mop Brush', 'Cleaning Long Plastic Mop Brush', 0.00, 0.00, 'public/images/20107012.png', NULL, NULL, 0, '2019-06-20 14:01:56', '2019-06-20 14:01:56'),
(20107013, 'Long handle China Brush', 20107, 1, 'Long handle China Brush', 'Long handle China Brush', 0.00, 0.00, 'public/images/20107013.png', NULL, NULL, 0, '2019-06-20 14:02:21', '2019-06-20 14:02:21'),
(20107014, 'Floor Magic Mop Wiper', 20107, 1, 'Floor Magic Mop Wiper', 'Floor Magic Mop Wiper', 0.00, 0.00, 'public/images/20107014.png', NULL, NULL, 0, '2019-06-20 14:02:46', '2019-06-20 14:02:46'),
(20107015, 'Floor Cleaning Wiper with Handle', 20107, 1, 'Floor Cleaning Wiper with Handle', 'Floor Cleaning Wiper with Handle', 130.00, 0.00, 'public/images/20107015.png', NULL, NULL, 1, '2019-06-20 14:03:31', '2019-06-20 14:03:31'),
(20107016, 'Floor Cleaning Mop Cotton', 20107, 1, 'Floor Cleaning Mop Cotton', 'Floor Cleaning Mop Cotton', 170.00, 0.00, 'public/images/20107016.png', NULL, NULL, 1, '2019-06-20 14:03:57', '2019-06-20 14:03:57'),
(20107017, 'Floor Cleaning Mop Refill', 20107, 1, 'Floor Cleaning Mop Refill', 'Floor Cleaning Mop Refill', 135.00, 0.00, 'public/images/20107017.png', NULL, NULL, 1, '2019-06-20 14:04:31', '2019-06-20 14:04:31'),
(20107018, 'Glass Cleaning Wiper', 20107, 1, 'Glass Cleaning Wiper', 'Glass Cleaning Wiper', 50.00, 0.00, 'public/images/20107018.png', NULL, NULL, 1, '2019-06-20 14:05:07', '2019-06-20 14:05:07'),
(20107019, 'RFL Toilet Brush', 20107, 1, 'RFL Toilet Brush', 'RFL Toilet Brush', 75.00, 0.00, 'public/images/20107019.png', NULL, NULL, 1, '2019-06-20 14:05:36', '2019-06-20 14:05:36'),
(20107020, 'Plastic Toilet Brush', 20107, 1, 'Plastic Toilet Brush', 'Plastic Toilet Brush', 65.00, 0.00, 'public/images/20107020.png', NULL, NULL, 1, '2019-06-20 14:06:13', '2019-06-20 14:06:13'),
(20107021, 'Toilet Brush Local', 20107, 1, 'Toilet Brush Local', 'Toilet Brush Local', 65.00, 0.00, 'public/images/20107021.png', NULL, NULL, 1, '2019-06-20 14:06:46', '2019-06-20 14:06:46'),
(20107022, 'Toilet Brush with Box', 20107, 1, 'Toilet Brush with Box', 'Toilet Brush with Box', 130.00, 0.00, 'public/images/20107022.png', NULL, NULL, 1, '2019-06-20 14:07:18', '2019-06-20 14:07:18'),
(20107023, 'Toilet Brush with Box Refill', 20107, 1, 'Toilet Brush with Box Refill', 'Toilet Brush with Box Refill', 65.00, 0.00, 'public/images/20107023.png', NULL, NULL, 1, '2019-06-20 14:07:40', '2019-06-20 14:07:40'),
(20107024, 'Plastic Hand Brush', 20107, 1, 'Plastic Hand Brush', 'Plastic Hand Brush', 45.00, 0.00, 'public/images/20107024.png', NULL, NULL, 1, '2019-06-20 14:08:03', '2019-06-20 14:08:03'),
(20107025, 'Dust Pan RFL', 20107, 1, 'Dust Pan RFL', 'Dust Pan RFL', 35.00, 0.00, 'public/images/20107025.png', NULL, NULL, 1, '2019-06-20 14:08:29', '2019-06-20 14:08:29'),
(20107026, 'Dust Pan Local', 20107, 1, 'Dust Pan Local', 'Dust Pan Local', 30.00, 0.00, 'public/images/20107026.png', NULL, NULL, 1, '2019-06-20 14:09:02', '2019-06-20 14:09:02'),
(20107027, 'Dust Keeping Busket RFL', 20107, 1, 'Dust Keeping Busket RFL', 'Dust Keeping Busket RFL', 75.00, NULL, 'public/images/20107027.png', NULL, NULL, 1, '2019-06-20 14:09:26', '2019-06-20 14:09:26'),
(20107028, 'Dust Keeping Busket Local', 20107, 1, 'Dust Keeping Busket Local', 'Dust Keeping Busket Local', 60.00, NULL, 'public/images/20107028.png', NULL, NULL, 1, '2019-06-20 14:10:01', '2019-06-20 14:10:01'),
(20107029, 'Dust Keeping Busket Steel', 20107, 1, 'Dust Keeping Busket Steel', 'Dust Keeping Busket Steel', 0.00, 0.00, 'public/images/20107029.png', NULL, NULL, 0, '2019-06-20 14:10:28', '2019-06-20 14:10:28'),
(30101001, 'Ispahani Mirzapore Tea,400gm Pack', 30101, 1, 'Ispahani Mirzapore Tea,400gm Pack', 'Ispahani Mirzapore Tea,400gm Pack', 210.00, 0.00, 'public/images/30101001.png', NULL, NULL, 1, '2019-06-18 16:50:34', '2019-06-18 16:50:34'),
(30101002, 'Ispahani Mirzapore Tea,200gm Pack', 30101, 1, 'Ispahani Mirzapore Tea,200gm Pack', 'Ispahani Mirzapore Tea,200gm Pack', 105.00, 0.00, 'public/images/30101002.png', NULL, NULL, 1, '2019-06-18 16:51:01', '2019-06-18 16:51:01'),
(30101003, 'Ispahani Mirzapore Tea,400gm Pack,Red Dust', 30101, 1, 'Ispahani Mirzapore Tea,400gm Pack,Red Dust', 'Ispahani Mirzapore Tea,400gm Pack,Red Dust', 0.00, 0.00, 'public/images/30101003.png', NULL, NULL, 0, '2019-06-18 16:51:31', '2019-06-18 16:51:31'),
(30101004, 'Ispahani Mirzapore Tea Bags, Pack of 50', 30101, 1, 'Ispahani Mirzapore Tea Bags, Pack of 50', 'Ispahani Mirzapore Tea Bags, Pack of 50', 85.00, 0.00, 'public/images/30101004.png', NULL, NULL, 1, '2019-06-18 16:51:55', '2019-06-18 16:51:55'),
(30101005, 'Taaza Tea Bag', 30101, 1, 'Taaza Tea Bag', 'Taaza Tea Bag', 85.00, 0.00, 'public/images/30101005.png', NULL, NULL, 1, '2019-06-18 16:52:22', '2019-06-18 16:52:22'),
(30101006, 'Sylon Tea Bag', 30101, 1, 'Sylon Tea Bag', 'Sylon Tea Bag', 80.00, 0.00, 'public/images/30101006.png', NULL, NULL, 1, '2019-06-18 16:52:47', '2019-06-18 16:52:47'),
(30101007, 'Sylon Tea Pack,200mg', 30101, 1, 'Sylon Tea Pack,200mg', 'Sylon Tea Pack,200mg', 100.00, 0.00, 'public/images/30101007.png', NULL, NULL, 1, '2019-06-18 16:53:15', '2019-06-18 16:53:15'),
(30101008, 'Sylon Tea Pack,400mg', 30101, 1, 'Sylon Tea Pack,400mg', 'Sylon Tea Pack,400mg', 205.00, 0.00, 'public/images/30101008.png', NULL, NULL, 1, '2019-06-18 16:53:50', '2019-06-18 16:53:50'),
(30101009, 'Finlay Green Tea', 30101, 1, 'Finlay Green Tea', 'Finlay Green Tea', 100.00, 0.00, 'public/images/30101009.png', NULL, NULL, 1, '2019-06-18 16:54:24', '2019-06-18 16:54:24'),
(30101010, 'Kazi & Kazi Green Tea', 30101, 1, 'Kazi & Kazi Green Tea', 'Kazi & Kazi Green Tea', 105.00, 0.00, 'public/images/30101010.png', NULL, NULL, 1, '2019-06-18 16:54:46', '2019-06-18 16:54:46'),
(30101011, 'Nescafe Instant Coffee,200gm Jar', 30101, 1, 'Nescafe Instant Coffee,200gm Jar', 'Nescafe Instant Coffee,200gm Jar', 580.00, 0.00, 'public/images/30101011.png', NULL, NULL, 1, '2019-06-18 16:55:12', '2019-06-18 16:55:12'),
(30101012, 'Nescafe 3 in 1 Coffee Mix,15gm Pack', 30101, 1, 'Nescafe 3 in 1 Coffee Mix,15gm Pack', 'Nescafe 3 in 1 Coffee Mix,15gm Pack', 10.00, 0.00, 'public/images/30101012.png', NULL, NULL, 1, '2019-06-18 16:55:38', '2019-06-18 16:55:38'),
(30102001, 'Fresh Milk Powder,400gm Pack', 30102, 1, 'Fresh Milk Powder,400gm Pack', 'Fresh Milk Powder,400gm Pack', 205.00, 0.00, 'public/images/30102001.png', NULL, NULL, 1, '2019-06-18 16:56:33', '2019-06-18 16:56:33'),
(30102002, 'Fresh Milk Powder,500gm Pack', 30102, 6, 'Fresh Milk Powder,500gm Pack', 'Fresh Milk Powder,500gm Pack', 230.00, 0.00, 'public/images/30102002.png', NULL, NULL, 1, '2019-06-18 16:57:03', '2019-06-18 16:57:03'),
(30102003, 'Fresh Milk Powder,1kg Pack', 30102, 1, 'Fresh Milk Powder,1kg Pack', 'Fresh Milk Powder,1kg Pack', 450.00, 0.00, 'public/images/30102003.png', NULL, NULL, 1, '2019-06-18 16:57:34', '2019-06-18 16:57:34'),
(30102004, 'Marks Milk Powder, 500gm Pack', 30102, 1, 'Marks Milk Powder, 500gm Pack', 'Marks Milk Powder, 500gm Pack', 260.00, 0.00, 'public/images/30102004.png', NULL, NULL, 1, '2019-06-18 16:57:57', '2019-06-18 16:57:57'),
(30102005, 'Marks Milk Powder, 400gm Pack', 30102, 1, 'Marks Milk Powder, 400gm Pack', 'Marks Milk Powder, 400gm Pack', 210.00, 0.00, 'public/images/30102005.png', NULL, NULL, 1, '2019-06-18 16:58:18', '2019-06-18 16:58:18'),
(30102006, 'Starship Condensed Milk', 30102, 1, 'Starship Condensed Milk', 'Starship Condensed Milk', 50.00, 0.00, 'public/images/30102006.png', NULL, NULL, 1, '2019-06-18 16:58:45', '2019-06-18 16:58:45'),
(30102007, 'Denish Condensed Milk', 30102, 1, 'Denish Condensed Milk', 'Denish Condensed Milk', 50.00, 0.00, 'public/images/30102007.png', NULL, NULL, 1, '2019-06-18 16:59:09', '2019-06-18 16:59:09'),
(30102008, 'No 1 Condensed Milk', 30102, 1, 'No 1 Condensed Milk', 'No 1 Condensed Milk', 48.00, 0.00, 'public/images/30102008.png', NULL, NULL, 1, '2019-06-18 16:59:31', '2019-06-18 16:59:31'),
(30102009, 'Fresh Refined Sugar, 1kg', 30102, 6, 'Fresh Refined Sugar, 1kg', 'Fresh Refined Sugar, 1kg', 60.00, 0.00, 'public/images/30102009.png', NULL, NULL, 1, '2019-06-18 17:00:04', '2019-06-18 17:00:04'),
(30102010, 'Teer Sugar,1kg', 30102, 1, 'Teer Sugar,1kg', 'Teer Sugar,1kg', 60.00, 0.00, 'public/images/30102010.png', NULL, NULL, 1, '2019-06-18 17:00:28', '2019-06-18 17:00:28'),
(30102011, 'ACI Pure Sugar,1kg', 30102, 1, 'ACI Pure Sugar,1kg', 'ACI Pure Sugar,1kg', 60.00, 0.00, 'public/images/30102011.png', NULL, NULL, 1, '2019-06-18 17:00:52', '2019-06-18 17:00:52'),
(30103001, 'Olympic Energy Plus Biscuits,80gm', 30103, 1, 'Olympic Energy Plus Biscuits,80gm', 'Olympic Energy Plus Biscuits,80gm', 13.00, 0.00, 'public/images/30103001.png', NULL, NULL, 1, '2019-06-18 17:01:39', '2019-06-18 17:01:39'),
(30103002, 'Olympic Crack Jack Biscuits,70gm', 30103, 1, 'Olympic Crack Jack Biscuits,70gm', 'Olympic Crack Jack Biscuits,70gm', 0.00, 0.00, 'public/images/30103002.png', NULL, NULL, 0, '2019-06-18 17:01:59', '2019-06-18 17:01:59'),
(30103003, 'Olympic Lexus Biscuits,240gm, Pack of 12', 30103, 1, 'Olympic Lexus Biscuits,240gm, Pack of 12', 'Olympic Lexus Biscuits,240gm, Pack of 12', 70.00, 0.00, 'public/images/30103003.png', NULL, NULL, 1, '2019-06-18 17:02:22', '2019-06-18 17:02:22'),
(30103004, 'Haque Digestive Biscuits,150gm', 30103, 1, 'Haque Digestive Biscuits,150gm', 'Haque Digestive Biscuits,150gm', 35.00, 0.00, 'public/images/30103004.png', NULL, NULL, 1, '2019-06-18 17:02:45', '2019-06-18 17:02:45'),
(30103005, 'Kishwan Horlicks Biscuits,350gm', 30103, 1, 'Kishwan Horlicks Biscuits,350gm', 'Kishwan Horlicks Biscuits,350gm', 55.00, 0.00, 'public/images/30103005.png', NULL, NULL, 1, '2019-06-18 17:03:19', '2019-06-18 17:03:19'),
(30103006, 'Fruit Fun Pineapple Cream Biscuits', 30103, 1, 'Fruit Fun Pineapple Cream Biscuits', 'Fruit Fun Pineapple Cream Biscuits', 5.00, NULL, 'public/images/30103006.png', NULL, NULL, 1, '2019-06-18 17:03:46', '2019-06-18 17:03:46'),
(30103007, 'Champion Chocolate Coated Biscuits', 30103, 1, 'Champion Chocolate Coated Biscuits', 'Champion Chocolate Coated Biscuits', 15.00, 0.00, 'public/images/30103007.png', NULL, NULL, 1, '2019-06-18 17:04:16', '2019-06-18 17:04:16'),
(30103008, 'Delight Toast Biscuits, 250gm', 30103, 1, 'Delight Toast Biscuits, 250gm', 'Delight Toast Biscuits, 250gm', 0.00, 0.00, 'public/images/30103008.png', NULL, NULL, 0, '2019-06-18 17:04:37', '2019-06-18 17:04:37'),
(30103009, 'Denish Lexus Biscuits', 30103, 1, 'Denish Lexus Biscuits', 'Denish Lexus Biscuits', 70.00, 0.00, 'public/images/30103009.png', NULL, NULL, 1, '2019-06-18 17:05:07', '2019-06-18 17:05:07'),
(30103010, 'Ruchi BBQ Chanachur', 30103, 1, 'Ruchi BBQ Chanachur', 'Ruchi BBQ Chanachur', 65.00, 0.00, 'public/images/30103010.png', NULL, NULL, 1, '2019-06-18 17:05:30', '2019-06-18 17:05:30'),
(30103011, 'Ruchi Jhal Chanachur', 30103, 1, 'Ruchi Jhal Chanachur', 'Ruchi Jhal Chanachur', 65.00, 0.00, 'public/images/30103011.png', NULL, NULL, 1, '2019-06-18 17:05:59', '2019-06-18 17:05:59'),
(30103012, 'BD Chanachur', 30103, 1, 'BD Chanachur', 'BD Chanachur', 60.00, 0.00, 'public/images/30103012.png', NULL, NULL, 1, '2019-06-18 17:06:20', '2019-06-18 17:06:20'),
(30104001, 'Food Box Medium,50Pcs', 30104, 1, 'Food Box Medium,50Pcs', 'Food Box Medium,50Pcs', 210.00, 0.00, 'public/images/30104001.png', NULL, NULL, 1, '2019-07-15 09:20:27', '2019-07-15 09:20:27'),
(30104002, 'Nascafee Tea Cup,50Pcs', 30104, 1, 'Nascafee Tea Cup,50Pcs', 'Nascafee Tea Cup,50Pcs', 65.00, 0.00, 'public/images/30104002.png', NULL, NULL, 1, '2019-07-15 09:20:56', '2019-07-15 09:20:56'),
(30104003, 'One Time Plate Big,50Pcs', 30104, 1, 'One Time Plate Big,50Pcs', 'One Time Plate Big,50Pcs', 200.00, 0.00, 'public/images/30104003.png', NULL, NULL, 1, '2019-07-15 09:21:33', '2019-07-15 09:21:33'),
(30104004, 'One Time Plate Small,50Pcs', 30104, 1, 'One Time Plate Small,50Pcs', 'One Time Plate Small,50Pcs', 150.00, 0.00, 'public/images/30104004.png', NULL, NULL, 1, '2019-07-15 09:21:59', '2019-07-15 09:21:59'),
(30104005, 'One Time Glass Big,50Pcs', 30104, 1, 'One Time Glass Big,50Pcs', 'One Time Glass Big,50Pcs', 60.00, 0.00, 'public/images/30104005.png', NULL, NULL, 1, '2019-07-15 09:22:35', '2019-07-15 09:22:35'),
(30104006, 'One Time Glass Small,50Pcs', 30104, 1, 'One Time Glass Small,50Pcs', 'One Time Glass Small,50Pcs', 40.00, 0.00, 'public/images/30104006.png', NULL, NULL, 1, '2019-07-15 09:23:13', '2019-07-15 09:23:13'),
(30104007, 'One Time Tea Cup,50Pcs', 30104, 1, 'One Time Tea Cup,50Pcs', 'One Time Tea Cup,50Pcs', 35.00, 0.00, 'public/images/30104007.png', NULL, NULL, 1, '2019-07-15 09:23:37', '2019-07-15 09:23:37'),
(30105001, 'Turkey Water Glass 6Pcs', 30105, 1, 'Turkey Water Glass 6Pcs', 'Turkey Water Glass 6Pcs', 960.00, 0.00, 'public/images/30105001.png', NULL, NULL, 1, '2019-07-15 08:43:22', '2019-07-15 08:43:22'),
(30105002, 'Water Glass China 1010, 6Pcs', 30105, 1, 'Water Glass China 1010, 6Pcs', 'Water Glass China 1010, 6Pcs', 350.00, 0.00, 'public/images/30105002.png', NULL, NULL, 1, '2019-07-15 08:43:49', '2019-07-15 08:43:49'),
(30105003, 'Water Glass China, 6Pcs', 30105, 1, 'Water Glass China, 6Pcs', 'Water Glass China, 6Pcs', 430.00, 0.00, 'public/images/30105003.png', NULL, NULL, 1, '2019-07-15 08:45:02', '2019-07-15 08:45:02'),
(30105004, 'Prothik Square Cup, 6Pcs', 30105, 1, 'Prothik Square Cup, 6Pcs', 'Prothik Square Cup, 6Pcs', 1120.00, 0.00, 'public/images/30105004.png', NULL, NULL, 1, '2019-07-15 08:45:30', '2019-07-15 08:45:30'),
(30105005, 'Coffee Mug Big Size, 1Pcs', 30105, 1, 'Coffee Mug Big Size, 1Pcs', 'Coffee Mug Big Size, 1Pcs', 95.00, 0.00, 'public/images/30105005.png', NULL, NULL, 1, '2019-07-15 08:45:57', '2019-07-15 08:45:57'),
(30105006, 'Coffee Mug Small Size, 1Pcs', 30105, 1, 'Coffee Mug Small Size, 1Pcs', 'Coffee Mug Small Size, 1Pcs', 90.00, 0.00, 'public/images/30105006.png', NULL, NULL, 1, '2019-07-15 08:46:26', '2019-07-15 08:46:26'),
(30105007, 'Coffee Mug, 1Pcs', 30105, 1, 'Coffee Mug, 1Pcs', 'Coffee Mug, 1Pcs', 80.00, 0.00, 'public/images/30105007.png', NULL, NULL, 1, '2019-07-15 08:47:04', '2019-07-15 08:47:04'),
(30105008, 'Coffee Mug, 1Pcs', 30105, 1, 'Coffee Mug, 1Pcs', 'Coffee Mug, 1Pcs', 130.00, 0.00, 'public/images/30105008.png', NULL, NULL, 1, '2019-07-15 08:47:32', '2019-07-15 08:47:32'),
(30105009, 'Ocean Jug, 1Pcs', 30105, 1, 'Ocean Jug, 1Pcs', 'Ocean Jug, 1Pcs', 900.00, 0.00, 'public/images/30105009.png', NULL, NULL, 1, '2019-07-15 08:47:58', '2019-07-15 08:47:58'),
(30105010, 'China Jug, 1Pcs', 30105, 1, 'China Jug, 1Pcs', 'China Jug, 1Pcs', 450.00, 0.00, 'public/images/30105010.png', NULL, NULL, 1, '2019-07-15 08:48:21', '2019-07-15 08:48:21'),
(30105011, 'RFL Square Jug,1Pcs', 30105, 12, 'RFL Square Jug,1Pcs', 'RFL Square Jug,1Pcs', 180.00, 0.00, 'public/images/30105011.png', NULL, NULL, 1, '2019-07-15 08:49:22', '2019-07-15 08:49:22'),
(30105012, 'Prothik Snacks Plate, 6Pcs', 30105, 1, 'Prothik Snacks Plate, 6Pcs', 'Prothik Snacks Plate, 6Pcs', 590.00, 0.00, 'public/images/30105012.png', NULL, NULL, 1, '2019-07-15 08:49:53', '2019-07-15 08:49:53'),
(30105013, 'Prothik Rice Plate,6Pcs', 30105, 1, 'Prothik Rice Plate,6Pcs', 'Prothik Rice Plate,6Pcs', 980.00, 0.00, 'public/images/30105013.png', NULL, NULL, 1, '2019-07-15 08:50:22', '2019-07-15 08:50:22'),
(30105014, 'Ariane Snacks Plate,6Pcs', 30105, 1, 'Ariane Snacks Plate,6Pcs', 'Ariane Snacks Plate,6Pcs', 620.00, 0.00, 'public/images/30105014.png', NULL, NULL, 1, '2019-07-15 08:50:53', '2019-07-15 08:50:53'),
(30105015, 'Ariane Rice Plate,6Pcs', 30105, 1, 'Ariane Rice Plate,6Pcs', 'Ariane Rice Plate,6Pcs', 1020.00, 0.00, 'public/images/30105015.png', NULL, NULL, 1, '2019-07-15 08:51:26', '2019-07-15 08:51:26'),
(30105016, 'Ariane Square Snacks Plate,6Pcs', 30105, 1, 'Ariane Square Snacks Plate,6Pcs', 'Ariane Square Snacks Plate,6Pcs', 820.00, 0.00, 'public/images/30105016.png', NULL, NULL, 1, '2019-07-15 08:52:06', '2019-07-15 08:52:06'),
(30105017, 'Ariane Snacks Plate,6Pcs', 30105, 1, 'Ariane Snacks Plate,6Pcs', 'Ariane Snacks Plate,6Pcs', 430.00, 0.00, 'public/images/30105017.png', NULL, NULL, 1, '2019-07-15 08:52:45', '2019-07-15 08:52:45'),
(30105018, 'Prothik Snacks Plate, 6Pcs', 30105, 1, 'Prothik Snacks Plate, 6Pcs', 'Prothik Snacks Plate, 6Pcs', 490.00, 0.00, 'public/images/30105018.png', NULL, NULL, 1, '2019-07-15 08:53:30', '2019-07-15 08:53:30'),
(30105019, 'Tissue Stand', 30105, 1, 'Tissue Stand', 'Tissue Stand', 180.00, 0.00, 'public/images/30105019.png', NULL, NULL, 1, '2019-07-15 08:54:06', '2019-07-15 08:54:06'),
(30105020, 'Tea Spoon,1Set', 30105, 1, 'Tea Spoon,1Set\r\nTea Spoon,1Set', 'Tea Spoon,1Set', 155.00, 0.00, 'public/images/30105020.png', NULL, NULL, 1, '2019-07-15 08:54:49', '2019-07-15 08:54:49'),
(30105021, 'Tea Spoon China,1Set', 30105, 1, 'Tea Spoon China,1Set', 'Tea Spoon China,1Set', 160.00, 0.00, 'public/images/30105021.png', NULL, NULL, 1, '2019-07-15 08:55:29', '2019-07-15 08:55:29');
INSERT INTO `tbl_product` (`product_id`, `product_name`, `sub_category_id`, `brand_id`, `product_short_description`, `product_long_description`, `product_price`, `offer`, `product_picture`, `product_size`, `product_color`, `publication_status`, `created_at`, `updated_at`) VALUES
(30105022, 'Cutting Board Small', 30105, 1, 'Cutting Board Small', 'Cutting Board Small', 180.00, 0.00, 'public/images/30105022.png', NULL, NULL, 1, '2019-07-15 08:56:17', '2019-07-15 08:56:17'),
(30105023, 'Cutting Board Medium', 30105, 1, 'Cutting Board Medium', 'Cutting Board Medium', 270.00, 0.00, 'public/images/30105023.png', NULL, NULL, 1, '2019-07-15 08:56:48', '2019-07-15 08:56:48'),
(30105024, 'Cutting Board Big', 30105, 1, 'Cutting Board Big', 'Cutting Board Big', 360.00, 0.00, 'public/images/30105024.png', NULL, NULL, 1, '2019-07-15 08:57:20', '2019-07-15 08:57:20'),
(30105025, 'Ariane Square Rice Plae,6Pcs', 30105, 1, 'Ariane Square Rice Plae,6Pcs', 'Ariane Square Rice Plae,6Pcs', 1290.00, 0.00, 'public/images/30105025.png', NULL, NULL, 1, '2019-07-15 08:57:50', '2019-07-15 08:57:50'),
(30105026, 'Ariane Rice Plate,6Pcs', 30105, 1, 'Ariane Rice Plate,6Pcs', 'Ariane Rice Plate,6Pcs', 1400.00, 0.00, 'public/images/30105026.png', NULL, NULL, 1, '2019-07-15 08:58:39', '2019-07-15 08:58:39'),
(30105027, 'Munno Mug,1Pcs', 30105, 1, 'Munno Mug,1Pcs', 'Munno Mug,1Pcs', 220.00, 0.00, 'public/images/30105027.png', NULL, NULL, 1, '2019-07-15 08:59:10', '2019-07-15 08:59:10'),
(30105028, 'Ariane Can Cup PL,6Pcs', 30105, 1, 'Ariane Can Cup PL,6Pcs', 'Ariane Can Cup PL,6Pcs', 900.00, 0.00, 'public/images/30105028.png', NULL, NULL, 1, '2019-07-15 08:59:45', '2019-07-15 08:59:45'),
(30105029, 'Ariane Can Cup GL,6Pcs', 30105, 1, 'Ariane Can Cup GL,6Pcs', 'Ariane Can Cup GL,6Pcs', 920.00, 0.00, 'public/images/30105029.png', NULL, NULL, 1, '2019-07-15 09:00:16', '2019-07-15 09:00:16'),
(30105030, 'Ariane Mit Cup,6Pcs', 30105, 1, 'Ariane Mit Cup,6Pcs', 'Ariane Mit Cup,6Pcs', 920.00, 0.00, 'public/images/30105030.png', NULL, NULL, 1, '2019-07-15 09:00:55', '2019-07-15 09:00:55'),
(30105031, 'Prothik Mit Cup PL,6Pcs', 30105, 1, 'Prothik Mit Cup PL,6Pcs', 'Prothik Mit Cup PL,6Pcs', 800.00, 0.00, 'public/images/30105031.png', NULL, NULL, 1, '2019-07-15 09:01:32', '2019-07-15 09:01:32'),
(30105032, 'Prothik Mit Cup Small,6Pcs', 30105, 1, 'Prothik Mit Cup Small,6Pcs', 'Prothik Mit Cup Small,6Pcs', 700.00, 0.00, 'public/images/30105032.png', NULL, NULL, 1, '2019-07-15 09:01:55', '2019-07-15 09:01:55'),
(30105033, 'Prothik Square Cup PL,6Pcs', 30105, 1, 'Prothik Square Cup PL,6Pcs', 'Prothik Square Cup PL,6Pcs', 1020.00, 0.00, 'public/images/30105033.png', NULL, NULL, 1, '2019-07-15 09:14:36', '2019-07-15 09:14:36'),
(30105034, 'YUJING China Cup,6Pcs', 30105, 1, 'YUJING China Cup,6Pcs', 'YUJING China Cup,6Pcs', 680.00, 0.00, 'public/images/30105034.png', NULL, NULL, 1, '2019-07-15 09:15:11', '2019-07-15 09:15:11'),
(30105035, 'Kacer Cup Set,6Pcs', 30105, 1, 'Kacer Cup Set,6Pcs', 'Kacer Cup Set,6Pcs', 570.00, 0.00, 'public/images/30105035.png', NULL, NULL, 1, '2019-07-15 09:15:56', '2019-07-15 09:15:56'),
(30105036, 'YUJING Glass 5010,6Pcs', 30105, 1, 'YUJING Glass 5010,6Pcs', 'YUJING Glass 5010,6Pcs', 490.00, 0.00, 'public/images/30105036.png', NULL, NULL, 1, '2019-07-15 09:16:33', '2019-07-15 09:16:33'),
(30105037, 'Ariane Mug,1Pcs', 30105, 1, 'Ariane Mug,1Pcs', 'Ariane Mug,1Pcs', 170.00, 0.00, 'public/images/30105037.png', NULL, NULL, 1, '2019-07-15 09:17:16', '2019-07-15 09:17:16'),
(30105038, 'Thai Knife 78', 30105, 1, 'Thai Knife 78', 'Thai Knife 78', 130.00, 0.00, 'public/images/30105038.png', NULL, NULL, 1, '2019-07-15 09:17:46', '2019-07-15 09:17:46'),
(30105039, 'Thai Knife 75', 30105, 1, 'Thai Knife 75', 'Thai Knife 75', 110.00, 0.00, 'public/images/30105039.png', NULL, NULL, 1, '2019-07-15 09:18:17', '2019-07-15 09:18:17'),
(30105040, 'Thai Knife 74', 30105, 1, 'Thai Knife 74', 'Thai Knife 74', 95.00, 0.00, 'public/images/30105040.png', NULL, NULL, 1, '2019-07-15 09:18:52', '2019-07-15 09:18:52'),
(40101001, 'Pen with Box', 40101, 1, 'Pen with Box', 'Pen with Box', 525.00, NULL, 'public/images/40101001.jpg', NULL, NULL, 1, '2019-07-15 09:25:23', '2019-07-15 09:25:23'),
(40101002, 'Pen without Box', 40101, 1, 'Pen without Box', 'Pen without Box', 425.00, 0.00, 'public/images/40101002.png', NULL, NULL, 1, '2019-07-15 09:27:10', '2019-07-15 09:27:10'),
(40101003, 'Wood Box Pen', 40101, 1, 'Wood Box Pen', 'Wood Box Pen', 240.00, NULL, 'public/images/40101003.jpg', NULL, NULL, 1, '2019-07-15 09:27:35', '2019-07-15 09:27:35'),
(40101004, 'Plastic Box Pen', 40101, 1, 'Plastic Box Pen', 'Plastic Box Pen', 140.00, NULL, 'public/images/40101004.jpg', NULL, NULL, 1, '2019-07-15 09:28:01', '2019-07-15 09:28:01'),
(40101005, 'Pen without Box', 40101, 1, 'Pen without Box', 'Pen without Box', 120.00, NULL, 'public/images/40101005.jpg', NULL, NULL, 1, '2019-07-15 09:28:40', '2019-07-15 09:28:40'),
(40101006, 'Box Pen Blue', 40101, 1, 'Box Pen Blue', 'Box Pen Blue', 410.00, NULL, 'public/images/40101006.jpg', NULL, NULL, 1, '2019-07-15 09:29:12', '2019-07-15 09:29:12'),
(40101007, 'Wood Box Pen', 40101, 1, 'Wood Box Pen', 'Wood Box Pen', 170.00, NULL, 'public/images/40101007.jpg', NULL, NULL, 1, '2019-07-15 09:30:09', '2019-07-15 09:30:09'),
(40101008, 'Wood Box Pen', 40101, 1, 'Wood Box Pen', 'Wood Box Pen', 150.00, 0.00, 'public/images/40101008.png', NULL, NULL, 1, '2019-07-15 09:30:46', '2019-07-15 09:30:46'),
(40101009, 'Plastic Box Pen', 40101, 1, 'Plastic Box Pen', 'Plastic Box Pen', 160.00, 0.00, 'public/images/40101009.png', NULL, NULL, 1, '2019-07-15 09:31:19', '2019-07-15 09:31:19'),
(40101010, 'Pen without Box', 40101, 1, 'Pen without Box', 'Pen without Box', 120.00, NULL, 'public/images/40101010.jpg', NULL, NULL, 1, '2019-07-15 09:31:48', '2019-07-15 09:31:48'),
(40102001, 'Sports Medal', 40102, 1, '+880 1623 549 361', '+880 1623 549 361', 0.00, NULL, 'public/images/40102001.jpg', NULL, NULL, 0, '2019-07-27 12:04:18', '2019-07-27 12:04:18'),
(40102002, 'Sports Medal 2', 40102, 1, '+880 1623 549 361', '+880 1623 549 361', 100.00, NULL, 'public/images/40102002.jpg', NULL, NULL, 1, '2019-07-27 12:05:24', '2019-07-27 12:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_mobile`, `shipping_email`, `shipping_status`, `created_at`, `updated_at`) VALUES
(1, 'Ali Hossain', '1401, Chowdhury Villa, Chittagong', '01737859493', 'alihossain.csecu@gmail.com', 1, NULL, NULL),
(2, 'Kamal', '101, Chandgaon RA, Chittagong', '01822272575', 'kamal.csecu@gmail.com', 1, NULL, NULL),
(3, 'AnisulIslam', '101, Chandgaon RA, Chittagong', '01822272575', 'anis@gmail.com', 0, NULL, NULL),
(4, 'AnisulIslam', '101, Chandgaon RA, Chittagong', '01737859493', 'alihossain.csecu@gmail.com', 1, NULL, NULL),
(5, 'Ali Hossain', '101, Chandgaon RA, Chittagong', '01737859493', 'alihossain.csecu@gmail.com', 1, NULL, NULL),
(6, 'AnisulIslam', '101, Chandgaon RA, Chittagong', '01822272575', 'anis@gmail.com', 0, NULL, NULL),
(7, 'AnisulIslam', '101, Chandgaon RA, Chittagong', '01822272575', 'alihossain.csecu@gmail.com', 0, NULL, NULL),
(8, 'Ali Hossain', '101, Chandgaon RA, Chittagong', '01822272575', 'alihossain.csecu@gmail.com', 0, NULL, NULL),
(9, 'Rehana Akter', 'Noakhali Govt. College', '0183345664693', 'rehana@yahoo.com', 0, NULL, NULL),
(10, 'Rehana Akter', 'Noakhali Govt. College', '01833454693', 'rehana@yahoo.com', 0, NULL, NULL),
(11, 'AnisulIslam', '101, Chandgaon RA, Chittagong', '01822272575', 'alihossain.csecu@gmail.com', 0, NULL, NULL),
(12, 'Ali Hossain', '101, Chandgaon RA, Chittagong', '01822272575', 'alihossain.csecu@gmail.com', 0, NULL, NULL),
(13, 'Rehana Akter', 'Noakhali Govt. College', '01833454693', 'rehana@yahoo.com', 1, NULL, NULL),
(14, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(15, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 1, NULL, NULL),
(16, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(17, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(18, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(19, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(20, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(21, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(22, 'Abduzzabbar', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(23, 'Abduzzabbar', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(24, 'Rabbi', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(25, 'Rabbi', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(26, 'Rabbi', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(27, 'Rabbi', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 1, NULL, NULL),
(28, 'Ringku', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(29, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 1, NULL, NULL),
(30, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(31, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(32, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(33, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(34, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(35, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(36, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(37, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(38, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(39, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(40, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(41, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(42, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(43, 'Rabbi', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, NULL, NULL),
(44, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(45, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(46, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(47, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(48, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(49, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(50, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(51, 'Abul Kalam', '2no gate, Kalurghat', '0172883733', 'abulkalam@gmail.com', 0, NULL, NULL),
(52, 'Abul Kalam', '2no gate, Kalurghat', '01913232257', 'abulkalam@gmail.com', 1, NULL, NULL),
(53, 'Shagor Barua', 'CU Area, Chittagong', '018182313', 'sagarbarua@gmail.com', 0, NULL, NULL),
(54, 'Shagor Barua', '2no gate, Kalurghat', '01913232299', 'sagarbarua@gmail.com', 0, NULL, NULL),
(55, 'Afsarul Amin', 'Chandgaon, Chittagong', '0183747674664', 'afsar@yahoo.com', 1, '2019-03-10 12:39:50', '2019-03-10 12:39:50'),
(56, 'Afsarul Amin', 'Chandgaon, Chittagong', '0183747674664', 'afsar@yahoo.com', 0, '2019-03-10 12:41:31', '2019-03-10 12:41:31'),
(57, 'Shahab Uddin', 'Noakhali, Chittagong', '0173998834', 'shahabUdiin@gmail.com', 0, '2019-03-11 09:47:30', '2019-03-11 09:47:30'),
(58, 'Abul Kalam', '2no gate, Kalurghat', '01913232299', 'abulkalam@gmail.com', 0, '2019-03-15 08:02:31', '2019-03-15 08:02:31'),
(59, 'Shagor Barua', 'Chandgaon, Chittagong', '01913232299', 'sagarbarua@gmail.com', 0, '2019-03-17 06:11:24', '2019-03-17 06:11:24'),
(60, 'Sabbir', 'South Campus, CU', '0172883733', 'sabbir@yahoo.com', 0, '2019-03-19 18:01:22', '2019-03-19 18:01:22'),
(61, 'Rafid Anwar', 'Agrabad, Chittagong', '01733345556', 'rafid.anwar@yahoo.com', 0, '2019-03-22 06:41:06', '2019-03-22 06:41:06'),
(62, 'Abdur Rahaman', 'Chandgaon, Chittagong', '0183747674664', 'arahaman@yahoo.com', 0, '2019-03-22 17:38:58', '2019-03-22 17:38:58'),
(63, 'Shagor Barua', 'Chawkbazar, Ctg', '01913232299', 'ringku_ctg@yahoo.com', 0, '2019-04-02 11:06:10', '2019-04-02 11:06:10'),
(64, 'csc', 'lalnxnad', '01812818444', 'xlnanxa@hhddd.ddd', 0, '2019-04-02 18:08:30', '2019-04-02 18:08:30'),
(65, 'csc', 'lalnxnad', '01812818444', 'xlnanxa@hhddd.ddd', 0, '2019-04-04 06:09:35', '2019-04-04 06:09:35'),
(66, 'Rabbi', 'Chawkbazar, Ctg', '01913232257', 'ringku_ctg@yahoo.com', 0, '2019-04-08 07:24:45', '2019-04-08 07:24:45'),
(67, 'Shammi', 'Chawkbazar, Ctg', '01913232299', 'shammi@yahoo.com', 0, '2019-04-24 09:55:26', '2019-04-24 09:55:26'),
(68, 'Yasin Ahmed', '112, Dhaka College', '01882737773', 'yasin@yahoo.com', 0, '2019-05-14 09:27:44', '2019-05-14 09:27:44'),
(69, 'Abul Kalam', '2no gate, Kalurghat', '01913232257', 'abulkalam@gmail.com', 0, '2019-05-18 05:02:56', '2019-05-18 05:02:56'),
(70, 'Ali Hasan', 'Chandgaon, Chittagong', '01882828233131', 'alihasan@taadd.ddd', 0, '2019-05-29 18:27:46', '2019-05-29 18:27:46'),
(71, 'Khaja', 'Khaja Road', '01922242423', 'khaja@yahoo.com', 0, '2019-06-03 09:31:35', '2019-06-03 09:31:35'),
(72, 'Khaja', 'Khaja Road', '01922242423', 'khaja@yahoo.com', 0, '2019-06-03 09:32:57', '2019-06-03 09:32:57'),
(73, 'Khaja', 'Khaja Road', '01922242423', 'khaja@yahoo.com', 0, '2019-06-03 09:33:48', '2019-06-03 09:33:48'),
(74, 'Khaja', 'Khaja Road', '01922242423', 'khaja@yahoo.com', 0, '2019-06-03 09:34:14', '2019-06-03 09:34:14'),
(75, 'Shagor Barua', 'Chawkbazar, Ctg', '01922242423', 'khaja@yahoo.com', 0, '2019-06-03 09:36:09', '2019-06-03 09:36:09'),
(76, 'Abdullah Al Mahmud', 'House No 504, Road No 1401, Agrabad, Chittagong', '01882720514', NULL, 0, '2019-06-15 16:56:09', '2019-06-15 16:56:09'),
(77, 'Soraz Boiddo', 'Pathor Gata,Kotuali,Chittagong', '01878711845', NULL, 0, '2019-06-21 16:22:21', '2019-06-21 16:22:21'),
(78, 'Mohammad Jalal Uddin Modina', 'alamsha pata bfhrbs', '018222735274', NULL, 0, '2019-06-22 08:36:18', '2019-06-22 08:36:18'),
(79, 'Syed Riadul Haque', 'Prime Bank, Fotikchori Branch.', '01922242423', NULL, 0, '2019-06-25 18:55:51', '2019-06-25 18:55:51'),
(80, 'Arju Hossain', 'Josh I’m bhabon chandgaon R/A', '01820323269', NULL, 0, '2019-06-27 17:25:39', '2019-06-27 17:25:39'),
(81, 'Arju hossain', 'Chandgoan abasik R/a=14 jasim babon', '01820323269', NULL, 0, '2019-06-27 17:37:21', '2019-06-27 17:37:21'),
(82, 'Shahab Uddin', '102, Khatunganj, Chittagong', '01920463680', 'shahabudiin@gmail.com', 0, '2019-07-11 19:47:26', '2019-07-11 19:47:26'),
(83, 'Nimrat', 'Bangladesh medical college girls hostel dhanmondi dhaka', '01624489256', 'bandaynimratulain@gmail.com', 0, '2019-09-09 11:14:12', '2019-09-09 11:14:12'),
(84, 'sadique', '5, love lane(beside Aga khan jamat khana mosque), Chittagong', '01554335535', 'litu26@gmail.com', 0, '2019-09-13 14:58:44', '2019-09-13 14:58:44'),
(85, 'Abdullah Al Mahmud', 'chomohony  agrrabad  cht', '01735911816', 'naweropu@gmail.com', 1, '2019-09-17 16:45:29', '2019-09-17 16:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `sub_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`sub_category_id`, `sub_category_name`, `sub_category_description`, `category_id`, `publication_status`, `created_at`, `updated_at`) VALUES
(10101, 'Offset Paper', 'ff', 101, 1, '2019-04-15 18:00:00', '2019-04-22 18:00:00'),
(10102, 'Regular Paper', 'ffff', 101, 1, '2019-04-15 18:00:00', '2019-04-22 18:00:00'),
(10103, 'Special Paper', 'rrrr', 101, 1, NULL, NULL),
(10201, 'Pen', 'vvv', 102, 1, NULL, NULL),
(10202, 'Pencil', 'sdsdd', 102, 1, NULL, NULL),
(10203, 'Marker & Highlighter', 'vvdvd', 102, 1, NULL, NULL),
(10204, 'Eraser Sharpener Fluid', 'dvdvd', 102, 1, NULL, NULL),
(10205, 'Scale & Measuring Tools', 'sdsds', 102, 1, NULL, NULL),
(10301, 'Stapler & Punch Machine', 'nsdv', 103, 1, NULL, NULL),
(10302, 'Pins & Clips', 'mllmlv', 103, 1, NULL, NULL),
(10303, 'Anticutter & Scissors', 'nnn', 103, 1, NULL, NULL),
(10304, 'Gum & Tape', 'lnndsn', 103, 1, NULL, NULL),
(10305, 'Stamp Pads & Ink', 'dvv', 103, 1, NULL, NULL),
(10306, 'Calculator', 'svv', 103, 1, NULL, NULL),
(10307, 'Envelope', 'NDS', 103, 1, NULL, NULL),
(10401, 'Register', 'lnn', 104, 1, NULL, NULL),
(10402, 'Notebook', 'fbd', 104, 1, NULL, NULL),
(10403, 'Diary', 'vxvs', 104, 1, NULL, NULL),
(10404, 'Practical Khata', 'dv', 104, 1, NULL, NULL),
(10501, 'Pen Stand', 'dv', 105, 1, NULL, NULL),
(10502, 'Card Holder', 'dvvv', 105, 1, NULL, NULL),
(10503, 'Paper Weight', 'dvd', 105, 1, NULL, NULL),
(10601, 'File', 'dvdv', 106, 1, NULL, NULL),
(10602, 'Folder', 'dvv', 106, 1, NULL, NULL),
(10701, 'Clip Board', 'dvvd', 107, 1, NULL, NULL),
(10702, 'Notice Board', 'dvvdv', 107, 1, NULL, NULL),
(10703, 'White Board', 'vdvdev', 107, 1, NULL, NULL),
(10801, 'Battery', 'dvvd', 108, 1, NULL, NULL),
(10802, 'Lock & Key', 'scsc', 108, 1, NULL, NULL),
(20101, 'Air Freshner', 'Vvav', 201, 1, NULL, NULL),
(20102, 'Antiseptic', 'dvav', 201, 1, NULL, NULL),
(20103, 'Insect Killer', 'svvdsv', 201, 1, NULL, NULL),
(20104, 'Tissue & Towel', 'ddvdv', 201, 1, NULL, NULL),
(20105, 'Soap & Handwash', 'vsvs', 201, 1, NULL, NULL),
(20106, 'Detergent & Dish Washing', 'dd', 201, 1, NULL, NULL),
(20107, 'Cleaner & Cleaning Tools', 'vsvs', 201, 1, NULL, NULL),
(30101, 'Tea & Coffee', 'ssv', 301, 1, NULL, NULL),
(30102, 'Milk & Sugar', 'vsvs', 301, 1, NULL, NULL),
(30103, 'Biscuits & Chanachur', 'vsvsv', 301, 1, NULL, NULL),
(30104, 'One Time Packaging', 'vsvs', 301, 1, NULL, NULL),
(30105, 'Crockeries Items', 'svv', 301, 1, NULL, NULL),
(40101, 'Business Gifts', 'svsvs', 401, 1, NULL, NULL),
(40102, 'Award Items', 'sv', 401, 1, NULL, NULL),
(50101, 'Banner', 'DSASD', 501, 1, NULL, NULL),
(50102, 'Calender', 'CCc', 501, 1, NULL, NULL),
(50103, 'Poster', 'NDNKSKN', 501, 1, NULL, NULL),
(50104, 'Print', 'dvde', 501, 1, NULL, NULL),
(50105, 'Photocopy', 'cscs', 501, 1, NULL, NULL),
(50106, 'Others', 'sfsf', 501, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_super_category`
--

CREATE TABLE `tbl_super_category` (
  `super_category_id` int(10) UNSIGNED NOT NULL,
  `super_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `super_category_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_super_category`
--

INSERT INTO `tbl_super_category` (`super_category_id`, `super_category_name`, `super_category_description`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'STATIONERY', 'All office stationery items like paper,pens,writings, marker etc. .', 1, '2019-04-17 08:25:38', '2019-04-17 08:25:38'),
(2, 'CLEANING & FRESHNESS', 'Cleaning products', 1, '2019-04-17 08:25:38', '2019-04-17 08:25:38'),
(3, 'FOOD & SNACKS', 'Office Snacks like tea, biscuits etc. products', 1, '2019-04-17 08:26:27', '2019-04-17 08:26:27'),
(4, 'GIFTS', 'Business Gifts like Mug, Crest, Medal etc.', 1, '2019-04-17 08:27:05', '2019-04-17 08:27:05'),
(5, 'PRINTING & PRESS', 'Printing & Press of different office', 1, '2019-04-17 08:27:48', '2019-04-17 08:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `created_at`, `updated_at`) VALUES
(1, 'alihossain.csecu@gmail.com', 'Ali Hossain Ringku', '$2y$10$IBraoTYt8UOmqQU6LuqDdeP3sOlvHv32d0Nr/BkF4YOxE0KtmglRi', '2019-01-22 06:59:34', '2019-01-22 06:59:34'),
(2, 'ringku_ctg@yahoo.com', 'Ali Hossain', '$2y$10$fVM4yeSElbUM27DIGgSFQOHWy0Xg9QVzOYoVKnogQtZfQTOLnwT1i', '2019-02-06 20:45:21', '2019-02-06 20:45:21'),
(3, 'kamaluddin.cse94@gmail.com', 'Kamal Uddin Babar', '$2y$10$YTJf6TclpzS7bODNxqz41.Z3pe9Jh/bg.PD8DEe2zAY1Zhk5jp1O6', '2019-07-09 09:14:14', '2019-07-09 09:14:14'),
(4, 'mejbahuddinj@gmail.com', 'Mejbah Uddin', '$2y$10$AE.nFkh4JZ8xAE2itPV6M.zS3mUzHZLf0gQbERLh3dOqdGI85.hni', '2019-07-09 09:26:59', '2019-07-09 09:26:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_corporate_customer`
--
ALTER TABLE `tbl_corporate_customer`
  ADD PRIMARY KEY (`corporate_customer_id`);

--
-- Indexes for table `tbl_corporate_order`
--
ALTER TABLE `tbl_corporate_order`
  ADD PRIMARY KEY (`corporate_order_id`);

--
-- Indexes for table `tbl_corporate_order_details`
--
ALTER TABLE `tbl_corporate_order_details`
  ADD PRIMARY KEY (`corporate_order_details_id`);

--
-- Indexes for table `tbl_corporate_payment`
--
ALTER TABLE `tbl_corporate_payment`
  ADD PRIMARY KEY (`corporate_payment_id`);

--
-- Indexes for table `tbl_corporate_shipping`
--
ALTER TABLE `tbl_corporate_shipping`
  ADD PRIMARY KEY (`corporate_shipping_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `tbl_order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_printing_order`
--
ALTER TABLE `tbl_printing_order`
  ADD PRIMARY KEY (`printing_order_id`);

--
-- Indexes for table `tbl_printing_order_details`
--
ALTER TABLE `tbl_printing_order_details`
  ADD PRIMARY KEY (`printing_order_details_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`sub_category_id`);

--
-- Indexes for table `tbl_super_category`
--
ALTER TABLE `tbl_super_category`
  ADD PRIMARY KEY (`super_category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_corporate_customer`
--
ALTER TABLE `tbl_corporate_customer`
  MODIFY `corporate_customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_corporate_order`
--
ALTER TABLE `tbl_corporate_order`
  MODIFY `corporate_order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tbl_corporate_order_details`
--
ALTER TABLE `tbl_corporate_order_details`
  MODIFY `corporate_order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `tbl_corporate_payment`
--
ALTER TABLE `tbl_corporate_payment`
  MODIFY `corporate_payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_corporate_shipping`
--
ALTER TABLE `tbl_corporate_shipping`
  MODIFY `corporate_shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbl_printing_order`
--
ALTER TABLE `tbl_printing_order`
  MODIFY `printing_order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_printing_order_details`
--
ALTER TABLE `tbl_printing_order_details`
  MODIFY `printing_order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbl_super_category`
--
ALTER TABLE `tbl_super_category`
  MODIFY `super_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
