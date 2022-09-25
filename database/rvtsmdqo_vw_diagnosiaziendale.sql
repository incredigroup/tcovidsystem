-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Lug 27, 2022 alle 13:52
-- Versione del server: 10.3.35-MariaDB-log-cll-lve
-- Versione PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rvtsmdqo_vw_diagnosiaziendale`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'nav-menu', '2020-12-14 19:28:26', '2020-12-14 19:28:26');

-- --------------------------------------------------------

--
-- Struttura della tabella `admin_menu_items`
--

CREATE TABLE `admin_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` int(10) UNSIGNED NOT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `admin_menu_items`
--

INSERT INTO `admin_menu_items` (`id`, `label`, `link`, `parent`, `sort`, `class`, `menu`, `depth`, `created_at`, `updated_at`) VALUES
(1, 'Blog', 'blog', 1, 1, NULL, 1, 0, '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(2, 'Courses', 'courses', 2, 2, NULL, 1, 0, '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(3, 'Bundles', 'bundles', 3, 3, NULL, 1, 0, '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(4, 'Forums', 'forums', 4, 4, NULL, 1, 0, '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(5, 'Contact', 'contact', 5, 5, NULL, 1, 0, '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(6, 'About Us', 'about-us', 6, 6, NULL, 1, 0, '2020-12-14 19:28:26', '2020-12-14 19:28:26');

-- --------------------------------------------------------

--
-- Struttura della tabella `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `bundles`
--

CREATE TABLE `bundles` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `featured` int(11) DEFAULT 0,
  `trending` int(11) DEFAULT 0,
  `popular` int(11) DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `free` tinyint(4) DEFAULT 0,
  `expire_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `bundles`
--

INSERT INTO `bundles` (`id`, `category_id`, `user_id`, `title`, `slug`, `description`, `price`, `course_image`, `start_date`, `featured`, `trending`, `popular`, `meta_title`, `meta_description`, `meta_keywords`, `published`, `free`, `expire_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'test', 'test', 'testing', '100.00', '1629991190-photo6289750529072539863.jpg', '2021-09-22', 0, 0, 0, 'tttt', 'jhjh', 'hhhh', 0, 1, '2021-11-18', '2021-08-26 15:19:51', '2022-02-17 15:43:53', '2022-02-17 15:43:53');

-- --------------------------------------------------------

--
-- Struttura della tabella `bundle_courses`
--

CREATE TABLE `bundle_courses` (
  `bundle_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `bundle_courses`
--

INSERT INTO `bundle_courses` (`bundle_id`, `course_id`) VALUES
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4),
(1, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `bundle_student`
--

CREATE TABLE `bundle_student` (
  `bundle_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `cart_storage`
--

CREATE TABLE `cart_storage` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'study', 'study', 'fas fa-bell', 1, '2021-03-08 14:38:43', '2021-03-08 14:38:43', NULL),
(2, 'art', 'art', 'fas fa-bullhorn', 1, '2021-03-08 14:38:54', '2021-03-08 14:38:54', NULL),
(3, 'Civil Engineering', 'civil-engineering', 'far fa-building', 1, '2021-05-31 18:59:54', '2021-05-31 18:59:54', NULL),
(4, 'General Course', 'general-course', 'fas fa-book-reader', 1, '2021-11-17 06:15:17', '2021-11-17 06:15:17', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Generated 0-Not Generated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `certificates`
--

INSERT INTO `certificates` (`id`, `name`, `user_id`, `course_id`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Student User', 3, 2, 'Certificate-2-3.pdf', 1, '2021-03-08 15:37:57', '2021-03-08 15:37:57'),
(2, 'Student User', 3, 1, 'Certificate-1-3.pdf', 1, '2021-09-09 15:15:45', '2021-09-09 15:15:45'),
(3, 'Student User', 3, 5, 'Certificate-5-3.pdf', 1, '2021-11-17 08:19:09', '2021-11-17 08:19:09');

-- --------------------------------------------------------

--
-- Struttura della tabella `chapter_students`
--

CREATE TABLE `chapter_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `chapter_students`
--

INSERT INTO `chapter_students` (`id`, `model_type`, `model_id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Lesson', 2, 3, 1, '2021-03-08 15:21:58', '2021-03-08 15:21:58'),
(2, 'App\\Models\\Lesson', 1, 3, 2, '2021-03-08 15:24:53', '2021-03-08 15:24:53'),
(3, 'App\\Models\\Test', 2, 3, 2, '2021-03-08 15:37:17', '2021-03-08 15:37:17'),
(4, 'App\\Models\\Test', 1, 3, 1, '2021-03-08 15:38:23', '2021-03-08 15:38:23'),
(5, 'App\\Models\\Lesson', 1, 5, 2, '2021-03-08 17:50:09', '2021-03-08 17:50:09'),
(6, 'App\\Models\\Test', 4, 3, 2, '2021-03-11 10:03:29', '2021-03-11 10:03:29'),
(7, 'App\\Models\\Test', 6, 3, 2, '2021-03-11 10:09:11', '2021-03-11 10:09:11'),
(8, 'App\\Models\\Test', 5, 3, 2, '2021-03-11 10:10:26', '2021-03-11 10:10:26'),
(9, 'App\\Models\\Test', 3, 3, 2, '2021-03-11 10:11:23', '2021-03-11 10:11:23'),
(10, 'App\\Models\\Test', 7, 3, 2, '2021-03-11 10:11:31', '2021-03-11 10:11:31'),
(11, 'App\\Models\\Test', 9, 3, 1, '2021-03-11 20:07:18', '2021-03-11 20:07:18'),
(12, 'App\\Models\\Test', 11, 3, 1, '2021-03-11 20:07:30', '2021-03-11 20:07:30'),
(13, 'App\\Models\\Lesson', 2, 6, 1, '2021-03-12 02:13:43', '2021-03-12 02:13:43'),
(14, 'App\\Models\\Lesson', 1, 6, 2, '2021-03-12 02:59:36', '2021-03-12 02:59:36'),
(15, 'App\\Models\\Test', 10, 6, 1, '2021-03-13 13:23:04', '2021-03-13 13:23:04'),
(16, 'App\\Models\\Test', 11, 6, 1, '2021-03-13 13:23:15', '2021-03-13 13:23:15'),
(17, 'App\\Models\\Test', 8, 6, 1, '2021-03-13 13:23:26', '2021-03-13 13:23:26'),
(18, 'App\\Models\\Test', 9, 6, 1, '2021-03-13 13:24:08', '2021-03-13 13:24:08'),
(19, 'App\\Models\\Test', 7, 1, 2, '2021-03-13 13:25:31', '2021-03-13 13:25:31'),
(20, 'App\\Models\\Lesson', 1, 1, 2, '2021-03-13 13:25:43', '2021-03-13 13:25:43'),
(21, 'App\\Models\\Lesson', 1, 8, 2, '2021-03-13 13:28:22', '2021-03-13 13:28:22'),
(22, 'App\\Models\\Test', 2, 8, 2, '2021-03-13 13:28:31', '2021-03-13 13:28:31'),
(23, 'App\\Models\\Test', 3, 8, 2, '2021-03-13 13:28:58', '2021-03-13 13:28:58'),
(24, 'App\\Models\\Test', 2, 6, 2, '2021-03-13 13:29:51', '2021-03-13 13:29:51'),
(25, 'App\\Models\\Test', 4, 6, 2, '2021-03-13 13:43:23', '2021-03-13 13:43:23'),
(26, 'App\\Models\\Test', 3, 6, 2, '2021-03-13 14:12:20', '2021-03-13 14:12:20'),
(27, 'App\\Models\\Test', 1, 6, 1, '2021-03-13 14:15:44', '2021-03-13 14:15:44'),
(28, 'App\\Models\\Test', 5, 6, 2, '2021-03-13 14:16:03', '2021-03-13 14:16:03'),
(29, 'App\\Models\\Test', 16, 3, 3, '2021-03-14 13:37:27', '2021-03-14 13:37:27'),
(30, 'App\\Models\\Test', 12, 3, 3, '2021-03-14 13:37:33', '2021-03-14 13:37:33'),
(31, 'App\\Models\\Test', 22, 3, 3, '2021-03-14 13:50:16', '2021-03-14 13:50:16'),
(32, 'App\\Models\\Test', 20, 3, 1, '2021-03-14 17:20:38', '2021-03-14 17:20:38'),
(33, 'App\\Models\\Test', 23, 3, 1, '2021-03-14 18:22:29', '2021-03-14 18:22:29'),
(34, 'App\\Models\\Test', 24, 3, 3, '2021-03-15 10:34:55', '2021-03-15 10:34:55'),
(35, 'App\\Models\\Test', 31, 3, 3, '2021-03-15 12:12:46', '2021-03-15 12:12:46'),
(36, 'App\\Models\\Test', 33, 3, 3, '2021-03-15 12:18:44', '2021-03-15 12:18:44'),
(37, 'App\\Models\\Test', 30, 3, 2, '2021-03-15 13:20:12', '2021-03-15 13:20:12'),
(38, 'App\\Models\\Test', 32, 3, 2, '2021-03-15 13:20:30', '2021-03-15 13:20:30'),
(39, 'App\\Models\\Test', 28, 3, 2, '2021-03-15 13:20:52', '2021-03-15 13:20:52'),
(40, 'App\\Models\\Test', 34, 3, 2, '2021-03-15 13:22:40', '2021-03-15 13:22:40'),
(41, 'App\\Models\\Test', 10, 3, 1, '2021-03-16 17:13:29', '2021-03-16 17:13:29'),
(42, 'App\\Models\\Test', 36, 3, 3, '2021-03-16 17:19:13', '2021-03-16 17:19:13'),
(43, 'App\\Models\\Test', 35, 3, 2, '2021-03-16 17:22:58', '2021-03-16 17:22:58'),
(44, 'App\\Models\\Test', 38, 3, 3, '2021-03-16 17:50:35', '2021-03-16 17:50:35'),
(45, 'App\\Models\\Test', 37, 3, 2, '2021-03-16 17:55:58', '2021-03-16 17:55:58'),
(46, 'App\\Models\\Test', 15, 3, 3, '2021-03-17 15:02:01', '2021-03-17 15:02:01'),
(47, 'App\\Models\\Test', 39, 3, 1, '2021-03-19 03:07:09', '2021-03-19 03:07:09'),
(48, 'App\\Models\\Test', 42, 3, 3, '2021-03-19 15:31:04', '2021-03-19 15:31:04'),
(49, 'App\\Models\\Test', 40, 3, 1, '2021-03-19 15:33:43', '2021-03-19 15:33:43'),
(50, 'App\\Models\\Test', 45, 3, 3, '2021-03-19 15:34:50', '2021-03-19 15:34:50'),
(51, 'App\\Models\\Test', 18, 3, 2, '2021-03-19 15:42:28', '2021-03-19 15:42:28'),
(52, 'App\\Models\\Test', 19, 3, 2, '2021-03-19 15:42:42', '2021-03-19 15:42:42'),
(53, 'App\\Models\\Test', 26, 3, 2, '2021-03-19 15:42:45', '2021-03-19 15:42:45'),
(54, 'App\\Models\\Test', 41, 3, 2, '2021-03-19 15:43:06', '2021-03-19 15:43:06'),
(55, 'App\\Models\\Test', 44, 3, 2, '2021-03-19 15:43:08', '2021-03-19 15:43:08'),
(56, 'App\\Models\\Test', 46, 3, 2, '2021-04-08 08:40:22', '2021-04-08 08:40:22'),
(57, 'App\\Models\\Test', 47, 3, 2, '2021-04-08 08:40:41', '2021-04-08 08:40:41'),
(58, 'App\\Models\\Test', 13, 3, 3, '2021-05-19 19:08:57', '2021-05-19 19:08:57'),
(59, 'App\\Models\\Test', 49, 3, 3, '2021-06-03 08:21:10', '2021-06-03 08:21:10'),
(60, 'App\\Models\\Lesson', 4, 3, 4, '2021-06-03 09:46:18', '2021-06-03 09:46:18'),
(62, 'App\\Models\\Test', 8, 3, 1, '2021-06-26 14:55:34', '2021-06-26 14:55:34'),
(63, 'App\\Models\\Test', 4, 1, 2, '2021-07-29 04:31:56', '2021-07-29 04:31:56'),
(64, 'App\\Models\\Test', 51, 3, 4, '2021-08-10 09:40:41', '2021-08-10 09:40:41'),
(65, 'App\\Models\\Test', 48, 3, 3, '2021-08-10 10:22:27', '2021-08-10 10:22:27'),
(66, 'App\\Models\\Test', 52, 3, 1, '2021-08-12 12:21:22', '2021-08-12 12:21:22'),
(67, 'App\\Models\\Test', 21, 3, 1, '2021-08-19 11:25:42', '2021-08-19 11:25:42'),
(68, 'App\\Models\\Test', 1, 1, 1, '2021-08-19 12:22:56', '2021-08-19 12:22:56'),
(69, 'App\\Models\\Test', 17, 3, 3, '2021-08-20 06:14:03', '2021-08-20 06:14:03'),
(70, 'App\\Models\\Lesson', 3, 3, 2, '2021-08-25 10:20:33', '2021-08-25 10:20:33'),
(71, 'App\\Models\\Test', 14, 3, 3, '2021-08-27 19:06:54', '2021-08-27 19:06:54'),
(72, 'App\\Models\\Test', 53, 3, 1, '2021-08-28 12:36:49', '2021-08-28 12:36:49'),
(73, 'App\\Models\\Test', 53, 1, 1, '2021-08-29 12:03:06', '2021-08-29 12:03:06'),
(74, 'App\\Models\\Test', 27, 3, 3, '2021-09-07 16:08:15', '2021-09-07 16:08:15'),
(75, 'App\\Models\\Test', 43, 3, 1, '2021-09-07 17:53:22', '2021-09-07 17:53:22'),
(76, 'App\\Models\\Lesson', 3, 1, 2, '2021-09-12 14:15:42', '2021-09-12 14:15:42'),
(77, 'App\\Models\\Test', 47, 1, 2, '2021-09-12 14:16:01', '2021-09-12 14:16:01'),
(78, 'App\\Models\\Test', 25, 3, 3, '2021-09-12 19:11:21', '2021-09-12 19:11:21'),
(79, 'App\\Models\\Test', 19, 1, 2, '2021-10-07 18:34:23', '2021-10-07 18:34:23'),
(80, 'App\\Models\\Test', 7, 5, 2, '2021-10-20 17:13:34', '2021-10-20 17:13:34'),
(81, 'App\\Models\\Test', 43, 16, 1, '2021-10-27 13:21:36', '2021-10-27 13:21:36'),
(82, 'App\\Models\\Test', 3, 1, 2, '2021-11-16 07:58:07', '2021-11-16 07:58:07'),
(83, 'App\\Models\\Test', 54, 3, 5, '2021-11-16 14:36:26', '2021-11-16 14:36:26'),
(84, 'App\\Models\\Lesson', 5, 3, 5, '2021-11-17 06:40:59', '2021-11-17 06:40:59'),
(85, 'App\\Models\\Test', 57, 3, 2, '2021-11-29 14:35:28', '2021-11-29 14:35:28'),
(86, 'App\\Models\\Test', 58, 3, 2, '2021-11-30 14:08:34', '2021-11-30 14:08:34'),
(87, 'App\\Models\\Test', 57, 1, 2, '2021-12-03 17:33:34', '2021-12-03 17:33:34'),
(88, 'App\\Models\\Test', 59, 3, 2, '2021-12-10 10:01:19', '2021-12-10 10:01:19'),
(89, 'App\\Models\\Test', 59, 1, 2, '2021-12-17 06:58:07', '2021-12-17 06:58:07'),
(90, 'App\\Models\\Test', 56, 3, 3, '2021-12-24 02:32:22', '2021-12-24 02:32:22'),
(91, 'App\\Models\\Test', 55, 3, 3, '2021-12-24 02:52:32', '2021-12-24 02:52:32'),
(92, 'App\\Models\\Lesson', 6, 3, 6, '2021-12-28 03:12:03', '2021-12-28 03:12:03'),
(93, 'App\\Models\\Test', 60, 3, 6, '2021-12-28 03:12:11', '2021-12-28 03:12:11'),
(94, 'App\\Models\\Test', 61, 3, 6, '2022-01-18 06:08:06', '2022-01-18 06:08:06'),
(95, 'App\\Models\\Test', 61, 18, 6, '2022-02-15 18:47:45', '2022-02-15 18:47:45'),
(96, 'App\\Models\\Test', 62, 3, 1, '2022-02-28 03:22:25', '2022-02-28 03:22:25'),
(97, 'App\\Models\\Lesson', 8, 3, 1, '2022-06-09 10:44:41', '2022-06-09 10:44:41'),
(98, 'App\\Models\\Test', 63, 3, 6, '2022-06-09 12:16:13', '2022-06-09 12:16:13'),
(99, 'App\\Models\\Test', 64, 3, 6, '2022-06-21 10:45:50', '2022-06-21 10:45:50'),
(100, 'App\\Models\\Test', 65, 3, 6, '2022-06-30 07:41:26', '2022-06-30 07:41:26'),
(101, 'App\\Models\\Test', 66, 3, 1, '2022-06-30 11:19:24', '2022-06-30 11:19:24'),
(102, 'App\\Models\\Test', 65, 1, 6, '2022-07-06 13:57:14', '2022-07-06 13:57:14'),
(103, 'App\\Models\\Test', 67, 3, 6, '2022-07-06 17:12:33', '2022-07-06 17:12:33'),
(104, 'App\\Models\\Test', 68, 3, 6, '2022-07-06 22:23:29', '2022-07-06 22:23:29'),
(105, 'App\\Models\\Test', 69, 3, 6, '2022-07-07 06:36:45', '2022-07-07 06:36:45'),
(106, 'App\\Models\\Test', 70, 3, 6, '2022-07-07 06:39:31', '2022-07-07 06:39:31'),
(107, 'App\\Models\\Test', 72, 3, 6, '2022-07-08 16:49:24', '2022-07-08 16:49:24'),
(108, 'App\\Models\\Test', 71, 3, 6, '2022-07-08 16:57:51', '2022-07-08 16:57:51'),
(109, 'App\\Models\\Test', 73, 3, 6, '2022-07-10 12:44:05', '2022-07-10 12:44:05'),
(110, 'App\\Models\\Test', 74, 3, 6, '2022-07-10 12:52:13', '2022-07-10 12:52:13'),
(111, 'App\\Models\\Test', 76, 3, 6, '2022-07-11 05:30:54', '2022-07-11 05:30:54'),
(112, 'App\\Models\\Test', 75, 3, 6, '2022-07-11 05:31:02', '2022-07-11 05:31:02'),
(113, 'App\\Models\\Test', 77, 3, 6, '2022-07-13 17:19:50', '2022-07-13 17:19:50'),
(114, 'App\\Models\\Test', 78, 3, 6, '2022-07-14 05:45:17', '2022-07-14 05:45:17'),
(115, 'App\\Models\\Lesson', 10, 3, 6, '2022-07-14 14:48:21', '2022-07-14 14:48:21'),
(116, 'App\\Models\\Test', 79, 3, 1, '2022-07-15 11:24:12', '2022-07-15 11:24:12'),
(117, 'App\\Models\\Lesson', 9, 3, 6, '2022-07-17 13:53:05', '2022-07-17 13:53:05');

-- --------------------------------------------------------

--
-- Struttura della tabella `charts`
--

CREATE TABLE `charts` (
  `id` int(10) UNSIGNED NOT NULL,
  `score` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `logic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order` int(255) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `charts`
--

INSERT INTO `charts` (`id`, `score`, `user_id`, `title`, `logic`, `order`, `test_id`, `content`, `short_code`, `type`) VALUES
(3, NULL, 1, 'Test Calc Chart', NULL, 1, NULL, '[[\"  \",\"2020\",\"2021\"],[\"mateo\",\"711.Row.1\",\"711.Row.3\"],[\"jhone\",\"711.Row.1\",\"711.Row.3\"]]', '[chart id=3]', '2'),
(4, NULL, 1, 'chart checkbox', NULL, 2, NULL, '[[\"  \",\"col1\"],[\"row1\",\"question477+question478\"],[\"Input\",\"question478+question477\"]]', '[chart id=4]', '2'),
(5, NULL, 1, 'chart value and range', NULL, 3, NULL, '[[\"  \",\"col1\",\"Input\"],[\"row1\",\"question479\",\"question479*question480\"],[\"Input\",\"question480\",\"question480*question479\"]]', '[chart id=5]', '2'),
(6, NULL, 1, 'prova7 marzo1', NULL, 4, NULL, '[[\"  \",\"col1\"],[\"row1\",\"question477+question478+question643+question704\"],[\"Input\",\"question477-question478+question705+question703\"]]', '[chart id=6]', '0'),
(7, NULL, 1, NULL, NULL, 5, NULL, '[[\"  \",\"col1\",\"Input\"],[\"row1\",\"482.evenue.2020.1\",\"482.evenue.n2021.2\"],[\"Input\",\"482.evenue.n2021.2+482.evenue.2020.1\",\"482.general cost.n2021.4*482.evenue.n2021.2\"],[\"Input\",\"482.employercost.2020.5/2\",\"482.evenue.n2021.2-482.evenue.2020.1\"]]', '[chart id=7]', '2'),
(8, NULL, 1, NULL, NULL, 6, NULL, '[[\"  \",\"col1\"],[\"row1\",\"485.Row.3+486.Row.3\"],[\"Input\",\"485.Row.1+486.Row.1\"]]', '[chart id=8]', '0'),
(9, NULL, 1, NULL, NULL, 7, NULL, '[[\"  \",\"col1\"],[\"row1\",\"question708\"],[\"Input\",\"question707\"]]', '[chart id=9]', '3'),
(10, NULL, 1, NULL, NULL, 8, NULL, '[[\"  \",\"2021\",\"2022\"],[\"revenue\",\"731.revenue.2020.1\",\"731.revenue.2022.2\"],[\"cost\",\"731.cost.2020.3\",\"731.cost.2022.4\"]]', '[chart id=10]', '2'),
(11, NULL, 1, 'sum of row 1 and row2 esottrazioone row 2 a row1', NULL, 9, NULL, '[[\"  \",\"2021\",\"2022\"],[\"total employer\",\"732.employer.2021.1+732.manager.2021.3\",\"732.employer.2022.2+732.manager.2022.4\"],[\"% manager\",\"732.manager.2021.3/(+732.employer.2021.1+732.manager.2021.3)\",\"732.manager.2022.4/(+732.employer.2022.2+732.manager.2022.4)\"]]', '[chart id=11]', '2'),
(12, NULL, 1, 'radio + check and radio+check/100', NULL, 10, NULL, '[[\"  \",\"col1\"],[\"row1\",\"question728+question729\"],[\"Input\",\"(question728+question729)/10\"]]', '[chart id=12]', '0'),
(13, NULL, 1, NULL, NULL, 11, NULL, '[[\"  \",\"col1\",\"Input\"],[\"row1\",\"745.EARN.1990.1+745.PAY.1990.3\",\"745.EARN.1991.2+745.PAY.1991.4\"],[\"Input\",\"745.EARN.1990.1-745.PAY.1990.3\",\"745.EARN.1991.2-745.PAY.1991.4\"]]', '[chart id=13]', '0'),
(14, NULL, 1, NULL, NULL, 12, NULL, '[[\"  \",\"col1\",\"Input\"],[\"row1\",\"746.EARN.1\",\"746.EARN.1-746.PAY.3\"],[\"Input\",\"746.PAY.3\",\"746.EARN.1+746.PAY.3\"]]', '[chart id=14]', '3'),
(15, NULL, 1, NULL, NULL, 13, NULL, '[[\"  \",\"col1\"],[\"Input\",\"question728+question729\"],[\"Input\",\"question728\"]]', '[chart id=15]', '0'),
(16, NULL, 1, 'dsfsd', NULL, 14, NULL, '[[\"  \",\"col1\"],[\"row1\",\"question729+question728\"],[\"Input\",\"question728\"]]', '[chart id=16]', '0'),
(17, NULL, 1, NULL, NULL, 15, NULL, '[[\"  \",\"rating\",\"range\",\"delta\"],[\"row1\",\"question763\",\"question761\",\"question761-+question763\"]]', '[chart id=17]', '2'),
(18, NULL, 1, NULL, NULL, 16, NULL, '[[\"  \",\"col1\"],[\"single value\",\"question764\"],[\"raitng\",\"question763\"],[\"delta\",\"question763-question764\"]]', '[chart id=18]', '2'),
(19, NULL, 1, NULL, NULL, 17, NULL, '[[\"  \",\"\"],[\"row1\",\"question767+question765\"]]', '[chart id=19]', '2'),
(20, NULL, 1, NULL, NULL, 18, NULL, '[[\"  \",\"col1\"],[\"row1\",\"question768+question765\"],[\"Input\",\"question767\"]]', '[chart id=20]', '2'),
(21, NULL, 1, NULL, NULL, 19, NULL, '[[\"  \",\"\",\"Input\",\"Input\"],[\"check8-7-1\",\"question769\",\"\",\"\"],[\"rating 8-7-2\",\"question771\",\"\",\"\"],[\"8-72-1rating+radio-7-1\",\"question771+question770\",\"\",\"\"],[\"Input\",\"\",\"\",\"\"],[\"Input\",\"\",\"\",\"\"]]', '[chart id=21]', '2'),
(22, NULL, 1, NULL, NULL, 20, NULL, '[[\"  \",\"\"],[\"774\",\"question774\"],[\"776\",\"question776\"],[\"777+775\",\"question775++question777+question762\"]]', '[chart id=22]', '2'),
(23, NULL, 1, NULL, NULL, 21, NULL, '[[\"  \",\"\"],[\"802\",\"question802\"],[\"803\",\"question803\"],[\"793 (condition)\",\"question793\"],[\"795+790\",\"question802+question800\"]]', '[chart id=23]', '11'),
(24, NULL, 1, NULL, NULL, 22, NULL, '[[\"  \",\"col1\"],[\"texts group241\",\"textgroup241\"],[\"texts group 240\",\"textgroup240\"],[\"text group 240+241\",\"textgroup241+2409\"]]', '[chart id=24]', '10'),
(25, NULL, 1, NULL, NULL, 23, NULL, '[[\"  \",\"col1\"],[\"row1\",\"textgroup241+textgroup234\"]]', '[chart id=25]', '0'),
(26, NULL, 1, NULL, NULL, 24, NULL, '[[\"  \",\"col1\"],[\"row1\",\"textgroup239+textgroup240\"]]', '[chart id=26]', '0'),
(27, NULL, 1, NULL, NULL, 25, NULL, '[[\"  \",\"col1\"],[\"241+234+239\",\"textgroup241+textgroup234+textgroup239\"],[\"241-234-239\",\"textgroup241-textgroup234-textgroup239\"]]', '[chart id=27]', '10'),
(28, NULL, 1, NULL, NULL, 26, NULL, '[[\"  \",\"col1\"],[\"row1\",\"textgroup241+textgroup234\"]]', '[chart id=28]', '0'),
(29, NULL, 1, NULL, NULL, 27, NULL, '[[\"  \",\"col1\"],[\"241\",\"textgroup241\"],[\"240\",\"textgroup240\"],[\"241+240\",\"textgroup241+textgroup240\"]]', '[chart id=29]', '2'),
(30, NULL, 1, NULL, NULL, 28, NULL, '[[\"  \",\"col1\"],[\"240\",\"textgroup240\"],[\"241\",\"textgroup241\"],[\"240+241\",\"textgroup240+textgroup241\"]]', '[chart id=30]', '2'),
(31, NULL, 1, NULL, NULL, 29, NULL, '[[\"  \",\"\"],[\"\",\"805.file.1+805.file.2\"]]', '[chart id=31]', '4'),
(32, NULL, 1, NULL, NULL, 30, NULL, '[[\"  \",\"\"],[\"\",\"question808\"]]', '[chart id=32]', '10'),
(33, NULL, 1, NULL, NULL, 31, NULL, '[[\"  \",\"\"],[\"\",\"question809\"]]', '[chart id=33]', '4'),
(34, NULL, 1, NULL, NULL, 32, NULL, '[[\"  \",\"\"],[\"\",\"question810\"]]', '[chart id=34]', '10');

-- --------------------------------------------------------

--
-- Struttura della tabella `chart_test`
--

CREATE TABLE `chart_test` (
  `chart_id` int(10) UNSIGNED DEFAULT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `chart_test`
--

INSERT INTO `chart_test` (`chart_id`, `test_id`) VALUES
(3, 1),
(3, 60),
(4, 62),
(5, 62),
(6, 62),
(7, 62),
(8, 62),
(9, 1),
(10, 65),
(10, 66),
(11, 65),
(11, 66),
(12, 1),
(13, 43),
(14, 43),
(15, 1),
(16, 65),
(17, 65),
(18, 65),
(19, 1),
(20, 68),
(21, 70),
(22, 72),
(22, 69),
(22, 70),
(22, 71),
(22, 73),
(23, 76),
(24, 76),
(25, 1),
(26, 2),
(27, 1),
(28, 2),
(29, 1),
(30, 76),
(31, 78),
(32, 78),
(33, 78),
(34, 78);

-- --------------------------------------------------------

--
-- Struttura della tabella `chatter_categories`
--

CREATE TABLE `chatter_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `chatter_discussion`
--

CREATE TABLE `chatter_discussion` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_category_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `answered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#232629',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `chatter_post`
--

CREATE TABLE `chatter_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `markdown` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `chatter_user_discussion`
--

CREATE TABLE `chatter_user_discussion` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `thread_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 'Hi', '2021-05-26 09:48:15', '2021-05-26 09:48:15', NULL),
(2, 2, 1, 'Hello, How are you. I am a student. Help yourself.', '2021-06-26 06:07:22', '2021-06-26 06:07:22', NULL),
(3, 2, 1, 'hi', '2021-08-12 16:46:37', '2021-08-12 16:46:37', NULL),
(4, 1, 3, 'Hi', '2021-08-12 19:40:40', '2021-08-12 19:40:40', NULL),
(5, 1, 3, 'Hi, here is new student.', '2021-08-18 14:33:05', '2021-08-18 14:33:05', NULL),
(6, 1, 3, 'I\'ve read your project.', '2021-08-18 14:34:34', '2021-08-18 14:34:34', NULL),
(7, 3, 3, 'ge', '2021-08-19 11:33:34', '2021-08-19 11:33:34', NULL),
(8, 4, 1, 'asda', '2021-08-20 09:26:33', '2021-08-20 09:26:33', NULL),
(9, 5, 3, 'xzczc', '2021-10-13 11:28:36', '2021-10-13 11:28:36', NULL),
(10, 5, 3, 'vggj', '2021-10-28 11:56:43', '2021-10-28 11:56:43', NULL),
(11, 1, 3, 'Cool, Okay', '2021-10-28 12:37:02', '2021-10-28 12:37:02', NULL),
(12, 3, 3, 'Not so good', '2021-10-28 12:37:19', '2021-10-28 12:37:19', NULL),
(13, 5, 3, 'I must click the send button.', '2021-10-28 12:37:38', '2021-10-28 12:37:38', NULL),
(14, 3, 3, 'Sir, I\'m not understand the second point in this course', '2021-11-17 05:59:11', '2021-11-17 05:59:11', NULL),
(15, 5, 3, '123', '2022-01-27 14:45:49', '2022-01-27 14:45:49', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `chat_participants`
--

CREATE TABLE `chat_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `starred` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `chat_participants`
--

INSERT INTO `chat_participants` (`id`, `thread_id`, `user_id`, `last_read`, `starred`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '2022-07-07 13:28:46', 0, '2021-05-26 09:48:15', '2022-07-07 13:28:46', NULL),
(2, 1, 2, NULL, 0, '2021-05-26 09:48:15', '2021-05-26 09:48:15', NULL),
(3, 2, 1, '2022-01-27 14:35:34', 0, '2021-06-26 06:07:22', '2022-01-27 14:35:34', NULL),
(4, 2, 2, NULL, 0, '2021-06-26 06:07:22', '2021-06-26 06:07:22', NULL),
(5, 3, 3, '2022-07-07 13:28:48', 0, '2021-08-19 11:33:35', '2022-07-07 13:28:48', NULL),
(6, 3, 2, NULL, 0, '2021-08-19 11:33:35', '2021-08-19 11:33:35', NULL),
(7, 4, 1, '2022-01-27 14:35:36', 0, '2021-08-20 09:26:33', '2022-01-27 14:35:36', NULL),
(8, 4, 2, NULL, 0, '2021-08-20 09:26:33', '2021-08-20 09:26:33', NULL),
(9, 5, 3, '2022-07-07 13:30:25', 0, '2021-10-13 11:28:36', '2022-07-07 13:30:25', NULL),
(10, 5, 2, NULL, 0, '2021-10-13 11:28:36', '2021-10-13 11:28:36', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `chat_threads`
--

CREATE TABLE `chat_threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique slug for social media sharing. MD5 hashed string',
  `max_participants` int(11) DEFAULT NULL COMMENT 'Max number of participants allowed',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Profile picture for the conversation',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `chat_threads`
--

INSERT INTO `chat_threads` (`id`, `subject`, `slug`, `max_participants`, `start_date`, `end_date`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-26 09:48:15', '2021-10-28 12:37:02', NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 06:07:22', '2021-08-12 16:46:37', NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-19 11:33:34', '2021-11-17 05:59:11', NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-20 09:26:33', '2021-08-20 09:26:33', NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-13 11:28:36', '2022-01-27 14:45:49', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `configs`
--

CREATE TABLE `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'theme_layout', '1', '2020-12-14 19:28:25', '2022-07-12 15:49:23'),
(2, 'font_color', 'color-3', '2020-12-14 19:28:26', '2022-07-12 15:43:45'),
(3, 'layout_type', 'wide-layout', '2020-12-14 19:28:26', '2022-07-06 13:53:47'),
(4, 'layout_1', '{\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Neon LMS\",\"status\":0},\"testimonial\":{\"title\":\"Testimonial\",\"status\":0},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":0},\"sponsors\":{\"title\":\"Sponsors\",\"status\":0},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":0},\"teachers\":{\"title\":\"Teachers\",\"status\":0},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":0},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":0},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}', '2020-12-14 19:28:26', '2022-07-12 15:59:05'),
(5, 'layout_2', '{\"sponsors\":{\"title\":\"Sponsors\",\"status\":0},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"search_section\":{\"title\":\"Search Section\",\"status\":0},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":0},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":0},\"testimonial\":{\"title\":\"Testimonial\",\"status\":0},\"teachers\":{\"title\":\"Teachers\",\"status\":0},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}', '2020-12-14 19:28:26', '2022-07-12 15:41:03'),
(6, 'layout_3', '{\"counters\":{\"title\":\"Counters\",\"status\":0},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Neon LMS\",\"status\":0},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":0},\"teachers\":{\"title\":\"Teachers\",\"status\":0},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":0},\"testimonial\":{\"title\":\"Testimonial\",\"status\":0},\"sponsors\":{\"title\":\"Sponsors\",\"status\":0},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":0},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":0}}', '2020-12-14 19:28:26', '2022-07-12 15:46:33'),
(7, 'layout_4', '{\"counters\":{\"title\":\"Counters\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Neon LMS\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"contact_form\":{\"title\":\"Contact Form\",\"status\":1},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}', '2020-12-14 19:28:26', '2022-07-12 15:43:45'),
(8, 'counter', '2', '2020-12-14 19:28:26', '2022-02-14 14:10:30'),
(9, 'total_students', '1M+', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(10, 'total_courses', '1K+', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(11, 'total_teachers', '200+', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(12, 'logo_b_image', '1615988564-diagnosi7-nero.png', '2020-12-14 19:28:26', '2021-03-17 14:42:44'),
(13, 'logo_w_image', '1615988564-diagnosi7-nero.png', '2020-12-14 19:28:26', '2021-03-17 14:42:44'),
(14, 'logo_white_image', '1615988564-logoopicc.png', '2020-12-14 19:28:26', '2021-03-17 14:42:44'),
(15, 'logo_popup', 'popup-logo.png', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(16, 'favicon_image', 'popup-logo.png', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(17, 'contact_data', '[{\"name\":\"short_text\",\"value\":\"I nostri contatti\",\"status\":0},{\"name\":\"primary_address\",\"value\":\" Last Vegas, 120 Graphic Street, US\",\"status\":0},{\"name\":\"secondary_address\",\"value\":\"Califorinia, 88 Design Street, US\",\"status\":0},{\"name\":\"primary_phone\",\"value\":\"(100) 3434 55666\",\"status\":0},{\"name\":\"secondary_phone\",\"value\":\"(20) 3434 9999\",\"status\":0},{\"name\":\"primary_email\",\"value\":\"info@neonlms.com\",\"status\":1},{\"name\":\"secondary_email\",\"value\":\"mail@neonlms.info\",\"status\":0},{\"name\":\"location_on_map\",\"value\":\"<iframe src=\'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d101408.2330017279!2d-122.15130702796371!3d37.41330279145996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb7495bec0189%3A0x7c17d44a466baf9b!2sMountain+View%2C+CA%2C+USA!5e0!3m2!1sen!2sin!4v1553663251022\' width=\'800\' height=\'600\' frameborder=\'0\' style=\'border:0\' allowfullscreen></iframe>\",\"status\":0}]', '2020-12-14 19:28:26', '2022-07-12 15:58:37'),
(18, 'footer_data', '{\"short_description\":{\"text\":\"Ti aiutiamo a formarti e far crescer la tua azienda\",\"status\":1},\"section1\":{\"type\":\"2\",\"status\":0},\"section2\":{\"type\":\"3\",\"status\":0},\"section3\":{\"type\":\"4\",\"status\":0},\"social_links\":{\"status\":0,\"links\":[{\"icon\":\"fab fa-facebook-f\",\"link\":\"#\"}]},\"newsletter_form\":{\"status\":0},\"bottom_footer\":{\"status\":0},\"copyright_text\":{\"text\":\"All right reserved  © 2022 - DIAGNOSIAZIENDALE:IT\",\"status\":1},\"bottom_footer_links\":{\"status\":0,\"links\":[{\"label\":\"Privacy Policy\",\"link\":\"http://neon-lms-app.com/privacy-policy\"}]}}', '2020-12-14 19:28:26', '2022-07-12 15:56:15'),
(19, 'app.locale', 'it', '2020-12-14 19:28:26', '2022-07-22 04:48:51'),
(20, 'app.display_type', 'ltr', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(21, 'app.currency', 'EUR', '2020-12-14 19:28:26', '2021-11-04 15:26:35'),
(22, 'lesson_timer', '0', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(23, 'show_offers', '0', '2020-12-14 19:28:26', '2022-07-12 15:41:03'),
(24, 'access.captcha.registration', '0', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(25, 'sitemap.chunk', '500', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(26, 'one_signal', '0', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(27, 'nav_menu', '2', '2020-12-14 19:28:26', '2021-05-31 19:17:52'),
(28, 'commission_rate', '0', '2020-12-14 19:28:26', '2020-12-14 19:28:26'),
(29, 'app.name', 'Neon LMS', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(30, 'app.url', 'http://www.diagnosiaziendale.it/', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(31, 'google_analytics_id', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(32, 'no-captcha.sitekey', 'no-captcha-sitekey', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(33, 'no-captcha.secret', 'no-captcha-secret', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(34, 'onesignal_data', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(35, 'custom_css', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(36, 'custom_js', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(37, 'mail.from.name', 'Example', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(38, 'mail.from.address', 'pac.ros@tiscali.it', '2021-03-17 14:34:48', '2021-11-04 15:26:35'),
(39, 'mail.driver', 'smtp', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(40, 'mail.host', 'smtp.mailtrap.io', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(41, 'mail.port', '2525', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(42, 'mail.username', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(43, 'mail.password', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(44, 'mail.encryption', 'tls', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(45, 'services.stripe.key', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(46, 'services.stripe.secret', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(47, 'paypal.settings.mode', 'sandbox', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(48, 'paypal.client_id', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(49, 'paypal.secret', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(50, 'rave.env', 'staging', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(51, 'rave.publicKey', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(52, 'rave.secretKey', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(53, 'services.instamojo.mode', 'sandbox', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(54, 'services.instamojo.key', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(55, 'services.instamojo.secret', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(56, 'services.razorpay.key', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(57, 'services.razorpay.secret', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(58, 'services.cashfree.mode', 'sandbox', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(59, 'services.cashfree.app_id', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(60, 'services.cashfree.secret', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(61, 'services.payu.mode', 'sandbox', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(62, 'services.payu.key', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(63, 'services.payu.salt', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(64, 'payment_offline_instruction', NULL, '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(65, 'registration_fields', '[]', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(66, 'myTable_length', '10', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(67, 'access_registration', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(68, 'mailchimp_double_opt_in', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(69, 'access_users_change_email', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(70, 'access_users_confirm_email', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(71, 'access_captcha_registration', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(72, 'access_users_requires_approval', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(73, 'services.stripe.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(74, 'paypal.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(75, 'payment_offline_active', '0', '2021-03-17 14:34:48', '2022-07-12 15:55:14'),
(76, 'backup.status', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(77, 'retest', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(78, 'onesignal_status', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(79, 'access.users.registration_mail', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(80, 'access.users.order_mail', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(81, 'services.instamojo.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(82, 'services.razorpay.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(83, 'services.cashfree.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(84, 'services.payu.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(85, 'flutter.active', '0', '2021-03-17 14:34:48', '2021-03-17 14:34:48'),
(86, 'section1', '2', '2022-07-12 15:55:14', '2022-07-12 15:55:14'),
(87, 'section2', '3', '2022-07-12 15:55:14', '2022-07-12 15:55:14'),
(88, 'section3', '4', '2022-07-12 15:55:14', '2022-07-12 15:55:14'),
(89, 'icon', 'fab fa-facebook-f', '2022-07-12 15:55:14', '2022-07-12 15:55:14');

-- --------------------------------------------------------

--
-- Struttura della tabella `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` bigint(20) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `number`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Steve James', 'steve@explainervideos4u.info', 11394960794, 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service which we feel can benefit your site diagnosiaziendale.it.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=oYoUQjxvhA0\r\nhttps://www.youtube.com/watch?v=MOnhn77TgDE\r\nhttps://www.youtube.com/watch?v=NKY4a3hvmUc\r\n\r\nAll of our videos are in a similar animated format as the above examples and we have voice over artists with US/UK/Australian accents.\r\n\r\nThey can show a solution to a problem or simply promote one of your products or services. They are concise, can be uploaded to video such as Youtube, and can be embedded into your website or featured on landing pages.\r\n\r\nOur prices are as follows depending on video length:\r\n1 minute = $239\r\n1-2 minutes = $339\r\n2-3 minutes = $449\r\n\r\n*All prices above are in USD and include an engaging, captivating video with full script and voice-over.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to get in touch.\r\nIf you are not interested, simply delete this message and we won\'t contact you again.\r\n\r\nKind Regards,\r\nSteve', '2021-05-11 02:14:26', '2021-05-11 02:14:26'),
(2, 'Jeanna Holt', 'jeanna.holt@gmail.com', 0, 'Hi,\r\n\r\nWe’re reaching out to ask if you accept guest/sponsored posts on diagnosiaziendale.it?\r\n\r\nWe\'re an outreach agency with a client reach of approaching 26 million people, so we\'re quite confident that you\'ll receive orders from us.\r\n\r\nIf our offer is of interest to you, please complete the form here: https://backlinkpro.club/submit-your-site\r\n\r\nKind Regards,\r\nJeanna', '2021-07-01 08:16:56', '2021-07-01 08:16:56'),
(3, 'Steve Watson', 'steve@explainervideos4u.info', 355, 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service which we feel can benefit your site diagnosiaziendale.it.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=oYoUQjxvhA0\r\nhttps://www.youtube.com/watch?v=MOnhn77TgDE\r\nhttps://www.youtube.com/watch?v=NKY4a3hvmUc\r\n\r\nAll of our videos are in a similar animated format as the above examples and we have voice over artists with US/UK/Australian accents.\r\n\r\nThey can show a solution to a problem or simply promote one of your products or services. They are concise, can be uploaded to video such as Youtube, and can be embedded into your website or featured on landing pages.\r\n\r\nOur prices are as follows depending on video length:\r\n1 minute = $239\r\n1-2 minutes = $339\r\n2-3 minutes = $449\r\n\r\n*All prices above are in USD and include an engaging, captivating video with full script and voice-over.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to get in touch.\r\nIf you are not interested, simply delete this message and we won\'t contact you again.\r\n\r\nKind Regards,\r\nSteve', '2021-11-12 08:21:45', '2021-11-12 08:21:45'),
(4, 'Steve Watson', 'steve@explainervideos4u.info', 32, 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service which we feel can benefit your site diagnosiaziendale.it.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=zvGF7uRfH04\r\nhttps://www.youtube.com/watch?v=cZPsp217Iik\r\nhttps://www.youtube.com/watch?v=JHfnqS2zpU8\r\n\r\nAll of our videos are in a similar animated format as the above examples and we have voice over artists with US/UK/Australian accents.\r\nWe can also produce voice overs in languages other than English.\r\n\r\nThey can show a solution to a problem or simply promote one of your products or services. They are concise, can be uploaded to video such as Youtube, and can be embedded into your website or featured on landing pages.\r\n\r\nOur prices are as follows depending on video length:\r\n1 minute = $189\r\n1-2 minutes = $339\r\n2-3 minutes = $449\r\n\r\n*All prices above are in USD and include an engaging, captivating video with full script and voice-over.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to get in touch.\r\n\r\nKind Regards,\r\nSteve', '2021-11-13 04:23:48', '2021-11-13 04:23:48'),
(5, 'Luis Hyland', 'luis@getlisted.directory', 800, 'Hello, did you know that there are 241,120 internet directories in the world. \r\n\r\nThese websites are what drive traffic to YOUR business.\r\n\r\nWant more traffic?  Want more Sales?  We can help - today.\r\n\r\nYour website diagnosiaziendale.it is listed in only 100 of these directories. \r\n\r\nGet more traffic for your Italy audience.\r\n\r\nOur automated system adds your website to all of the directories.\r\n\r\nYou can find it here: getlisted.directory/diagnosiaziendale.it\r\n\r\nAct today, and we will expedite your listings and waive the processing charge!\r\n\r\nWe have a special going on. Use \"FRIENDS\" on checkout for a 50% discount valid today.', '2022-07-13 13:15:26', '2022-07-13 13:15:26'),
(6, 'Eric Jones', 'eric.jones.z.mail@gmail.com', 555, 'Good day, \r\n\r\nMy name is Eric and unlike a lot of emails you might get, I wanted to instead provide you with a word of encouragement – Congratulations\r\n\r\nWhat for?  \r\n\r\nPart of my job is to check out websites and the work you’ve done with diagnosiaziendale.it definitely stands out. \r\n\r\nIt’s clear you took building a website seriously and made a real investment of time and resources into making it top quality.\r\n\r\nThere is, however, a catch… more accurately, a question…\r\n\r\nSo when someone like me happens to find your site – maybe at the top of the search results (nice job BTW) or just through a random link, how do you know? \r\n\r\nMore importantly, how do you make a connection with that person?\r\n\r\nStudies show that 7 out of 10 visitors don’t stick around – they’re there one second and then gone with the wind.\r\n\r\nHere’s a way to create INSTANT engagement that you may not have known about… \r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know INSTANTLY that they’re interested – so that you can talk to that lead while they’re literally checking out diagnosiaziendale.it.\r\n\r\nCLICK HERE http://boostleadgeneration.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nIt could be a game-changer for your business – and it gets even better… once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation – immediately (and there’s literally a 100X difference between contacting someone within 5 minutes versus 30 minutes.)\r\n\r\nPlus then, even if you don’t close a deal right away, you can connect later on with text messages for new offers, content links, even just follow up notes to build a relationship.\r\n\r\nEverything I’ve just described is simple, easy, and effective. \r\n\r\nCLICK HERE http://boostleadgeneration.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://boostleadgeneration.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://boostleadgeneration.com/unsubscribe.aspx?d=diagnosiaziendale.it', '2022-07-13 23:23:24', '2022-07-13 23:23:24');

-- --------------------------------------------------------

--
-- Struttura della tabella `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - Discount, 2 - Flat Amount',
  `amount` double(8,2) NOT NULL COMMENT 'Percentage or Amount',
  `min_price` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum price to allow coupons',
  `expires_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_user_limit` int(11) NOT NULL DEFAULT 1 COMMENT '0 - Unlimited',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - Disabled, 1 - Enabled, 2 - Expired',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `description`, `code`, `type`, `amount`, `min_price`, `expires_at`, `per_user_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tttttttttttttttttt1212', 'ttttttttttttttttttttttttttt', '4545', 2, 2000.00, 1.00, '2021-10-30', 5, 0, '2021-10-13 11:48:34', '2022-01-27 15:31:43');

-- --------------------------------------------------------

--
-- Struttura della tabella `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `strike` decimal(15,2) DEFAULT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `featured` int(11) DEFAULT 0,
  `trending` int(11) DEFAULT 0,
  `popular` int(11) DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `free` tinyint(4) DEFAULT 0,
  `expire_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `courses`
--

INSERT INTO `courses` (`id`, `category_id`, `title`, `slug`, `description`, `price`, `strike`, `course_image`, `start_date`, `featured`, `trending`, `popular`, `meta_title`, `meta_description`, `meta_keywords`, `published`, `free`, `expire_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Industry', 'A_production', '<p>ASas</p>', NULL, '0.00', NULL, '2021-03-01', 1, 1, 1, NULL, NULL, NULL, 1, 1, '2021-03-31', '2021-03-08 14:39:28', '2021-03-14 08:53:39', NULL),
(2, 1, 'Service', 'A_service', '<p>asdasd</p>', NULL, '0.00', '1615182007-1b138215bd6d6ea221a6d68ff80380ba.png', '2021-03-01', 1, 1, 1, NULL, NULL, NULL, 1, 1, '2021-03-31', '2021-03-08 14:40:08', '2021-03-14 08:54:11', NULL),
(3, 1, 'Wholesale', 'wholesale', NULL, NULL, NULL, '1615708067-apparel-1850804-1920-300x207.jpg', '2021-03-01', 0, 0, 0, NULL, NULL, NULL, 1, 1, '2021-04-07', '2021-03-14 08:47:47', '2021-03-14 08:47:47', NULL),
(4, 3, 'Engineering Math', 'engineering-math', '<h1>Introduction of Derivatives | Engineering Diploma | Mathematics</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Introduction of Derivatives | Engineering Diploma | Mathematics | RKDEMY Derivative And Integration: <a href=\"https://www.youtube.com/watch?v=Km9kZejj9Cw&amp;t=0s\">https://youtu.be/Km9kZejj9Cw</a> Laplace of Derivative - Example : <a href=\"https://www.youtube.com/watch?v=KITJETvSMLA&amp;t=0s\">https://youtu.be/KITJETvSMLA</a> <a href=\"https://www.youtube.com/hashtag/derivatives\">#derivatives</a> <a href=\"https://www.youtube.com/hashtag/mathematics\">#mathematics</a> <a href=\"https://www.youtube.com/hashtag/rkdemy\">#RKDEMY</a> Call or Whatsapp for a Coupon code. For more videos Subscribe over the channel. Download App Here : <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbW9rMUFEdUxWVGNRb1NOUDV4cTVwTkhiRldxZ3xBQ3Jtc0tsdDVzMmtZVEdzZldqU1FhaUtaRHBYT2RtZzk0X0I2LW9lbGtodU1GSFBrYml4OEktOFZaYXVtOGcweUUxSmhOTmJ2Q1Z5ZlJRdFlsMUlfV2t3RHlScHpobFg0R25UZk92cmJTNWo4N1NNN1RsVTljdw&amp;q=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.osi.edutech\" target=\"_blank\">https://play.google.com/store/apps/de...</a> Follow us on : FACEBOOK : <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqa1A5U2JpMGwzWFR5Zmk5dzRONjN6VWJIbDdEd3xBQ3Jtc0ttWDBhbmwyam1ENE4za1ZtemdKV1Vqazh3V2FsSVBiQkJMUDYtT05FSXUyVEVFa0wxV2RISUFUUGE5V1o4UHI0Y1hHelV0N1UwWjdnSkJDQ3Q4TVFQcHRmdGlUeUJnQjBkWVE0aFh2ODVkemMwbk1Pbw&amp;q=https%3A%2F%2Fwww.facebook.com%2Frkdemyapp\" target=\"_blank\">https://www.facebook.com/rkdemyapp</a> INSTAGRAM : <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbmtvQ2dhN3J4RFowMWY0U3ZtYXYxVTkwUWkwUXxBQ3Jtc0tuczhacHpISXFwdnZhM3A1Zzl1Z1Rxc0JzOGNNYTNPVDdPWmhQZmNjblpvc1BlSWNoMFBaajBsbnVyWWRaXzcyUkd5QUVlei1HbVNnbzlUaGxhcThyeGlBVFFTSnotRThoX0VBUDE1MGN1VjRDQ2trQQ&amp;q=https%3A%2F%2Fwww.instagram.com%2Frkdemy%2F\" target=\"_blank\">https://www.instagram.com/rkdemy/</a> TELEGRAM : <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqa0ZtX3l5WnFWUVJmWFJvdHN1WW95WnhBcnlYUXxBQ3Jtc0ttYnpxazBjdC1nZ3NMTlk0UFZSLWxPV08wX0JTemRiRk42YW1IR1IyWnNGYUM5OGxfamhrbmF2S2Z1Z2RQVFJmZzFGcWpPVE5hTzMxanVsc2hxOXFndGRmUDUwOGlfZ2dZVG1SRGI1b2E1TWMyeGFIdw&amp;q=https%3A%2F%2Ft.me%2Fjoinchat%2FcpEaBpq-eExkZjA1\" target=\"_blank\">https://t.me/joinchat/cpEaBpq-eExkZjA1</a> Contact us on : WHATSAPP : 8879557714 Website : <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbUJaLTEtQjJacVFjdXlHU3puTkd4ejVBNWcyZ3xBQ3Jtc0trdEVScU9Pektxa3ptNlQ2M2NYZTZNb3I4dlgtc28xbUxfcmEzZVJoMXJXblVrUUZIZG9IZ0pKZlJpMkd0Z3ZRakpnRFpsclVOV09iYzlDTUMweTJvMU0zVThZVUdEcU9CTmRBWVNzMFFMNW1jcUxaVQ&amp;q=https%3A%2F%2Fwww.rkdemy.com%2F\" target=\"_blank\">https://www.rkdemy.com/</a> For more videos subscribe to our channel.</p>\r\n\r\n<p>SHOW LESS</p>', '50.00', '10.00', NULL, '2021-06-01', 1, 1, 1, 'this is civil Engineering Math', 'Introduction of Derivatives | Engineering Diploma | Mathematics', 'Derivatives | Engineering Diploma | Mathematics', 1, 1, '2021-06-30', '2021-05-31 19:04:03', '2021-05-31 19:04:03', NULL),
(5, 4, 'General Knowledge', 'GK', '<p>GK Quiz Section</p>', NULL, NULL, '1637067957-career-2.jpg', '2021-11-16', 1, 1, 1, 'Crash course gk', 'Crash course gk description', 'GK,General Knowledge, World GK', 1, 1, '2021-11-18', '2021-11-16 14:05:57', '2021-11-17 06:16:40', NULL),
(6, 1, 'B_Course', 'b_course', '<p>Test Course</p>', NULL, '0.00', '1640671541-paypal.png', '2021-12-28', 1, 0, 0, 'a,b', 'asdasdasd', 'asdsadasdasd', 1, 0, '2022-01-28', '2021-12-28 03:05:41', '2021-12-28 03:05:41', NULL),
(7, 2, 'aaa', 'aaa', '<p>&nbsp;</p>\r\n\r\n<div class=\"bootstrapiso\" data-original-title=\"\" id=\"mttContainer\" style=\"left: 0px; top: 0px; position: fixed; z-index: 100000200; width: 500px; margin-left: -250px; background-color: rgba(0, 0, 0, 0); pointer-events: none;\" title=\"\">&nbsp;</div>', '111.00', '222.00', NULL, '2022-02-02', 0, 0, 0, NULL, '123', '123', 0, 0, NULL, '2022-02-03 18:05:04', '2022-07-14 14:30:10', '2022-07-14 14:30:10');

-- --------------------------------------------------------

--
-- Struttura della tabella `course_student`
--

CREATE TABLE `course_student` (
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `course_student`
--

INSERT INTO `course_student` (`course_id`, `user_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 3, 0, '2021-03-08 15:21:54', '2021-03-08 15:21:54'),
(2, 3, 0, '2021-03-08 15:24:32', '2021-03-08 15:24:32'),
(2, 5, 0, '2021-03-08 17:50:05', '2021-03-08 17:50:05'),
(1, 6, 0, '2021-03-12 02:13:39', '2021-03-12 02:13:39'),
(2, 6, 0, '2021-03-12 02:59:26', '2021-03-12 02:59:26'),
(2, 8, 0, '2021-03-13 13:28:14', '2021-03-13 13:28:14'),
(3, 3, 0, '2021-03-14 09:07:51', '2021-03-14 09:07:51'),
(4, 3, 0, '2021-06-03 09:48:18', '2021-06-03 09:48:18'),
(1, 3, 0, '2021-03-08 15:21:54', '2021-03-08 15:21:54'),
(2, 3, 0, '2021-03-08 15:24:32', '2021-03-08 15:24:32'),
(2, 5, 0, '2021-03-08 17:50:05', '2021-03-08 17:50:05'),
(1, 6, 0, '2021-03-12 02:13:39', '2021-03-12 02:13:39'),
(2, 6, 0, '2021-03-12 02:59:26', '2021-03-12 02:59:26'),
(2, 8, 0, '2021-03-13 13:28:14', '2021-03-13 13:28:14'),
(3, 3, 0, '2021-03-14 09:07:51', '2021-03-14 09:07:51'),
(4, 3, 0, '2021-06-03 09:48:18', '2021-06-03 09:48:18'),
(1, 3, 0, '2021-03-08 15:21:54', '2021-03-08 15:21:54'),
(2, 3, 0, '2021-03-08 15:24:32', '2021-03-08 15:24:32'),
(2, 5, 0, '2021-03-08 17:50:05', '2021-03-08 17:50:05'),
(1, 6, 0, '2021-03-12 02:13:39', '2021-03-12 02:13:39'),
(2, 6, 0, '2021-03-12 02:59:26', '2021-03-12 02:59:26'),
(2, 8, 0, '2021-03-13 13:28:14', '2021-03-13 13:28:14'),
(3, 3, 0, '2021-03-14 09:07:51', '2021-03-14 09:07:51'),
(4, 3, 0, '2021-06-03 09:48:18', '2021-06-03 09:48:18'),
(5, 3, 0, '2021-11-17 06:39:23', '2021-11-17 06:39:23');

-- --------------------------------------------------------

--
-- Struttura della tabella `course_timeline`
--

CREATE TABLE `course_timeline` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `course_timeline`
--

INSERT INTO `course_timeline` (`id`, `model_type`, `model_id`, `course_id`, `sequence`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Lesson', 1, 2, 1, '2021-03-08 14:42:06', '2021-03-08 14:42:06'),
(2, 'App\\Models\\Lesson', 2, 1, 1, '2021-03-08 14:42:44', '2021-03-08 14:42:44'),
(3, 'App\\Models\\Test', 1, 1, 3, '2021-03-08 14:45:08', '2021-03-08 22:04:53'),
(4, 'App\\Models\\Test', 2, 2, 4, '2021-03-08 14:47:15', '2021-03-08 19:21:18'),
(5, 'App\\Models\\Test', 3, 2, 3, '2021-03-08 17:51:54', '2021-03-08 17:51:54'),
(6, 'App\\Models\\Test', 4, 2, 23, '2021-03-08 18:11:00', '2021-07-19 03:15:44'),
(7, 'App\\Models\\Test', 5, 2, 6, '2021-03-08 18:11:35', '2021-03-08 19:21:18'),
(8, 'App\\Models\\Test', 6, 2, 5, '2021-03-08 18:12:09', '2021-03-08 19:21:18'),
(9, 'App\\Models\\Test', 7, 2, 2, '2021-03-08 18:23:21', '2021-03-08 19:21:18'),
(10, 'App\\Models\\Test', 8, 1, 14, '2021-03-08 18:24:28', '2021-03-14 08:56:16'),
(11, 'App\\Models\\Test', 9, 1, 13, '2021-03-08 18:24:57', '2021-03-14 08:55:52'),
(12, 'App\\Models\\Test', 10, 1, 11, '2021-03-08 18:25:38', '2021-03-14 08:55:11'),
(13, 'App\\Models\\Test', 11, 1, 12, '2021-03-08 18:26:03', '2021-03-14 08:55:31'),
(14, 'App\\Models\\Test', 12, 3, 1, '2021-03-14 08:48:27', '2021-03-14 08:48:27'),
(15, 'App\\Models\\Test', 13, 3, 2, '2021-03-14 08:48:51', '2021-03-14 08:48:51'),
(16, 'App\\Models\\Test', 14, 3, 3, '2021-03-14 08:49:16', '2021-03-14 08:49:16'),
(17, 'App\\Models\\Test', 15, 3, 4, '2021-03-14 08:49:35', '2021-03-14 08:49:35'),
(18, 'App\\Models\\Test', 16, 3, 5, '2021-03-14 08:50:03', '2021-03-14 08:50:03'),
(19, 'App\\Models\\Test', 17, 3, 6, '2021-03-14 08:50:24', '2021-03-14 08:50:24'),
(20, 'App\\Models\\Test', 18, 2, 8, '2021-03-14 08:51:41', '2021-03-14 08:51:41'),
(21, 'App\\Models\\Test', 19, 2, 9, '2021-03-14 08:51:58', '2021-03-14 08:51:58'),
(22, 'App\\Models\\Test', 20, 1, 10, '2021-03-14 08:52:17', '2021-03-14 08:54:51'),
(23, 'App\\Models\\Test', 21, 1, 9, '2021-03-14 08:52:36', '2021-03-14 08:54:33'),
(24, 'App\\Models\\Test', 22, 3, 7, '2021-03-14 13:42:35', '2021-03-14 13:42:35'),
(25, 'App\\Models\\Test', 23, 1, 15, '2021-03-14 18:14:15', '2021-03-14 18:14:15'),
(26, 'App\\Models\\Test', 24, 3, 8, '2021-03-15 10:28:30', '2021-03-15 10:28:30'),
(27, 'App\\Models\\Test', 25, 3, 9, '2021-03-15 11:15:32', '2021-03-15 11:15:32'),
(28, 'App\\Models\\Test', 26, 2, 10, '2021-03-15 11:16:01', '2021-03-15 11:16:01'),
(29, 'App\\Models\\Test', 27, 3, 10, '2021-03-15 11:16:27', '2021-03-15 11:16:27'),
(30, 'App\\Models\\Test', 28, 2, 11, '2021-03-15 11:16:54', '2021-03-15 11:16:54'),
(31, 'App\\Models\\Test', 29, 3, 11, '2021-03-15 11:29:57', '2021-03-15 11:29:57'),
(32, 'App\\Models\\Test', 30, 2, 12, '2021-03-15 11:59:15', '2021-03-15 11:59:15'),
(33, 'App\\Models\\Test', 31, 3, 12, '2021-03-15 11:59:40', '2021-03-15 11:59:40'),
(34, 'App\\Models\\Test', 32, 2, 13, '2021-03-15 12:00:09', '2021-03-15 12:00:09'),
(35, 'App\\Models\\Test', 33, 3, 13, '2021-03-15 12:00:32', '2021-03-15 12:00:32'),
(36, 'App\\Models\\Test', 34, 2, 14, '2021-03-15 13:14:44', '2021-03-15 13:14:44'),
(37, 'App\\Models\\Test', 35, 2, 15, '2021-03-16 17:08:53', '2021-03-16 17:08:53'),
(38, 'App\\Models\\Test', 36, 3, 14, '2021-03-16 17:09:17', '2021-03-16 17:09:17'),
(39, 'App\\Models\\Test', 37, 2, 16, '2021-03-16 17:09:38', '2021-03-16 17:09:38'),
(40, 'App\\Models\\Test', 38, 3, 15, '2021-03-16 17:10:04', '2021-03-16 17:10:04'),
(41, 'App\\Models\\Test', 39, 1, 16, '2021-03-18 22:53:58', '2021-03-18 22:53:58'),
(42, 'App\\Models\\Test', 40, 1, 18, '2021-03-19 15:09:59', '2021-03-19 15:10:50'),
(43, 'App\\Models\\Test', 41, 2, 18, '2021-03-19 15:10:22', '2021-03-19 15:58:09'),
(44, 'App\\Models\\Test', 42, 3, 16, '2021-03-19 15:11:14', '2021-03-19 15:11:14'),
(45, 'App\\Models\\Test', 43, 1, 19, '2021-03-19 15:11:32', '2021-03-19 15:11:32'),
(46, 'App\\Models\\Test', 44, 2, 17, '2021-03-19 15:11:52', '2021-03-19 15:58:09'),
(47, 'App\\Models\\Test', 45, 3, 17, '2021-03-19 15:12:18', '2021-03-19 15:12:18'),
(48, 'App\\Models\\Lesson', 3, 2, 22, '2021-03-28 08:28:15', '2021-05-25 13:32:48'),
(49, 'App\\Models\\Test', 46, 2, 20, '2021-04-08 08:11:56', '2021-04-08 08:11:56'),
(50, 'App\\Models\\Test', 47, 2, 21, '2021-04-08 08:12:19', '2021-04-08 08:12:19'),
(51, 'App\\Models\\Test', 48, 3, 18, '2021-04-08 08:12:52', '2021-04-08 08:12:52'),
(52, 'App\\Models\\Test', 49, 3, 19, '2021-04-08 08:13:11', '2021-04-08 08:13:11'),
(53, 'App\\Models\\Lesson', 4, 4, 1, '2021-05-31 19:09:47', '2021-05-31 19:09:47'),
(54, 'App\\Models\\Test', 50, 4, 2, '2021-05-31 19:10:49', '2021-05-31 19:10:49'),
(55, 'App\\Models\\Test', 51, 4, 3, '2021-07-14 07:40:55', '2021-07-14 07:40:55'),
(56, 'App\\Models\\Test', 52, 1, 20, '2021-07-15 08:37:46', '2021-07-15 08:37:46'),
(57, 'App\\Models\\Test', 53, 1, 21, '2021-08-28 12:08:00', '2021-08-28 12:08:00'),
(58, 'App\\Models\\Test', 54, 5, 3, '2021-11-16 14:35:53', '2021-11-17 06:25:38'),
(59, 'App\\Models\\Lesson', 5, 5, 2, '2021-11-17 06:22:59', '2021-11-17 06:22:59'),
(60, 'App\\Models\\Test', 55, 3, 20, '2021-11-26 15:09:23', '2021-11-26 15:09:23'),
(61, 'App\\Models\\Test', 56, 3, 21, '2021-11-26 15:10:06', '2021-11-26 15:10:06'),
(62, 'App\\Models\\Test', 57, 2, 24, '2021-11-29 14:21:42', '2021-11-29 14:21:42'),
(63, 'App\\Models\\Test', 58, 2, 25, '2021-11-29 14:22:07', '2021-11-29 14:22:07'),
(64, 'App\\Models\\Test', 59, 2, 26, '2021-12-10 09:49:24', '2021-12-10 09:49:24'),
(65, 'App\\Models\\Lesson', 6, 6, 1, '2021-12-28 03:07:02', '2021-12-28 03:07:02'),
(66, 'App\\Models\\Test', 60, 6, 2, '2021-12-28 03:07:59', '2021-12-28 03:07:59'),
(67, 'App\\Models\\Test', 61, 6, 3, '2022-01-18 03:55:54', '2022-01-18 03:55:54'),
(68, 'App\\Models\\Test', 62, 1, 22, '2022-02-19 05:44:53', '2022-02-19 05:44:53'),
(69, 'App\\Models\\Lesson', 7, 1, 24, '2022-02-19 05:46:53', '2022-02-19 05:47:05'),
(70, 'App\\Models\\Lesson', 8, 1, 25, '2022-02-19 05:48:09', '2022-02-19 05:48:09'),
(71, 'App\\Models\\Test', 63, 6, 4, '2022-06-09 12:01:36', '2022-06-09 12:01:36'),
(72, 'App\\Models\\Test', 64, 6, 5, '2022-06-21 10:45:37', '2022-06-21 10:45:37'),
(73, 'App\\Models\\Test', 65, 6, 6, '2022-06-30 06:23:52', '2022-06-30 06:23:52'),
(74, 'App\\Models\\Test', 66, 1, 26, '2022-06-30 06:24:15', '2022-06-30 06:24:15'),
(75, 'App\\Models\\Test', 67, 6, 7, '2022-07-06 17:03:06', '2022-07-06 17:03:06'),
(76, 'App\\Models\\Test', 68, 6, 8, '2022-07-06 19:37:16', '2022-07-06 19:37:16'),
(77, 'App\\Models\\Test', 69, 6, 9, '2022-07-07 06:21:30', '2022-07-07 06:21:30'),
(78, 'App\\Models\\Test', 70, 6, 10, '2022-07-07 06:21:58', '2022-07-07 06:21:58'),
(79, 'App\\Models\\Test', 71, 6, 11, '2022-07-08 16:43:30', '2022-07-08 16:43:30'),
(80, 'App\\Models\\Test', 72, 6, 12, '2022-07-08 16:47:12', '2022-07-08 16:47:12'),
(81, 'App\\Models\\Test', 73, 6, 13, '2022-07-08 17:10:36', '2022-07-08 17:10:36'),
(82, 'App\\Models\\Test', 74, 6, 16, '2022-07-10 12:46:00', '2022-07-10 12:50:43'),
(83, 'App\\Models\\Test', 75, 6, 17, '2022-07-11 05:22:24', '2022-07-11 05:22:24'),
(84, 'App\\Models\\Test', 76, 6, 18, '2022-07-11 05:22:44', '2022-07-11 05:22:44'),
(85, 'App\\Models\\Test', 77, 6, 19, '2022-07-13 17:11:19', '2022-07-13 17:11:19'),
(86, 'App\\Models\\Test', 78, 6, 21, '2022-07-14 05:36:33', '2022-07-14 05:39:30'),
(87, 'App\\Models\\Test', 79, 1, 28, '2022-07-14 05:37:09', '2022-07-14 05:40:05'),
(88, 'App\\Models\\Test', 80, 2, 27, '2022-07-14 05:40:32', '2022-07-14 05:40:32'),
(89, 'App\\Models\\Lesson', 9, 6, 23, '2022-07-14 14:32:35', '2022-07-14 14:33:56'),
(90, 'App\\Models\\Lesson', 10, 6, 25, '2022-07-14 14:47:56', '2022-07-14 14:50:18');

-- --------------------------------------------------------

--
-- Struttura della tabella `course_user`
--

CREATE TABLE `course_user` (
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `course_user`
--

INSERT INTO `course_user` (`course_id`, `user_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_price` decimal(8,2) NOT NULL,
  `amount` decimal(5,2) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disbaled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `free_lesson` tinyint(4) DEFAULT 1,
  `published` tinyint(4) DEFAULT 0,
  `live_lesson` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `title`, `slug`, `lesson_image`, `short_text`, `full_text`, `position`, `free_lesson`, `published`, `live_lesson`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'lesson_service1', 'asda', NULL, 'asd', '<p>asd</p>', 1, 1, 1, 0, '2021-03-08 14:42:06', '2021-03-08 14:42:06', NULL),
(2, 1, 'lesson_production1', 'lesson-production1', NULL, 'asdasd', NULL, 1, 1, 1, 0, '2021-03-08 14:42:25', '2021-03-08 14:42:44', NULL),
(3, 2, 'dfgdfgd', 'dfgdfgd', NULL, 'ddfgdf', NULL, 2, 1, 1, 0, '2021-03-28 08:28:15', '2021-03-28 08:28:15', NULL),
(4, 4, 'Integration', 'integration', NULL, NULL, NULL, 1, 1, 1, 0, '2021-05-31 19:09:47', '2021-05-31 19:09:47', NULL),
(5, 5, 'GK-Title-Test', 'GK-Slug-Test', '1637126578-gk.jpg', 'GK-Short Text-Test', '<p>GK-Full Text -Test</p>', 1, 1, 1, 0, '2021-11-17 06:22:58', '2021-11-17 06:22:58', NULL),
(6, 6, 'B Leason 1', 'b_leason_1', '1640671622-visa.png', 'test leason b course', '<p>test leason b course</p>', 1, 1, 1, 0, '2021-12-28 03:07:02', '2021-12-28 03:07:02', NULL),
(7, 1, 'test1-industry', 'test1-industry', NULL, 'one to one', NULL, NULL, 1, 1, 1, '2022-02-19 05:46:53', '2022-02-19 05:46:53', NULL),
(8, 1, 'test2', 'test2', NULL, 'test2', '<p>This is test2</p>', 2, 1, 1, 0, '2022-02-19 05:48:09', '2022-02-19 05:48:09', NULL),
(9, 6, 'prova', 'prova', NULL, 'hghjghjghjghj', '<p>fsdfdsfsdfdsfds</p>\r\n\r\n<p>dgdfgdfgdf</p>\r\n\r\n<p>dfgdfgdfgdfg</p>\r\n\r\n<p>dsfdsafasfsfssd</p>', 2, 1, 1, 0, '2022-07-14 14:32:35', '2022-07-14 14:33:56', NULL),
(10, 6, 'prova lezione b course', 'prova-lezione-b-course', NULL, 'hghjghjklhklhkhlk', '<p>gjkgjkgjkgjgjkgjkgjkgjk</p>\r\n\r\n<p>ghghjgjhg</p>', 3, 1, 1, 0, '2022-07-14 14:47:56', '2022-07-14 14:50:18', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `lesson_slot_bookings`
--

CREATE TABLE `lesson_slot_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `live_lesson_slot_id` int(10) UNSIGNED DEFAULT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `live_lesson_slots`
--

CREATE TABLE `live_lesson_slots` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'agenda',
  `start_at` datetime NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'minutes',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meeting password',
  `student_limit` int(11) DEFAULT NULL,
  `start_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `join_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `locales`
--

CREATE TABLE `locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr' COMMENT 'ltr - Left to right, rtl - Right to Left',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `locales`
--

INSERT INTO `locales` (`id`, `name`, `short_name`, `display_type`, `is_default`, `created_at`, `updated_at`) VALUES
(9, 'English', 'en', 'ltr', 0, '2022-02-19 02:36:03', '2022-07-22 04:48:51'),
(13, NULL, 'fr', 'ltr', 0, '2022-07-22 00:18:21', '2022-07-22 04:48:51'),
(14, NULL, 'it', 'ltr', 1, '2022-07-22 00:18:51', '2022-07-22 04:48:51');

-- --------------------------------------------------------

--
-- Struttura della tabella `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(8965, 0, 'en', 'vendor/backup', 'exception_message', 'Exception message: :message', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8966, 0, 'en', 'vendor/backup', 'exception_trace', 'Exception trace: :trace', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8967, 0, 'en', 'vendor/backup', 'exception_message_title', 'Exception message', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8968, 0, 'en', 'vendor/backup', 'exception_trace_title', 'Exception trace', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8969, 0, 'en', 'vendor/backup', 'backup_failed_subject', 'Failed backup of :application_name', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8970, 0, 'en', 'vendor/backup', 'backup_failed_body', 'Important: An error occurred while backing up :application_name', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8971, 0, 'en', 'vendor/backup', 'backup_successful_subject', 'Successful new backup of :application_name', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8972, 0, 'en', 'vendor/backup', 'backup_successful_subject_title', 'Successful new backup!', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8973, 0, 'en', 'vendor/backup', 'backup_successful_body', 'Great news, a new backup of :application_name was successfully created on the disk named :disk_name.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8974, 0, 'en', 'vendor/backup', 'cleanup_failed_subject', 'Cleaning up the backups of :application_name failed.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8975, 0, 'en', 'vendor/backup', 'cleanup_failed_body', 'An error occurred while cleaning up the backups of :application_name', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8976, 0, 'en', 'vendor/backup', 'cleanup_successful_subject', 'Clean up of :application_name backups successful', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8977, 0, 'en', 'vendor/backup', 'cleanup_successful_subject_title', 'Clean up of backups successful!', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8978, 0, 'en', 'vendor/backup', 'cleanup_successful_body', 'The clean up of the :application_name backups on the disk named :disk_name was successful.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8979, 0, 'en', 'vendor/backup', 'healthy_backup_found_subject', 'The backups for :application_name on disk :disk_name are healthy', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8980, 0, 'en', 'vendor/backup', 'healthy_backup_found_subject_title', 'The backups for :application_name are healthy', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8981, 0, 'en', 'vendor/backup', 'healthy_backup_found_body', 'The backups for :application_name are considered healthy. Good job!', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8982, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_subject', 'Important: The backups for :application_name are unhealthy', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8983, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_subject_title', 'Important: The backups for :application_name are unhealthy. :problem', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8984, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_body', 'The backups for :application_name on disk :disk_name are unhealthy.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8985, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_not_reachable', 'The backup destination cannot be reached. :error', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8986, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_empty', 'There are no backups of this application at all.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8987, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_old', 'The latest backup made on :date is considered too old.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8988, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_unknown', 'Sorry, an exact reason cannot be determined.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(8989, 0, 'en', 'vendor/backup', 'unhealthy_backup_found_full', 'The backups are using too much storage. Current usage is :disk_usage which is higher than the allowed limit of :disk_limit.', '2022-02-12 13:39:07', '2022-02-16 17:18:25'),
(9100, 0, 'en', 'vendor/chatter', 'success.title', 'Well done!', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9101, 1, 'en', 'vendor/chatter', 'success.reason.submitted_to_post', 'Response successfully submitted to discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9102, 1, 'en', 'vendor/chatter', 'success.reason.updated_post', 'Successfully updated the discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9103, 1, 'en', 'vendor/chatter', 'success.reason.destroy_post', 'Successfully deleted the response and discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9104, 1, 'en', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'Successfully deleted the response from the discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9105, 1, 'en', 'vendor/chatter', 'success.reason.created_discussion', 'Successfully created a new discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9106, 0, 'en', 'vendor/chatter', 'info.title', 'Heads Up!', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9107, 0, 'en', 'vendor/chatter', 'warning.title', 'Wuh Oh!', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9108, 0, 'en', 'vendor/chatter', 'danger.title', 'Oh Snap!', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9109, 0, 'en', 'vendor/chatter', 'danger.reason.errors', 'Please fix the following errors:', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9110, 0, 'en', 'vendor/chatter', 'danger.reason.prevent_spam', 'In order to prevent spam, please allow at least :minutes in between submitting content.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9111, 0, 'en', 'vendor/chatter', 'danger.reason.trouble', 'Sorry, there seems to have been a problem submitting your response.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9112, 0, 'en', 'vendor/chatter', 'danger.reason.update_post', 'Nah ah ah... Could not update your response. Make sure you\'re not doing anything shady.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9113, 0, 'en', 'vendor/chatter', 'danger.reason.destroy_post', 'Nah ah ah... Could not delete the response. Make sure you\'re not doing anything shady.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9114, 1, 'en', 'vendor/chatter', 'danger.reason.create_discussion', 'Whoops :( There seems to be a problem creating your discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9115, 0, 'en', 'vendor/chatter', 'danger.reason.title_required', 'Please write a title', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9116, 0, 'en', 'vendor/chatter', 'danger.reason.title_min', 'The title has to have at least :min characters.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9117, 0, 'en', 'vendor/chatter', 'danger.reason.title_max', 'The title has to have no more than :max characters.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9118, 0, 'en', 'vendor/chatter', 'danger.reason.content_required', 'Please write some content', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9119, 0, 'en', 'vendor/chatter', 'danger.reason.content_min', 'The content has to have at least :min characters', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9120, 0, 'en', 'vendor/chatter', 'danger.reason.category_required', 'Please choose a category', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9121, 0, 'en', 'vendor/chatter', 'preheader', 'Just wanted to let you know that someone has responded to a forum post.', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9122, 0, 'en', 'vendor/chatter', 'greeting', 'Hi there,', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9123, 0, 'en', 'vendor/chatter', 'body', 'Just wanted to let you know that someone has responded to a forum post at', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9124, 1, 'en', 'vendor/chatter', 'view_discussion', 'View the discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9125, 0, 'en', 'vendor/chatter', 'farewell', 'Have a great day!', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9126, 0, 'en', 'vendor/chatter', 'unsuscribe.message', 'If you no longer wish to be notified when someone responds to this form post be sure to uncheck the notification setting at the bottom of the page :)', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9127, 0, 'en', 'vendor/chatter', 'unsuscribe.action', 'Don\'t like these emails?', '2022-02-12 13:39:09', '2022-02-16 17:18:26'),
(9128, 1, 'en', 'vendor/chatter', 'unsuscribe.link', 'Unsubscribe to this discussion.', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9129, 0, 'en', 'vendor/chatter', 'titles.discussion', 'Discussion', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9130, 0, 'en', 'vendor/chatter', 'titles.discussions', 'Discussions', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9131, 0, 'en', 'vendor/chatter', 'headline', 'Welcome to Chatter', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9132, 0, 'en', 'vendor/chatter', 'description', 'A simple forum package for your Laravel app.', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9133, 0, 'en', 'vendor/chatter', 'words.cancel', 'Cancel', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9134, 0, 'en', 'vendor/chatter', 'words.delete', 'Delete', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9135, 0, 'en', 'vendor/chatter', 'words.edit', 'Edit', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9136, 0, 'en', 'vendor/chatter', 'words.yes', 'Yes', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9137, 0, 'en', 'vendor/chatter', 'words.no', 'No', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9138, 0, 'en', 'vendor/chatter', 'words.minutes', '1 minute| :count minutes', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9139, 1, 'en', 'vendor/chatter', 'discussion.new', 'New Discussion', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9140, 1, 'en', 'vendor/chatter', 'discussion.all', 'All Discussion', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9141, 1, 'en', 'vendor/chatter', 'discussion.create', 'Create Discussion', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9142, 0, 'en', 'vendor/chatter', 'discussion.posted_by', 'Posted by', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9143, 0, 'en', 'vendor/chatter', 'discussion.head_details', 'Posted in Category', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9144, 0, 'en', 'vendor/chatter', 'response.confirm', 'Are you sure you want to delete this response?', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9145, 0, 'en', 'vendor/chatter', 'response.yes_confirm', 'Yes Delete It', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9146, 0, 'en', 'vendor/chatter', 'response.no_confirm', 'No Thanks', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9147, 0, 'en', 'vendor/chatter', 'response.submit', 'Submit response', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9148, 0, 'en', 'vendor/chatter', 'response.update', 'Update Response', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9149, 1, 'en', 'vendor/chatter', 'editor.title', 'Title of Discussion', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9150, 0, 'en', 'vendor/chatter', 'editor.select', 'Select a Category', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9151, 1, 'en', 'vendor/chatter', 'editor.tinymce_placeholder', 'Type Your Discussion Here...', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9152, 1, 'en', 'vendor/chatter', 'editor.select_color_text', 'Select a Color for this Discussion (optional)', '2022-02-12 13:39:09', '2022-02-12 13:39:09'),
(9153, 0, 'en', 'vendor/chatter', 'email.notify', 'Notify me when someone replies', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9154, 0, 'en', 'vendor/chatter', 'auth', 'Please <a href=\"/:home/login\">login</a>\n                or <a href=\"/:home/register\">register</a>\n                to leave a response.', '2022-02-12 13:39:09', '2022-02-16 17:18:27'),
(9267, 0, 'en', 'vendor/cookieConsent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9268, 0, 'en', 'vendor/cookieConsent', 'agree', 'Allow cookies', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9279, 0, 'en', 'vendor/log-viewer', 'all', 'All', '2022-02-12 13:39:11', '2022-02-12 13:39:11'),
(9280, 0, 'en', 'vendor/log-viewer', 'date', 'Date', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9281, 0, 'en', 'vendor/log-viewer', 'emergency', 'Emergency', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9282, 0, 'en', 'vendor/log-viewer', 'alert', 'Alert', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9283, 0, 'en', 'vendor/log-viewer', 'critical', 'Critical', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9284, 0, 'en', 'vendor/log-viewer', 'error', 'Error', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9285, 0, 'en', 'vendor/log-viewer', 'warning', 'Warning', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9286, 0, 'en', 'vendor/log-viewer', 'notice', 'Notice', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9287, 0, 'en', 'vendor/log-viewer', 'info', 'Info', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9288, 0, 'en', 'vendor/log-viewer', 'debug', 'Debug', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9295, 0, 'en', 'vendor/read-time', 'reads_left_to_right', '1', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9296, 0, 'en', 'vendor/read-time', 'min', 'min', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9297, 0, 'en', 'vendor/read-time', 'minute', 'minute', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9298, 0, 'en', 'vendor/read-time', 'sec', 'sec', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9299, 0, 'en', 'vendor/read-time', 'second', 'second', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9300, 0, 'en', 'vendor/read-time', 'read', 'read', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9301, 0, 'en', 'vendor/self-diagnosis', 'app_key_is_set.message', 'The application key is not set. Call \"php artisan key:generate\" to create and set one.', '2022-02-12 13:39:11', '2022-02-16 17:18:28'),
(9302, 0, 'en', 'vendor/self-diagnosis', 'app_key_is_set.name', 'App key is set', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9303, 0, 'en', 'vendor/self-diagnosis', 'composer_with_dev_dependencies_is_up_to_date.message', 'Your composer dependencies are not up to date. Call \"composer install\" to update them. :more', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9304, 0, 'en', 'vendor/self-diagnosis', 'composer_with_dev_dependencies_is_up_to_date.name', 'Composer dependencies (including dev) are up to date', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9305, 0, 'en', 'vendor/self-diagnosis', 'composer_without_dev_dependencies_is_up_to_date.message', 'Your composer dependencies are not up to date. Call \"composer install\" to update them. :more', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9306, 0, 'en', 'vendor/self-diagnosis', 'composer_without_dev_dependencies_is_up_to_date.name', 'Composer dependencies (without dev) are up to date', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9307, 0, 'en', 'vendor/self-diagnosis', 'configuration_is_cached.message', 'Your configuration should be cached in production for better performance. Call \"php artisan config:cache\" to create the configuration cache.', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9308, 0, 'en', 'vendor/self-diagnosis', 'configuration_is_cached.name', 'Configuration is cached', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9309, 0, 'en', 'vendor/self-diagnosis', 'configuration_is_not_cached.message', 'Your configuration files should not be cached during development. Call \"php artisan config:clear\" to clear the configuration cache.', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9310, 0, 'en', 'vendor/self-diagnosis', 'configuration_is_not_cached.name', 'Configuration is not cached', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9311, 1, 'en', 'vendor/self-diagnosis', 'correct_php_version_is_installed.message', 'You do not have the required PHP version installed.\nRequired: :required\nUsed: :used', '2022-02-12 13:39:11', '2022-02-19 00:46:43'),
(9312, 0, 'en', 'vendor/self-diagnosis', 'correct_php_version_is_installed.name', 'The correct PHP version is installed', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9313, 0, 'en', 'vendor/self-diagnosis', 'database_can_be_accessed.message', 'The database can not be accessed: :error', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9314, 0, 'en', 'vendor/self-diagnosis', 'database_can_be_accessed.name', 'The database can be accessed', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9315, 0, 'en', 'vendor/self-diagnosis', 'debug_mode_is_not_enabled.message', 'You should not use debug mode in production. Set \"APP_DEBUG\" in the .env file to \"false\".', '2022-02-12 13:39:11', '2022-02-16 17:18:29'),
(9316, 0, 'en', 'vendor/self-diagnosis', 'debug_mode_is_not_enabled.name', 'Debug mode is not enabled', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9317, 1, 'en', 'vendor/self-diagnosis', 'directories_have_correct_permissions.message', 'The following directories are not writable:\n:directories', '2022-02-12 13:39:12', '2022-02-19 00:46:43'),
(9318, 0, 'en', 'vendor/self-diagnosis', 'directories_have_correct_permissions.name', 'All directories have the correct permissions', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9319, 0, 'en', 'vendor/self-diagnosis', 'env_file_exists.message', 'The .env file does not exist. Please copy your .env.example file as .env and adjust accordingly.', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9320, 0, 'en', 'vendor/self-diagnosis', 'env_file_exists.name', 'The environment file exists', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9321, 1, 'en', 'vendor/self-diagnosis', 'example_environment_variables_are_set.message', 'These environment variables are missing in your .env file, but are defined in your .env.example:\n:variables', '2022-02-12 13:39:12', '2022-02-19 00:46:43'),
(9322, 0, 'en', 'vendor/self-diagnosis', 'example_environment_variables_are_set.name', 'The example environment variables are set', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9323, 0, 'en', 'vendor/self-diagnosis', 'migrations_are_up_to_date.message.need_to_migrate', 'You need to update your database. Call \"php artisan migrate\" to run migrations.', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9324, 0, 'en', 'vendor/self-diagnosis', 'migrations_are_up_to_date.message.unable_to_check', 'Unable to check for migrations: :reason', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9325, 0, 'en', 'vendor/self-diagnosis', 'migrations_are_up_to_date.name', 'The migrations are up to date', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9326, 1, 'en', 'vendor/self-diagnosis', 'php_extensions_are_disabled.message', 'The following extensions are still enabled:\n:extensions', '2022-02-12 13:39:12', '2022-02-19 00:46:43'),
(9327, 0, 'en', 'vendor/self-diagnosis', 'php_extensions_are_disabled.name', 'Unwanted PHP extensions are disabled', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9328, 1, 'en', 'vendor/self-diagnosis', 'php_extensions_are_installed.message', 'The following extensions are missing:\n:extensions', '2022-02-12 13:39:12', '2022-02-19 00:46:43'),
(9329, 0, 'en', 'vendor/self-diagnosis', 'php_extensions_are_installed.name', 'The required PHP extensions are installed', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9330, 0, 'en', 'vendor/self-diagnosis', 'routes_are_cached.message', 'Your routes should be cached in production for better performance. Call \"php artisan route:cache\" to create the route cache.', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9331, 0, 'en', 'vendor/self-diagnosis', 'routes_are_cached.name', 'Routes are cached', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9332, 0, 'en', 'vendor/self-diagnosis', 'routes_are_not_cached.message', 'Your routes should not be cached during development. Call \"php artisan route:clear\" to clear the route cache.', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9333, 0, 'en', 'vendor/self-diagnosis', 'routes_are_not_cached.name', 'Routes are not cached', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9334, 0, 'en', 'vendor/self-diagnosis', 'storage_directory_is_linked.message', 'The storage directory is not linked. Use \"php artisan storage:link\" to create a symbolic link.', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9335, 0, 'en', 'vendor/self-diagnosis', 'storage_directory_is_linked.name', 'The storage directory is linked', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9336, 0, 'en', 'vendor/self-diagnosis', 'self_diagnosis.common_checks', 'Common Checks', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9337, 0, 'en', 'vendor/self-diagnosis', 'self_diagnosis.environment_specific_checks', 'Environment Specific Checks (:environment)', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9338, 0, 'en', 'vendor/self-diagnosis', 'self_diagnosis.failed_checks', 'The following checks failed:', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9339, 0, 'en', 'vendor/self-diagnosis', 'self_diagnosis.running_check', '<fg=yellow>Running check :current/:max:</fg=yellow> :name...  ', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9340, 0, 'en', 'vendor/self-diagnosis', 'self_diagnosis.success', 'Good job, looks like you are all set up!', '2022-02-12 13:39:12', '2022-02-16 17:18:29'),
(9341, 0, 'en', 'alerts', 'backend.general.created', 'Created successfully.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9342, 0, 'en', 'alerts', 'backend.general.slug_exist', 'Record with same slug exist, please update the slug.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9343, 0, 'en', 'alerts', 'backend.general.error', 'Something went wrong. Try Again', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9344, 0, 'en', 'alerts', 'backend.general.updated', 'Updated successfully.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9345, 0, 'en', 'alerts', 'backend.general.deleted', 'Deleted successfully.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9346, 0, 'en', 'alerts', 'backend.general.restored', 'Restored successfully.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9347, 0, 'en', 'alerts', 'backend.general.cancelled', 'Update Cancelled.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9348, 0, 'en', 'alerts', 'backend.general.unverified', 'Unverified Update files.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9349, 0, 'en', 'alerts', 'backend.general.backup_warning', 'Please fill necessary details for backup', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9350, 0, 'en', 'alerts', 'backend.general.delete_warning', 'You can not delete course. Students are already enrolled. Unpublish the course instead', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9351, 0, 'en', 'alerts', 'backend.general.delete_warning_bundle', 'You can not delete Bundle. Students are already enrolled. Unpublish the Bundle instead', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9352, 0, 'en', 'alerts', 'backend.general.teacher_delete_warning', 'You can not delete teacher. Courses are already added. Change the status instead', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9353, 0, 'en', 'alerts', 'backend.roles.created', 'The role was successfully created.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9354, 0, 'en', 'alerts', 'backend.roles.updated', 'The role was successfully updated.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9355, 0, 'en', 'alerts', 'backend.roles.deleted', 'The role was successfully deleted.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9356, 0, 'en', 'alerts', 'backend.users.cant_resend_confirmation', 'The application is currently set to manually approve users.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9357, 0, 'en', 'alerts', 'backend.users.confirmation_email', 'A new confirmation e-mail has been sent to the address on file.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9358, 0, 'en', 'alerts', 'backend.users.confirmed', 'The user was successfully confirmed.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9359, 0, 'en', 'alerts', 'backend.users.unconfirmed', 'The user was successfully un-confirmed', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9360, 0, 'en', 'alerts', 'backend.users.created', 'The user was successfully created.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9361, 0, 'en', 'alerts', 'backend.users.updated', 'The user was successfully updated.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9362, 0, 'en', 'alerts', 'backend.users.deleted', 'The user was successfully deleted.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9363, 0, 'en', 'alerts', 'backend.users.updated_password', 'The user\'s password was successfully updated.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9364, 0, 'en', 'alerts', 'backend.users.session_cleared', 'The user\'s session was successfully cleared.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9365, 0, 'en', 'alerts', 'backend.users.social_deleted', 'Social Account Successfully Removed', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9366, 0, 'en', 'alerts', 'backend.users.deleted_permanently', 'The user was deleted permanently.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9367, 0, 'en', 'alerts', 'backend.users.restored', 'The user was successfully restored.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9368, 0, 'en', 'alerts', 'backend.stripe_plan.stripe_credentials', 'Stripe credentials not available', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9369, 0, 'en', 'alerts', 'frontend.contact.sent', 'Your information was successfully sent. We will respond back to the e-mail provided as soon as we can.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9370, 0, 'en', 'alerts', 'frontend.course.completed', 'Congratulations! You\'ve successfully completed course. Checkout your certificate in dashboard', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9371, 0, 'en', 'alerts', 'frontend.course.slot_booking', 'Live lesson slot booking successfully', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9372, 0, 'en', 'alerts', 'frontend.course.subscription_plan_expired', 'Your Subscription Plan Expired', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9373, 0, 'en', 'alerts', 'frontend.course.subscription_plan_cancelled', 'Your Subscription Plan Cancelled', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9374, 0, 'en', 'alerts', 'frontend.course.sub_course_limit_over', 'Your Subscription Plan Course Limit Over', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9375, 0, 'en', 'alerts', 'frontend.course.sub_bundle_limit_over', 'Your Subscription Plan Bundle Limit Over', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9376, 0, 'en', 'alerts', 'frontend.course.sub_course_success', 'Course Subscribe Successfully', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9377, 0, 'en', 'alerts', 'frontend.course.sub_bundle_success', 'Bundle Subscribe Successfully', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9378, 0, 'en', 'alerts', 'frontend.course.sub_course_not_access', 'Your Subscription Plan Not Any Course Access', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9379, 0, 'en', 'alerts', 'frontend.course.sub_bundle_not_access', 'Your Subscription Plan Not Any Bundle Access', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9380, 0, 'en', 'alerts', 'frontend.duplicate_course', 'is already course purchased.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9381, 0, 'en', 'alerts', 'frontend.duplicate_bundle', 'is already bundle purchased.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9382, 0, 'en', 'alerts', 'frontend.wishlist.exist', 'This course already in wishlist', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9383, 0, 'en', 'alerts', 'frontend.wishlist.added', 'Course added successfully in wishlist', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9384, 0, 'en', 'auth', 'general_error', 'You do not have access to do that.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9385, 0, 'en', 'auth', 'socialite.unacceptable', ':provider is not an acceptable login type.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9386, 0, 'en', 'auth', 'password_rules', 'Your password must be more than 8 characters long, should contain at least 1 uppercase, 1 lowercase and 1 number.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9387, 0, 'en', 'auth', 'password_used', 'You can not set a password that you have previously used.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9388, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9389, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9390, 0, 'en', 'auth', 'unknown', 'An unknown error occurred', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9391, 0, 'en', 'buttons', 'general.crud.edit', 'Edit', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9392, 0, 'en', 'buttons', 'general.crud.delete', 'Delete', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9393, 0, 'en', 'buttons', 'general.crud.view', 'View', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9394, 0, 'en', 'buttons', 'general.crud.create', 'Create', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9395, 0, 'en', 'buttons', 'general.crud.update', 'Update', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9396, 0, 'en', 'buttons', 'general.crud.generate', 'Generate', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9397, 0, 'en', 'buttons', 'general.cancel', 'Cancel', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9398, 0, 'en', 'buttons', 'general.continue', 'Continue', '2022-02-16 17:17:53', '2022-07-22 00:14:05'),
(9399, 0, 'en', 'buttons', 'general.save', 'Save', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9400, 0, 'en', 'buttons', 'general.view', 'View', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9401, 0, 'en', 'buttons', 'backend.access.users.unconfirm', 'Un-confirm', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9402, 0, 'en', 'buttons', 'backend.access.users.confirm', 'Confirm', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9403, 0, 'en', 'buttons', 'backend.access.users.unlink', 'Unlink', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9404, 0, 'en', 'buttons', 'backend.access.users.login_as', 'Login As :user', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9405, 0, 'en', 'buttons', 'backend.access.users.clear_session', 'Clear Session', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9406, 0, 'en', 'buttons', 'backend.access.users.change_password', 'Change Password', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9407, 0, 'en', 'buttons', 'backend.access.users.activate', 'Activate', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9408, 0, 'en', 'buttons', 'backend.access.users.deactivate', 'Deactivate', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9409, 0, 'en', 'buttons', 'backend.access.users.resend_email', 'Resend Confirmation E-mail', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9410, 0, 'en', 'buttons', 'backend.access.users.delete_permanently', 'Delete Permanently', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9411, 0, 'en', 'buttons', 'backend.access.users.restore_user', 'Restore User', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9412, 0, 'en', 'buttons', 'emails.auth.confirm_account', 'Confirm Account', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9413, 0, 'en', 'buttons', 'emails.auth.reset_password', 'Reset Password', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9414, 0, 'en', 'configmanager', 'title', 'Config Manager', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9415, 0, 'en', 'configmanager', 'info_choose', 'Choose a file to start editing', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9416, 0, 'en', 'configmanager', 'file', 'File', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9417, 0, 'en', 'configmanager', 'path', 'Path', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9418, 0, 'en', 'configmanager', 'header.key', 'Key', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9419, 0, 'en', 'configmanager', 'header.value', 'Value', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9420, 0, 'en', 'configmanager', 'header.actions', 'Actions', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9421, 0, 'en', 'configmanager', 'actions.edit', 'Edit', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9422, 0, 'en', 'configmanager', 'actions.confirm', 'Save new key', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9423, 0, 'en', 'configmanager', 'actions.save', 'Save!', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9424, 0, 'en', 'configmanager', 'actions.cancel', 'Cancel', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9425, 0, 'en', 'configmanager', 'sure', 'Are you sure?', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9426, 0, 'en', 'custom-menu', 'nav-menu.blog', 'Blog', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9427, 0, 'en', 'custom-menu', 'nav-menu.courses', 'Courses', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9428, 0, 'en', 'custom-menu', 'nav-menu.bundles', 'Bundles', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9429, 0, 'en', 'custom-menu', 'nav-menu.forums', 'Forums', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9430, 0, 'en', 'custom-menu', 'nav-menu.contact', 'Contact', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9431, 0, 'en', 'custom-menu', 'nav-menu.about-us', 'About Us', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9432, 0, 'en', 'datatable', 'colvis', 'Column Visibility', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9433, 0, 'en', 'datatable', 'csv', 'CSV', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9434, 0, 'en', 'datatable', 'pdf', 'PDF', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9435, 0, 'en', 'exceptions', 'backend.access.roles.cant_delete_admin', 'You can not delete the Administrator role.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9436, 0, 'en', 'exceptions', 'backend.access.roles.needs_permission', 'You must select at least one permission for this role.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9437, 0, 'en', 'exceptions', 'backend.access.roles.create_error', 'There was a problem creating this role. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9438, 0, 'en', 'exceptions', 'backend.access.roles.update_error', 'There was a problem updating this role. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9439, 0, 'en', 'exceptions', 'backend.access.roles.already_exists', 'That role already exists. Please choose a different name.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9440, 0, 'en', 'exceptions', 'backend.access.roles.delete_error', 'There was a problem deleting this role. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9441, 0, 'en', 'exceptions', 'backend.access.roles.has_users', 'You can not delete a role with associated users.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9442, 0, 'en', 'exceptions', 'backend.access.roles.not_found', 'That role does not exist.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9443, 0, 'en', 'exceptions', 'backend.access.users.already_confirmed', 'This user is already confirmed.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9444, 0, 'en', 'exceptions', 'backend.access.users.cant_delete_own_session', 'You can not delete your own session.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9445, 0, 'en', 'exceptions', 'backend.access.users.session_wrong_driver', 'Your session driver must be set to database to use this feature.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9446, 0, 'en', 'exceptions', 'backend.access.users.social_delete_error', 'There was a problem removing the social account from the user.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9447, 0, 'en', 'exceptions', 'backend.access.users.role_needed_create', 'You must choose at lease one role.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9448, 0, 'en', 'exceptions', 'backend.access.users.create_error', 'There was a problem creating this user. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9449, 0, 'en', 'exceptions', 'backend.access.users.update_error', 'There was a problem updating this user. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9450, 0, 'en', 'exceptions', 'backend.access.users.update_password_error', 'There was a problem changing this users password. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9451, 0, 'en', 'exceptions', 'backend.access.users.cant_deactivate_self', 'You can not do that to yourself.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9452, 0, 'en', 'exceptions', 'backend.access.users.mark_error', 'There was a problem updating this user. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9453, 0, 'en', 'exceptions', 'backend.access.users.cant_confirm', 'There was a problem confirming the user account.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9454, 0, 'en', 'exceptions', 'backend.access.users.not_confirmed', 'This user is not confirmed.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9455, 0, 'en', 'exceptions', 'backend.access.users.cant_unconfirm_admin', 'You can not un-confirm the super administrator.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9456, 0, 'en', 'exceptions', 'backend.access.users.cant_unconfirm_self', 'You can not un-confirm yourself.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9457, 0, 'en', 'exceptions', 'backend.access.users.delete_first', 'This user must be deleted first before it can be destroyed permanently.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9458, 0, 'en', 'exceptions', 'backend.access.users.delete_error', 'There was a problem deleting this user. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9459, 0, 'en', 'exceptions', 'backend.access.users.cant_restore', 'This user is not deleted so it can not be restored.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9460, 0, 'en', 'exceptions', 'backend.access.users.restore_error', 'There was a problem restoring this user. Please try again.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9461, 0, 'en', 'exceptions', 'backend.access.users.email_error', 'That email address belongs to a different user.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9462, 0, 'en', 'exceptions', 'backend.access.users.not_found', 'That user does not exist.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9463, 0, 'en', 'exceptions', 'backend.access.users.cant_delete_admin', 'You can not delete the super administrator.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9464, 0, 'en', 'exceptions', 'backend.access.users.cant_delete_self', 'You can not delete yourself.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9465, 0, 'en', 'exceptions', 'backend.access.users.role_needed', 'You must choose at least one role.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9466, 0, 'en', 'exceptions', 'frontend.auth.confirmation.success', 'Your account has been successfully confirmed!', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9467, 0, 'en', 'exceptions', 'frontend.auth.confirmation.already_confirmed', 'Your account is already confirmed.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9468, 0, 'en', 'exceptions', 'frontend.auth.confirmation.resent', 'A new confirmation e-mail has been sent to the address on file.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9469, 0, 'en', 'exceptions', 'frontend.auth.confirmation.pending', 'Your account is currently pending approval.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9470, 0, 'en', 'exceptions', 'frontend.auth.confirmation.resend', 'Your account is not confirmed. Please click the confirmation link in your e-mail, or <a href=\":url\">click here</a> to resend the confirmation e-mail.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9471, 0, 'en', 'exceptions', 'frontend.auth.confirmation.confirm', 'Confirm your account!', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9472, 0, 'en', 'exceptions', 'frontend.auth.confirmation.mismatch', 'Your confirmation code does not match.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9473, 0, 'en', 'exceptions', 'frontend.auth.confirmation.created_pending', 'Your account was successfully created and is pending approval. An e-mail will be sent when your account is approved.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9474, 0, 'en', 'exceptions', 'frontend.auth.confirmation.created_confirm', 'Your account was successfully created. We have sent you an e-mail to confirm your account.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9475, 0, 'en', 'exceptions', 'frontend.auth.confirmation.not_found', 'That confirmation code does not exist.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9476, 0, 'en', 'exceptions', 'frontend.auth.deactivated', 'Your account has been deactivated.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9477, 0, 'en', 'exceptions', 'frontend.auth.password.reset_problem', 'There was a problem resetting your password. Please resend the password reset email.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9478, 0, 'en', 'exceptions', 'frontend.auth.password.change_mismatch', 'That is not your old password.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9479, 0, 'en', 'exceptions', 'frontend.auth.email_taken', 'That e-mail address is already taken.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9480, 0, 'en', 'exceptions', 'frontend.auth.registration_disabled', 'Registration is currently closed.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9481, 0, 'en', 'http', '404.description2', ' It looks like nothing was found at this location.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9482, 0, 'en', 'http', '404.title', 'Page Not Found', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9483, 0, 'en', 'http', '404.title2', '404', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9484, 0, 'en', 'http', '404.back', 'Back To HomePage', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9485, 0, 'en', 'http', '404.description', 'THIS IS SOMEWHAT EMBARRASSING, ISN’T IT?', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9486, 0, 'en', 'http', '503.title', 'Be right back.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9487, 0, 'en', 'http', '503.description', 'Be right back.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9488, 0, 'en', 'labels', 'backend.courses.title', 'Courses', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9489, 0, 'en', 'labels', 'backend.courses.fields.published', 'Published', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9490, 0, 'en', 'labels', 'backend.courses.fields.unpublished', 'Not Published', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9491, 0, 'en', 'labels', 'backend.courses.fields.featured', 'Featured', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9492, 0, 'en', 'labels', 'backend.courses.fields.free', 'Free', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9493, 0, 'en', 'labels', 'backend.courses.fields.trending', 'Trending', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9494, 0, 'en', 'labels', 'backend.courses.fields.popular', 'Popular', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9495, 0, 'en', 'labels', 'backend.courses.fields.teachers', 'Teachers', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9496, 0, 'en', 'labels', 'backend.courses.fields.category', 'Category', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9497, 0, 'en', 'labels', 'backend.courses.fields.title', 'Title', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9498, 0, 'en', 'labels', 'backend.courses.fields.slug', 'Slug', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9499, 0, 'en', 'labels', 'backend.courses.fields.description', 'Description', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9500, 0, 'en', 'labels', 'backend.courses.fields.price', 'Price', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9501, 0, 'en', 'labels', 'backend.courses.fields.strike', 'Strike Price', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9502, 0, 'en', 'labels', 'backend.courses.fields.course_image', 'Course Image', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9503, 0, 'en', 'labels', 'backend.courses.fields.start_date', 'Start Date', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9504, 0, 'en', 'labels', 'backend.courses.fields.meta_title', 'Meta Title', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9505, 0, 'en', 'labels', 'backend.courses.fields.meta_description', 'Meta Description', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9506, 0, 'en', 'labels', 'backend.courses.fields.meta_keywords', 'Meta Keywords', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9507, 0, 'en', 'labels', 'backend.courses.fields.sidebar', 'Add Sidebar', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9508, 0, 'en', 'labels', 'backend.courses.fields.lessons.add', 'Add Lessons', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9509, 0, 'en', 'labels', 'backend.courses.fields.lessons.view', 'View Lessons', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9510, 0, 'en', 'labels', 'backend.courses.fields.course', 'Course', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9511, 0, 'en', 'labels', 'backend.courses.fields.status', 'Status', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9512, 0, 'en', 'labels', 'backend.courses.fields.expire_at', 'Expire / Disable Course Date', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9513, 0, 'en', 'labels', 'backend.courses.add_teachers', 'Add Teachers', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9514, 0, 'en', 'labels', 'backend.courses.add_categories', 'Add Categories', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9515, 0, 'en', 'labels', 'backend.courses.slug_placeholder', 'Input slug or it will be generated automatically', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9516, 0, 'en', 'labels', 'backend.courses.select_category', 'Select Category', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9517, 0, 'en', 'labels', 'backend.courses.select_teachers', 'Select Teachers', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9518, 0, 'en', 'labels', 'backend.courses.test', 'Test', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9519, 0, 'en', 'labels', 'backend.courses.lesson', 'Lesson', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9520, 0, 'en', 'labels', 'backend.courses.create', 'Create Course', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9521, 0, 'en', 'labels', 'backend.courses.edit', 'Edit Course', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9522, 0, 'en', 'labels', 'backend.courses.view', 'View Courses', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9523, 0, 'en', 'labels', 'backend.courses.category', 'Category', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9524, 0, 'en', 'labels', 'backend.courses.save_timeline', 'Save timeline', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9525, 0, 'en', 'labels', 'backend.courses.course_timeline', 'Course timeline', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9526, 0, 'en', 'labels', 'backend.courses.timeline_description', 'Drag and change sequence of Lessons/Tests for course', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9527, 0, 'en', 'labels', 'backend.courses.listing_note', 'Only Published Lessons and Tests will be Displayed and Sorted.', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9528, 0, 'en', 'labels', 'backend.tests.title', 'Tests', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9529, 0, 'en', 'labels', 'backend.tests.fields.course', 'Course', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9530, 0, 'en', 'labels', 'backend.tests.fields.lesson', 'Lesson', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9531, 0, 'en', 'labels', 'backend.tests.fields.title', 'Title', '2022-02-16 17:17:54', '2022-07-22 00:14:05'),
(9532, 0, 'en', 'labels', 'backend.tests.fields.description', 'Description', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9533, 0, 'en', 'labels', 'backend.tests.fields.published', 'Published', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9534, 0, 'en', 'labels', 'backend.tests.fields.questions', 'Questions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9535, 0, 'en', 'labels', 'backend.tests.fields.textgroups', 'Text Groups', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9536, 0, 'en', 'labels', 'backend.tests.create', 'Create Test', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9537, 0, 'en', 'labels', 'backend.tests.edit', 'Edit Test', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9538, 0, 'en', 'labels', 'backend.tests.view', 'View Tests', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9539, 0, 'en', 'labels', 'backend.orders.fields.payment_status.pending', 'Pending', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9540, 0, 'en', 'labels', 'backend.orders.fields.payment_status.completed', 'Completed', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9541, 0, 'en', 'labels', 'backend.orders.fields.payment_status.failed', 'Failed', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9542, 0, 'en', 'labels', 'backend.orders.fields.payment_status.title', 'Payment', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9543, 0, 'en', 'labels', 'backend.orders.fields.payment_type.stripe', 'Credit / Debit Card (Stripe Payment Gateway)', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9544, 0, 'en', 'labels', 'backend.orders.fields.payment_type.paypal', 'Paypal', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9545, 0, 'en', 'labels', 'backend.orders.fields.payment_type.offline', 'Offline', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9546, 0, 'en', 'labels', 'backend.orders.fields.payment_type.title', 'Payment Type', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9547, 0, 'en', 'labels', 'backend.orders.fields.reference_no', 'Reference No.', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9548, 0, 'en', 'labels', 'backend.orders.fields.ordered_by', 'Ordered By', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9549, 0, 'en', 'labels', 'backend.orders.fields.items', 'Items', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9550, 0, 'en', 'labels', 'backend.orders.fields.amount', 'Amount', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9551, 0, 'en', 'labels', 'backend.orders.fields.user_email', 'User Email', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9552, 0, 'en', 'labels', 'backend.orders.fields.date', 'Order date', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9553, 0, 'en', 'labels', 'backend.orders.complete', 'Complete Manually', '2022-02-16 17:17:55', '2022-07-22 00:14:05');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(9554, 0, 'en', 'labels', 'backend.orders.offline_requests', 'Offline Requests', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9555, 0, 'en', 'labels', 'backend.orders.view_invoice', 'View Invoice', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9556, 0, 'en', 'labels', 'backend.orders.download_invoice', 'Download Invoice', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9557, 0, 'en', 'labels', 'backend.orders.title', 'Orders', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9558, 0, 'en', 'labels', 'backend.pages.fields.published', 'Published', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9559, 0, 'en', 'labels', 'backend.pages.fields.drafted', 'Drafted', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9560, 0, 'en', 'labels', 'backend.pages.fields.title', 'Title', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9561, 0, 'en', 'labels', 'backend.pages.fields.slug', 'Slug', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9562, 0, 'en', 'labels', 'backend.pages.fields.featured_image', 'Featured image', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9563, 0, 'en', 'labels', 'backend.pages.fields.content', 'Content', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9564, 0, 'en', 'labels', 'backend.pages.fields.meta_title', 'Meta Title', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9565, 0, 'en', 'labels', 'backend.pages.fields.meta_description', 'Meta Description', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9566, 0, 'en', 'labels', 'backend.pages.fields.meta_keywords', 'Meta Keywords', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9567, 0, 'en', 'labels', 'backend.pages.fields.clear', 'Clear', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9568, 0, 'en', 'labels', 'backend.pages.fields.status', 'Status', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9569, 0, 'en', 'labels', 'backend.pages.fields.created', 'Created', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9570, 0, 'en', 'labels', 'backend.pages.fields.created_at', 'Created On', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9571, 0, 'en', 'labels', 'backend.pages.max_file_size', '(max file size 10MB)', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9572, 0, 'en', 'labels', 'backend.pages.title', 'Pages', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9573, 0, 'en', 'labels', 'backend.pages.create', 'Create Page', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9574, 0, 'en', 'labels', 'backend.pages.edit', 'Edit Page', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9575, 0, 'en', 'labels', 'backend.pages.view', 'View Pages', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9576, 0, 'en', 'labels', 'backend.access.users.user_actions', 'User Actions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9577, 0, 'en', 'labels', 'backend.access.users.management', 'User Management', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9578, 0, 'en', 'labels', 'backend.access.users.change_password', 'Change Password', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9579, 0, 'en', 'labels', 'backend.access.users.change_password_for', 'Change Password for :user', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9580, 0, 'en', 'labels', 'backend.access.users.create', 'Create User', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9581, 0, 'en', 'labels', 'backend.access.users.table.abilities', 'Abilities', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9582, 0, 'en', 'labels', 'backend.access.users.table.total', 'user total|users total', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9583, 0, 'en', 'labels', 'backend.access.users.table.confirmed', 'Confirmed', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9584, 0, 'en', 'labels', 'backend.access.users.table.created', 'Created', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9585, 0, 'en', 'labels', 'backend.access.users.table.email', 'E-mail', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9586, 0, 'en', 'labels', 'backend.access.users.table.id', 'ID', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9587, 0, 'en', 'labels', 'backend.access.users.table.last_updated', 'Last Updated', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9588, 0, 'en', 'labels', 'backend.access.users.table.name', 'Name', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9589, 0, 'en', 'labels', 'backend.access.users.table.first_name', 'First Name', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9590, 0, 'en', 'labels', 'backend.access.users.table.last_name', 'Last Name', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9591, 0, 'en', 'labels', 'backend.access.users.table.no_deactivated', 'No Deactivated Users', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9592, 0, 'en', 'labels', 'backend.access.users.table.no_deleted', 'No Deleted Users', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9593, 0, 'en', 'labels', 'backend.access.users.table.other_permissions', 'Other Permissions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9594, 0, 'en', 'labels', 'backend.access.users.table.permissions', 'Permissions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9595, 0, 'en', 'labels', 'backend.access.users.table.roles', 'Roles', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9596, 0, 'en', 'labels', 'backend.access.users.table.social', 'Social', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9597, 0, 'en', 'labels', 'backend.access.users.table.status', 'Status', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9598, 0, 'en', 'labels', 'backend.access.users.all_permissions', 'All Permissions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9599, 0, 'en', 'labels', 'backend.access.users.deactivated', 'Deactivated Users', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9600, 0, 'en', 'labels', 'backend.access.users.deleted', 'Deleted Users', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9601, 0, 'en', 'labels', 'backend.access.users.edit', 'Edit User', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9602, 0, 'en', 'labels', 'backend.access.users.active', 'Active Users', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9603, 0, 'en', 'labels', 'backend.access.users.view', 'View User', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9604, 0, 'en', 'labels', 'backend.access.users.tabs.titles.overview', 'Overview', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9605, 0, 'en', 'labels', 'backend.access.users.tabs.titles.history', 'History', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9606, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.avatar', 'Avatar', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9607, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.confirmed', 'Confirmed', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9608, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.created_at', 'Created At', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9609, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.deleted_at', 'Deleted At', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9610, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.email', 'E-mail', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9611, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_login_at', 'Last Login At', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9612, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_login_ip', 'Last Login IP', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9613, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_updated', 'Last Updated', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9614, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.name', 'Name', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9615, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.first_name', 'First Name', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9616, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_name', 'Last Name', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9617, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.status', 'Status', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9618, 0, 'en', 'labels', 'backend.access.users.tabs.content.overview.timezone', 'Timezone', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9619, 0, 'en', 'labels', 'backend.access.users.no_permissions', 'No Permissions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9620, 0, 'en', 'labels', 'backend.access.users.no_roles', 'No Roles to set.', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9621, 0, 'en', 'labels', 'backend.access.users.permissions', 'Permissions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9622, 0, 'en', 'labels', 'backend.access.users.select_role', 'Select Role', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9623, 0, 'en', 'labels', 'backend.access.roles.management', 'Role Management', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9624, 0, 'en', 'labels', 'backend.access.roles.create', 'Create Role', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9625, 0, 'en', 'labels', 'backend.access.roles.edit', 'Edit Role', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9626, 0, 'en', 'labels', 'backend.access.roles.table.total', 'role total|roles total', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9627, 0, 'en', 'labels', 'backend.access.roles.table.number_of_users', 'Number of Users', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9628, 0, 'en', 'labels', 'backend.access.roles.table.permissions', 'Permissions', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9629, 0, 'en', 'labels', 'backend.access.roles.table.role', 'Role', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9630, 0, 'en', 'labels', 'backend.access.roles.table.sort', 'Sort', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9631, 0, 'en', 'labels', 'backend.blogs.fields.title', 'Title', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9632, 0, 'en', 'labels', 'backend.blogs.fields.category', 'Category', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9633, 0, 'en', 'labels', 'backend.blogs.fields.slug', 'Slug', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9634, 0, 'en', 'labels', 'backend.blogs.fields.featured_image', 'Featured image', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9635, 0, 'en', 'labels', 'backend.blogs.fields.content', 'Content', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9636, 0, 'en', 'labels', 'backend.blogs.fields.tags_placeholder', 'Add tags here', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9637, 0, 'en', 'labels', 'backend.blogs.fields.meta_title', 'Meta Title', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9638, 0, 'en', 'labels', 'backend.blogs.fields.meta_description', 'Meta Description', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9639, 0, 'en', 'labels', 'backend.blogs.fields.meta_keywords', 'Meta Keywords', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9640, 0, 'en', 'labels', 'backend.blogs.fields.publish', 'Publish', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9641, 0, 'en', 'labels', 'backend.blogs.fields.clear', 'Clear', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9642, 0, 'en', 'labels', 'backend.blogs.fields.status', 'Status', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9643, 0, 'en', 'labels', 'backend.blogs.fields.views', 'Views', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9644, 0, 'en', 'labels', 'backend.blogs.fields.created', 'Created', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9645, 0, 'en', 'labels', 'backend.blogs.fields.comments', 'Comments', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9646, 0, 'en', 'labels', 'backend.blogs.fields.tags', 'Tags', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9647, 0, 'en', 'labels', 'backend.blogs.fields.created_at', 'Created On', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9648, 0, 'en', 'labels', 'backend.blogs.max_file_size', '(max file size 10MB)', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9649, 0, 'en', 'labels', 'backend.blogs.title', 'Blog', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9650, 0, 'en', 'labels', 'backend.blogs.create', 'Create Blog', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9651, 0, 'en', 'labels', 'backend.blogs.edit', 'Edit Blog', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9652, 0, 'en', 'labels', 'backend.blogs.view', 'View Blogs', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9653, 0, 'en', 'labels', 'backend.lessons.slug_placeholder', 'Input slug or it will be generated automatically', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9654, 0, 'en', 'labels', 'backend.lessons.fields.course', 'Course', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9655, 0, 'en', 'labels', 'backend.lessons.fields.title', 'Title', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9656, 0, 'en', 'labels', 'backend.lessons.fields.slug', 'Slug', '2022-02-16 17:17:55', '2022-07-22 00:14:05'),
(9657, 0, 'en', 'labels', 'backend.lessons.fields.lesson_image', 'Lesson Image', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9658, 0, 'en', 'labels', 'backend.lessons.fields.short_text', 'Short Text', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9659, 0, 'en', 'labels', 'backend.lessons.fields.full_text', 'Full Text', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9660, 0, 'en', 'labels', 'backend.lessons.fields.downloadable_files', 'Downloadable Files', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9661, 0, 'en', 'labels', 'backend.lessons.fields.free_lesson', 'Free Lesson', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9662, 0, 'en', 'labels', 'backend.lessons.fields.published', 'Published', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9663, 0, 'en', 'labels', 'backend.lessons.fields.position', 'Position', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9664, 0, 'en', 'labels', 'backend.lessons.fields.youtube_videos', 'YouTube Videos', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9665, 0, 'en', 'labels', 'backend.lessons.fields.add_pdf', 'Add PDF', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9666, 0, 'en', 'labels', 'backend.lessons.fields.add_video', 'Add Video', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9667, 0, 'en', 'labels', 'backend.lessons.fields.add_subtitle', 'Add Subtitle', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9668, 0, 'en', 'labels', 'backend.lessons.fields.media_video', 'Media Video', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9669, 0, 'en', 'labels', 'backend.lessons.fields.media_audio', 'Media Audio', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9670, 0, 'en', 'labels', 'backend.lessons.fields.media_pdf', 'Media PDF', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9671, 0, 'en', 'labels', 'backend.lessons.fields.add_audio', 'Add Audio', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9672, 0, 'en', 'labels', 'backend.lessons.max_file_size', '(max file size 5MB)', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9673, 0, 'en', 'labels', 'backend.lessons.short_description_placeholder', 'Input short description of lesson', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9674, 0, 'en', 'labels', 'backend.lessons.select_course', 'Select Course', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9675, 0, 'en', 'labels', 'backend.lessons.yt_note', '<b>Instructions to add Video link: </b><br> Go to youtube -> open video -> right click on video and <b>Copy Video URL</b> and paste here.<br> If you want to add multiple videos, then separate them with <b>,</b> (Comma) Sign.', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9676, 0, 'en', 'labels', 'backend.lessons.vimeo_note', '<b>Instructions to add Video link: </b><br> Go to vimeo -> open video -> right click on video and <b>Copy Video URL</b> and paste here.<br> If you want to add multiple videos, then separate them with <b>,</b> (Comma) Sign.', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9677, 0, 'en', 'labels', 'backend.lessons.title', 'Lessons', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9678, 0, 'en', 'labels', 'backend.lessons.enter_video_url', 'Enter video data', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9679, 0, 'en', 'labels', 'backend.lessons.enter_video_embed_code', 'Enter video embed code', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9680, 0, 'en', 'labels', 'backend.lessons.create', 'Create Lesson', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9681, 0, 'en', 'labels', 'backend.lessons.edit', 'Edit Lesson', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9682, 0, 'en', 'labels', 'backend.lessons.view', 'View Lessons', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9683, 0, 'en', 'labels', 'backend.lessons.video_guide', '<p class=\"mb-1\"><b>Youtube :</b> Go to Youtube -> Go to video you want to display -> click on share button below video. Copy that links and paste in above text box </p>\n<p class=\"mb-1\"><b>Vimeo :</b> Go to Vimeo -> Go to video you want to display -> click on share button and copy paste video url here </p>\n<p class=\"mb-1\"><b>Upload :</b> Upload <b>mp4</b> file in file input</p>\n<p class=\"mb-1\"><b>Embed :</b> Copy / Paste embed code in above text box</p>', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9684, 0, 'en', 'labels', 'backend.lessons.remove', 'Remove', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9685, 0, 'en', 'labels', 'backend.categories.fields.name', 'Name', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9686, 0, 'en', 'labels', 'backend.categories.fields.select_icon', 'Select Icon', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9687, 0, 'en', 'labels', 'backend.categories.fields.image', 'Image', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9688, 0, 'en', 'labels', 'backend.categories.fields.icon', 'Icon', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9689, 0, 'en', 'labels', 'backend.categories.fields.icon_type.title', 'Icon type', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9690, 0, 'en', 'labels', 'backend.categories.fields.icon_type.select_any', 'Select Any', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9691, 0, 'en', 'labels', 'backend.categories.fields.icon_type.image', 'Upload image', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9692, 0, 'en', 'labels', 'backend.categories.fields.icon_type.icon', 'Select Icon', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9693, 0, 'en', 'labels', 'backend.categories.fields.or', 'Or', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9694, 0, 'en', 'labels', 'backend.categories.fields.slug', 'Slug', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9695, 0, 'en', 'labels', 'backend.categories.fields.courses', 'Courses', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9696, 0, 'en', 'labels', 'backend.categories.fields.status', 'Status', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9697, 0, 'en', 'labels', 'backend.categories.fields.blog', 'Blog', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9698, 0, 'en', 'labels', 'backend.categories.title', 'Categories', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9699, 0, 'en', 'labels', 'backend.categories.create', 'Create Category', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9700, 0, 'en', 'labels', 'backend.categories.edit', 'Edit Category', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9701, 0, 'en', 'labels', 'backend.categories.view', 'View Categories', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9702, 0, 'en', 'labels', 'backend.categories.not_allowed', 'Not allowed! Category contains data.', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9703, 0, 'en', 'labels', 'backend.faqs.fields.question', 'Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9704, 0, 'en', 'labels', 'backend.faqs.fields.answer', 'Answer', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9705, 0, 'en', 'labels', 'backend.faqs.fields.category', 'Category', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9706, 0, 'en', 'labels', 'backend.faqs.fields.status', 'Status', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9707, 0, 'en', 'labels', 'backend.faqs.title', 'FAQs', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9708, 0, 'en', 'labels', 'backend.faqs.create', 'Create FAQ', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9709, 0, 'en', 'labels', 'backend.faqs.edit', 'Edit FAQ', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9710, 0, 'en', 'labels', 'backend.faqs.view', 'View FAQs', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9711, 0, 'en', 'labels', 'backend.invoices.fields.view', 'View', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9712, 0, 'en', 'labels', 'backend.invoices.fields.download', 'Download', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9713, 0, 'en', 'labels', 'backend.invoices.fields.order_date', 'Order Date', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9714, 0, 'en', 'labels', 'backend.invoices.fields.amount', 'Amount', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9715, 0, 'en', 'labels', 'backend.invoices.title', 'Invoices', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9716, 0, 'en', 'labels', 'backend.menu-manager.title', 'Menu Manager', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9717, 0, 'en', 'labels', 'backend.messages.compose', 'Compose', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9718, 0, 'en', 'labels', 'backend.messages.search_user', 'Search User', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9719, 0, 'en', 'labels', 'backend.messages.select_recipients', 'Select Recipients', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9720, 0, 'en', 'labels', 'backend.messages.start_conversation', 'Start a conversation', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9721, 0, 'en', 'labels', 'backend.messages.type_a_message', 'Type a message', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9722, 0, 'en', 'labels', 'backend.messages.title', 'Messages', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9723, 0, 'en', 'labels', 'backend.questions.fields.question', 'Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9724, 0, 'en', 'labels', 'backend.questions.fields.question_image', 'Question Image', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9725, 0, 'en', 'labels', 'backend.questions.fields.score', 'Score', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9726, 0, 'en', 'labels', 'backend.questions.fields.tests', 'Tests', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9727, 0, 'en', 'labels', 'backend.questions.fields.option_text', 'Option Text', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9728, 0, 'en', 'labels', 'backend.questions.fields.correct', 'Correct', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9729, 0, 'en', 'labels', 'backend.questions.fields.course', 'Course', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9730, 0, 'en', 'labels', 'backend.questions.fields.lesson', 'Lesson', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9731, 0, 'en', 'labels', 'backend.questions.fields.title', 'Title', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9732, 0, 'en', 'labels', 'backend.questions.fields.option_explanation', 'Option Explanation', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9733, 0, 'en', 'labels', 'backend.questions.fields.question_order', 'Question Order', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9734, 0, 'en', 'labels', 'backend.questions.fields.question_page', 'Question Page', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9735, 0, 'en', 'labels', 'backend.questions.fields.question_type', 'Question Type', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9736, 0, 'en', 'labels', 'backend.questions.fields.qt_single_input', 'Single Input - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9737, 0, 'en', 'labels', 'backend.questions.fields.qt_checkbox', 'Checkbox - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9738, 0, 'en', 'labels', 'backend.questions.fields.qt_radiogroup', 'Radiogroup - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9739, 0, 'en', 'labels', 'backend.questions.fields.qt_image', 'Image - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9740, 0, 'en', 'labels', 'backend.questions.fields.qt_matrix', 'Matrix - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9741, 0, 'en', 'labels', 'backend.questions.fields.qt_col', 'column', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9742, 0, 'en', 'labels', 'backend.questions.fields.qt_row', 'row', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9743, 0, 'en', 'labels', 'backend.questions.title', 'Questions', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9744, 0, 'en', 'labels', 'backend.questions.create', 'Create Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9745, 0, 'en', 'labels', 'backend.questions.edit', 'Edit Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9746, 0, 'en', 'labels', 'backend.questions.view', 'View Questions', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9747, 0, 'en', 'labels', 'backend.questions.test', 'Test', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9748, 0, 'en', 'labels', 'backend.textgroups.fields.textgroups', 'textgroups', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9749, 0, 'en', 'labels', 'backend.textgroups.fields.question_image', 'Question Image', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9750, 0, 'en', 'labels', 'backend.textgroups.fields.score', 'Score', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9751, 0, 'en', 'labels', 'backend.textgroups.fields.tests', 'Tests', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9752, 0, 'en', 'labels', 'backend.textgroups.fields.option_text', 'Option Text', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9753, 0, 'en', 'labels', 'backend.textgroups.fields.correct', 'Correct', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9754, 0, 'en', 'labels', 'backend.textgroups.fields.course', 'Course', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9755, 0, 'en', 'labels', 'backend.textgroups.fields.lesson', 'Lesson', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9756, 0, 'en', 'labels', 'backend.textgroups.fields.title', 'Title', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9757, 0, 'en', 'labels', 'backend.textgroups.fields.option_explanation', 'Option Explanation', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9758, 0, 'en', 'labels', 'backend.textgroups.fields.question_order', 'Question Order', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9759, 0, 'en', 'labels', 'backend.textgroups.fields.question_page', 'Question Page', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9760, 0, 'en', 'labels', 'backend.textgroups.fields.question_type', 'Question Type', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9761, 0, 'en', 'labels', 'backend.textgroups.fields.qt_single_input', 'Single Input - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9762, 0, 'en', 'labels', 'backend.textgroups.fields.qt_checkbox', 'Checkbox - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9763, 0, 'en', 'labels', 'backend.textgroups.fields.qt_radiogroup', 'Radiogroup - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9764, 0, 'en', 'labels', 'backend.textgroups.fields.qt_image', 'Image - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9765, 0, 'en', 'labels', 'backend.textgroups.fields.qt_matrix', 'Matrix - Question', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9766, 0, 'en', 'labels', 'backend.textgroups.fields.qt_col', 'column', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9767, 0, 'en', 'labels', 'backend.textgroups.fields.qt_row', 'row', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9768, 0, 'en', 'labels', 'backend.textgroups.title', 'TextGroups', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9769, 0, 'en', 'labels', 'backend.textgroups.create', 'Create TextGroup', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9770, 0, 'en', 'labels', 'backend.textgroups.edit', 'Edit TextGroups', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9771, 0, 'en', 'labels', 'backend.textgroups.view', 'View TextGroups', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9772, 0, 'en', 'labels', 'backend.textgroups.test', 'Test', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9773, 0, 'en', 'labels', 'backend.reasons.fields.title', 'Title', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9774, 0, 'en', 'labels', 'backend.reasons.fields.icon', 'Icon', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9775, 0, 'en', 'labels', 'backend.reasons.fields.content', 'Content', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9776, 0, 'en', 'labels', 'backend.reasons.fields.status', 'Status', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9777, 0, 'en', 'labels', 'backend.reasons.title', 'Reasons', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9778, 0, 'en', 'labels', 'backend.reasons.create', 'Create Reason', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9779, 0, 'en', 'labels', 'backend.reasons.edit', 'Edit Reason', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9780, 0, 'en', 'labels', 'backend.reasons.view', 'View Reasons', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9781, 0, 'en', 'labels', 'backend.reasons.note', 'Reasons will be displayed as a slider on homepage as below', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9782, 0, 'en', 'labels', 'backend.general_settings.title', 'General', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9783, 0, 'en', 'labels', 'backend.general_settings.contact.short_text', 'Short Text', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9784, 0, 'en', 'labels', 'backend.general_settings.contact.show', 'Show', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9785, 0, 'en', 'labels', 'backend.general_settings.contact.primary_address', 'Primary Address', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9786, 0, 'en', 'labels', 'backend.general_settings.contact.secondary_address', 'Secondary Address', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9787, 0, 'en', 'labels', 'backend.general_settings.contact.primary_phone', 'Primary Phone', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9788, 0, 'en', 'labels', 'backend.general_settings.contact.secondary_phone', 'Secondary Phone', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9789, 0, 'en', 'labels', 'backend.general_settings.contact.primary_email', 'Primary Email', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9790, 0, 'en', 'labels', 'backend.general_settings.contact.secondary_email', 'Secondary Email', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9791, 0, 'en', 'labels', 'backend.general_settings.contact.location_on_map', 'Location on Map', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9792, 0, 'en', 'labels', 'backend.general_settings.contact.map_note', '<h3>How to embed Location for Map?</h3>\n                                <p>Do following simple steps and you are good to go:</p>\n                                <ol class=\"map-guide\">\n                                    <li>Go to <a class=\"text-bold\" target=\"_blank\" href=\"//maps.google.com\">Google Map</a> </li>\n                                    <li>Search the place you want to add by Entering address / location in input box located on upper-left corner</li>\n                                    <li>Once you get the place you want. It shows details in left sidebar. Click on <i class=\"fa fa-share-alt text-primary\"></i> button</li>\n                                    <li>A popup will appear which will have two tabs <b>Send a link</b> and <b>Embed a Map</b></li>\n                                    <li>Click on <b>Embed a map</b> It will show you chosen Place on Map</li>\n                                    <li>Now click on the dropdown from the left. By default <b>Medium</b> is selected. Click on it and Select <b>Large</b></li>\n                                    <li>Now Click on <b class=\"text-primary\">COPY HTML</b> link from it and <b>Paste</b> that code here in <b>Location on Map</b>.</li>\n                                </ol>', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9793, 0, 'en', 'labels', 'backend.general_settings.contact.title', 'Contact', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9794, 0, 'en', 'labels', 'backend.general_settings.contact.primary_email_note', 'This email will be used to correspond \"Contact Us\" emails', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9795, 0, 'en', 'labels', 'backend.general_settings.footer.short_description', 'Short Description', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9796, 0, 'en', 'labels', 'backend.general_settings.footer.popular_categories', 'Popular categories', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9797, 0, 'en', 'labels', 'backend.general_settings.footer.featured_courses', 'Featured courses', '2022-02-16 17:17:56', '2022-07-22 00:14:05'),
(9798, 0, 'en', 'labels', 'backend.general_settings.footer.trending_courses', 'Trending courses', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9799, 0, 'en', 'labels', 'backend.general_settings.footer.popular_courses', 'Popular courses', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9800, 0, 'en', 'labels', 'backend.general_settings.footer.custom_links', 'Custom Links', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9801, 0, 'en', 'labels', 'backend.general_settings.footer.social_links', 'Social Links', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9802, 0, 'en', 'labels', 'backend.general_settings.footer.link_url', 'URL', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9803, 0, 'en', 'labels', 'backend.general_settings.footer.social_links_note', 'Add social link URL and select Icon for that media from iconpicker. Click on <b>ADD +</b> button. And your social link will be created. You can also delete them by clicking on <b><i class=\"fa fa-times\"></i></b> button', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9804, 0, 'en', 'labels', 'backend.general_settings.footer.newsletter_form', 'Newsletter Form', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9805, 0, 'en', 'labels', 'backend.general_settings.footer.bottom_footer', 'Bottom Footer', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9806, 0, 'en', 'labels', 'backend.general_settings.footer.bottom_footer_note', 'Note : it includes Copyright text and Footer links', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9807, 0, 'en', 'labels', 'backend.general_settings.footer.copyright_text', 'Copyright Text', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9808, 0, 'en', 'labels', 'backend.general_settings.footer.footer_links', 'Footer Links', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9809, 0, 'en', 'labels', 'backend.general_settings.footer.link_label', 'Label', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9810, 0, 'en', 'labels', 'backend.general_settings.footer.link', 'Link', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9811, 0, 'en', 'labels', 'backend.general_settings.footer.title', 'Footer', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9812, 0, 'en', 'labels', 'backend.general_settings.footer.section_1', 'Section 1', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9813, 0, 'en', 'labels', 'backend.general_settings.footer.section_2', 'Section 2', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9814, 0, 'en', 'labels', 'backend.general_settings.footer.section_3', 'Section 3', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9815, 0, 'en', 'labels', 'backend.general_settings.footer.recent_news', 'Recent News', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9816, 0, 'en', 'labels', 'backend.general_settings.logos.title', 'Logos', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9817, 0, 'en', 'labels', 'backend.general_settings.layout.title', 'Layout', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9818, 0, 'en', 'labels', 'backend.general_settings.email.title', 'Mail Configuration', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9819, 0, 'en', 'labels', 'backend.general_settings.email.mail_from_name', 'Mail From Name', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9820, 0, 'en', 'labels', 'backend.general_settings.email.mail_from_name_note', 'This will be display name for your sent email.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9821, 0, 'en', 'labels', 'backend.general_settings.email.mail_from_address', 'Mail From Address', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9822, 0, 'en', 'labels', 'backend.general_settings.email.mail_from_address_note', 'This email will be used for \"Contact Form\" correspondence.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9823, 0, 'en', 'labels', 'backend.general_settings.email.mail_driver', 'Mail Driver', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9824, 0, 'en', 'labels', 'backend.general_settings.email.mail_driver_note', 'You can select any driver you want for your Mail setup. <b>Ex. SMTP, Mailgun, Mandrill, SparkPost, Amazon SES etc.</b><br> Add <b>single driver only</b>.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9825, 0, 'en', 'labels', 'backend.general_settings.email.mail_host', 'Mail HOST', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9826, 0, 'en', 'labels', 'backend.general_settings.email.mail_port', 'Mail PORT', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9827, 0, 'en', 'labels', 'backend.general_settings.email.mail_username', 'Mail Username', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9828, 0, 'en', 'labels', 'backend.general_settings.email.mail_username_note', 'Add your email id you want to configure for sending emails', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9829, 0, 'en', 'labels', 'backend.general_settings.email.mail_password', 'Mail Password', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9830, 0, 'en', 'labels', 'backend.general_settings.email.mail_password_note', 'Add your email password you want to configure for sending emails', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9831, 0, 'en', 'labels', 'backend.general_settings.email.mail_encryption', 'Mail Encryption', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9832, 0, 'en', 'labels', 'backend.general_settings.email.mail_encryption_note', 'Use <b>tls</b> if your site uses <b>HTTP</b> protocol and <b>ssl</b> if you site uses <b>HTTPS</b> protocol', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9833, 0, 'en', 'labels', 'backend.general_settings.email.note', '<b>Important Note</b> : IF you are using <b>GMAIL</b> for Mail configuration, make sure you have completed following process before updating:\n <ul>\n<li>Go to <a target=\"_blank\" href=\"https://myaccount.google.com/security\">My Account</a> from your Google Account you want to configure and Login</li>\n<li>Scroll down to <b>Less secure app access</b> and set it <b>ON</b></li>\n</ul>', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9834, 0, 'en', 'labels', 'backend.general_settings.payment_settings.title', 'Payment Configuration', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9835, 0, 'en', 'labels', 'backend.general_settings.payment_settings.select_currency', 'Select Currency', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9836, 0, 'en', 'labels', 'backend.general_settings.payment_settings.stripe', 'Stripe Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9837, 0, 'en', 'labels', 'backend.general_settings.payment_settings.stripe_note', 'Enables payments in site with Debit / Credit Cards', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9838, 0, 'en', 'labels', 'backend.general_settings.payment_settings.paypal', 'Paypal Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9839, 0, 'en', 'labels', 'backend.general_settings.payment_settings.paypal_note', 'Redirects to paypal for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9840, 0, 'en', 'labels', 'backend.general_settings.payment_settings.offline_mode', 'Offline Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9841, 0, 'en', 'labels', 'backend.general_settings.payment_settings.offline_mode_note', 'User gets assistance for offline payment via admin', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9842, 0, 'en', 'labels', 'backend.general_settings.payment_settings.offline_mode_instruction', 'Enter offline payment instructions', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9843, 0, 'en', 'labels', 'backend.general_settings.payment_settings.key', 'API Key', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9844, 0, 'en', 'labels', 'backend.general_settings.payment_settings.secret', 'API Secret', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9845, 0, 'en', 'labels', 'backend.general_settings.payment_settings.client_id', 'Client ID', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9846, 0, 'en', 'labels', 'backend.general_settings.payment_settings.client_secret', 'Secret', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9847, 0, 'en', 'labels', 'backend.general_settings.payment_settings.mode', 'Mode', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9848, 0, 'en', 'labels', 'backend.general_settings.payment_settings.sandbox', 'Sandbox', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9849, 0, 'en', 'labels', 'backend.general_settings.payment_settings.live', 'Live', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9850, 0, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_stripe', 'How to get STRIPE API Credentials?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9851, 0, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_paypal', 'How to get PayPal API Credentials?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9852, 0, 'en', 'labels', 'backend.general_settings.payment_settings.mode_note', '<b>Sandbox</b>= Will be used for testing payments with PayPal Test Credentials. Account with USD only can make payments with PayPal for now. This options will redirect to test PayPal payment with Sandbox User Credentials. It will be used for dummy transactions only.<br>\n<b>Live</b> = Will be used with you Live PayPal credentials to make actual transaction with normal users with PayPal account.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9853, 0, 'en', 'labels', 'backend.general_settings.payment_settings.bluesnap', 'Bluesnap Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9854, 0, 'en', 'labels', 'backend.general_settings.payment_settings.bluesnap_note', 'Bluesnap card form for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9855, 0, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_bluesnap', 'How to get Bluesnap API Credentials?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9856, 0, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo', 'Instamojo Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9857, 0, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo_note', 'Redirects to instamojo for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9858, 0, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo_token', 'API Token', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9859, 0, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo_mode_note', '<b>Sandbox</b>= Will be used for testing payments with Instamojo Test Credentials. This options will redirect to test Instamojo payment with Sandbox User Credentials. It will be used for dummy transactions only.<br><a href=\"//test.instamojo.com/\">How to get Instamojo Test API Credentials?</a><br>\n<b>Live</b> = Will be used with you Live Instamojo credentials to make actual transaction with normal users with Instamojo account.<br><a href=\"//www.instamojo.com\">How to get Instamojo Live API Credentials?</a>', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9860, 0, 'en', 'labels', 'backend.general_settings.payment_settings.razorpay', 'Razorpay Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9861, 0, 'en', 'labels', 'backend.general_settings.payment_settings.razorpay_note', 'Redirects to RazorPay for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9862, 0, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_razorpay', 'How to get RAZORPAY API Credentials?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9863, 0, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree', 'CashFree Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9864, 0, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_note', 'Redirects to CashFree for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9865, 0, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_app_id', 'App ID', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9866, 0, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_secret', 'Secret Key', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9867, 0, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_mode_note', '<b>Sandbox</b>= Will be used for testing payments with CasFree Test Credentials. Account with INR only can make payments with Cashfree for now. This options will redirect to test Cashfree payment with Sandbox User Credentials. It will be used for dummy transactions only.<br><a href=\"//test.cashfree.com\">How to get Cashfree Test API Credentials?</a><br>\n<b>Live</b> = Will be used with you Live Cashfree credentials to make actual transaction with normal users with Cashfree account.<br><strong>If you set this payment gateway then set your currency as INR</strong><br><a href=\"//www.cashfree.com\">How to get Cashfree Live API Credentials?</a>', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9868, 0, 'en', 'labels', 'backend.general_settings.payment_settings.payu', 'PayUMoney Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9869, 0, 'en', 'labels', 'backend.general_settings.payment_settings.payu_note', 'Redirects to PayUMoney for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9870, 0, 'en', 'labels', 'backend.general_settings.payment_settings.payu_salt', 'Salt', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9871, 0, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_payu', 'How to get PayUMoney API Credentials?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9872, 0, 'en', 'labels', 'backend.general_settings.payment_settings.payu_mode_note', '<b>Sandbox</b>= Will be used for testing payments with PayUMoney Test Credentials. Account with INR only can make payments with Payment for now. This options will redirect to test PayUMoney payment with Sandbox User Credentials. It will be used for dummy transactions only.<br>\n<b>Live</b> = Will be used with you Live PayUMoney credentials to make actual transaction with normal users with PayUMoney account.<br><strong>If you set this payment gateway then set your currency as INR</strong>', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9873, 0, 'en', 'labels', 'backend.general_settings.payment_settings.flutter', 'Flutter Payment Method', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9874, 0, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_flutter', 'How to get Flutter API Credentials?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9875, 0, 'en', 'labels', 'backend.general_settings.payment_settings.flutter_note', 'Redirects to Flutter for payment', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9876, 0, 'en', 'labels', 'backend.general_settings.management', 'General Settings', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9877, 0, 'en', 'labels', 'backend.general_settings.app_name', 'App Name', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9878, 0, 'en', 'labels', 'backend.general_settings.app_url', 'App URL', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9879, 0, 'en', 'labels', 'backend.general_settings.custom_css', 'Custom CSS', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9880, 0, 'en', 'labels', 'backend.general_settings.custom_js', 'Custom JS', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9881, 0, 'en', 'labels', 'backend.general_settings.teacher_commission_rate', 'Teacher Commission Rate', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9882, 0, 'en', 'labels', 'backend.general_settings.lesson_note', 'Enable / Disable if user will be able to skip before timer is over.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9883, 0, 'en', 'labels', 'backend.general_settings.font_color', 'Font Color', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9884, 0, 'en', 'labels', 'backend.general_settings.static', 'Static', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9885, 0, 'en', 'labels', 'backend.general_settings.google_analytics_id', 'Google Analytics ID', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9886, 0, 'en', 'labels', 'backend.general_settings.google_analytics_id_note', 'How to get Google Analytics ID?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9887, 0, 'en', 'labels', 'backend.general_settings.database', 'Database / Real', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9888, 0, 'en', 'labels', 'backend.general_settings.counter', 'Counter', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9889, 0, 'en', 'labels', 'backend.general_settings.counter_note', '<b>Static</b> =  Manually add data for counter. Please enter exact text you want to display on frontend counter section,<br> <b>Database/Real</b> = It will take real data from database for all the fields (Students enrolled, Total Courses, Total Teachers)', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9890, 0, 'en', 'labels', 'backend.general_settings.total_students', 'Enter Total Students. Ex: 1K, 1Million, 1000 etc.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9891, 0, 'en', 'labels', 'backend.general_settings.total_courses', 'Enter Total Courses. Ex: 1K, 1000 etc.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9892, 0, 'en', 'labels', 'backend.general_settings.total_teachers', 'Enter Total Teachers. Ex: 1K, 1000 etc.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9893, 0, 'en', 'labels', 'backend.general_settings.layout_type', 'Layout Type', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9894, 0, 'en', 'labels', 'backend.general_settings.theme_layout', 'Theme Layout', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9895, 0, 'en', 'labels', 'backend.general_settings.layout_note', 'This will change frontend theme layout', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9896, 0, 'en', 'labels', 'backend.general_settings.show_offers_note', 'Enable / Disable if Coupon offers page link to be displayed in bottom footer', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9897, 0, 'en', 'labels', 'backend.general_settings.admin_registration_mail', 'Registration Mail', '2022-02-16 17:17:57', '2022-07-22 00:14:05');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(9898, 0, 'en', 'labels', 'backend.general_settings.admin_registration_mail_note', 'Enable / Disable if admin will be able to received new registration user mail', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9899, 0, 'en', 'labels', 'backend.general_settings.admin_order_mail', 'Order Mail', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9900, 0, 'en', 'labels', 'backend.general_settings.admin_order_mail_note', 'Enable / Disable if admin will be able to received new order mail', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9901, 0, 'en', 'labels', 'backend.general_settings.newsletter.mail_provider', 'Mail Service Provider', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9902, 0, 'en', 'labels', 'backend.general_settings.newsletter.mailchimp', 'Mailchimp', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9903, 0, 'en', 'labels', 'backend.general_settings.newsletter.sendgrid', 'SendGrid', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9904, 0, 'en', 'labels', 'backend.general_settings.newsletter.mail_provider_note', '<b>Note </b>: You can select any Mail service provider to receive all the emails which are being used to <b>subscribe newsletter</b>.<br> Select and setup according to steps given. <b>It is compulsory</b>, if you want to use <b>newsletter subscription</b> form.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9905, 0, 'en', 'labels', 'backend.general_settings.newsletter.api_key', 'API Key', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9906, 0, 'en', 'labels', 'backend.general_settings.newsletter.api_key_note', 'Generate <b>API key</b> from your <a target=\"_blank\" href=\"https://mailchimp.com/\"><b> Mailchimp account</b></a> and paste that in above text box.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9907, 0, 'en', 'labels', 'backend.general_settings.newsletter.api_key_question', 'How to generate API key?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9908, 0, 'en', 'labels', 'backend.general_settings.newsletter.list_id', 'List ID', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9909, 0, 'en', 'labels', 'backend.general_settings.newsletter.list_id_note', 'Find and paste <b>List ID</b> in above box', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9910, 0, 'en', 'labels', 'backend.general_settings.newsletter.list_id_question', 'How to find List ID from Mailchimp?', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9911, 0, 'en', 'labels', 'backend.general_settings.newsletter.double_opt_in', 'Double Opt-in', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9912, 0, 'en', 'labels', 'backend.general_settings.newsletter.double_opt_in_note', '<b>On</b> = User will be asked in mail to opt in for subscription. <b>Off</b> = User will be directly subscribed for newsletter ', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9913, 0, 'en', 'labels', 'backend.general_settings.newsletter.api_key_note_sendgrid', 'Generate <b>API key</b> from your <a target=\"_blank\" href=\"https://sendgrid.com/\"><b> SendGrid account</b></a> and paste that in above text box.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9914, 0, 'en', 'labels', 'backend.general_settings.newsletter.get_lists', 'Get Lists', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9915, 0, 'en', 'labels', 'backend.general_settings.newsletter.sendgrid_lists', 'SendGrid Email Lists', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9916, 0, 'en', 'labels', 'backend.general_settings.newsletter.select_list', 'Select List', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9917, 0, 'en', 'labels', 'backend.general_settings.newsletter.manage_lists', 'Manage SendGrid Lists', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9918, 0, 'en', 'labels', 'backend.general_settings.newsletter.create_new', 'Create and Select New', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9919, 0, 'en', 'labels', 'backend.general_settings.newsletter.title', 'Newsletter Configuration', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9920, 0, 'en', 'labels', 'backend.general_settings.newsletter.list_id_question_sendgrid', 'Create new Email list for SendGrid Here.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9921, 0, 'en', 'labels', 'backend.general_settings.mail_configuration_note', 'Have you configured :link Mail Settings</a>? It is compulsory to setup to send/receive emails', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9922, 0, 'en', 'labels', 'backend.general_settings.app_locale', 'App Locale', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9923, 0, 'en', 'labels', 'backend.general_settings.app_timezone', 'App Timezone', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9924, 0, 'en', 'labels', 'backend.general_settings.mail_driver', 'Mail Driver', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9925, 0, 'en', 'labels', 'backend.general_settings.mail_host', 'Mail Host', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9926, 0, 'en', 'labels', 'backend.general_settings.mail_port', 'Mail Port', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9927, 0, 'en', 'labels', 'backend.general_settings.mail_from_name', 'Mail From Name', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9928, 0, 'en', 'labels', 'backend.general_settings.mail_from_address', 'Mail From Address', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9929, 0, 'en', 'labels', 'backend.general_settings.mail_username', 'Mail Username', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9930, 0, 'en', 'labels', 'backend.general_settings.mail_password', 'Mail Password', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9931, 0, 'en', 'labels', 'backend.general_settings.enable_registration', 'Enable Registration', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9932, 0, 'en', 'labels', 'backend.general_settings.change_email', 'Change Email', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9933, 0, 'en', 'labels', 'backend.general_settings.password_history', 'Password History', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9934, 0, 'en', 'labels', 'backend.general_settings.password_expires_days', 'Password Expires Days', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9935, 0, 'en', 'labels', 'backend.general_settings.requires_approval', 'Requires Approval', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9936, 0, 'en', 'labels', 'backend.general_settings.confirm_email', 'Confirm Email', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9937, 0, 'en', 'labels', 'backend.general_settings.homepage', 'Select Homepage', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9938, 0, 'en', 'labels', 'backend.general_settings.captcha_status', 'Captcha Status', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9939, 0, 'en', 'labels', 'backend.general_settings.captcha_site_key', 'Captcha Key', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9940, 0, 'en', 'labels', 'backend.general_settings.captcha_site_secret', 'Captcha Secret', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9941, 0, 'en', 'labels', 'backend.general_settings.google_analytics', 'Google Analytics Code', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9942, 0, 'en', 'labels', 'backend.general_settings.sections_note', 'Once you click on update, you will see list of sections to on/off.', '2022-02-16 17:17:57', '2022-07-22 00:14:05'),
(9943, 0, 'en', 'labels', 'backend.general_settings.general.title', 'General', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9944, 0, 'en', 'labels', 'backend.general_settings.captcha', 'Whether the registration - login - contact captcha is on or off', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9945, 0, 'en', 'labels', 'backend.general_settings.captcha_note', 'How to get Google reCaptcha credentials?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9946, 0, 'en', 'labels', 'backend.general_settings.retest_note', 'Enable / Disable if user will be able to give retest for same exam', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9947, 0, 'en', 'labels', 'backend.general_settings.language_settings.title', 'Language Settings', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9948, 0, 'en', 'labels', 'backend.general_settings.language_settings.default_language', 'Default Language', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9949, 0, 'en', 'labels', 'backend.general_settings.language_settings.right_to_left', 'Right to Left', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9950, 0, 'en', 'labels', 'backend.general_settings.language_settings.left_to_right', 'Left to right', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9951, 0, 'en', 'labels', 'backend.general_settings.language_settings.display_type', 'Display Type', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9952, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.title', 'User Registration Settings', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9953, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.desc', 'Checked fields from the right sidebar will be displayed in registration form', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9954, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.first_name', 'First Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9955, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.last_name', 'Last Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9956, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.email', 'Email', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9957, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.password', 'Password', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9958, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.phone', 'Phone', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9959, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.dob', 'Date of Birth', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9960, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.gender', 'Gender', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9961, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.male', 'Male', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9962, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.female', 'Female', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9963, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.other', 'Other', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9964, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.address', 'Address', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9965, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.pincode', 'Pincode', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9966, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.country', 'Country', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9967, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.state', 'State', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9968, 0, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.city', 'City', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9969, 0, 'en', 'labels', 'backend.general_settings.troubleshoot', 'Troubleshoot', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9970, 0, 'en', 'labels', 'backend.general_settings.onesignal_note', 'Enable / Disble OneSignal configuration for Website.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9971, 0, 'en', 'labels', 'backend.general_settings.how_to_onesignal', 'How to create app in OneSignal?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9972, 0, 'en', 'labels', 'backend.general_settings.setup_onesignal', 'How to set up OneSignal?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9973, 0, 'en', 'labels', 'backend.general_settings.api_clients.title', 'API Clients', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9974, 0, 'en', 'labels', 'backend.general_settings.api_clients.generate', 'Generate', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9975, 0, 'en', 'labels', 'backend.general_settings.api_clients.note', '<span class=\"text-danger font-weight-bold\">Note :</span> This section will be helpful for API purpose. You can generate <b>Client ID</b> and <b>Client Secret</b> to use in your Android app or Postman to test the API.<br> You need to customise parameters and URL according to your requirement.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9976, 0, 'en', 'labels', 'backend.general_settings.api_clients.developer_manual', 'Developer Manual', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9977, 0, 'en', 'labels', 'backend.general_settings.api_clients.fields.name', 'Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9978, 0, 'en', 'labels', 'backend.general_settings.api_clients.fields.id', 'ID', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9979, 0, 'en', 'labels', 'backend.general_settings.api_clients.fields.secret', 'Secret', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9980, 0, 'en', 'labels', 'backend.general_settings.api_clients.fields.status', 'Status', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9981, 0, 'en', 'labels', 'backend.general_settings.api_clients.fields.action', 'Action', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9982, 0, 'en', 'labels', 'backend.general_settings.api_clients.revoked', 'Revoked', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9983, 0, 'en', 'labels', 'backend.general_settings.api_clients.revoke', 'Revoke', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9984, 0, 'en', 'labels', 'backend.general_settings.api_clients.live', 'Live', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9985, 0, 'en', 'labels', 'backend.general_settings.api_clients.enable', 'Enable', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9986, 0, 'en', 'labels', 'backend.general_settings.api_clients.api_client_name', 'API Client Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9987, 0, 'en', 'labels', 'backend.general_settings.api_clients.something_went_wrong', 'Something Went Wrong', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9988, 0, 'en', 'labels', 'backend.general_settings.api_clients.please_input_api_client_name', 'Please input API client name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9989, 0, 'en', 'labels', 'backend.general_settings.list_update_note', 'Once you click on update, you will see list of sections to on/off.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9990, 0, 'en', 'labels', 'backend.general_settings.wide', 'Wide', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9991, 0, 'en', 'labels', 'backend.general_settings.box', 'Box', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9992, 0, 'en', 'labels', 'backend.general_settings.layout_type_note', 'This will change frontend theme layout type', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9993, 0, 'en', 'labels', 'backend.general_settings.layout_label', 'Layout', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9994, 0, 'en', 'labels', 'backend.logo.logo_b', 'Logo 1', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9995, 0, 'en', 'labels', 'backend.logo.logo_b_note', 'Note : Upload logo with <b>black text and transparent background in .png format</b> and <b>294x50</b>(WxH) pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9996, 0, 'en', 'labels', 'backend.logo.logo_w', 'Logo 2', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9997, 0, 'en', 'labels', 'backend.logo.logo_w_note', 'Note : Upload logo with <b>white text and transparent background in .png format</b> and <b>294x50</b> (WxH) pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9998, 0, 'en', 'labels', 'backend.logo.logo_white', 'Logo 3', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(9999, 0, 'en', 'labels', 'backend.logo.logo_white_note', 'Note : Upload logo with <b>only in white text and transparent background in .png format</b> and <b>294x50</b>(WxH)  pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10000, 0, 'en', 'labels', 'backend.logo.logo_popup', 'Logo for Popups', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10001, 0, 'en', 'labels', 'backend.logo.logo_popup_note', 'Note : Add square logo minimum resolution <b>72x72</b> pixels', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10002, 0, 'en', 'labels', 'backend.logo.favicon', 'Add Favicon', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10003, 0, 'en', 'labels', 'backend.logo.favicon_note', 'Note : Upload logo with resolution <b>32x32</b> pixels and extension <b>.png</b> or <b>.gif</b> or <b>.ico</b>', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10004, 0, 'en', 'labels', 'backend.logo.title', 'Change Logo', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10005, 0, 'en', 'labels', 'backend.social_settings.management', 'Social Settings', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10006, 0, 'en', 'labels', 'backend.social_settings.fb_note', 'Enable / disable facebook login for website', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10007, 0, 'en', 'labels', 'backend.social_settings.fb_api_note', 'How to get Facebook API Credentials?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10008, 0, 'en', 'labels', 'backend.social_settings.google_api_note', 'How to get Google API Credentials?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10009, 0, 'en', 'labels', 'backend.social_settings.twitter_api_note', 'How to get Twitter API Credentials?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10010, 0, 'en', 'labels', 'backend.social_settings.google_note', 'Enable / disable Google login for website', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10011, 0, 'en', 'labels', 'backend.social_settings.twitter_note', 'Enable / disable Twitter login for website', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10012, 0, 'en', 'labels', 'backend.social_settings.linkedin_api_note', 'How to get LinkedIn API Credentials?', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10013, 0, 'en', 'labels', 'backend.social_settings.linkedin_note', 'Enable / disable LinkedIn login for website', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10014, 0, 'en', 'labels', 'backend.hero_slider.fields.name', 'Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10015, 0, 'en', 'labels', 'backend.hero_slider.fields.bg_image', 'BG Image', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10016, 0, 'en', 'labels', 'backend.hero_slider.fields.overlay.title', 'Overlay', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10017, 0, 'en', 'labels', 'backend.hero_slider.fields.overlay.note', 'If you turn it on. A black overlay will be displayed on your image. It will be helpful when BG image is not darker or does not have Overlay', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10018, 0, 'en', 'labels', 'backend.hero_slider.fields.hero_text', 'Hero Text', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10019, 0, 'en', 'labels', 'backend.hero_slider.fields.sub_text', 'Sub Text', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10020, 0, 'en', 'labels', 'backend.hero_slider.fields.widget.title', 'Widget', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10021, 0, 'en', 'labels', 'backend.hero_slider.fields.widget.input_date_time', 'Input date and time', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10022, 0, 'en', 'labels', 'backend.hero_slider.fields.widget.select_widget', 'Select Widget', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10023, 0, 'en', 'labels', 'backend.hero_slider.fields.widget.search_bar', 'Search Bar', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10024, 0, 'en', 'labels', 'backend.hero_slider.fields.widget.countdown_timer', 'Countdown Timer', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10025, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.title', 'Buttons', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10026, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.add', 'Add', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10027, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.placeholder', 'Add number of buttons you want to add', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10028, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.note', 'Note: Maximum 4 buttons can be added. Please add label and link for the button for redirecting action when button is clicked.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10029, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.name', 'Button', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10030, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.label', 'Label', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10031, 0, 'en', 'labels', 'backend.hero_slider.fields.buttons.link', 'Link', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10032, 0, 'en', 'labels', 'backend.hero_slider.fields.sequence', 'Sequence', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10033, 0, 'en', 'labels', 'backend.hero_slider.fields.status', 'Status', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10034, 0, 'en', 'labels', 'backend.hero_slider.note', 'Note: Please upload .jpg or .png in <b>1920x900</b> resolution for best result. Use darker or Overlayed images for better result.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10035, 0, 'en', 'labels', 'backend.hero_slider.on', 'On', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10036, 0, 'en', 'labels', 'backend.hero_slider.off', 'Off', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10037, 0, 'en', 'labels', 'backend.hero_slider.title', 'Hero Slider', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10038, 0, 'en', 'labels', 'backend.hero_slider.create', 'Create Slide', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10039, 0, 'en', 'labels', 'backend.hero_slider.edit', 'Edit Slide', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10040, 0, 'en', 'labels', 'backend.hero_slider.view', 'View Slides', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10041, 0, 'en', 'labels', 'backend.hero_slider.manage_sequence', 'Manage Sequence of Slides', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10042, 0, 'en', 'labels', 'backend.hero_slider.sequence_note', 'Drag and change sequence of a Slide', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10043, 0, 'en', 'labels', 'backend.hero_slider.save_sequence', 'Save Sequence', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10044, 0, 'en', 'labels', 'backend.tax.title', 'Tax', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10045, 0, 'en', 'labels', 'backend.tax.create', 'Create Tax', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10046, 0, 'en', 'labels', 'backend.tax.edit', 'Edit Tax', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10047, 0, 'en', 'labels', 'backend.tax.view', 'View Tax', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10048, 0, 'en', 'labels', 'backend.tax.on', 'On', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10049, 0, 'en', 'labels', 'backend.tax.off', 'Off', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10050, 0, 'en', 'labels', 'backend.tax.fields.name', 'Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10051, 0, 'en', 'labels', 'backend.tax.fields.rate', 'Rate', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10052, 0, 'en', 'labels', 'backend.tax.fields.status', 'Status', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10053, 0, 'en', 'labels', 'backend.coupons.title', 'Coupons', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10054, 0, 'en', 'labels', 'backend.coupons.create', 'Create Coupon', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10055, 0, 'en', 'labels', 'backend.coupons.edit', 'Edit Coupon', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10056, 0, 'en', 'labels', 'backend.coupons.view', 'View Coupons', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10057, 0, 'en', 'labels', 'backend.coupons.courses', 'Courses', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10058, 0, 'en', 'labels', 'backend.coupons.bundles', 'Bundles', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10059, 0, 'en', 'labels', 'backend.coupons.on', 'On', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10060, 0, 'en', 'labels', 'backend.coupons.off', 'Off', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10061, 0, 'en', 'labels', 'backend.coupons.flat_rate', 'Flat Rate', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10062, 0, 'en', 'labels', 'backend.coupons.discount_rate', 'Discount Rate', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10063, 0, 'en', 'labels', 'backend.coupons.type_note', '<b>Discount Rate (%) :</b> If you will select this, it will apply rate in % to total purchase. Ex. Price = $100 and Discount rate is 10% then 10% of 100$ will be deducted.<br><b>Flat Rate : </b>If you select this, particular amount will be deducted from total purchase. Ex. Price = 100$ and Flat rate is 25$ then 25$ will be deducted from 100$.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10064, 0, 'en', 'labels', 'backend.coupons.amount_note', 'If <b>Discount Rate</b> selected, input rate of percentage. If <b>Flat Rate</b> selected, input particular amount to be deducted.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10065, 0, 'en', 'labels', 'backend.coupons.per_user_limit_note', 'Specify how many times a single user can use this coupon. By default one time use.', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10066, 0, 'en', 'labels', 'backend.coupons.total_note', 'Number of coupons to be issued', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10067, 0, 'en', 'labels', 'backend.coupons.fields.name', 'Name', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10068, 0, 'en', 'labels', 'backend.coupons.fields.code', 'Code', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10069, 0, 'en', 'labels', 'backend.coupons.fields.type', 'Type', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10070, 0, 'en', 'labels', 'backend.coupons.fields.for', 'For', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10071, 0, 'en', 'labels', 'backend.coupons.fields.amount', 'Amount', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10072, 0, 'en', 'labels', 'backend.coupons.fields.expires_at', 'Expires At', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10073, 0, 'en', 'labels', 'backend.coupons.fields.per_user_limit', 'Per User Limit', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10074, 0, 'en', 'labels', 'backend.coupons.fields.total', 'Total', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10075, 0, 'en', 'labels', 'backend.coupons.fields.status', 'Status', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10076, 0, 'en', 'labels', 'backend.coupons.fields.min_price', 'Minimum Order Price', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10077, 0, 'en', 'labels', 'backend.coupons.fields.description', 'Description', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10078, 0, 'en', 'labels', 'backend.coupons.description', 'Description', '2022-02-16 17:17:58', '2022-07-22 00:14:05'),
(10079, 0, 'en', 'labels', 'backend.coupons.unlimited', 'Unlimited', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10080, 0, 'en', 'labels', 'backend.sponsors.title', 'Sponsors', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10081, 0, 'en', 'labels', 'backend.sponsors.fields.name', 'Name', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10082, 0, 'en', 'labels', 'backend.sponsors.fields.link', 'Link', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10083, 0, 'en', 'labels', 'backend.sponsors.fields.logo', 'Logo', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10084, 0, 'en', 'labels', 'backend.sponsors.fields.status', 'Status', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10085, 0, 'en', 'labels', 'backend.sponsors.create', 'Create Sponsors', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10086, 0, 'en', 'labels', 'backend.sponsors.edit', 'Edit Sponsors', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10087, 0, 'en', 'labels', 'backend.sponsors.view', 'View Sponsors', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10088, 0, 'en', 'labels', 'backend.teachers.fields.first_name', 'First Name', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10089, 0, 'en', 'labels', 'backend.teachers.fields.last_name', 'Last Name', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10090, 0, 'en', 'labels', 'backend.teachers.fields.email', 'Email Address', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10091, 0, 'en', 'labels', 'backend.teachers.fields.password', 'Password', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10092, 0, 'en', 'labels', 'backend.teachers.fields.image', 'Image', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10093, 0, 'en', 'labels', 'backend.teachers.fields.status', 'Status', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10094, 0, 'en', 'labels', 'backend.teachers.title', 'Teachers', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10095, 0, 'en', 'labels', 'backend.teachers.create', 'Create Teacher', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10096, 0, 'en', 'labels', 'backend.teachers.edit', 'Edit Teacher', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10097, 0, 'en', 'labels', 'backend.teachers.view', 'View Teachers', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10098, 0, 'en', 'labels', 'backend.testimonials.fields.name', 'Name', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10099, 0, 'en', 'labels', 'backend.testimonials.fields.occupation', 'Occupation', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10100, 0, 'en', 'labels', 'backend.testimonials.fields.content', 'Content', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10101, 0, 'en', 'labels', 'backend.testimonials.fields.status', 'Status', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10102, 0, 'en', 'labels', 'backend.testimonials.title', 'Testimonials', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10103, 0, 'en', 'labels', 'backend.testimonials.create', 'Create Testimonial', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10104, 0, 'en', 'labels', 'backend.testimonials.edit', 'Edit Testimonial', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10105, 0, 'en', 'labels', 'backend.testimonials.view', 'View Testimonials', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10106, 0, 'en', 'labels', 'backend.dashboard.title', 'Dashboard', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10107, 0, 'en', 'labels', 'backend.dashboard.students', 'Students', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10108, 0, 'en', 'labels', 'backend.dashboard.trending', 'Trending', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10109, 0, 'en', 'labels', 'backend.dashboard.teachers', 'Teachers', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10110, 0, 'en', 'labels', 'backend.dashboard.completed', 'Completed', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10111, 0, 'en', 'labels', 'backend.dashboard.no_data', 'No data available', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10112, 0, 'en', 'labels', 'backend.dashboard.buy_course_now', 'Buy course now', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10113, 0, 'en', 'labels', 'backend.dashboard.your_courses', 'Your Courses', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10114, 0, 'en', 'labels', 'backend.dashboard.students_enrolled', 'Students Enrolled To<br> Your Courses', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10115, 0, 'en', 'labels', 'backend.dashboard.recent_reviews', 'Recent Reviews', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10116, 0, 'en', 'labels', 'backend.dashboard.recent_orders', 'Recent Orders', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10117, 0, 'en', 'labels', 'backend.dashboard.recent_contacts', 'Recent Contacts', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10118, 0, 'en', 'labels', 'backend.dashboard.view_all', 'View All', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10119, 0, 'en', 'labels', 'backend.dashboard.course', 'Course', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10120, 0, 'en', 'labels', 'backend.dashboard.review', 'Review', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10121, 0, 'en', 'labels', 'backend.dashboard.time', 'Time', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10122, 0, 'en', 'labels', 'backend.dashboard.recent_messages', 'Recent Messages', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10123, 0, 'en', 'labels', 'backend.dashboard.message', 'Message', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10124, 0, 'en', 'labels', 'backend.dashboard.message_by', 'Message By', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10125, 0, 'en', 'labels', 'backend.dashboard.courses', 'Courses', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10126, 0, 'en', 'labels', 'backend.dashboard.ordered_by', 'Ordered By', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10127, 0, 'en', 'labels', 'backend.dashboard.view', 'View', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10128, 0, 'en', 'labels', 'backend.dashboard.amount', 'Amount', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10129, 0, 'en', 'labels', 'backend.dashboard.recent_contact_requests', 'Recent Contact Requests', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10130, 0, 'en', 'labels', 'backend.dashboard.name', 'Name', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10131, 0, 'en', 'labels', 'backend.dashboard.email', 'Email', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10132, 0, 'en', 'labels', 'backend.dashboard.my_course_bundles', 'My Course Bundles', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10133, 0, 'en', 'labels', 'backend.dashboard.my_courses', 'My Courses', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10134, 0, 'en', 'labels', 'backend.dashboard.your_courses_and_bundles', 'Your Courses and Bundles', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10135, 0, 'en', 'labels', 'backend.dashboard.course_and_bundles', 'Course and Bundles', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10136, 0, 'en', 'labels', 'backend.dashboard.pending_orders', 'Pending Orders', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10137, 0, 'en', 'labels', 'backend.dashboard.pending', 'Pending', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10138, 0, 'en', 'labels', 'backend.dashboard.success', 'Success', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10139, 0, 'en', 'labels', 'backend.dashboard.failed', 'Failed', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10140, 0, 'en', 'labels', 'backend.dashboard.my_subscribed_courses', 'My Subscribed Courses', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10141, 0, 'en', 'labels', 'backend.dashboard.my_subscribed_course_bundles', 'My Subscribed Course Bundles', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10142, 0, 'en', 'labels', 'backend.questions_options.title', 'Questions Option', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10143, 0, 'en', 'labels', 'backend.questions_options.create', 'Create Option', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10144, 0, 'en', 'labels', 'backend.questions_options.edit', 'Edit Option', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10145, 0, 'en', 'labels', 'backend.questions_options.view', 'View Question Options', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10146, 0, 'en', 'labels', 'backend.questions_options.fields.course', 'Course', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10147, 0, 'en', 'labels', 'backend.questions_options.fields.lesson', 'Lesson', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10148, 0, 'en', 'labels', 'backend.questions_options.fields.title', 'Title', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10149, 0, 'en', 'labels', 'backend.questions_options.fields.question', 'Question', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10150, 0, 'en', 'labels', 'backend.questions_options.fields.question_option', 'Question Option', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10151, 0, 'en', 'labels', 'backend.questions_options.fields.score', 'Score', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10152, 0, 'en', 'labels', 'backend.questions_options.fields.tests', 'Tests', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10153, 0, 'en', 'labels', 'backend.questions_options.fields.option_text', 'Option Text', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10154, 0, 'en', 'labels', 'backend.questions_options.fields.correct', 'Correct', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10155, 0, 'en', 'labels', 'backend.reviews.title', 'Reviews', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10156, 0, 'en', 'labels', 'backend.reviews.fields.course', 'Course', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10157, 0, 'en', 'labels', 'backend.reviews.fields.user', 'User', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10158, 0, 'en', 'labels', 'backend.reviews.fields.content', 'Content', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10159, 0, 'en', 'labels', 'backend.reviews.fields.time', 'Time', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10160, 0, 'en', 'labels', 'backend.contacts.title', 'Leads', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10161, 0, 'en', 'labels', 'backend.contacts.fields.name', 'Name', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10162, 0, 'en', 'labels', 'backend.contacts.fields.email', 'Email', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10163, 0, 'en', 'labels', 'backend.contacts.fields.phone', 'Phone', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10164, 0, 'en', 'labels', 'backend.contacts.fields.message', 'Message', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10165, 0, 'en', 'labels', 'backend.contacts.fields.time', 'Time', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10166, 0, 'en', 'labels', 'backend.translations.title', 'Translation Manager', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10167, 0, 'en', 'labels', 'backend.translations.warning', 'Warning, translations are not visible until they are exported back to the app/lang file, using\n                        <code>php artisan translation:export</code> command or publish button.', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10168, 0, 'en', 'labels', 'backend.translations.done_importing', 'Done importing, processed <strong class=\"counter\">N</strong> items! Reload this page to\n                            refresh the groups!', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10169, 0, 'en', 'labels', 'backend.translations.done_searching', 'Done searching for translations, found <strong class=\"counter\">N</strong> items!', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10170, 0, 'en', 'labels', 'backend.translations.done_publishing_for_group', 'Done publishing the translations for group', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10171, 0, 'en', 'labels', 'backend.translations.done_publishing_for_all_groups', 'Done publishing the translations for all group!', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10172, 0, 'en', 'labels', 'backend.translations.append_new_translations', 'Append new translations', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10173, 0, 'en', 'labels', 'backend.translations.replace_existing_translations', 'Replace existing translations', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10174, 0, 'en', 'labels', 'backend.translations.import_groups', 'Import Groups', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10175, 0, 'en', 'labels', 'backend.translations.import_groups_note', '<p>This will get all locale files from <code>lang</code> folder and insert into database.<br> <b>Append new translations :</b> It will append only new files and data <b>&amp;</b>\n                                            <b>Replace existing translations:</b>It will replace existing records according to files</p>', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10176, 0, 'en', 'labels', 'backend.translations.choose_a_group', 'Choose a group to display the group translations. If no groups are visible, make sure\n                                you have run the migrations and imported the translations.', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10177, 0, 'en', 'labels', 'backend.translations.translation_warning', 'Are you sure you want to publish the translations group :group ? This will overwrite existing language files', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10178, 0, 'en', 'labels', 'backend.translations.publishing', 'Publishing..', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10179, 0, 'en', 'labels', 'backend.translations.publish_translations', 'Publish Translations', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10180, 0, 'en', 'labels', 'backend.translations.total', 'Total', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10181, 0, 'en', 'labels', 'backend.translations.changed', 'Changed', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10182, 0, 'en', 'labels', 'backend.translations.key', 'Key', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10183, 0, 'en', 'labels', 'backend.translations.supported_locales', 'Supported Locales', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10184, 0, 'en', 'labels', 'backend.translations.current_supported_locales', 'Current Supported Locales', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10185, 0, 'en', 'labels', 'backend.translations.enter_new_locale_key', 'Enter new locale key', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10186, 0, 'en', 'labels', 'backend.translations.add_new_locale', 'Add new locale', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10187, 0, 'en', 'labels', 'backend.translations.adding', 'Adding...', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10188, 0, 'en', 'labels', 'backend.translations.export_all_translations', 'Export all translations', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10189, 0, 'en', 'labels', 'backend.translations.publish_all', 'Publish all', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10190, 0, 'en', 'labels', 'backend.translations.publish_all_warning', 'Are you sure you want to publish all translations group? This will overwrite existing language files.', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10191, 0, 'en', 'labels', 'backend.update.title', 'Update Theme', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10192, 0, 'en', 'labels', 'backend.update.upload', 'Upload new version  <small>(update.zip)</small>', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10193, 0, 'en', 'labels', 'backend.update.current_version', 'Current Version', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10194, 0, 'en', 'labels', 'backend.update.note_before_upload_title', 'Read following notes before updating', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10195, 0, 'en', 'labels', 'backend.update.file_replaced', 'Following files will be updated / replaced', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10196, 0, 'en', 'labels', 'backend.update.warning', '<b>WARNING : We strongly recommend you to update theme by version number</b>.<br> <b>Example :</b> update_v1.zip, update_v2.zip. Please do not jump version number. If your version number is 1 and you want to update it, then update to version 2. Do no directly update to version 3.', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10197, 0, 'en', 'labels', 'backend.update.note_before_upload', '<p><b>Please take BACKUP before updating.</b> Updated zip file may come with new folders and file updates. <b>Your current files will be replaced with new one</b>. So, <b>if you have made any changes in current application files it will be LOST</b>.</p>\n                        <p>If you are directly uploading from below file input box, your files will be replaced. We strongly recommend you to do it manual replacement of files one by one or edit the changes by comparing your current edited file and new updated files.</p>\n                        <p>If you still have confusion. Please contact us, we will guide you to update your application</p>', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10198, 0, 'en', 'labels', 'backend.backup.title', 'Backup', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10199, 0, 'en', 'labels', 'backend.backup.email', 'Email Notification', '2022-02-16 17:17:59', '2022-07-22 00:14:05'),
(10200, 0, 'en', 'labels', 'backend.backup.app_token', 'App Token', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10201, 0, 'en', 'labels', 'backend.backup.app_secret', 'App Secret', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10202, 0, 'en', 'labels', 'backend.backup.api_key', 'API Key', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10203, 0, 'en', 'labels', 'backend.backup.app_key', 'App Key', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10204, 0, 'en', 'labels', 'backend.backup.api_secret', 'API Secret', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10205, 0, 'en', 'labels', 'backend.backup.enable_disable', 'Enable / Disable', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10206, 0, 'en', 'labels', 'backend.backup.backup_type', 'Backup Type', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10207, 0, 'en', 'labels', 'backend.backup.dropbox', 'Dropbox', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10208, 0, 'en', 'labels', 'backend.backup.backup_files', 'Backup Files', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10209, 0, 'en', 'labels', 'backend.backup.aws', 'AWS S3', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10210, 0, 'en', 'labels', 'backend.backup.db', 'Database', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10211, 0, 'en', 'labels', 'backend.backup.configuration', 'Configuration', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10212, 0, 'en', 'labels', 'backend.backup.generate_backup', 'Generate Backup', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10213, 0, 'en', 'labels', 'backend.backup.db_storage', 'Database and Storage files', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10214, 0, 'en', 'labels', 'backend.backup.db_app', 'Database and Application files', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10215, 0, 'en', 'labels', 'backend.backup.backup_schedule', 'Backup Schedule', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10216, 0, 'en', 'labels', 'backend.backup.daily', 'Daily', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10217, 0, 'en', 'labels', 'backend.backup.weekly', 'Weekly', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10218, 0, 'en', 'labels', 'backend.backup.monthly', 'Monthly', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10219, 0, 'en', 'labels', 'backend.backup.dropbox_note', 'Please checkout documentation for <b>How to obtain DropBox App Keys?</b>', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10220, 0, 'en', 'labels', 'backend.backup.region', 'Region', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10221, 0, 'en', 'labels', 'backend.backup.bucket_name', 'Bucket Name', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10222, 0, 'en', 'labels', 'backend.backup.backup_notice', 'Please refer documentation before beginning backup. It has every details step by step for creating backup with Dropbox.', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10223, 0, 'en', 'labels', 'backend.backup.backup_note', '<b>Note </b>: To run this backup properly you need to add following code to your <b>CRON TAB:</b><br><code>* * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1</code>', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10224, 0, 'en', 'labels', 'backend.certificates.title', 'Certificates', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10225, 0, 'en', 'labels', 'backend.certificates.fields.course_name', 'Course Name', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10226, 0, 'en', 'labels', 'backend.certificates.fields.progress', 'Progress', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10227, 0, 'en', 'labels', 'backend.certificates.fields.action', 'Action', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10228, 0, 'en', 'labels', 'backend.certificates.view', 'View', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10229, 0, 'en', 'labels', 'backend.certificates.download', 'Download', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10230, 0, 'en', 'labels', 'backend.bundles.title', 'Bundles', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10231, 0, 'en', 'labels', 'backend.bundles.fields.published', 'Published', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10232, 0, 'en', 'labels', 'backend.bundles.fields.unpublished', 'Not Published', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10233, 0, 'en', 'labels', 'backend.bundles.fields.featured', 'Featured', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10234, 0, 'en', 'labels', 'backend.bundles.fields.trending', 'Trending', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10235, 0, 'en', 'labels', 'backend.bundles.fields.free', 'Free', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10236, 0, 'en', 'labels', 'backend.bundles.fields.popular', 'Popular', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10237, 0, 'en', 'labels', 'backend.bundles.fields.teachers', 'Teachers', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10238, 0, 'en', 'labels', 'backend.bundles.fields.category', 'Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10239, 0, 'en', 'labels', 'backend.bundles.fields.title', 'Title', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10240, 0, 'en', 'labels', 'backend.bundles.fields.slug', 'Slug', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10241, 0, 'en', 'labels', 'backend.bundles.fields.description', 'Description', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10242, 0, 'en', 'labels', 'backend.bundles.fields.price', 'Price', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10243, 0, 'en', 'labels', 'backend.bundles.fields.course_image', 'Course Image', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10244, 0, 'en', 'labels', 'backend.bundles.fields.start_date', 'Start Date', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10245, 0, 'en', 'labels', 'backend.bundles.fields.meta_title', 'Meta Title', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10246, 0, 'en', 'labels', 'backend.bundles.fields.meta_description', 'Meta Description', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10247, 0, 'en', 'labels', 'backend.bundles.fields.meta_keywords', 'Meta Keywords', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10248, 0, 'en', 'labels', 'backend.bundles.fields.sidebar', 'Add Sidebar', '2022-02-16 17:18:00', '2022-07-22 00:14:05');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(10249, 0, 'en', 'labels', 'backend.bundles.fields.expire_at', 'Expire / Disable Bundle Date', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10250, 0, 'en', 'labels', 'backend.bundles.fields.lessons.add', 'Add Lessons', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10251, 0, 'en', 'labels', 'backend.bundles.fields.lessons.view', 'View Lessons', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10252, 0, 'en', 'labels', 'backend.bundles.fields.course', 'Course', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10253, 0, 'en', 'labels', 'backend.bundles.fields.courses', 'Courses', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10254, 0, 'en', 'labels', 'backend.bundles.fields.status', 'Status', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10255, 0, 'en', 'labels', 'backend.bundles.add_courses', 'Add Courses', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10256, 0, 'en', 'labels', 'backend.bundles.add_teachers', 'Add Teachers', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10257, 0, 'en', 'labels', 'backend.bundles.add_categories', 'Add Categories', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10258, 0, 'en', 'labels', 'backend.bundles.slug_placeholder', 'Input slug or it will be generated automatically', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10259, 0, 'en', 'labels', 'backend.bundles.select_category', 'Select Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10260, 0, 'en', 'labels', 'backend.bundles.select_courses', 'Select Courses', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10261, 0, 'en', 'labels', 'backend.bundles.select_teachers', 'Select Teachers', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10262, 0, 'en', 'labels', 'backend.bundles.test', 'Test', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10263, 0, 'en', 'labels', 'backend.bundles.lesson', 'Lesson', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10264, 0, 'en', 'labels', 'backend.bundles.create', 'Create Bundle', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10265, 0, 'en', 'labels', 'backend.bundles.edit', 'Edit Bundle', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10266, 0, 'en', 'labels', 'backend.bundles.view', 'View Bundles', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10267, 0, 'en', 'labels', 'backend.bundles.category', 'Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10268, 0, 'en', 'labels', 'backend.bundles.save_timeline', 'Save timeline', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10269, 0, 'en', 'labels', 'backend.bundles.course_timeline', 'Course timeline', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10270, 0, 'en', 'labels', 'backend.bundles.timeline_description', 'Drag and change sequence of Lessons/Tests for course', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10271, 0, 'en', 'labels', 'backend.bundles.listing_note', 'Only Published Lessons and Tests will be Displayed and Sorted.', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10272, 0, 'en', 'labels', 'backend.reports.title', 'Reports', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10273, 0, 'en', 'labels', 'backend.reports.sales_report', 'Sales Report', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10274, 0, 'en', 'labels', 'backend.reports.students_report', 'Students Report', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10275, 0, 'en', 'labels', 'backend.reports.bundles', 'Bundles', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10276, 0, 'en', 'labels', 'backend.reports.courses', 'Courses', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10277, 0, 'en', 'labels', 'backend.reports.total_earnings', 'Total Earnings', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10278, 0, 'en', 'labels', 'backend.reports.total_sales', 'Total Sales', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10279, 0, 'en', 'labels', 'backend.reports.date_range', 'Date Range', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10280, 0, 'en', 'labels', 'backend.reports.select_student', 'Select Student', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10281, 0, 'en', 'labels', 'backend.reports.select_bundle', 'Select Bundle', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10282, 0, 'en', 'labels', 'backend.reports.select_course', 'Select Course', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10283, 0, 'en', 'labels', 'backend.reports.filter', 'Filter', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10284, 0, 'en', 'labels', 'backend.reports.reset', 'Reset', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10285, 0, 'en', 'labels', 'backend.reports.apply_date', 'Apply Date', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10286, 0, 'en', 'labels', 'backend.reports.date_input_lang.today', 'Today', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10287, 0, 'en', 'labels', 'backend.reports.date_input_lang.yesterday', 'Yesterday', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10288, 0, 'en', 'labels', 'backend.reports.date_input_lang.last_7_days', 'Last 7 Days', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10289, 0, 'en', 'labels', 'backend.reports.date_input_lang.last_30_days', 'Last 30 Days', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10290, 0, 'en', 'labels', 'backend.reports.date_input_lang.this_month', 'This Month', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10291, 0, 'en', 'labels', 'backend.reports.date_input_lang.last_month', 'Last Month', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10292, 0, 'en', 'labels', 'backend.reports.date_input_lang.quarter_to_date', 'Quarter to date', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10293, 0, 'en', 'labels', 'backend.reports.date_input_lang.year_to_date', 'Year to date', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10294, 0, 'en', 'labels', 'backend.reports.fields.name', 'Name', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10295, 0, 'en', 'labels', 'backend.reports.fields.orders', 'Orders', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10296, 0, 'en', 'labels', 'backend.reports.fields.earnings', 'Earnings', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10297, 0, 'en', 'labels', 'backend.reports.fields.course', 'Course', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10298, 0, 'en', 'labels', 'backend.reports.fields.user', 'User', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10299, 0, 'en', 'labels', 'backend.reports.fields.content', 'Content', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10300, 0, 'en', 'labels', 'backend.reports.fields.time', 'Time', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10301, 0, 'en', 'labels', 'backend.reports.fields.students', 'Students', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10302, 0, 'en', 'labels', 'backend.reports.fields.bundle', 'Bundle', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10303, 0, 'en', 'labels', 'backend.reports.fields.completed', 'Completed Course', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10304, 0, 'en', 'labels', 'backend.reports.fields.amount', 'Amount', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10305, 0, 'en', 'labels', 'backend.reports.fields.student', 'Student', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10306, 0, 'en', 'labels', 'backend.reports.fields.date', 'Date', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10307, 0, 'en', 'labels', 'backend.reports.fields.transaction', 'Transaction ID', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10308, 0, 'en', 'labels', 'backend.sitemap.title', 'Sitemap', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10309, 0, 'en', 'labels', 'backend.sitemap.records_per_file', 'Records Per File', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10310, 0, 'en', 'labels', 'backend.sitemap.records_note', 'Number of records per file.', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10311, 0, 'en', 'labels', 'backend.sitemap.generated', 'Sitemap generated successfully.', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10312, 0, 'en', 'labels', 'backend.sitemap.generate', 'Generate', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10313, 0, 'en', 'labels', 'backend.sitemap.daily', 'Daily', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10314, 0, 'en', 'labels', 'backend.sitemap.weekly', 'Weekly', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10315, 0, 'en', 'labels', 'backend.sitemap.monthly', 'Monthly', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10316, 0, 'en', 'labels', 'backend.sitemap.sitemap_note', 'This sitemap tool will generate sitemap for published Course, Bundles and Blog.', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10317, 0, 'en', 'labels', 'backend.forum_category.title', 'Forum Categories', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10318, 0, 'en', 'labels', 'backend.forum_category.create', 'Create Forum Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10319, 0, 'en', 'labels', 'backend.forum_category.edit', 'Edit Forum Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10320, 0, 'en', 'labels', 'backend.forum_category.view', 'View Forum Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10321, 0, 'en', 'labels', 'backend.forum_category.on', 'On', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10322, 0, 'en', 'labels', 'backend.forum_category.off', 'Off', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10323, 0, 'en', 'labels', 'backend.forum_category.fields.parent_category', 'Parent Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10324, 0, 'en', 'labels', 'backend.forum_category.fields.category', 'Category', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10325, 0, 'en', 'labels', 'backend.forum_category.fields.order', 'Order', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10326, 0, 'en', 'labels', 'backend.forum_category.fields.color', 'Color', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10327, 0, 'en', 'labels', 'backend.forum_category.fields.status', 'Status', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10328, 0, 'en', 'labels', 'backend.payments.title', 'Payments', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10329, 0, 'en', 'labels', 'backend.payments.total_earnings', 'Total Earnings', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10330, 0, 'en', 'labels', 'backend.payments.total_withdrawals', 'Total Withdrawals', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10331, 0, 'en', 'labels', 'backend.payments.total_withdrawal_pending', 'Total Withdrawal Pending', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10332, 0, 'en', 'labels', 'backend.payments.total_balance', 'Total Balance', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10333, 0, 'en', 'labels', 'backend.payments.earnings', 'Earnings', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10334, 0, 'en', 'labels', 'backend.payments.withdrawals', 'Withdrawals', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10335, 0, 'en', 'labels', 'backend.payments.add_withdrawal_request', 'Add Withdrawal Request', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10336, 0, 'en', 'labels', 'backend.payments.approve', 'Approve', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10337, 0, 'en', 'labels', 'backend.payments.reject', 'Reject', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10338, 0, 'en', 'labels', 'backend.payments.payment_type.bank', 'Bank', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10339, 0, 'en', 'labels', 'backend.payments.payment_type.paypal', 'Paypal', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10340, 0, 'en', 'labels', 'backend.payments.payment_type.offline', 'Offline', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10341, 0, 'en', 'labels', 'backend.payments.status.pending', 'Pending', '2022-02-16 17:18:00', '2022-07-22 00:14:05'),
(10342, 0, 'en', 'labels', 'backend.payments.status.approved', 'Approved', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10343, 0, 'en', 'labels', 'backend.payments.status.rejected', 'Rejected', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10344, 0, 'en', 'labels', 'backend.payments.fields.amount', 'Amount', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10345, 0, 'en', 'labels', 'backend.payments.fields.payment_type', 'Payment Type', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10346, 0, 'en', 'labels', 'backend.payments.fields.status', 'Status', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10347, 0, 'en', 'labels', 'backend.payments.fields.remarks', 'Remarks', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10348, 0, 'en', 'labels', 'backend.payments.fields.date', 'Date', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10349, 0, 'en', 'labels', 'backend.payments.fields.teacher_name', 'Teacher Name', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10350, 0, 'en', 'labels', 'backend.live_lessons.title', 'Live Lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10351, 0, 'en', 'labels', 'backend.live_lessons.create', 'Create Live Lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10352, 0, 'en', 'labels', 'backend.live_lessons.edit', 'Edit Live Lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10353, 0, 'en', 'labels', 'backend.live_lessons.view', 'View Lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10354, 0, 'en', 'labels', 'backend.live_lessons.select_course', 'Select Course', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10355, 0, 'en', 'labels', 'backend.live_lessons.short_description_placeholder', 'Input short description of live lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10356, 0, 'en', 'labels', 'backend.live_lessons.fields.course', 'Course', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10357, 0, 'en', 'labels', 'backend.live_lessons.fields.title', 'Title', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10358, 0, 'en', 'labels', 'backend.live_lessons.fields.short_text', 'Sort Description', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10359, 0, 'en', 'labels', 'backend.live_lesson_slots.title', 'Live Lesson Slots', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10360, 0, 'en', 'labels', 'backend.live_lesson_slots.select_lesson', 'Select Lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10361, 0, 'en', 'labels', 'backend.live_lesson_slots.create', 'Create Live Lesson Slot', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10362, 0, 'en', 'labels', 'backend.live_lesson_slots.edit', 'Edit Live Lesson Slot', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10363, 0, 'en', 'labels', 'backend.live_lesson_slots.view', 'View Slot', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10364, 0, 'en', 'labels', 'backend.live_lesson_slots.slot', 'Slot', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10365, 0, 'en', 'labels', 'backend.live_lesson_slots.short_description_placeholder', 'Input short description of slot', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10366, 0, 'en', 'labels', 'backend.live_lesson_slots.start_url', 'Start URL', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10367, 0, 'en', 'labels', 'backend.live_lesson_slots.slot_booked_student_list', 'Slot Booked Student List', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10368, 0, 'en', 'labels', 'backend.live_lesson_slots.student_name', 'Student Name', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10369, 0, 'en', 'labels', 'backend.live_lesson_slots.student_email', 'Student Email', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10370, 0, 'en', 'labels', 'backend.live_lesson_slots.closed', 'Closed', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10371, 0, 'en', 'labels', 'backend.live_lesson_slots.type.select_type', 'Select Type', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10372, 0, 'en', 'labels', 'backend.live_lesson_slots.type.daily', 'Daily', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10373, 0, 'en', 'labels', 'backend.live_lesson_slots.type.weekly', 'Weekly', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10374, 0, 'en', 'labels', 'backend.live_lesson_slots.type.monthly', 'Monthly', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10375, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.lesson', 'Lesson', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10376, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.topic', 'Topic', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10377, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.short_text', 'Sort Description', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10378, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.date_of_slot', 'Date', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10379, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.duration', 'Duration(in minutes)', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10380, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.meeting_id', 'Meeting ID', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10381, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.date', 'Date', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10382, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.password', 'Password', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10383, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.change_default_setting', 'Change Default Setting', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10384, 0, 'en', 'labels', 'backend.live_lesson_slots.fields.student_limit', 'Student Limit', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10385, 0, 'en', 'labels', 'backend.zoom_setting.management', 'Zoom Setting', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10386, 0, 'en', 'labels', 'backend.zoom_setting.audio_options.both', 'Both', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10387, 0, 'en', 'labels', 'backend.zoom_setting.audio_options.voip', 'VoIP', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10388, 0, 'en', 'labels', 'backend.zoom_setting.audio_options.telephony', 'Telephony', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10389, 0, 'en', 'labels', 'backend.zoom_setting.meeting_approval_options.automatically', 'Automatically', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10390, 0, 'en', 'labels', 'backend.zoom_setting.meeting_approval_options.manually', 'Manually', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10391, 0, 'en', 'labels', 'backend.zoom_setting.meeting_approval_options.no_registration_required', 'No Registration Required', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10392, 0, 'en', 'labels', 'backend.zoom_setting.auto_recording_options.none', 'None', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10393, 0, 'en', 'labels', 'backend.zoom_setting.auto_recording_options.local', 'Local', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10394, 0, 'en', 'labels', 'backend.zoom_setting.auto_recording_options.cloud', 'Cloud', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10395, 0, 'en', 'labels', 'backend.zoom_setting.fields.api_key', 'API Key', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10396, 0, 'en', 'labels', 'backend.zoom_setting.fields.api_secret', 'Secret Key', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10397, 0, 'en', 'labels', 'backend.zoom_setting.fields.join_before_host', 'Join Before Host', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10398, 0, 'en', 'labels', 'backend.zoom_setting.fields.host_video', 'Host Video', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10399, 0, 'en', 'labels', 'backend.zoom_setting.fields.participant_video', 'Participant Video', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10400, 0, 'en', 'labels', 'backend.zoom_setting.fields.participant_mic_mute', 'Participant Mic Mute', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10401, 0, 'en', 'labels', 'backend.zoom_setting.fields.waiting_room', 'Waiting Room', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10402, 0, 'en', 'labels', 'backend.zoom_setting.fields.audio_option', 'Audio Option', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10403, 0, 'en', 'labels', 'backend.zoom_setting.fields.meeting_join_approval', 'Meeting Join Approval', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10404, 0, 'en', 'labels', 'backend.zoom_setting.fields.auto_recording', 'Auto Recording', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10405, 0, 'en', 'labels', 'backend.zoom_setting.fields.timezone', 'Timezone', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10406, 0, 'en', 'labels', 'backend.stripe.plan.title', 'Stripe Plans', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10407, 0, 'en', 'labels', 'backend.stripe.plan.create', 'Create Stripe Plan', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10408, 0, 'en', 'labels', 'backend.stripe.plan.edit', 'Edit Stripe Plan', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10409, 0, 'en', 'labels', 'backend.stripe.plan.view', 'View Stripe Plan', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10410, 0, 'en', 'labels', 'backend.stripe.plan.select_product', 'Select Product', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10411, 0, 'en', 'labels', 'backend.stripe.plan.course', '{0} Unlimited Access|{99} Not Access|[1,*] :quantity', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10412, 0, 'en', 'labels', 'backend.stripe.plan.bundle', '{0} Unlimited Access|{99} Not Access|[1,*] :quantity', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10413, 0, 'en', 'labels', 'backend.stripe.plan.interval_type.', 'Select Interval', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10414, 0, 'en', 'labels', 'backend.stripe.plan.interval_type.day', 'Day', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10415, 0, 'en', 'labels', 'backend.stripe.plan.interval_type.week', 'Week', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10416, 0, 'en', 'labels', 'backend.stripe.plan.interval_type.month', 'Month', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10417, 0, 'en', 'labels', 'backend.stripe.plan.interval_type.year', 'Year', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10418, 0, 'en', 'labels', 'backend.stripe.plan.input_quantity_note', '0 Means Unlimited Access, 99  Means Not Access', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10419, 0, 'en', 'labels', 'backend.stripe.plan.stripe_currency_note', '<strong>Please use currency code in lower case. Find your currency code <a href=\"//stripe.com/docs/currencies#presentment-currencies\" target=\"_blank\">Here</a></strong>', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10420, 0, 'en', 'labels', 'backend.stripe.plan.fields.product', 'Product', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10421, 0, 'en', 'labels', 'backend.stripe.plan.fields.name', 'Name', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10422, 0, 'en', 'labels', 'backend.stripe.plan.fields.description', 'Description', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10423, 0, 'en', 'labels', 'backend.stripe.plan.fields.amount', 'Amount', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10424, 0, 'en', 'labels', 'backend.stripe.plan.fields.currency', 'Currency', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10425, 0, 'en', 'labels', 'backend.stripe.plan.fields.interval', 'Interval', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10426, 0, 'en', 'labels', 'backend.stripe.plan.fields.course', 'Course Quantity', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10427, 0, 'en', 'labels', 'backend.stripe.plan.fields.bundle', 'Bundle Quantity', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10428, 0, 'en', 'labels', 'backend.subscription.title', 'Subscription', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10429, 0, 'en', 'labels', 'backend.subscription.invoice_list', 'Invoice List', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10430, 0, 'en', 'labels', 'backend.subscription.click_here', 'Click Here', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10431, 0, 'en', 'labels', 'backend.subscription.cancel_title', 'Cancel Subscription', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10432, 0, 'en', 'labels', 'backend.subscription.subscribe_plan', 'Subscribe Plan', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10433, 0, 'en', 'labels', 'backend.subscription.date', 'Date', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10434, 0, 'en', 'labels', 'backend.subscription.sub_total', 'Sub Total', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10435, 0, 'en', 'labels', 'backend.subscription.total', 'Total', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10436, 0, 'en', 'labels', 'backend.subscription.download', 'Download', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10437, 0, 'en', 'labels', 'backend.subscription.active_plan', 'Active Plan', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10438, 0, 'en', 'labels', 'backend.subscription.course', 'Course', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10439, 0, 'en', 'labels', 'backend.subscription.bundle', 'Bundle', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10440, 0, 'en', 'labels', 'backend.subscription.quantity', '{0} Unlimited|{99} Not Access|[1,*] :quantity', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10441, 0, 'en', 'labels', 'backend.wishlist.title', 'Wishlist', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10442, 0, 'en', 'labels', 'backend.wishlist.course', 'Course', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10443, 0, 'en', 'labels', 'general.id', 'ID', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10444, 0, 'en', 'labels', 'general.active', 'Active', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10445, 0, 'en', 'labels', 'general.inactive', 'Inactive', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10446, 0, 'en', 'labels', 'general.yes', 'Yes', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10447, 0, 'en', 'labels', 'general.no', 'No', '2022-02-16 17:18:01', '2022-07-22 00:14:05'),
(10448, 0, 'en', 'labels', 'general.none', 'None', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10449, 0, 'en', 'labels', 'general.back', 'Back', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10450, 0, 'en', 'labels', 'general.more', 'More', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10451, 0, 'en', 'labels', 'general.buttons.update', 'Update', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10452, 0, 'en', 'labels', 'general.buttons.cancel', 'Cancel', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10453, 0, 'en', 'labels', 'general.buttons.save', 'Save', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10454, 0, 'en', 'labels', 'general.toolbar_btn_groups', 'Toolbar with button groups', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10455, 0, 'en', 'labels', 'general.create_new', 'Create New', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10456, 0, 'en', 'labels', 'general.all', 'All', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10457, 0, 'en', 'labels', 'general.trash', 'Trash', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10458, 0, 'en', 'labels', 'general.delete', 'Delete', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10459, 0, 'en', 'labels', 'general.no_data_available', 'No data available', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10460, 0, 'en', 'labels', 'general.edit', 'Edit', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10461, 0, 'en', 'labels', 'general.copyright', 'Copyright', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10462, 0, 'en', 'labels', 'general.delete_selected', 'Delete Selected', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10463, 0, 'en', 'labels', 'general.custom', 'Custom', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10464, 0, 'en', 'labels', 'general.actions', 'Actions', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10465, 0, 'en', 'labels', 'general.hide', 'Hide', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10466, 0, 'en', 'labels', 'general.show', 'Show', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10467, 0, 'en', 'labels', 'general.toggle_navigation', 'Toggle Navigation', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10468, 0, 'en', 'labels', 'general.sr_no', 'Sr No.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10469, 0, 'en', 'labels', 'general.read_more', 'Read More', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10470, 0, 'en', 'labels', 'frontend.auth.login_button', 'Login', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10471, 0, 'en', 'labels', 'frontend.auth.login_box_title', 'Login', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10472, 0, 'en', 'labels', 'frontend.auth.remember_me', 'Remember Me', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10473, 0, 'en', 'labels', 'frontend.auth.register_box_title', 'Register', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10474, 0, 'en', 'labels', 'frontend.auth.register_button', 'Register', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10475, 0, 'en', 'labels', 'frontend.auth.login_with', 'Login with :social_media', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10476, 0, 'en', 'labels', 'frontend.passwords.reset_password_box_title', 'Reset Password', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10477, 0, 'en', 'labels', 'frontend.passwords.send_password_reset_link_button', 'Send Password Reset Link', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10478, 0, 'en', 'labels', 'frontend.passwords.expired_password_box_title', 'Your password has expired.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10479, 0, 'en', 'labels', 'frontend.passwords.update_password_button', 'Update Password', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10480, 0, 'en', 'labels', 'frontend.passwords.reset_password_button', 'Reset Password', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10481, 0, 'en', 'labels', 'frontend.passwords.forgot_password', 'Forgot Your Password?', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10482, 0, 'en', 'labels', 'frontend.blog.share_this_news', 'Share this news', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10483, 0, 'en', 'labels', 'frontend.blog.related_news', '<span>Related</span> News', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10484, 0, 'en', 'labels', 'frontend.blog.post_comments', 'Post <span>Comments.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10485, 0, 'en', 'labels', 'frontend.blog.write_a_comment', 'Write a Comment', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10486, 0, 'en', 'labels', 'frontend.blog.add_comment', 'Add Comment', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10487, 0, 'en', 'labels', 'frontend.blog.by', 'By', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10488, 0, 'en', 'labels', 'frontend.blog.title', 'Blog', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10489, 0, 'en', 'labels', 'frontend.blog.search_blog', 'Search Blog', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10490, 0, 'en', 'labels', 'frontend.blog.blog_categories', 'Blog <span>Categories.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10491, 0, 'en', 'labels', 'frontend.blog.popular_tags', 'Popular <span>Tags.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10492, 0, 'en', 'labels', 'frontend.blog.featured_course', 'Featured <span>Course.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10493, 0, 'en', 'labels', 'frontend.blog.login_to_post_comment', 'Login to Post a Comment', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10494, 0, 'en', 'labels', 'frontend.blog.no_comments_yet', 'No comments yet, Be the first to comment.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10495, 0, 'en', 'labels', 'frontend.cart.payment_status', 'Payment Status', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10496, 0, 'en', 'labels', 'frontend.cart.payment_cards', 'Credit or Debit Card', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10497, 0, 'en', 'labels', 'frontend.cart.name_on_card_placeholder', 'Enter the name written on your card', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10498, 0, 'en', 'labels', 'frontend.cart.no_payment_method', 'No payment method available at this moment', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10499, 0, 'en', 'labels', 'frontend.cart.card_number_placeholder', 'Enter your card number', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10500, 0, 'en', 'labels', 'frontend.cart.cvv', 'CVV', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10501, 0, 'en', 'labels', 'frontend.cart.mm', 'MM', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10502, 0, 'en', 'labels', 'frontend.cart.yy', 'YY', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10503, 0, 'en', 'labels', 'frontend.cart.pay_now', 'Pay Now', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10504, 0, 'en', 'labels', 'frontend.cart.stripe_error_message', 'Please correct the errors and try again.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10505, 0, 'en', 'labels', 'frontend.cart.paypal', 'PayPal', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10506, 0, 'en', 'labels', 'frontend.cart.pay_securely_paypal', 'Pay securely with PayPal', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10507, 0, 'en', 'labels', 'frontend.cart.offline_payment', 'Offline Payment', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10508, 0, 'en', 'labels', 'frontend.cart.offline_payment_note', 'In this payment method our executives will contact you and give you instructions regarding payment and course purchase.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10509, 0, 'en', 'labels', 'frontend.cart.request_assistance', 'Request Assistance', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10510, 0, 'en', 'labels', 'frontend.cart.cart', 'Cart', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10511, 0, 'en', 'labels', 'frontend.cart.checkout', 'Checkout', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10512, 0, 'en', 'labels', 'frontend.cart.your_shopping_cart', 'Your Shopping Cart', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10513, 0, 'en', 'labels', 'frontend.cart.complete_your_purchases', 'Complete<span> Your Purchases.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10514, 0, 'en', 'labels', 'frontend.cart.order_item', 'Order <span>Item.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10515, 0, 'en', 'labels', 'frontend.cart.course_name', 'Course Name', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10516, 0, 'en', 'labels', 'frontend.cart.course_type', 'Course Type', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10517, 0, 'en', 'labels', 'frontend.cart.starts', 'Starts', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10518, 0, 'en', 'labels', 'frontend.cart.empty_cart', 'Your cart is empty', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10519, 0, 'en', 'labels', 'frontend.cart.order_payment', 'Order <span>Payment.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10520, 0, 'en', 'labels', 'frontend.cart.name_on_card', 'Name on Card', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10521, 0, 'en', 'labels', 'frontend.cart.card_number', 'Card Number', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10522, 0, 'en', 'labels', 'frontend.cart.expiration_date', 'Expiration Date', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10523, 0, 'en', 'labels', 'frontend.cart.confirmation_note', 'By confirming this purchase, I agree to the <b>Term of Use, Refund Policy</b> and <b>Privacy Policy</b>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10524, 0, 'en', 'labels', 'frontend.cart.order_detail', 'Order <span>Detail.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10525, 0, 'en', 'labels', 'frontend.cart.total', 'Total', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10526, 0, 'en', 'labels', 'frontend.cart.your_payment_status', 'Your <span>Payment Status.</span>', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10527, 0, 'en', 'labels', 'frontend.cart.success_message', 'Congratulations. Enjoy your course', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10528, 0, 'en', 'labels', 'frontend.cart.see_more_courses', 'See More Courses', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10529, 0, 'en', 'labels', 'frontend.cart.go_back_to_cart', 'Go back to Cart', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10530, 0, 'en', 'labels', 'frontend.cart.product_name', 'Product Name', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10531, 0, 'en', 'labels', 'frontend.cart.product_type', 'Product Type', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10532, 0, 'en', 'labels', 'frontend.cart.product_added', 'Product added to cart successfully', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10533, 0, 'en', 'labels', 'frontend.cart.try_again', 'Error! Please Try again.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10534, 0, 'en', 'labels', 'frontend.cart.payment_done', 'Payment done successfully !', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10535, 0, 'en', 'labels', 'frontend.cart.payment_failed', 'Error! Payment Failed!', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10536, 0, 'en', 'labels', 'frontend.cart.offline_request', 'Request received successfully! check your registered email for further details.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10537, 0, 'en', 'labels', 'frontend.cart.purchase_successful', 'Congratulations! You\'ve purchased this course.', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10538, 0, 'en', 'labels', 'frontend.cart.unknown_error', 'Unknown error occurred', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10539, 0, 'en', 'labels', 'frontend.cart.connection_timeout', 'Connection Timeout', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10540, 0, 'en', 'labels', 'frontend.cart.sub_total', 'Sub Total', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10541, 0, 'en', 'labels', 'frontend.cart.apply', 'Apply', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10542, 0, 'en', 'labels', 'frontend.cart.items', 'items', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10543, 0, 'en', 'labels', 'frontend.cart.item', 'item', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10544, 0, 'en', 'labels', 'frontend.cart.offers', 'Offers', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10545, 0, 'en', 'labels', 'frontend.cart.empty_input', 'Write coupon code before applying', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10546, 0, 'en', 'labels', 'frontend.cart.invalid_coupon', 'Invalid Coupon!', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10547, 0, 'en', 'labels', 'frontend.cart.amount', 'Amount', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10548, 0, 'en', 'labels', 'frontend.cart.total_payable', 'Total Payable', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10549, 0, 'en', 'labels', 'frontend.cart.price', 'Price', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10550, 0, 'en', 'labels', 'frontend.cart.instamojo', 'Instamojo', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10551, 0, 'en', 'labels', 'frontend.cart.pay_securely_instamojo', 'Pay securely with Instamojo', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10552, 0, 'en', 'labels', 'frontend.cart.razorpay', 'RazorPay', '2022-02-16 17:18:02', '2022-07-22 00:14:05'),
(10553, 0, 'en', 'labels', 'frontend.cart.pay_securely_razorpay', 'Pay securely with RazorPay', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10554, 0, 'en', 'labels', 'frontend.cart.cashfree', 'CashFree', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10555, 0, 'en', 'labels', 'frontend.cart.pay_securely_cashfree', 'Pay securely with CashFree', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10556, 0, 'en', 'labels', 'frontend.cart.user_email', 'Email', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10557, 0, 'en', 'labels', 'frontend.cart.user_phone', 'Phone', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10558, 0, 'en', 'labels', 'frontend.cart.user_name', 'Name', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10559, 0, 'en', 'labels', 'frontend.cart.payu', 'PayUMoney', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10560, 0, 'en', 'labels', 'frontend.cart.pay_securely_payu', 'Pay securely with PayUMoney', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10561, 0, 'en', 'labels', 'frontend.cart.flutter', 'Flutter', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10562, 0, 'en', 'labels', 'frontend.cart.pay_securely_flutter', 'Pay securely with Flutter', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10563, 0, 'en', 'labels', 'frontend.contact.title', 'Contact', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10564, 0, 'en', 'labels', 'frontend.contact.your_name', 'Your Name', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10565, 0, 'en', 'labels', 'frontend.contact.your_email', 'Your Email', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10566, 0, 'en', 'labels', 'frontend.contact.phone_number', 'Phone Number', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10567, 0, 'en', 'labels', 'frontend.contact.message', 'Message', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10568, 0, 'en', 'labels', 'frontend.contact.box_title', 'Contact Us', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10569, 0, 'en', 'labels', 'frontend.contact.button', 'Send Information', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10570, 0, 'en', 'labels', 'frontend.contact.send_us_a_message', 'Send Us A<span> Message.</span>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10571, 0, 'en', 'labels', 'frontend.contact.keep_in_touch', 'Keep<span> In Touch.</span>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10572, 0, 'en', 'labels', 'frontend.contact.send_email', 'Send Email', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10573, 0, 'en', 'labels', 'frontend.contact.send_message_now', 'Send Message Now', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10574, 0, 'en', 'labels', 'frontend.badges.trending', 'Trending', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10575, 0, 'en', 'labels', 'frontend.course.ratings', 'Ratings', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10576, 0, 'en', 'labels', 'frontend.course.stars', 'Stars', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10577, 0, 'en', 'labels', 'frontend.course.by', 'By', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10578, 0, 'en', 'labels', 'frontend.course.no_reviews_yet', 'No reviews yet.', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10579, 0, 'en', 'labels', 'frontend.course.add_to_cart', 'Add To Cart', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10580, 0, 'en', 'labels', 'frontend.course.buy_note', 'Only Students Can Buy Course', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10581, 0, 'en', 'labels', 'frontend.course.continue_course', 'Continue Course', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10582, 0, 'en', 'labels', 'frontend.course.enrolled', 'Enrolled', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10583, 0, 'en', 'labels', 'frontend.course.chapters', 'Chapters', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10584, 0, 'en', 'labels', 'frontend.course.category', 'Category', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10585, 0, 'en', 'labels', 'frontend.course.author', 'Author', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10586, 0, 'en', 'labels', 'frontend.course.courses', 'Courses', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10587, 0, 'en', 'labels', 'frontend.course.students', 'Students', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10588, 0, 'en', 'labels', 'frontend.course.give_test_again', 'Give Test Again', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10589, 0, 'en', 'labels', 'frontend.course.submit_results', 'Submit Results', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10590, 0, 'en', 'labels', 'frontend.course.chapter_videos', 'Chapter Videos', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10591, 0, 'en', 'labels', 'frontend.course.download_files', 'Download Files', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10592, 0, 'en', 'labels', 'frontend.course.mb', 'MB', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10593, 0, 'en', 'labels', 'frontend.course.prev', 'PREV', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10594, 0, 'en', 'labels', 'frontend.course.test', 'Test', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10595, 0, 'en', 'labels', 'frontend.course.completed', 'Completed', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10596, 0, 'en', 'labels', 'frontend.course.title', 'Course', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10597, 0, 'en', 'labels', 'frontend.course.course_details', '<span>Course Details.</span>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10598, 0, 'en', 'labels', 'frontend.course.course_detail', 'Course Details', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10599, 0, 'en', 'labels', 'frontend.course.course_timeline', 'Course <b>Timeline:</b>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10600, 0, 'en', 'labels', 'frontend.course.go', 'Go', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10601, 0, 'en', 'labels', 'frontend.course.course_reviews', 'Course <span>Reviews:</span>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10602, 0, 'en', 'labels', 'frontend.course.average_rating', 'Average Rating', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10603, 0, 'en', 'labels', 'frontend.course.details', 'Details', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10604, 0, 'en', 'labels', 'frontend.course.add_reviews', 'Add <span>Reviews.</span>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10605, 0, 'en', 'labels', 'frontend.course.your_rating', 'Your Rating', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10606, 0, 'en', 'labels', 'frontend.course.message', 'Message', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10607, 0, 'en', 'labels', 'frontend.course.add_review_now', 'Add Review Now', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10608, 0, 'en', 'labels', 'frontend.course.price', 'Price', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10609, 0, 'en', 'labels', 'frontend.course.added_to_cart', 'Added To Cart', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10610, 0, 'en', 'labels', 'frontend.course.buy_now', 'Buy Now', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10611, 0, 'en', 'labels', 'frontend.course.get_now', 'Get Now', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10612, 0, 'en', 'labels', 'frontend.course.recent_news', '<span>Recent  </span>News.', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10613, 0, 'en', 'labels', 'frontend.course.view_all_news', 'View All News', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10614, 0, 'en', 'labels', 'frontend.course.featured_course', '<span>Featured</span> Course.', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10615, 0, 'en', 'labels', 'frontend.course.sort_by', '<b>Sort</b> By', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10616, 0, 'en', 'labels', 'frontend.course.popular', 'Popular', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10617, 0, 'en', 'labels', 'frontend.course.none', 'None', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10618, 0, 'en', 'labels', 'frontend.course.trending', 'Trending', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10619, 0, 'en', 'labels', 'frontend.course.featured', 'Featured', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10620, 0, 'en', 'labels', 'frontend.course.course_name', 'Course Name', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10621, 0, 'en', 'labels', 'frontend.course.course_type', 'Course Type', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10622, 0, 'en', 'labels', 'frontend.course.starts', 'Starts', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10623, 0, 'en', 'labels', 'frontend.course.full_text', 'FULL TEXT', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10624, 0, 'en', 'labels', 'frontend.course.find_courses', 'FIND COURSES', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10625, 0, 'en', 'labels', 'frontend.course.your_test_score', 'Your Test Score', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10626, 0, 'en', 'labels', 'frontend.course.find_your_course', '<span>Find </span>Your Course.', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10627, 0, 'en', 'labels', 'frontend.course.next', 'NEXT', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10628, 0, 'en', 'labels', 'frontend.course.progress', 'Progress', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10629, 0, 'en', 'labels', 'frontend.course.finish_course', 'Finish Course', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10630, 0, 'en', 'labels', 'frontend.course.certified', 'You\'re Certified for this course', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10631, 0, 'en', 'labels', 'frontend.course.course', 'Course', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10632, 0, 'en', 'labels', 'frontend.course.bundles', 'Bundles', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10633, 0, 'en', 'labels', 'frontend.course.bundle_detail', 'Bundle Details', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10634, 0, 'en', 'labels', 'frontend.course.bundle_reviews', 'Bundle <span>Reviews:</span>', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10635, 0, 'en', 'labels', 'frontend.course.available_in_bundles', 'Also available in Bundles', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10636, 0, 'en', 'labels', 'frontend.course.complete_test', 'Please Complete Test', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10637, 0, 'en', 'labels', 'frontend.course.looking_for', 'Looking For?', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10638, 0, 'en', 'labels', 'frontend.course.not_attempted', 'Not Attempted', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10639, 0, 'en', 'labels', 'frontend.course.explanation', 'Explanation', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10640, 0, 'en', 'labels', 'frontend.course.find_your_bundle', '<span>Find</span> your Bundle', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10641, 0, 'en', 'labels', 'frontend.course.select_category', 'Select Category', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10642, 0, 'en', 'labels', 'frontend.course.live_lesson', 'Live Lessons', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10643, 0, 'en', 'labels', 'frontend.course.slot', 'Slot', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10644, 0, 'en', 'labels', 'frontend.course.available_slots', 'Available Slots', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10645, 0, 'en', 'labels', 'frontend.course.date', 'Date', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10646, 0, 'en', 'labels', 'frontend.course.live_lesson_join_url', 'Join URL', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10647, 0, 'en', 'labels', 'frontend.course.live_lesson_meeting_password', 'Password', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10648, 0, 'en', 'labels', 'frontend.course.live_lesson_meeting_date', 'Meeting Date', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10649, 0, 'en', 'labels', 'frontend.course.live_lesson_meeting_id', 'Meeting ID', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10650, 0, 'en', 'labels', 'frontend.course.live_lesson_meeting_duration', 'Durations', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10651, 0, 'en', 'labels', 'frontend.course.book_slot', 'Book a Slot', '2022-02-16 17:18:03', '2022-07-22 00:14:05');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(10652, 0, 'en', 'labels', 'frontend.course.full_slot', 'Slot is full', '2022-02-16 17:18:03', '2022-07-22 00:14:05'),
(10653, 0, 'en', 'labels', 'frontend.course.subscribe', 'Subscribe', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10654, 0, 'en', 'labels', 'frontend.course.original_price', 'Original Price', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10655, 0, 'en', 'labels', 'frontend.home.title', 'Home', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10656, 0, 'en', 'labels', 'frontend.home.search_course_placeholder', 'Type what do you want to learn today?', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10657, 0, 'en', 'labels', 'frontend.home.popular_teachers', '<span>Popular</span> Teachers', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10658, 0, 'en', 'labels', 'frontend.home.learn_new_skills', 'Learn new skills', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10659, 0, 'en', 'labels', 'frontend.home.search_course', 'Search Course', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10660, 0, 'en', 'labels', 'frontend.home.search_courses', '<span>Search</span> Courses.', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10661, 0, 'en', 'labels', 'frontend.home.students_enrolled', 'Students Enrolled', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10662, 0, 'en', 'labels', 'frontend.home.online_available_courses', 'Online Available Courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10663, 0, 'en', 'labels', 'frontend.home.teachers', 'Teachers', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10664, 0, 'en', 'labels', 'frontend.home.our_professionals', 'Our Professionals', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10665, 0, 'en', 'labels', 'frontend.home.all_teachers', 'All Teachers', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10666, 0, 'en', 'labels', 'frontend.home.what_they_say_about_us', 'What they say about us', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10667, 0, 'en', 'labels', 'frontend.home.no_data_available', 'No data available', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10668, 0, 'en', 'labels', 'frontend.layouts.partials.advantages', 'Advantages', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10669, 0, 'en', 'labels', 'frontend.layouts.partials.email_address', 'Email Address', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10670, 0, 'en', 'labels', 'frontend.layouts.partials.email_registration', 'Email Us For Free Registration', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10671, 0, 'en', 'labels', 'frontend.layouts.partials.call_us_registration', 'Call Us For Free Registration', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10672, 0, 'en', 'labels', 'frontend.layouts.partials.students', 'Students', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10673, 0, 'en', 'labels', 'frontend.layouts.partials.faq', 'FAQ', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10674, 0, 'en', 'labels', 'frontend.layouts.partials.more_faqs', 'More Faqs', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10675, 0, 'en', 'labels', 'frontend.layouts.partials.search_placeholder', 'Type what do you want to learn today?', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10676, 0, 'en', 'labels', 'frontend.layouts.partials.search_our_courses', 'SEARCH OUR COURSES', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10677, 0, 'en', 'labels', 'frontend.layouts.partials.browse_featured_course', 'Browse Our<span> Featured Course.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10678, 0, 'en', 'labels', 'frontend.layouts.partials.course_detail', 'Course detail', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10679, 0, 'en', 'labels', 'frontend.layouts.partials.contact_us', 'Contact Us', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10680, 0, 'en', 'labels', 'frontend.layouts.partials.get_in_touch', 'Get In Touch', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10681, 0, 'en', 'labels', 'frontend.layouts.partials.primary', 'Primary', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10682, 0, 'en', 'labels', 'frontend.layouts.partials.second', 'Second', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10683, 0, 'en', 'labels', 'frontend.layouts.partials.courses_categories', 'Courses Categories', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10684, 0, 'en', 'labels', 'frontend.layouts.partials.browse_course_by_category', 'Browse Courses<span> By Category.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10685, 0, 'en', 'labels', 'frontend.layouts.partials.faq_full', 'Frequently<span> Asked Questions</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10686, 0, 'en', 'labels', 'frontend.layouts.partials.social_network', 'Social Network', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10687, 0, 'en', 'labels', 'frontend.layouts.partials.subscribe_newsletter', 'Subscribe Newsletter', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10688, 0, 'en', 'labels', 'frontend.layouts.partials.subscribe_now', 'Subscribe Now', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10689, 0, 'en', 'labels', 'frontend.layouts.partials.latest_news_blog', 'Latest <span>News Blog.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10690, 0, 'en', 'labels', 'frontend.layouts.partials.trending_courses', 'Trending <span>Courses.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10691, 0, 'en', 'labels', 'frontend.layouts.partials.popular_courses', 'Popular <span>Courses.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10692, 0, 'en', 'labels', 'frontend.layouts.partials.view_all_news', 'View All News', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10693, 0, 'en', 'labels', 'frontend.layouts.partials.view_all_trending_courses', 'View All Trending Courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10694, 0, 'en', 'labels', 'frontend.layouts.partials.view_all_popular_courses', 'View All Popular Courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10695, 0, 'en', 'labels', 'frontend.layouts.partials.learn_new_skills', 'Learn new skills', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10696, 0, 'en', 'labels', 'frontend.layouts.partials.recent_news', '<span>Recent  </span>News.', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10697, 0, 'en', 'labels', 'frontend.layouts.partials.featured_course', '<span>Featured  </span>Course.', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10698, 0, 'en', 'labels', 'frontend.layouts.partials.days', 'Days', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10699, 0, 'en', 'labels', 'frontend.layouts.partials.hours', 'Hours', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10700, 0, 'en', 'labels', 'frontend.layouts.partials.minutes', 'Minutes', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10701, 0, 'en', 'labels', 'frontend.layouts.partials.seconds', 'Seconds', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10702, 0, 'en', 'labels', 'frontend.layouts.partials.search_courses', 'Search Courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10703, 0, 'en', 'labels', 'frontend.layouts.partials.sponsors', 'Sponsors.', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10704, 0, 'en', 'labels', 'frontend.layouts.partials.students_testimonial', 'Students <span>Testimonial.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10705, 0, 'en', 'labels', 'frontend.layouts.partials.why_choose', 'Reason Why Choose', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10706, 0, 'en', 'labels', 'frontend.layouts.partials.certificate_verification', 'Certificate Verification', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10707, 0, 'en', 'labels', 'frontend.layouts.partials.offers', 'Offers', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10708, 0, 'en', 'labels', 'frontend.modal.new_user_note', 'New User? Register Here', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10709, 0, 'en', 'labels', 'frontend.modal.registration_message', 'Registration Successful. Please LogIn', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10710, 0, 'en', 'labels', 'frontend.modal.my_account', 'My Account', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10711, 0, 'en', 'labels', 'frontend.modal.login_register', '<a href=\"#\" class=\"font-weight-bold go-login px-0\">LOGIN</a> to our website, or <a href=\"#\" class=\"font-weight-bold go-register px-0\" id=\"\">REGISTER</a>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10712, 0, 'en', 'labels', 'frontend.modal.already_user_note', 'Already a user? Login Here', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10713, 0, 'en', 'labels', 'frontend.modal.login_now', 'LogIn Now', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10714, 0, 'en', 'labels', 'frontend.modal.register_now', 'Register Now', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10715, 0, 'en', 'labels', 'frontend.search_result.students', 'Students', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10716, 0, 'en', 'labels', 'frontend.search_result.blog', 'Blog', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10717, 0, 'en', 'labels', 'frontend.search_result.search_blog', 'Search Blog', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10718, 0, 'en', 'labels', 'frontend.search_result.sort_by', '<b>Sort</b> By', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10719, 0, 'en', 'labels', 'frontend.search_result.popular', 'Popular', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10720, 0, 'en', 'labels', 'frontend.search_result.none', 'None', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10721, 0, 'en', 'labels', 'frontend.search_result.trending', 'Trending', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10722, 0, 'en', 'labels', 'frontend.search_result.featured', 'Featured', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10723, 0, 'en', 'labels', 'frontend.search_result.course_name', 'Course Name', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10724, 0, 'en', 'labels', 'frontend.search_result.course_type', 'Course Type', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10725, 0, 'en', 'labels', 'frontend.search_result.starts', 'Starts', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10726, 0, 'en', 'labels', 'frontend.search_result.course_detail', 'Course Detail', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10727, 0, 'en', 'labels', 'frontend.teacher.send_now', 'Send Now', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10728, 0, 'en', 'labels', 'frontend.teacher.students', 'Students', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10729, 0, 'en', 'labels', 'frontend.teacher.title', 'Teachers', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10730, 0, 'en', 'labels', 'frontend.teacher.courses_by_teacher', 'Courses <span>By Teacher.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10731, 0, 'en', 'labels', 'frontend.teacher.course_detail', 'Course Detail', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10732, 0, 'en', 'labels', 'frontend.user.passwords.change', 'Change Password', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10733, 0, 'en', 'labels', 'frontend.user.profile.avatar', 'Avatar', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10734, 0, 'en', 'labels', 'frontend.user.profile.created_at', 'Created At', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10735, 0, 'en', 'labels', 'frontend.user.profile.edit_information', 'Edit Information', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10736, 0, 'en', 'labels', 'frontend.user.profile.email', 'E-mail', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10737, 0, 'en', 'labels', 'frontend.user.profile.last_updated', 'Last Updated', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10738, 0, 'en', 'labels', 'frontend.user.profile.name', 'Name', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10739, 0, 'en', 'labels', 'frontend.user.profile.first_name', 'First Name', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10740, 0, 'en', 'labels', 'frontend.user.profile.last_name', 'Last Name', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10741, 0, 'en', 'labels', 'frontend.user.profile.update_information', 'Update Information', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10742, 0, 'en', 'labels', 'frontend.faq.title', 'Frequently <span>Asked Questions</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10743, 0, 'en', 'labels', 'frontend.faq.find', 'Find <span>Your Questions & Answers.</span>', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10744, 0, 'en', 'labels', 'frontend.faq.make_question', 'Make Question', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10745, 0, 'en', 'labels', 'frontend.faq.contact_us', 'Contact Us', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10746, 0, 'en', 'labels', 'frontend.certificate_verification.title', 'Certificate Verification', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10747, 0, 'en', 'labels', 'frontend.certificate_verification.name_on_certificate', 'Name on Certificate. Ex. John', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10748, 0, 'en', 'labels', 'frontend.certificate_verification.date_on_certificate', 'Date on Certificate. Ex. 2018-11-25', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10749, 0, 'en', 'labels', 'frontend.certificate_verification.verify_now', 'Verify Now', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10750, 0, 'en', 'labels', 'frontend.certificate_verification.not_found', 'No certificate found for given information.', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10751, 0, 'en', 'labels', 'frontend.footer.popular_courses', 'Popular courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10752, 0, 'en', 'labels', 'frontend.footer.popular_categories', 'Popular Categories', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10753, 0, 'en', 'labels', 'frontend.footer.featured_courses', 'Featured Courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10754, 0, 'en', 'labels', 'frontend.footer.trending_courses', 'Trending Courses', '2022-02-16 17:18:04', '2022-07-22 00:14:05'),
(10755, 0, 'en', 'labels', 'frontend.footer.useful_links', 'Useful Links', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10756, 0, 'en', 'labels', 'frontend.offers.title', 'Offers', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10757, 0, 'en', 'labels', 'frontend.offers.no_offers', 'No Offers', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10758, 0, 'en', 'labels', 'frontend.offers.unlimited', 'Unlimited', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10759, 0, 'en', 'labels', 'frontend.offers.validity', 'Validity', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10760, 0, 'en', 'labels', 'frontend.offers.minimum_order_amount', 'Minimum Order Amount', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10761, 0, 'en', 'labels', 'frontend.offers.usage', 'Usage', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10762, 0, 'en', 'labels', 'frontend.offers.per_user', 'Per User', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10763, 0, 'en', 'labels', 'lang.en', 'English', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10764, 0, 'en', 'labels', 'lang.sp', 'Spanish', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10765, 0, 'en', 'labels', 'lang.fr', 'French', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10766, 0, 'en', 'labels', 'lang.ar', 'Arabic', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10767, 0, 'en', 'labels', 'teacher.teacher_register', 'Register as Teacher? Click Here', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10768, 0, 'en', 'labels', 'teacher.teacher_register_box_title', 'Teacher Register', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10769, 0, 'en', 'labels', 'teacher.facebook_link', 'Facebook Link', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10770, 0, 'en', 'labels', 'teacher.twitter_link', 'Twitter Link', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10771, 0, 'en', 'labels', 'teacher.linkedin_link', 'Linkedin Link', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10772, 0, 'en', 'labels', 'teacher.payment_details', 'Payment Details', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10773, 0, 'en', 'labels', 'teacher.bank', 'Bank', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10774, 0, 'en', 'labels', 'teacher.paypal', 'Paypal', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10775, 0, 'en', 'labels', 'teacher.paypal_email', 'Paypal Email', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10776, 0, 'en', 'labels', 'teacher.bank_details.name', 'Bank Name', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10777, 0, 'en', 'labels', 'teacher.bank_details.bank_code', 'Bank Code', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10778, 0, 'en', 'labels', 'teacher.bank_details.account', 'Account Number', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10779, 0, 'en', 'labels', 'teacher.bank_details.holder_name', 'Account Name', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10780, 0, 'en', 'labels', 'teacher.bank_details.account_number', 'Account Number', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10781, 0, 'en', 'labels', 'teacher.bank_details.ifsc_code', 'IFSC Code', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10782, 0, 'en', 'labels', 'teacher.description', 'Description', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10783, 0, 'en', 'labels', 'subscription.title', 'Subscription Plan', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10784, 0, 'en', 'labels', 'subscription.quantity', '{0} Unlimited Access|[1,*] Total :quantity Quantity Access', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10785, 0, 'en', 'labels', 'subscription.course', '{0} Unlimited Courses Access|{99} Course Not Available|[1,1]:quantity Course|[2,*]:quantity Courses', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10786, 0, 'en', 'labels', 'subscription.bundle', '{0} Unlimited Bundles Access|{99} Bundle Not Available|[1,1]:quantity Bundle|[2,*]:quantity Bundles', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10787, 0, 'en', 'labels', 'subscription.button', 'Subscribe', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10788, 0, 'en', 'labels', 'subscription.plan', 'Plan', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10789, 0, 'en', 'labels', 'subscription.price', 'Price', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10790, 0, 'en', 'labels', 'subscription.trial_period', 'Trial Period :days Days', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10791, 0, 'en', 'labels', 'subscription.payment_status', 'Subscription Payment Status', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10792, 0, 'en', 'labels', 'subscription.already_subscribe', 'Already Subscribe', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10793, 0, 'en', 'labels', 'subscription.your_subscription_status', 'Your <span>Subscription Status.</span>', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10794, 0, 'en', 'labels', 'subscription.go_to_home', 'Home', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10795, 0, 'en', 'labels', 'subscription.go_to_plan', 'Go to Plans', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10796, 0, 'en', 'labels', 'subscription.done', 'Subscription done successfully !', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10797, 0, 'en', 'labels', 'subscription.update', 'Subscription update successfully !', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10798, 0, 'en', 'labels', 'subscription.failed', 'Error! Subscription Failed!', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10799, 0, 'en', 'labels', 'subscription.cancel', 'Subscription Canceled!', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10800, 0, 'en', 'labels', 'subscription.resume', 'Subscription Resume!', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10801, 0, 'en', 'labels', 'subscription.form.name', 'Name', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10802, 0, 'en', 'labels', 'subscription.form.email', 'Email', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10803, 0, 'en', 'labels', 'subscription.form.address', 'Address', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10804, 0, 'en', 'labels', 'subscription.form.city', 'City', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10805, 0, 'en', 'labels', 'subscription.form.state', 'State', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10806, 0, 'en', 'labels', 'subscription.form.zip', 'ZIP', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10807, 0, 'en', 'labels', 'subscription.form.card', 'Card', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10808, 0, 'en', 'labels', 'subscription.form.country_code', 'Country Code', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10809, 0, 'en', 'menus', 'backend.sidebar.general', 'General', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10810, 0, 'en', 'menus', 'backend.sidebar.dashboard', 'Dashboard', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10811, 0, 'en', 'menus', 'backend.sidebar.courses.management', 'Courses Management', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10812, 0, 'en', 'menus', 'backend.sidebar.courses.title', 'Courses', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10813, 0, 'en', 'menus', 'backend.sidebar.courses.manage', 'Manage Courses', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10814, 0, 'en', 'menus', 'backend.sidebar.site-management.title', 'Site Management', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10815, 0, 'en', 'menus', 'backend.sidebar.menu-manager.title', 'Menu Manager', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10816, 0, 'en', 'menus', 'backend.sidebar.system', 'System', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10817, 0, 'en', 'menus', 'backend.sidebar.settings.title', 'Settings', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10818, 0, 'en', 'menus', 'backend.sidebar.settings.general', 'General', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10819, 0, 'en', 'menus', 'backend.sidebar.settings.social-login', 'Social Login', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10820, 0, 'en', 'menus', 'backend.sidebar.settings.zoom_setting', 'Zoom Setting', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10821, 0, 'en', 'menus', 'backend.sidebar.debug-site.title', 'Debug Site', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10822, 0, 'en', 'menus', 'backend.sidebar.history', 'History', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10823, 0, 'en', 'menus', 'backend.sidebar.lessons.title', 'Lessons', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10824, 0, 'en', 'menus', 'backend.sidebar.questions.title', 'Questions', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10825, 0, 'en', 'menus', 'backend.sidebar.textgroups.title', 'Text Groups', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10826, 0, 'en', 'menus', 'backend.sidebar.reports.title', 'Reports', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10827, 0, 'en', 'menus', 'backend.sidebar.reports.students', 'Students', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10828, 0, 'en', 'menus', 'backend.sidebar.reports.sales', 'Sales', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10829, 0, 'en', 'menus', 'backend.sidebar.questions-options.title', 'Questions Options', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10830, 0, 'en', 'menus', 'backend.sidebar.tests.title', 'Tests', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10831, 0, 'en', 'menus', 'backend.sidebar.change-password.title', 'Change Password', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10832, 0, 'en', 'menus', 'backend.sidebar.account.title', 'Account', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10833, 0, 'en', 'menus', 'backend.sidebar.messages.title', 'Messages', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10834, 0, 'en', 'menus', 'backend.sidebar.orders.title', 'Orders', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10835, 0, 'en', 'menus', 'backend.sidebar.categories.title', 'Categories', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10836, 0, 'en', 'menus', 'backend.sidebar.teachers.title', 'Teachers', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10837, 0, 'en', 'menus', 'backend.sidebar.hero-slider.title', 'Hero Slider', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10838, 0, 'en', 'menus', 'backend.sidebar.sponsors.title', 'Sponsors', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10839, 0, 'en', 'menus', 'backend.sidebar.testimonials.title', 'Testimonials', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10840, 0, 'en', 'menus', 'backend.sidebar.blogs.title', 'Blog', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10841, 0, 'en', 'menus', 'backend.sidebar.faqs.title', 'FAQs', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10842, 0, 'en', 'menus', 'backend.sidebar.reasons.title', 'Reasons', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10843, 0, 'en', 'menus', 'backend.sidebar.contact.title', 'Contact', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10844, 0, 'en', 'menus', 'backend.sidebar.footer.title', 'Footer', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10845, 0, 'en', 'menus', 'backend.sidebar.newsletter-configuration.title', 'Newsletter Configuration', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10846, 0, 'en', 'menus', 'backend.sidebar.invoices.title', 'Invoices', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10847, 0, 'en', 'menus', 'backend.sidebar.certificates.title', 'Certificates', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10848, 0, 'en', 'menus', 'backend.sidebar.contacts.title', 'Leads', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10849, 0, 'en', 'menus', 'backend.sidebar.pages.title', 'Pages Manager', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10850, 0, 'en', 'menus', 'backend.sidebar.reviews.title', 'Reviews', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10851, 0, 'en', 'menus', 'backend.sidebar.translations.title', 'Translation Manager', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10852, 0, 'en', 'menus', 'backend.sidebar.update.title', 'Update', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10853, 0, 'en', 'menus', 'backend.sidebar.backup.title', 'Backup', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10854, 0, 'en', 'menus', 'backend.sidebar.bundles.title', 'Bundles', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10855, 0, 'en', 'menus', 'backend.sidebar.coupons.title', 'Coupons', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10856, 0, 'en', 'menus', 'backend.sidebar.tax.title', 'Tax', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10857, 0, 'en', 'menus', 'backend.sidebar.sitemap.title', 'Sitemap', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10858, 0, 'en', 'menus', 'backend.sidebar.forums-category.title', 'Forums Categories', '2022-02-16 17:18:05', '2022-07-22 00:14:05'),
(10859, 0, 'en', 'menus', 'backend.sidebar.payments.title', 'Payments', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10860, 0, 'en', 'menus', 'backend.sidebar.payments_requests.title', 'Payment Requests', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10861, 0, 'en', 'menus', 'backend.sidebar.live_lessons.title', 'Live Lessons', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10862, 0, 'en', 'menus', 'backend.sidebar.live_lesson_slots.title', 'Live Lesson Slots', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10863, 0, 'en', 'menus', 'backend.sidebar.subscription.title', 'Subscription', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10864, 0, 'en', 'menus', 'backend.sidebar.wishlist.title', 'Wishlist', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10865, 0, 'en', 'menus', 'backend.access.title', 'Access', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10866, 0, 'en', 'menus', 'backend.access.roles.management', 'Role Management', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10867, 0, 'en', 'menus', 'backend.access.roles.create', 'Create Role', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10868, 0, 'en', 'menus', 'backend.access.roles.edit', 'Edit Role', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10869, 0, 'en', 'menus', 'backend.access.roles.all', 'All Roles', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10870, 0, 'en', 'menus', 'backend.access.roles.main', 'Roles', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10871, 0, 'en', 'menus', 'backend.access.users.deactivated', 'Deactivated Users', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10872, 0, 'en', 'menus', 'backend.access.users.deleted', 'Deleted Users', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10873, 0, 'en', 'menus', 'backend.access.users.view', 'View User', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10874, 0, 'en', 'menus', 'backend.access.users.edit', 'Edit User', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10875, 0, 'en', 'menus', 'backend.access.users.change-password', 'Change Password', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10876, 0, 'en', 'menus', 'backend.access.users.all', 'All Users', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10877, 0, 'en', 'menus', 'backend.access.users.create', 'Create User', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10878, 0, 'en', 'menus', 'backend.access.users.main', 'Users', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10879, 0, 'en', 'menus', 'backend.log-viewer.dashboard', 'Debug dashboard', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10880, 0, 'en', 'menus', 'backend.log-viewer.logs', 'Logs', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10881, 0, 'en', 'menus', 'backend.log-viewer.main', 'Log Viewer', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10882, 0, 'en', 'menus', 'backend.stripe.title', 'Stripe', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10883, 0, 'en', 'menus', 'backend.stripe.plan', 'Plans', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10884, 0, 'en', 'menus', 'language-picker.language', 'Language', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10885, 0, 'en', 'menus', 'language-picker.langs.ar', 'Arabic', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10886, 0, 'en', 'menus', 'language-picker.langs.zh', 'Chinese', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10887, 0, 'en', 'menus', 'language-picker.langs.zh-TW', 'Chinese Traditional', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10888, 0, 'en', 'menus', 'language-picker.langs.da', 'Danish', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10889, 0, 'en', 'menus', 'language-picker.langs.de', 'German', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10890, 0, 'en', 'menus', 'language-picker.langs.el', 'Greek', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10891, 0, 'en', 'menus', 'language-picker.langs.en', 'English', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10892, 0, 'en', 'menus', 'language-picker.langs.es', 'Spanish', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10893, 0, 'en', 'menus', 'language-picker.langs.fa', 'Persian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10894, 0, 'en', 'menus', 'language-picker.langs.fr', 'French', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10895, 0, 'en', 'menus', 'language-picker.langs.he', 'Hebrew', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10896, 0, 'en', 'menus', 'language-picker.langs.id', 'Indonesian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10897, 0, 'en', 'menus', 'language-picker.langs.it', 'Italian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10898, 0, 'en', 'menus', 'language-picker.langs.ja', 'Japanese', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10899, 0, 'en', 'menus', 'language-picker.langs.nl', 'Dutch', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10900, 0, 'en', 'menus', 'language-picker.langs.no', 'Norwegian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10901, 0, 'en', 'menus', 'language-picker.langs.pt_BR', 'Portuguese (Brazil)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10902, 0, 'en', 'menus', 'language-picker.langs.ru', 'Russian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10903, 0, 'en', 'menus', 'language-picker.langs.sv', 'Swedish', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10904, 0, 'en', 'menus', 'language-picker.langs.th', 'Thai', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10905, 0, 'en', 'menus', 'language-picker.langs.tr', 'Turkish', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10906, 0, 'en', 'menus', 'language-picker.langs.af', 'Afrikaans', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10907, 0, 'en', 'menus', 'language-picker.langs.ak', 'Akan', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10908, 0, 'en', 'menus', 'language-picker.langs.sq_AL', 'Albanian (Albania)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10909, 0, 'en', 'menus', 'language-picker.langs.sq', 'Albanian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10910, 0, 'en', 'menus', 'language-picker.langs.am_ET', 'Amharic (Ethiopia)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10911, 0, 'en', 'menus', 'language-picker.langs.am', 'Amharic', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10912, 0, 'en', 'menus', 'language-picker.langs.ar_DZ', 'Arabic (Algeria)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10913, 0, 'en', 'menus', 'language-picker.langs.ar_BH', 'Arabic (Bahrain)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10914, 0, 'en', 'menus', 'language-picker.langs.ar_EG', 'Arabic (Egypt)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10915, 0, 'en', 'menus', 'language-picker.langs.ar_IQ', 'Arabic (Iraq)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10916, 0, 'en', 'menus', 'language-picker.langs.ar_JO', 'Arabic (Jordan)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10917, 0, 'en', 'menus', 'language-picker.langs.ar_KW', 'Arabic (Kuwait)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10918, 0, 'en', 'menus', 'language-picker.langs.ar_LB', 'Arabic (Lebanon)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10919, 0, 'en', 'menus', 'language-picker.langs.ar_LY', 'Arabic (Libya)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10920, 0, 'en', 'menus', 'language-picker.langs.ar_MA', 'Arabic (Morocco)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10921, 0, 'en', 'menus', 'language-picker.langs.ar_OM', 'Arabic (Oman)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10922, 0, 'en', 'menus', 'language-picker.langs.ar_QA', 'Arabic (Qatar)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10923, 0, 'en', 'menus', 'language-picker.langs.ar_SA', 'Arabic (Saudi Arabia)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10924, 0, 'en', 'menus', 'language-picker.langs.ar_SD', 'Arabic (Sudan)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10925, 0, 'en', 'menus', 'language-picker.langs.ar_SY', 'Arabic (Syria)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10926, 0, 'en', 'menus', 'language-picker.langs.ar_TN', 'Arabic (Tunisia)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10927, 0, 'en', 'menus', 'language-picker.langs.ar_AE', 'Arabic (United Arab Emirates)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10928, 0, 'en', 'menus', 'language-picker.langs.ar_YE', 'Arabic (Yemen)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10929, 0, 'en', 'menus', 'language-picker.langs.hy_AM', 'Armenian (Armenia)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10930, 0, 'en', 'menus', 'language-picker.langs.hy', 'Armenian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10931, 0, 'en', 'menus', 'language-picker.langs.as_IN', 'Assamese (India)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10932, 0, 'en', 'menus', 'language-picker.langs.as', 'Assamese', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10933, 0, 'en', 'menus', 'language-picker.langs.asa_TZ', 'Asu (Tanzania)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10934, 0, 'en', 'menus', 'language-picker.langs.asa', 'Asu', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10935, 0, 'en', 'menus', 'language-picker.langs.az_Cyrl', 'Azerbaijani (Cyrillic)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10936, 0, 'en', 'menus', 'language-picker.langs.az_Cyrl_AZ', 'Azerbaijani (Cyrillic, Azerbaijan)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10937, 0, 'en', 'menus', 'language-picker.langs.az_Latn', 'Azerbaijani (Latin)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10938, 0, 'en', 'menus', 'language-picker.langs.az_Latn_AZ', 'Azerbaijani (Latin, Azerbaijan)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10939, 0, 'en', 'menus', 'language-picker.langs.az', 'Azerbaijani', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10940, 0, 'en', 'menus', 'language-picker.langs.bm_ML', 'Bambara (Mali)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10941, 0, 'en', 'menus', 'language-picker.langs.bm', 'Bambara', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10942, 0, 'en', 'menus', 'language-picker.langs.eu_ES', 'Basque (Spain)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10943, 0, 'en', 'menus', 'language-picker.langs.eu', 'Basque', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10944, 0, 'en', 'menus', 'language-picker.langs.be_BY', 'Belarusian (Belarus)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10945, 0, 'en', 'menus', 'language-picker.langs.be', 'Belarusian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10946, 0, 'en', 'menus', 'language-picker.langs.bem_ZM', 'Bemba (Zambia)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10947, 0, 'en', 'menus', 'language-picker.langs.bem', 'Bemba', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10948, 0, 'en', 'menus', 'language-picker.langs.bez_TZ', 'Bena (Tanzania)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10949, 0, 'en', 'menus', 'language-picker.langs.bez', 'Bena', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10950, 0, 'en', 'menus', 'language-picker.langs.bn_BD', 'Bengali (Bangladesh)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10951, 0, 'en', 'menus', 'language-picker.langs.bn_IN', 'Bengali (India)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10952, 0, 'en', 'menus', 'language-picker.langs.bn', 'Bengali', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10953, 0, 'en', 'menus', 'language-picker.langs.bs_BA', 'Bosnian (Bosnia and Herzegovina)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10954, 0, 'en', 'menus', 'language-picker.langs.bs', 'Bosnian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10955, 0, 'en', 'menus', 'language-picker.langs.bg_BG', 'Bulgarian (Bulgaria)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10956, 0, 'en', 'menus', 'language-picker.langs.bg', 'Bulgarian', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10957, 0, 'en', 'menus', 'language-picker.langs.my_MM', 'Burmese (Myanmar [Burma])', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10958, 0, 'en', 'menus', 'language-picker.langs.my', 'Burmese', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10959, 0, 'en', 'menus', 'language-picker.langs.yue_Hant_HK', 'Cantonese (Traditional, Hong Kong SAR China)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10960, 0, 'en', 'menus', 'language-picker.langs.ca_ES', 'Catalan (Spain)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10961, 0, 'en', 'menus', 'language-picker.langs.ca', 'Catalan', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10962, 0, 'en', 'menus', 'language-picker.langs.tzm_Latn', 'Central Morocco Tamazight (Latin)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10963, 0, 'en', 'menus', 'language-picker.langs.tzm_Latn_MA', 'Central Morocco Tamazight (Latin, Morocco)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10964, 0, 'en', 'menus', 'language-picker.langs.tzm', 'Central Morocco Tamazight', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10965, 0, 'en', 'menus', 'language-picker.langs.chr_US', 'Cherokee (United States)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10966, 0, 'en', 'menus', 'language-picker.langs.chr', 'Cherokee', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10967, 0, 'en', 'menus', 'language-picker.langs.cgg_UG', 'Chiga (Uganda)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10968, 0, 'en', 'menus', 'language-picker.langs.cgg', 'Chiga', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10969, 0, 'en', 'menus', 'language-picker.langs.zh_Hans', 'Chinese (Simplified Han)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10970, 0, 'en', 'menus', 'language-picker.langs.zh_Hans_CN', 'Chinese (Simplified Han, China)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10971, 0, 'en', 'menus', 'language-picker.langs.zh_Hans_HK', 'Chinese (Simplified Han, Hong Kong SAR China)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10972, 0, 'en', 'menus', 'language-picker.langs.zh_Hans_MO', 'Chinese (Simplified Han, Macau SAR China)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10973, 0, 'en', 'menus', 'language-picker.langs.zh_Hans_SG', 'Chinese (Simplified Han, Singapore)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10974, 0, 'en', 'menus', 'language-picker.langs.zh_Hant', 'Chinese (Traditional Han)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10975, 0, 'en', 'menus', 'language-picker.langs.zh_Hant_HK', 'Chinese (Traditional Han, Hong Kong SAR China)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10976, 0, 'en', 'menus', 'language-picker.langs.zh_Hant_MO', 'Chinese (Traditional Han, Macau SAR China)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10977, 0, 'en', 'menus', 'language-picker.langs.zh_Hant_TW', 'Chinese (Traditional Han, Taiwan)', '2022-02-16 17:18:06', '2022-07-22 00:14:05'),
(10978, 0, 'en', 'menus', 'language-picker.langs.kw_GB', 'Cornish (United Kingdom)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10979, 0, 'en', 'menus', 'language-picker.langs.kw', 'Cornish', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10980, 0, 'en', 'menus', 'language-picker.langs.hr_HR', 'Croatian (Croatia)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10981, 0, 'en', 'menus', 'language-picker.langs.hr', 'Croatian', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10982, 0, 'en', 'menus', 'language-picker.langs.cs_CZ', 'Czech (Czech Republic)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10983, 0, 'en', 'menus', 'language-picker.langs.cs', 'Czech', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10984, 0, 'en', 'menus', 'language-picker.langs.da_DK', 'Danish (Denmark)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10985, 0, 'en', 'menus', 'language-picker.langs.nl_BE', 'Dutch (Belgium)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10986, 0, 'en', 'menus', 'language-picker.langs.nl_NL', 'Dutch (Netherlands)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10987, 0, 'en', 'menus', 'language-picker.langs.ebu_KE', 'Embu (Kenya)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10988, 0, 'en', 'menus', 'language-picker.langs.ebu', 'Embu', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10989, 0, 'en', 'menus', 'language-picker.langs.en_AS', 'English (American Samoa)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10990, 0, 'en', 'menus', 'language-picker.langs.en_AU', 'English (Australia)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10991, 0, 'en', 'menus', 'language-picker.langs.en_BE', 'English (Belgium)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10992, 0, 'en', 'menus', 'language-picker.langs.en_BZ', 'English (Belize)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10993, 0, 'en', 'menus', 'language-picker.langs.en_BW', 'English (Botswana)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10994, 0, 'en', 'menus', 'language-picker.langs.en_CA', 'English (Canada)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10995, 0, 'en', 'menus', 'language-picker.langs.en_GU', 'English (Guam)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10996, 0, 'en', 'menus', 'language-picker.langs.en_HK', 'English (Hong Kong SAR China)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10997, 0, 'en', 'menus', 'language-picker.langs.en_IN', 'English (India)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10998, 0, 'en', 'menus', 'language-picker.langs.en_IE', 'English (Ireland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(10999, 0, 'en', 'menus', 'language-picker.langs.en_IL', 'English (Israel)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11000, 0, 'en', 'menus', 'language-picker.langs.en_JM', 'English (Jamaica)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11001, 0, 'en', 'menus', 'language-picker.langs.en_MT', 'English (Malta)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11002, 0, 'en', 'menus', 'language-picker.langs.en_MH', 'English (Marshall Islands)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11003, 0, 'en', 'menus', 'language-picker.langs.en_MU', 'English (Mauritius)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11004, 0, 'en', 'menus', 'language-picker.langs.en_NA', 'English (Namibia)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11005, 0, 'en', 'menus', 'language-picker.langs.en_NZ', 'English (New Zealand)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11006, 0, 'en', 'menus', 'language-picker.langs.en_MP', 'English (Northern Mariana Islands)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11007, 0, 'en', 'menus', 'language-picker.langs.en_PK', 'English (Pakistan)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11008, 0, 'en', 'menus', 'language-picker.langs.en_PH', 'English (Philippines)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11009, 0, 'en', 'menus', 'language-picker.langs.en_SG', 'English (Singapore)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11010, 0, 'en', 'menus', 'language-picker.langs.en_ZA', 'English (South Africa)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11011, 0, 'en', 'menus', 'language-picker.langs.en_TT', 'English (Trinidad and Tobago)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11012, 0, 'en', 'menus', 'language-picker.langs.en_UM', 'English (U.S. Minor Outlying Islands)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11013, 0, 'en', 'menus', 'language-picker.langs.en_VI', 'English (U.S. Virgin Islands)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11014, 0, 'en', 'menus', 'language-picker.langs.en_GB', 'English (United Kingdom)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11015, 0, 'en', 'menus', 'language-picker.langs.en_US', 'English (United States)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11016, 0, 'en', 'menus', 'language-picker.langs.en_ZW', 'English (Zimbabwe)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11017, 0, 'en', 'menus', 'language-picker.langs.eo', 'Esperanto', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11018, 0, 'en', 'menus', 'language-picker.langs.et_EE', 'Estonian (Estonia)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11019, 0, 'en', 'menus', 'language-picker.langs.et', 'Estonian', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11020, 0, 'en', 'menus', 'language-picker.langs.ee_GH', 'Ewe (Ghana)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11021, 0, 'en', 'menus', 'language-picker.langs.ee_TG', 'Ewe (Togo)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11022, 0, 'en', 'menus', 'language-picker.langs.ee', 'Ewe', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11023, 0, 'en', 'menus', 'language-picker.langs.fo_FO', 'Faroese (Faroe Islands)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11024, 0, 'en', 'menus', 'language-picker.langs.fo', 'Faroese', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11025, 0, 'en', 'menus', 'language-picker.langs.fil_PH', 'Filipino (Philippines)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11026, 0, 'en', 'menus', 'language-picker.langs.fil', 'Filipino', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11027, 0, 'en', 'menus', 'language-picker.langs.fi_FI', 'Finnish (Finland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11028, 0, 'en', 'menus', 'language-picker.langs.fi', 'Finnish', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11029, 0, 'en', 'menus', 'language-picker.langs.fr_BE', 'French (Belgium)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11030, 0, 'en', 'menus', 'language-picker.langs.fr_BJ', 'French (Benin)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11031, 0, 'en', 'menus', 'language-picker.langs.fr_BF', 'French (Burkina Faso)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11032, 0, 'en', 'menus', 'language-picker.langs.fr_BI', 'French (Burundi)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11033, 0, 'en', 'menus', 'language-picker.langs.fr_CM', 'French (Cameroon)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11034, 0, 'en', 'menus', 'language-picker.langs.fr_CA', 'French (Canada)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11035, 0, 'en', 'menus', 'language-picker.langs.fr_CF', 'French (Central African Republic)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11036, 0, 'en', 'menus', 'language-picker.langs.fr_TD', 'French (Chad)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11037, 0, 'en', 'menus', 'language-picker.langs.fr_KM', 'French (Comoros)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11038, 0, 'en', 'menus', 'language-picker.langs.fr_CG', 'French (Congo - Brazzaville)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11039, 0, 'en', 'menus', 'language-picker.langs.fr_CD', 'French (Congo - Kinshasa)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11040, 0, 'en', 'menus', 'language-picker.langs.fr_CI', 'French (Côte d’Ivoire)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11041, 0, 'en', 'menus', 'language-picker.langs.fr_DJ', 'French (Djibouti)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11042, 0, 'en', 'menus', 'language-picker.langs.fr_GQ', 'French (Equatorial Guinea)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11043, 0, 'en', 'menus', 'language-picker.langs.fr_FR', 'French (France)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11044, 0, 'en', 'menus', 'language-picker.langs.fr_GA', 'French (Gabon)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11045, 0, 'en', 'menus', 'language-picker.langs.fr_GP', 'French (Guadeloupe)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11046, 0, 'en', 'menus', 'language-picker.langs.fr_GN', 'French (Guinea)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11047, 0, 'en', 'menus', 'language-picker.langs.fr_LU', 'French (Luxembourg)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11048, 0, 'en', 'menus', 'language-picker.langs.fr_MG', 'French (Madagascar)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11049, 0, 'en', 'menus', 'language-picker.langs.fr_ML', 'French (Mali)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11050, 0, 'en', 'menus', 'language-picker.langs.fr_MQ', 'French (Martinique)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11051, 0, 'en', 'menus', 'language-picker.langs.fr_MC', 'French (Monaco)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11052, 0, 'en', 'menus', 'language-picker.langs.fr_NE', 'French (Niger)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11053, 0, 'en', 'menus', 'language-picker.langs.fr_RW', 'French (Rwanda)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11054, 0, 'en', 'menus', 'language-picker.langs.fr_RE', 'French (Réunion)', '2022-02-16 17:18:07', '2022-07-22 00:14:05');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(11055, 0, 'en', 'menus', 'language-picker.langs.fr_BL', 'French (Saint Barthélemy)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11056, 0, 'en', 'menus', 'language-picker.langs.fr_MF', 'French (Saint Martin)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11057, 0, 'en', 'menus', 'language-picker.langs.fr_SN', 'French (Senegal)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11058, 0, 'en', 'menus', 'language-picker.langs.fr_CH', 'French (Switzerland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11059, 0, 'en', 'menus', 'language-picker.langs.fr_TG', 'French (Togo)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11060, 0, 'en', 'menus', 'language-picker.langs.ff_SN', 'Fulah (Senegal)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11061, 0, 'en', 'menus', 'language-picker.langs.ff', 'Fulah', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11062, 0, 'en', 'menus', 'language-picker.langs.gl_ES', 'Galician (Spain)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11063, 0, 'en', 'menus', 'language-picker.langs.gl', 'Galician', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11064, 0, 'en', 'menus', 'language-picker.langs.lg_UG', 'Ganda (Uganda)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11065, 0, 'en', 'menus', 'language-picker.langs.lg', 'Ganda', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11066, 0, 'en', 'menus', 'language-picker.langs.ka_GE', 'Georgian (Georgia)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11067, 0, 'en', 'menus', 'language-picker.langs.ka', 'Georgian', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11068, 0, 'en', 'menus', 'language-picker.langs.de_AT', 'German (Austria)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11069, 0, 'en', 'menus', 'language-picker.langs.de_BE', 'German (Belgium)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11070, 0, 'en', 'menus', 'language-picker.langs.de_DE', 'German (Germany)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11071, 0, 'en', 'menus', 'language-picker.langs.de_LI', 'German (Liechtenstein)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11072, 0, 'en', 'menus', 'language-picker.langs.de_LU', 'German (Luxembourg)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11073, 0, 'en', 'menus', 'language-picker.langs.de_CH', 'German (Switzerland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11074, 0, 'en', 'menus', 'language-picker.langs.el_CY', 'Greek (Cyprus)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11075, 0, 'en', 'menus', 'language-picker.langs.el_GR', 'Greek (Greece)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11076, 0, 'en', 'menus', 'language-picker.langs.gu_IN', 'Gujarati (India)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11077, 0, 'en', 'menus', 'language-picker.langs.gu', 'Gujarati', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11078, 0, 'en', 'menus', 'language-picker.langs.guz_KE', 'Gusii (Kenya)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11079, 0, 'en', 'menus', 'language-picker.langs.guz', 'Gusii', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11080, 0, 'en', 'menus', 'language-picker.langs.ha_Latn', 'Hausa (Latin)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11081, 0, 'en', 'menus', 'language-picker.langs.ha_Latn_GH', 'Hausa (Latin, Ghana)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11082, 0, 'en', 'menus', 'language-picker.langs.ha_Latn_NE', 'Hausa (Latin, Niger)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11083, 0, 'en', 'menus', 'language-picker.langs.ha_Latn_NG', 'Hausa (Latin, Nigeria)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11084, 0, 'en', 'menus', 'language-picker.langs.ha', 'Hausa', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11085, 0, 'en', 'menus', 'language-picker.langs.haw_US', 'Hawaiian (United States)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11086, 0, 'en', 'menus', 'language-picker.langs.haw', 'Hawaiian', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11087, 0, 'en', 'menus', 'language-picker.langs.he_IL', 'Hebrew (Israel)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11088, 0, 'en', 'menus', 'language-picker.langs.hi_IN', 'Hindi (India)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11089, 0, 'en', 'menus', 'language-picker.langs.hi', 'Hindi', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11090, 0, 'en', 'menus', 'language-picker.langs.hu_HU', 'Hungarian (Hungary)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11091, 0, 'en', 'menus', 'language-picker.langs.hu', 'Hungarian', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11092, 0, 'en', 'menus', 'language-picker.langs.is_IS', 'Icelandic (Iceland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11093, 0, 'en', 'menus', 'language-picker.langs.is', 'Icelandic', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11094, 0, 'en', 'menus', 'language-picker.langs.ig_NG', 'Igbo (Nigeria)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11095, 0, 'en', 'menus', 'language-picker.langs.ig', 'Igbo', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11096, 0, 'en', 'menus', 'language-picker.langs.id_ID', 'Indonesian (Indonesia)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11097, 0, 'en', 'menus', 'language-picker.langs.ga_IE', 'Irish (Ireland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11098, 0, 'en', 'menus', 'language-picker.langs.ga', 'Irish', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11099, 0, 'en', 'menus', 'language-picker.langs.it_IT', 'Italian (Italy)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11100, 0, 'en', 'menus', 'language-picker.langs.it_CH', 'Italian (Switzerland)', '2022-02-16 17:18:07', '2022-07-22 00:14:05'),
(11101, 0, 'en', 'menus', 'language-picker.langs.ja_JP', 'Japanese (Japan)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11102, 0, 'en', 'menus', 'language-picker.langs.kea_CV', 'Kabuverdianu (Cape Verde)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11103, 0, 'en', 'menus', 'language-picker.langs.kea', 'Kabuverdianu', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11104, 0, 'en', 'menus', 'language-picker.langs.kab_DZ', 'Kabyle (Algeria)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11105, 0, 'en', 'menus', 'language-picker.langs.kab', 'Kabyle', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11106, 0, 'en', 'menus', 'language-picker.langs.kl_GL', 'Kalaallisut (Greenland)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11107, 0, 'en', 'menus', 'language-picker.langs.kl', 'Kalaallisut', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11108, 0, 'en', 'menus', 'language-picker.langs.kln_KE', 'Kalenjin (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11109, 0, 'en', 'menus', 'language-picker.langs.kln', 'Kalenjin', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11110, 0, 'en', 'menus', 'language-picker.langs.kam_KE', 'Kamba (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11111, 0, 'en', 'menus', 'language-picker.langs.kam', 'Kamba', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11112, 0, 'en', 'menus', 'language-picker.langs.kn_IN', 'Kannada (India)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11113, 0, 'en', 'menus', 'language-picker.langs.kn', 'Kannada', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11114, 0, 'en', 'menus', 'language-picker.langs.kk_Cyrl', 'Kazakh (Cyrillic)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11115, 0, 'en', 'menus', 'language-picker.langs.kk_Cyrl_KZ', 'Kazakh (Cyrillic, Kazakhstan)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11116, 0, 'en', 'menus', 'language-picker.langs.kk', 'Kazakh', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11117, 0, 'en', 'menus', 'language-picker.langs.km_KH', 'Khmer (Cambodia)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11118, 0, 'en', 'menus', 'language-picker.langs.km', 'Khmer', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11119, 0, 'en', 'menus', 'language-picker.langs.ki_KE', 'Kikuyu (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11120, 0, 'en', 'menus', 'language-picker.langs.ki', 'Kikuyu', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11121, 0, 'en', 'menus', 'language-picker.langs.rw_RW', 'Kinyarwanda (Rwanda)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11122, 0, 'en', 'menus', 'language-picker.langs.rw', 'Kinyarwanda', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11123, 0, 'en', 'menus', 'language-picker.langs.kok_IN', 'Konkani (India)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11124, 0, 'en', 'menus', 'language-picker.langs.kok', 'Konkani', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11125, 0, 'en', 'menus', 'language-picker.langs.ko_KR', 'Korean (South Korea)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11126, 0, 'en', 'menus', 'language-picker.langs.ko', 'Korean', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11127, 0, 'en', 'menus', 'language-picker.langs.khq_ML', 'Koyra Chiini (Mali)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11128, 0, 'en', 'menus', 'language-picker.langs.khq', 'Koyra Chiini', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11129, 0, 'en', 'menus', 'language-picker.langs.ses_ML', 'Koyraboro Senni (Mali)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11130, 0, 'en', 'menus', 'language-picker.langs.ses', 'Koyraboro Senni', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11131, 0, 'en', 'menus', 'language-picker.langs.lag_TZ', 'Langi (Tanzania)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11132, 0, 'en', 'menus', 'language-picker.langs.lag', 'Langi', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11133, 0, 'en', 'menus', 'language-picker.langs.lv_LV', 'Latvian (Latvia)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11134, 0, 'en', 'menus', 'language-picker.langs.lv', 'Latvian', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11135, 0, 'en', 'menus', 'language-picker.langs.lt_LT', 'Lithuanian (Lithuania)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11136, 0, 'en', 'menus', 'language-picker.langs.lt', 'Lithuanian', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11137, 0, 'en', 'menus', 'language-picker.langs.luo_KE', 'Luo (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11138, 0, 'en', 'menus', 'language-picker.langs.luo', 'Luo', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11139, 0, 'en', 'menus', 'language-picker.langs.luy_KE', 'Luyia (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11140, 0, 'en', 'menus', 'language-picker.langs.luy', 'Luyia', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11141, 0, 'en', 'menus', 'language-picker.langs.mk_MK', 'Macedonian (Macedonia)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11142, 0, 'en', 'menus', 'language-picker.langs.mk', 'Macedonian', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11143, 0, 'en', 'menus', 'language-picker.langs.jmc_TZ', 'Machame (Tanzania)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11144, 0, 'en', 'menus', 'language-picker.langs.jmc', 'Machame', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11145, 0, 'en', 'menus', 'language-picker.langs.kde_TZ', 'Makonde (Tanzania)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11146, 0, 'en', 'menus', 'language-picker.langs.kde', 'Makonde', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11147, 0, 'en', 'menus', 'language-picker.langs.mg_MG', 'Malagasy (Madagascar)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11148, 0, 'en', 'menus', 'language-picker.langs.mg', 'Malagasy', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11149, 0, 'en', 'menus', 'language-picker.langs.ms_BN', 'Malay (Brunei)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11150, 0, 'en', 'menus', 'language-picker.langs.ms_MY', 'Malay (Malaysia)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11151, 0, 'en', 'menus', 'language-picker.langs.ms', 'Malay', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11152, 0, 'en', 'menus', 'language-picker.langs.ml_IN', 'Malayalam (India)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11153, 0, 'en', 'menus', 'language-picker.langs.ml', 'Malayalam', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11154, 0, 'en', 'menus', 'language-picker.langs.mt_MT', 'Maltese (Malta)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11155, 0, 'en', 'menus', 'language-picker.langs.mt', 'Maltese', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11156, 0, 'en', 'menus', 'language-picker.langs.gv_GB', 'Manx (United Kingdom)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11157, 0, 'en', 'menus', 'language-picker.langs.gv', 'Manx', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11158, 0, 'en', 'menus', 'language-picker.langs.mr_IN', 'Marathi (India)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11159, 0, 'en', 'menus', 'language-picker.langs.mr', 'Marathi', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11160, 0, 'en', 'menus', 'language-picker.langs.mas_KE', 'Masai (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11161, 0, 'en', 'menus', 'language-picker.langs.mas_TZ', 'Masai (Tanzania)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11162, 0, 'en', 'menus', 'language-picker.langs.mas', 'Masai', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11163, 0, 'en', 'menus', 'language-picker.langs.mer_KE', 'Meru (Kenya)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11164, 0, 'en', 'menus', 'language-picker.langs.mer', 'Meru', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11165, 0, 'en', 'menus', 'language-picker.langs.mfe_MU', 'Morisyen (Mauritius)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11166, 0, 'en', 'menus', 'language-picker.langs.mfe', 'Morisyen', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11167, 0, 'en', 'menus', 'language-picker.langs.naq_NA', 'Nama (Namibia)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11168, 0, 'en', 'menus', 'language-picker.langs.naq', 'Nama', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11169, 0, 'en', 'menus', 'language-picker.langs.ne_IN', 'Nepali (India)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11170, 0, 'en', 'menus', 'language-picker.langs.ne_NP', 'Nepali (Nepal)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11171, 0, 'en', 'menus', 'language-picker.langs.ne', 'Nepali', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11172, 0, 'en', 'menus', 'language-picker.langs.nd_ZW', 'North Ndebele (Zimbabwe)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11173, 0, 'en', 'menus', 'language-picker.langs.nd', 'North Ndebele', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11174, 0, 'en', 'menus', 'language-picker.langs.nb_NO', 'Norwegian Bokmål (Norway)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11175, 0, 'en', 'menus', 'language-picker.langs.nb', 'Norwegian Bokmål', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11176, 0, 'en', 'menus', 'language-picker.langs.nn_NO', 'Norwegian Nynorsk (Norway)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11177, 0, 'en', 'menus', 'language-picker.langs.nn', 'Norwegian Nynorsk', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11178, 0, 'en', 'menus', 'language-picker.langs.nyn_UG', 'Nyankole (Uganda)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11179, 0, 'en', 'menus', 'language-picker.langs.nyn', 'Nyankole', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11180, 0, 'en', 'menus', 'language-picker.langs.or_IN', 'Oriya (India)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11181, 0, 'en', 'menus', 'language-picker.langs.or', 'Oriya', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11182, 0, 'en', 'menus', 'language-picker.langs.om_ET', 'Oromo (Ethiopia)', '2022-02-16 17:18:08', '2022-07-22 00:14:05'),
(11183, 0, 'en', 'menus', 'language-picker.langs.om_KE', 'Oromo (Kenya)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11184, 0, 'en', 'menus', 'language-picker.langs.om', 'Oromo', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11185, 0, 'en', 'menus', 'language-picker.langs.ps_AF', 'Pashto (Afghanistan)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11186, 0, 'en', 'menus', 'language-picker.langs.ps', 'Pashto', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11187, 0, 'en', 'menus', 'language-picker.langs.fa_AF', 'Persian (Afghanistan)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11188, 0, 'en', 'menus', 'language-picker.langs.fa_IR', 'Persian (Iran)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11189, 0, 'en', 'menus', 'language-picker.langs.pl_PL', 'Polish (Poland)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11190, 0, 'en', 'menus', 'language-picker.langs.pl', 'Polish', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11191, 0, 'en', 'menus', 'language-picker.langs.pt_GW', 'Portuguese (Guinea-Bissau)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11192, 0, 'en', 'menus', 'language-picker.langs.pt_MZ', 'Portuguese (Mozambique)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11193, 0, 'en', 'menus', 'language-picker.langs.pt_PT', 'Portuguese (Portugal)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11194, 0, 'en', 'menus', 'language-picker.langs.pt', 'Portuguese', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11195, 0, 'en', 'menus', 'language-picker.langs.pa_Arab', 'Punjabi (Arabic)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11196, 0, 'en', 'menus', 'language-picker.langs.pa_Arab_PK', 'Punjabi (Arabic, Pakistan)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11197, 0, 'en', 'menus', 'language-picker.langs.pa_Guru', 'Punjabi (Gurmukhi)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11198, 0, 'en', 'menus', 'language-picker.langs.pa_Guru_IN', 'Punjabi (Gurmukhi, India)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11199, 0, 'en', 'menus', 'language-picker.langs.pa', 'Punjabi', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11200, 0, 'en', 'menus', 'language-picker.langs.ro_MD', 'Romanian (Moldova)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11201, 0, 'en', 'menus', 'language-picker.langs.ro_RO', 'Romanian (Romania)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11202, 0, 'en', 'menus', 'language-picker.langs.ro', 'Romanian', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11203, 0, 'en', 'menus', 'language-picker.langs.rm_CH', 'Romansh (Switzerland)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11204, 0, 'en', 'menus', 'language-picker.langs.rm', 'Romansh', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11205, 0, 'en', 'menus', 'language-picker.langs.rof_TZ', 'Rombo (Tanzania)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11206, 0, 'en', 'menus', 'language-picker.langs.rof', 'Rombo', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11207, 0, 'en', 'menus', 'language-picker.langs.ru_MD', 'Russian (Moldova)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11208, 0, 'en', 'menus', 'language-picker.langs.ru_RU', 'Russian (Russia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11209, 0, 'en', 'menus', 'language-picker.langs.ru_UA', 'Russian (Ukraine)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11210, 0, 'en', 'menus', 'language-picker.langs.rwk_TZ', 'Rwa (Tanzania)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11211, 0, 'en', 'menus', 'language-picker.langs.rwk', 'Rwa', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11212, 0, 'en', 'menus', 'language-picker.langs.saq_KE', 'Samburu (Kenya)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11213, 0, 'en', 'menus', 'language-picker.langs.saq', 'Samburu', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11214, 0, 'en', 'menus', 'language-picker.langs.sg_CF', 'Sango (Central African Republic)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11215, 0, 'en', 'menus', 'language-picker.langs.sg', 'Sango', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11216, 0, 'en', 'menus', 'language-picker.langs.seh_MZ', 'Sena (Mozambique)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11217, 0, 'en', 'menus', 'language-picker.langs.seh', 'Sena', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11218, 0, 'en', 'menus', 'language-picker.langs.sr_Cyrl', 'Serbian (Cyrillic)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11219, 0, 'en', 'menus', 'language-picker.langs.sr_Cyrl_BA', 'Serbian (Cyrillic, Bosnia and Herzegovina)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11220, 0, 'en', 'menus', 'language-picker.langs.sr_Cyrl_ME', 'Serbian (Cyrillic, Montenegro)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11221, 0, 'en', 'menus', 'language-picker.langs.sr_Cyrl_RS', 'Serbian (Cyrillic, Serbia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11222, 0, 'en', 'menus', 'language-picker.langs.sr_Latn', 'Serbian (Latin)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11223, 0, 'en', 'menus', 'language-picker.langs.sr_Latn_BA', 'Serbian (Latin, Bosnia and Herzegovina)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11224, 0, 'en', 'menus', 'language-picker.langs.sr_Latn_ME', 'Serbian (Latin, Montenegro)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11225, 0, 'en', 'menus', 'language-picker.langs.sr_Latn_RS', 'Serbian (Latin, Serbia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11226, 0, 'en', 'menus', 'language-picker.langs.sr', 'Serbian', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11227, 0, 'en', 'menus', 'language-picker.langs.sn_ZW', 'Shona (Zimbabwe)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11228, 0, 'en', 'menus', 'language-picker.langs.sn', 'Shona', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11229, 0, 'en', 'menus', 'language-picker.langs.ii_CN', 'Sichuan Yi (China)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11230, 0, 'en', 'menus', 'language-picker.langs.ii', 'Sichuan Yi', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11231, 0, 'en', 'menus', 'language-picker.langs.si_LK', 'Sinhala (Sri Lanka)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11232, 0, 'en', 'menus', 'language-picker.langs.si', 'Sinhala', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11233, 0, 'en', 'menus', 'language-picker.langs.sk_SK', 'Slovak (Slovakia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11234, 0, 'en', 'menus', 'language-picker.langs.sk', 'Slovak', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11235, 0, 'en', 'menus', 'language-picker.langs.sl_SI', 'Slovenian (Slovenia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11236, 0, 'en', 'menus', 'language-picker.langs.sl', 'Slovenian', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11237, 0, 'en', 'menus', 'language-picker.langs.xog_UG', 'Soga (Uganda)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11238, 0, 'en', 'menus', 'language-picker.langs.xog', 'Soga', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11239, 0, 'en', 'menus', 'language-picker.langs.so_DJ', 'Somali (Djibouti)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11240, 0, 'en', 'menus', 'language-picker.langs.so_ET', 'Somali (Ethiopia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11241, 0, 'en', 'menus', 'language-picker.langs.so_KE', 'Somali (Kenya)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11242, 0, 'en', 'menus', 'language-picker.langs.so_SO', 'Somali (Somalia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11243, 0, 'en', 'menus', 'language-picker.langs.so', 'Somali', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11244, 0, 'en', 'menus', 'language-picker.langs.es_AR', 'Spanish (Argentina)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11245, 0, 'en', 'menus', 'language-picker.langs.es_BO', 'Spanish (Bolivia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11246, 0, 'en', 'menus', 'language-picker.langs.es_CL', 'Spanish (Chile)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11247, 0, 'en', 'menus', 'language-picker.langs.es_CO', 'Spanish (Colombia)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11248, 0, 'en', 'menus', 'language-picker.langs.es_CR', 'Spanish (Costa Rica)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11249, 0, 'en', 'menus', 'language-picker.langs.es_DO', 'Spanish (Dominican Republic)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11250, 0, 'en', 'menus', 'language-picker.langs.es_EC', 'Spanish (Ecuador)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11251, 0, 'en', 'menus', 'language-picker.langs.es_SV', 'Spanish (El Salvador)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11252, 0, 'en', 'menus', 'language-picker.langs.es_GQ', 'Spanish (Equatorial Guinea)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11253, 0, 'en', 'menus', 'language-picker.langs.es_GT', 'Spanish (Guatemala)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11254, 0, 'en', 'menus', 'language-picker.langs.es_HN', 'Spanish (Honduras)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11255, 0, 'en', 'menus', 'language-picker.langs.es_419', 'Spanish (Latin America)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11256, 0, 'en', 'menus', 'language-picker.langs.es_MX', 'Spanish (Mexico)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11257, 0, 'en', 'menus', 'language-picker.langs.es_NI', 'Spanish (Nicaragua)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11258, 0, 'en', 'menus', 'language-picker.langs.es_PA', 'Spanish (Panama)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11259, 0, 'en', 'menus', 'language-picker.langs.es_PY', 'Spanish (Paraguay)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11260, 0, 'en', 'menus', 'language-picker.langs.es_PE', 'Spanish (Peru)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11261, 0, 'en', 'menus', 'language-picker.langs.es_PR', 'Spanish (Puerto Rico)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11262, 0, 'en', 'menus', 'language-picker.langs.es_ES', 'Spanish (Spain)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11263, 0, 'en', 'menus', 'language-picker.langs.es_US', 'Spanish (United States)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11264, 0, 'en', 'menus', 'language-picker.langs.es_UY', 'Spanish (Uruguay)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11265, 0, 'en', 'menus', 'language-picker.langs.es_VE', 'Spanish (Venezuela)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11266, 0, 'en', 'menus', 'language-picker.langs.sw_KE', 'Swahili (Kenya)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11267, 0, 'en', 'menus', 'language-picker.langs.sw_TZ', 'Swahili (Tanzania)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11268, 0, 'en', 'menus', 'language-picker.langs.sw', 'Swahili', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11269, 0, 'en', 'menus', 'language-picker.langs.sv_FI', 'Swedish (Finland)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11270, 0, 'en', 'menus', 'language-picker.langs.sv_SE', 'Swedish (Sweden)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11271, 0, 'en', 'menus', 'language-picker.langs.gsw_CH', 'Swiss German (Switzerland)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11272, 0, 'en', 'menus', 'language-picker.langs.gsw', 'Swiss German', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11273, 0, 'en', 'menus', 'language-picker.langs.shi_Latn', 'Tachelhit (Latin)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11274, 0, 'en', 'menus', 'language-picker.langs.shi_Latn_MA', 'Tachelhit (Latin, Morocco)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11275, 0, 'en', 'menus', 'language-picker.langs.shi_Tfng', 'Tachelhit (Tifinagh)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11276, 0, 'en', 'menus', 'language-picker.langs.shi_Tfng_MA', 'Tachelhit (Tifinagh, Morocco)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11277, 0, 'en', 'menus', 'language-picker.langs.shi', 'Tachelhit', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11278, 0, 'en', 'menus', 'language-picker.langs.dav_KE', 'Taita (Kenya)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11279, 0, 'en', 'menus', 'language-picker.langs.dav', 'Taita', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11280, 0, 'en', 'menus', 'language-picker.langs.ta_IN', 'Tamil (India)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11281, 0, 'en', 'menus', 'language-picker.langs.ta_LK', 'Tamil (Sri Lanka)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11282, 0, 'en', 'menus', 'language-picker.langs.ta', 'Tamil', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11283, 0, 'en', 'menus', 'language-picker.langs.te_IN', 'Telugu (India)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11284, 0, 'en', 'menus', 'language-picker.langs.te', 'Telugu', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11285, 0, 'en', 'menus', 'language-picker.langs.teo_KE', 'Teso (Kenya)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11286, 0, 'en', 'menus', 'language-picker.langs.teo_UG', 'Teso (Uganda)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11287, 0, 'en', 'menus', 'language-picker.langs.teo', 'Teso', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11288, 0, 'en', 'menus', 'language-picker.langs.th_TH', 'Thai (Thailand)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11289, 0, 'en', 'menus', 'language-picker.langs.bo_CN', 'Tibetan (China)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11290, 0, 'en', 'menus', 'language-picker.langs.bo_IN', 'Tibetan (India)', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11291, 0, 'en', 'menus', 'language-picker.langs.bo', 'Tibetan', '2022-02-16 17:18:09', '2022-07-22 00:14:05'),
(11292, 0, 'en', 'menus', 'language-picker.langs.ti_ER', 'Tigrinya (Eritrea)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11293, 0, 'en', 'menus', 'language-picker.langs.ti_ET', 'Tigrinya (Ethiopia)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11294, 0, 'en', 'menus', 'language-picker.langs.ti', 'Tigrinya', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11295, 0, 'en', 'menus', 'language-picker.langs.to_TO', 'Tonga (Tonga)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11296, 0, 'en', 'menus', 'language-picker.langs.to', 'Tonga', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11297, 0, 'en', 'menus', 'language-picker.langs.tr_TR', 'Turkish (Turkey)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11298, 0, 'en', 'menus', 'language-picker.langs.uk_UA', 'Ukrainian (Ukraine)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11299, 0, 'en', 'menus', 'language-picker.langs.uk', 'Ukrainian', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11300, 0, 'en', 'menus', 'language-picker.langs.ur_IN', 'Urdu (India)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11301, 0, 'en', 'menus', 'language-picker.langs.ur_PK', 'Urdu (Pakistan)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11302, 0, 'en', 'menus', 'language-picker.langs.ur', 'Urdu', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11303, 0, 'en', 'menus', 'language-picker.langs.uz_Arab', 'Uzbek (Arabic)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11304, 0, 'en', 'menus', 'language-picker.langs.uz_Arab_AF', 'Uzbek (Arabic, Afghanistan)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11305, 0, 'en', 'menus', 'language-picker.langs.uz_Cyrl', 'Uzbek (Cyrillic)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11306, 0, 'en', 'menus', 'language-picker.langs.uz_Cyrl_UZ', 'Uzbek (Cyrillic, Uzbekistan)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11307, 0, 'en', 'menus', 'language-picker.langs.uz_Latn', 'Uzbek (Latin)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11308, 0, 'en', 'menus', 'language-picker.langs.uz_Latn_UZ', 'Uzbek (Latin, Uzbekistan)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11309, 0, 'en', 'menus', 'language-picker.langs.uz', 'Uzbek', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11310, 0, 'en', 'menus', 'language-picker.langs.vi_VN', 'Vietnamese (Vietnam)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11311, 0, 'en', 'menus', 'language-picker.langs.vi', 'Vietnamese', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11312, 0, 'en', 'menus', 'language-picker.langs.vun_TZ', 'Vunjo (Tanzania)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11313, 0, 'en', 'menus', 'language-picker.langs.vun', 'Vunjo', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11314, 0, 'en', 'menus', 'language-picker.langs.cy_GB', 'Welsh (United Kingdom)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11315, 0, 'en', 'menus', 'language-picker.langs.cy', 'Welsh', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11316, 0, 'en', 'menus', 'language-picker.langs.yo_NG', 'Yoruba (Nigeria)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11317, 0, 'en', 'menus', 'language-picker.langs.yo', 'Yoruba', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11318, 0, 'en', 'menus', 'language-picker.langs.zu_ZA', 'Zulu (South Africa)', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11319, 0, 'en', 'menus', 'language-picker.langs.zu', 'Zulu', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11320, 0, 'en', 'navs', 'general.logout', 'Logout', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11321, 0, 'en', 'navs', 'general.home', 'Home', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11322, 0, 'en', 'navs', 'general.login', 'LogIn', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11323, 0, 'en', 'navs', 'general.messages', 'Messages', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11324, 0, 'en', 'navs', 'general.no_messages', 'No messages', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11325, 0, 'en', 'navs', 'general.account', 'Account', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11326, 0, 'en', 'navs', 'general.profile', 'Profile', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11327, 0, 'en', 'navs', 'frontend.contact', 'Contact', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11328, 0, 'en', 'navs', 'frontend.dashboard', 'Dashboard', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11329, 0, 'en', 'navs', 'frontend.login', 'Login', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11330, 0, 'en', 'navs', 'frontend.macros', 'Macros', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11331, 0, 'en', 'navs', 'frontend.register', 'Register', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11332, 0, 'en', 'navs', 'frontend.courses', 'Courses', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11333, 0, 'en', 'navs', 'frontend.forums', 'Forums', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11334, 0, 'en', 'navs', 'frontend.user.account', 'My Account', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11335, 0, 'en', 'navs', 'frontend.user.administration', 'Administration', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11336, 0, 'en', 'navs', 'frontend.user.change_password', 'Change Password', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11337, 0, 'en', 'navs', 'frontend.user.my_information', 'My Information', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11338, 0, 'en', 'navs', 'frontend.user.profile', 'Profile', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11339, 0, 'en', 'navs', 'frontend.user.edit_account', 'Edit Account', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11340, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11341, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2022-02-16 17:18:10', '2022-07-22 00:14:05'),
(11342, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11343, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11344, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11345, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11346, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11347, 0, 'en', 'roles', 'administrator', 'Administrator', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11348, 0, 'en', 'roles', 'user', 'User', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11349, 0, 'en', 'strings', 'frontend.user.email_changed_notice', 'You must confirm your new e-mail address before you can log in again.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11350, 0, 'en', 'strings', 'frontend.user.profile_updated', 'Profile successfully updated.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11351, 0, 'en', 'strings', 'frontend.user.password_updated', 'Password successfully updated.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11352, 0, 'en', 'strings', 'frontend.user.change_email_notice', 'If you change your e-mail you will be logged out until you confirm your new e-mail address.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11353, 0, 'en', 'strings', 'frontend.test', 'Test', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11354, 0, 'en', 'strings', 'frontend.tests.based_on.permission', 'Permission Based - ', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11355, 0, 'en', 'strings', 'frontend.tests.based_on.role', 'Role Based - ', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11356, 0, 'en', 'strings', 'frontend.tests.js_injected_from_controller', 'Javascript Injected from a Controller', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11357, 0, 'en', 'strings', 'frontend.tests.using_blade_extensions', 'Using Blade Extensions', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11358, 0, 'en', 'strings', 'frontend.tests.using_access_helper.array_permissions', 'Using Access Helper with Array of Permission Names or ID\'s where the user does have to possess all.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11359, 0, 'en', 'strings', 'frontend.tests.using_access_helper.array_permissions_not', 'Using Access Helper with Array of Permission Names or ID\'s where the user does not have to possess all.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11360, 0, 'en', 'strings', 'frontend.tests.using_access_helper.array_roles', 'Using Access Helper with Array of Role Names or ID\'s where the user does have to possess all.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11361, 0, 'en', 'strings', 'frontend.tests.using_access_helper.array_roles_not', 'Using Access Helper with Array of Role Names or ID\'s where the user does not have to possess all.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11362, 0, 'en', 'strings', 'frontend.tests.using_access_helper.permission_id', 'Using Access Helper with Permission ID', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11363, 0, 'en', 'strings', 'frontend.tests.using_access_helper.permission_name', 'Using Access Helper with Permission Name', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11364, 0, 'en', 'strings', 'frontend.tests.using_access_helper.role_id', 'Using Access Helper with Role ID', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11365, 0, 'en', 'strings', 'frontend.tests.using_access_helper.role_name', 'Using Access Helper with Role Name', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11366, 0, 'en', 'strings', 'frontend.tests.view_console_it_works', 'View console, you should see \'it works!\' which is coming from FrontendController@index', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11367, 0, 'en', 'strings', 'frontend.tests.you_can_see_because', 'You can see this because you have the role of \':role\'!', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11368, 0, 'en', 'strings', 'frontend.tests.you_can_see_because_permission', 'You can see this because you have the permission of \':permission\'!', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11369, 0, 'en', 'strings', 'frontend.general.joined', 'Joined', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11370, 0, 'en', 'strings', 'frontend.general.add_to_wishlist', 'Add To Wishlist', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11371, 0, 'en', 'strings', 'frontend.welcome_to', 'Welcome to :place', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11372, 0, 'en', 'strings', 'backend.menu_manager.page', 'Page', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11373, 0, 'en', 'strings', 'backend.menu_manager.link', 'Link', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11374, 0, 'en', 'strings', 'backend.menu_manager.title', 'Menu Manager', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11375, 0, 'en', 'strings', 'backend.menu_manager.edit_menus', 'Edit Menus', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11376, 0, 'en', 'strings', 'backend.menu_manager.locations', 'Locations', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11377, 0, 'en', 'strings', 'backend.menu_manager.select_to_edit', 'Select the menu you want to edit', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11378, 0, 'en', 'strings', 'backend.menu_manager.create_new', 'Create new menu', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11379, 0, 'en', 'strings', 'backend.menu_manager.or', 'Or', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11380, 0, 'en', 'strings', 'backend.menu_manager.choose', 'Choose', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11381, 0, 'en', 'strings', 'backend.menu_manager.welcome', 'Welcome', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11382, 0, 'en', 'strings', 'backend.menu_manager.url', 'URL', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11383, 0, 'en', 'strings', 'backend.menu_manager.label', 'Label', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11384, 0, 'en', 'strings', 'backend.menu_manager.add_to_menu', 'Add to Menu', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11385, 0, 'en', 'strings', 'backend.menu_manager.screen_reader_text', 'Press return or enter to expand', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11386, 0, 'en', 'strings', 'backend.menu_manager.categories', 'Categories', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11387, 0, 'en', 'strings', 'backend.menu_manager.Category', 'Category', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11388, 0, 'en', 'strings', 'backend.menu_manager.pages', 'Pages', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11389, 0, 'en', 'strings', 'backend.menu_manager.posts', 'Posts', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11390, 0, 'en', 'strings', 'backend.menu_manager.post', 'Post', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11391, 0, 'en', 'strings', 'backend.menu_manager.custom_link', 'Custom Link', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11392, 0, 'en', 'strings', 'backend.menu_manager.menu_structure', 'Menu Structure', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11393, 0, 'en', 'strings', 'backend.menu_manager.name', 'Name', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11394, 0, 'en', 'strings', 'backend.menu_manager.create_menu', 'Create Menu', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11395, 0, 'en', 'strings', 'backend.menu_manager.save_menu', 'Save Menu', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11396, 0, 'en', 'strings', 'backend.menu_manager.delete_menu', 'Delete Menu', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11397, 0, 'en', 'strings', 'backend.menu_manager.sub_menu', 'Sub-menu', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11398, 0, 'en', 'strings', 'backend.menu_manager.menu_creation', 'Menu Creation', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11399, 0, 'en', 'strings', 'backend.menu_manager.drag_instruction_1', 'Place each item in the order you prefer. Click on the arrow to the right of the item to display more configuration options.', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11400, 0, 'en', 'strings', 'backend.menu_manager.drag_instruction_2', 'Please enter the name and select \"Create menu\" button', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11401, 0, 'en', 'strings', 'backend.menu_manager.class', 'Class CSS (optional)', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11402, 0, 'en', 'strings', 'backend.menu_manager.move', 'Move', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11403, 0, 'en', 'strings', 'backend.menu_manager.move_up', 'Move up', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11404, 0, 'en', 'strings', 'backend.menu_manager.move_down', 'Move down', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11405, 0, 'en', 'strings', 'backend.menu_manager.move_right', 'Move right', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11406, 0, 'en', 'strings', 'backend.menu_manager.move_left', 'Move left', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11407, 0, 'en', 'strings', 'backend.menu_manager.top', 'Top', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11408, 0, 'en', 'strings', 'backend.menu_manager.delete', 'Delete', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11409, 0, 'en', 'strings', 'backend.menu_manager.cancel', 'Cancel', '2022-02-16 17:18:10', '2022-07-22 00:14:06'),
(11410, 0, 'en', 'strings', 'backend.menu_manager.update_item', 'Update Item', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11411, 0, 'en', 'strings', 'backend.menu_manager.menu_settings', 'Menu Settings', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11412, 0, 'en', 'strings', 'backend.menu_manager.auto_add_pages', 'Auto Add Pages', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11413, 0, 'en', 'strings', 'backend.menu_manager.auto_add_pages_desc', 'Automatically add new top-level pages to this menu', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11414, 0, 'en', 'strings', 'backend.menu_manager.display', 'Display', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11415, 0, 'en', 'strings', 'backend.menu_manager.top_menu', 'Top Menu', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11416, 0, 'en', 'strings', 'backend.menu_manager.footer_menu', 'Footer Menu', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11417, 0, 'en', 'strings', 'backend.menu_manager.currently', 'Currently set to', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11418, 0, 'en', 'strings', 'backend.menu_manager.theme_location', 'Theme Location', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11419, 0, 'en', 'strings', 'backend.menu_manager.save_changes', 'Save Changes', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11420, 0, 'en', 'strings', 'backend.menu_manager.assigned_menu', 'Assigned Menu', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11421, 0, 'en', 'strings', 'backend.menu_manager.edit', 'Edit', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11422, 0, 'en', 'strings', 'backend.menu_manager.select_all', 'Select All', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11423, 0, 'en', 'strings', 'backend.general.are_you_sure', 'Are you sure you want to do this?', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11424, 0, 'en', 'strings', 'backend.general.app_back_to_list', 'Back to list', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11425, 0, 'en', 'strings', 'backend.general.app_save', 'Save', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11426, 0, 'en', 'strings', 'backend.general.actions', 'Actions', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11427, 0, 'en', 'strings', 'backend.general.app_update', 'Update', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11428, 0, 'en', 'strings', 'backend.general.app_restore', 'Restore', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11429, 0, 'en', 'strings', 'backend.general.app_permadel', 'Permanently Delete', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11430, 0, 'en', 'strings', 'backend.general.all_rights_reserved', 'All Rights Reserved.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11431, 0, 'en', 'strings', 'backend.general.app_add', 'Add', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11432, 0, 'en', 'strings', 'backend.general.app_create', 'Create', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11433, 0, 'en', 'strings', 'backend.general.app_edit', 'Edit', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11434, 0, 'en', 'strings', 'backend.general.app_view', 'View', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11435, 0, 'en', 'strings', 'backend.general.app_list', 'List', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11436, 0, 'en', 'strings', 'backend.general.app_no_entries_in_table', 'No entries in table', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11437, 0, 'en', 'strings', 'backend.general.custom_controller_index', 'Custom controller index.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11438, 0, 'en', 'strings', 'backend.general.app_logout', 'Logout', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11439, 0, 'en', 'strings', 'backend.general.app_add_new', 'Add new', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11440, 0, 'en', 'strings', 'backend.general.app_are_you_sure', 'Are you sure?', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11441, 0, 'en', 'strings', 'backend.general.app_dashboard', 'Dashboard', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11442, 0, 'en', 'strings', 'backend.general.app_delete', 'Delete', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11443, 0, 'en', 'strings', 'backend.general.all', 'All', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11444, 0, 'en', 'strings', 'backend.general.trashed', 'Trashed', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11445, 0, 'en', 'strings', 'backend.general.boilerplate_link', 'JThemes Studio', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11446, 0, 'en', 'strings', 'backend.general.continue', 'Continue', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11447, 0, 'en', 'strings', 'backend.general.member_since', 'Member since', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11448, 0, 'en', 'strings', 'backend.general.minutes', ' minutes', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11449, 0, 'en', 'strings', 'backend.general.search_placeholder', 'Search...', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11450, 0, 'en', 'strings', 'backend.general.timeout', 'You were automatically logged out for security reasons since you had no activity in ', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11451, 0, 'en', 'strings', 'backend.general.see_all.messages', 'See all messages', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11452, 0, 'en', 'strings', 'backend.general.see_all.notifications', 'View all', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11453, 0, 'en', 'strings', 'backend.general.see_all.tasks', 'View all tasks', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11454, 0, 'en', 'strings', 'backend.general.status.online', 'Online', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11455, 0, 'en', 'strings', 'backend.general.status.offline', 'Offline', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11456, 0, 'en', 'strings', 'backend.general.you_have.messages', '{0} You don\'t have messages|{1} You have 1 message|[2,Inf] You have :number messages', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11457, 0, 'en', 'strings', 'backend.general.you_have.notifications', '{0} You don\'t have notifications|{1} You have 1 notification|[2,Inf] You have :number notifications', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11458, 0, 'en', 'strings', 'backend.general.you_have.tasks', '{0} You don\'t have tasks|{1} You have 1 task|[2,Inf] You have :number tasks', '2022-02-16 17:18:11', '2022-07-22 00:14:06');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(11459, 0, 'en', 'strings', 'backend.access.users.if_confirmed_off', '(If confirmed is off)', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11460, 0, 'en', 'strings', 'backend.access.users.delete_user_confirm', 'Are you sure you want to delete this user permanently? Anywhere in the application that references this user\'s id will most likely error. Proceed at your own risk. This can not be un-done.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11461, 0, 'en', 'strings', 'backend.access.users.no_deactivated', 'There are no deactivated users.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11462, 0, 'en', 'strings', 'backend.access.users.no_deleted', 'There are no deleted users.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11463, 0, 'en', 'strings', 'backend.access.users.restore_user_confirm', 'Restore this user to its original state?', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11464, 0, 'en', 'strings', 'backend.dashboard.title', 'Dashboard', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11465, 0, 'en', 'strings', 'backend.dashboard.welcome', 'Welcome', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11466, 0, 'en', 'strings', 'backend.dashboard.my_courses', 'My Courses', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11467, 0, 'en', 'strings', 'backend.search.empty', 'Please enter a search term.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11468, 0, 'en', 'strings', 'backend.search.incomplete', 'You must write your own search logic for this system.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11469, 0, 'en', 'strings', 'backend.search.title', 'Search Results', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11470, 0, 'en', 'strings', 'backend.search.results', 'Search Results for :query', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11471, 0, 'en', 'strings', 'backend.welcome', 'Welcome to the Dashboard', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11472, 0, 'en', 'strings', 'emails.contact.subject', 'A new :app_name contact form submission!', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11473, 0, 'en', 'strings', 'emails.contact.email_body_title', 'You have a new contact form request: Below are the details:', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11474, 0, 'en', 'strings', 'emails.auth.account_confirmed', 'Your account has been confirmed.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11475, 0, 'en', 'strings', 'emails.auth.thank_you_for_using_app', 'Thank you for using our application!', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11476, 0, 'en', 'strings', 'emails.auth.click_to_confirm', 'Click here to confirm your account:', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11477, 0, 'en', 'strings', 'emails.auth.password_reset_subject', 'Reset Password', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11478, 0, 'en', 'strings', 'emails.auth.password_cause_of_email', 'You are receiving this email because we received a password reset request for your account.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11479, 0, 'en', 'strings', 'emails.auth.password_if_not_requested', 'If you did not request a password reset, no further action is required.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11480, 0, 'en', 'strings', 'emails.auth.error', 'Whoops!', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11481, 0, 'en', 'strings', 'emails.auth.greeting', 'Hello!', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11482, 0, 'en', 'strings', 'emails.auth.regards', 'Regards,', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11483, 0, 'en', 'strings', 'emails.auth.trouble_clicking_button', 'If you’re having trouble clicking the \":action_text\" button, copy and paste the URL below into your web browser:', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11484, 0, 'en', 'strings', 'emails.auth.reset_password', 'Click here to reset your password', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11485, 0, 'en', 'strings', 'emails.offline_order.subject', 'Regarding your recent order on :app_name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11486, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11487, 0, 'en', 'validation', 'attributes.frontend.old_password', 'Old Password', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11488, 0, 'en', 'validation', 'attributes.frontend.male', 'Male', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11489, 0, 'en', 'validation', 'attributes.frontend.female', 'Female', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11490, 0, 'en', 'validation', 'attributes.frontend.other', 'Other', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11491, 0, 'en', 'validation', 'attributes.frontend.password', 'Password', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11492, 0, 'en', 'validation', 'attributes.frontend.password_confirmation', 'Password Confirmation', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11493, 0, 'en', 'validation', 'attributes.frontend.avatar', 'Avatar Location', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11494, 0, 'en', 'validation', 'attributes.frontend.first_name', 'First Name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11495, 0, 'en', 'validation', 'attributes.frontend.last_name', 'Last Name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11496, 0, 'en', 'validation', 'attributes.frontend.email', 'E-mail Address', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11497, 0, 'en', 'validation', 'attributes.frontend.name', 'Full Name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11498, 0, 'en', 'validation', 'attributes.frontend.phone', 'Phone', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11499, 0, 'en', 'validation', 'attributes.frontend.message', 'Message', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11500, 0, 'en', 'validation', 'attributes.frontend.new_password', 'New Password', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11501, 0, 'en', 'validation', 'attributes.frontend.new_password_confirmation', 'New Password Confirmation', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11502, 0, 'en', 'validation', 'attributes.frontend.timezone', 'Timezone', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11503, 0, 'en', 'validation', 'attributes.frontend.language', 'Language', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11504, 0, 'en', 'validation', 'attributes.frontend.gravatar', 'Gravatar', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11505, 0, 'en', 'validation', 'attributes.frontend.upload', 'Upload', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11506, 0, 'en', 'validation', 'attributes.frontend.captcha', 'Captcha required', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11507, 0, 'en', 'validation', 'attributes.frontend.personal_information', 'Personal Information', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11508, 0, 'en', 'validation', 'attributes.frontend.social_information', 'Social Information', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11509, 0, 'en', 'validation', 'attributes.frontend.payment_information', 'Payment Information', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11510, 0, 'en', 'validation', 'attributes.backend.access.roles.name', 'Name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11511, 0, 'en', 'validation', 'attributes.backend.access.roles.associated_permissions', 'Associated Permissions', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11512, 0, 'en', 'validation', 'attributes.backend.access.roles.sort', 'Sort', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11513, 0, 'en', 'validation', 'attributes.backend.access.users.password', 'Password', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11514, 0, 'en', 'validation', 'attributes.backend.access.users.password_confirmation', 'Password Confirmation', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11515, 0, 'en', 'validation', 'attributes.backend.access.users.first_name', 'First Name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11516, 0, 'en', 'validation', 'attributes.backend.access.users.last_name', 'Last Name', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11517, 0, 'en', 'validation', 'attributes.backend.access.users.email', 'E-mail Address', '2022-02-16 17:18:11', '2022-07-22 00:14:06'),
(11518, 0, 'en', 'validation', 'attributes.backend.access.users.active', 'Active', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11519, 0, 'en', 'validation', 'attributes.backend.access.users.confirmed', 'Confirmed', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11520, 0, 'en', 'validation', 'attributes.backend.access.users.send_confirmation_email', 'Send Confirmation E-mail', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11521, 0, 'en', 'validation', 'attributes.backend.access.users.associated_roles', 'Associated Roles', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11522, 0, 'en', 'validation', 'attributes.backend.access.users.name', 'Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11523, 0, 'en', 'validation', 'attributes.backend.access.users.other_permissions', 'Other Permissions', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11524, 0, 'en', 'validation', 'attributes.backend.access.users.timezone', 'Timezone', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11525, 0, 'en', 'validation', 'attributes.backend.access.users.language', 'Language', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11526, 0, 'en', 'validation', 'attributes.backend.access.permissions.associated_roles', 'Associated Roles', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11527, 0, 'en', 'validation', 'attributes.backend.access.permissions.dependencies', 'Dependencies', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11528, 0, 'en', 'validation', 'attributes.backend.access.permissions.display_name', 'Display Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11529, 0, 'en', 'validation', 'attributes.backend.access.permissions.group', 'Group', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11530, 0, 'en', 'validation', 'attributes.backend.access.permissions.group_sort', 'Group Sort', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11531, 0, 'en', 'validation', 'attributes.backend.access.permissions.groups.name', 'Group Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11532, 0, 'en', 'validation', 'attributes.backend.access.permissions.name', 'Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11533, 0, 'en', 'validation', 'attributes.backend.access.permissions.first_name', 'First Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11534, 0, 'en', 'validation', 'attributes.backend.access.permissions.last_name', 'Last Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11535, 0, 'en', 'validation', 'attributes.backend.access.permissions.system', 'System', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11536, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.label', 'Facebook Login Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11537, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.client_id', 'Client ID', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11538, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.client_secret', 'Client Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11539, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.redirect', 'Redirect URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11540, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.google.label', 'Google Login Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11541, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.google.client_id', 'Client ID', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11542, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.google.client_secret', 'Client Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11543, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.google.redirect', 'Redirect URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11544, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.label', 'Twitter Login Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11545, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.client_id', 'Client ID', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11546, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.client_secret', 'Client Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11547, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.redirect', 'Redirect URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11548, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.label', 'LinkedIn Login Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11549, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.client_id', 'Client ID', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11550, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.client_secret', 'Client Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11551, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.redirect', 'Redirect URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11552, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.github.label', 'Github Login Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11553, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.github.client_id', 'Client ID', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11554, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.github.client_secret', 'Client Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11555, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.github.redirect', 'Redirect URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11556, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.label', 'Bitbucket Login Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11557, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.client_id', 'Client ID', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11558, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.client_secret', 'Client Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11559, 0, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.redirect', 'Redirect URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11560, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.app_name', 'App Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11561, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.app_url', 'App URL', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11562, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.app_locale', 'App Locale', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11563, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.app_timezone', 'App Timezone', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11564, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_driver', 'Mail Driver', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11565, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_host', 'Mail Host', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11566, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_port', 'Mail Port', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11567, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_from_name', 'Mail From Name', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11568, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.lesson_timer', 'Lesson Timer', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11569, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_from_address', 'Mail From Address', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11570, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_username', 'Mail Username', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11571, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_password', 'Mail Password', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11572, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.enable_registration', 'Enable Registration', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11573, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.change_email', 'Change Email', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11574, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.password_history', 'Password History', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11575, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.password_expires_days', 'Password Expires Days', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11576, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.requires_approval', 'Requires Approval', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11577, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.confirm_email', 'Confirm Email', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11578, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.homepage', 'Select Homepage', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11579, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.captcha_status', 'Captcha Status', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11580, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.captcha_site_key', 'Captcha Key', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11581, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.captcha_site_secret', 'Captcha Secret', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11582, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.google_analytics', 'Google Analytics Code', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11583, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.theme_layout', 'Theme Layout', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11584, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.font_color', 'Font Color', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11585, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.layout_type', 'Layout Type', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11586, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.retest_status', 'Re-Test', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11587, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.show_offers', 'Show Offers Page', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11588, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.one_signal_push_notification', 'OneSignal Setup', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11589, 0, 'en', 'validation', 'attributes.backend.settings.general_settings.onesignal_code', 'Paste OneSignal script code here', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11590, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11591, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11592, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11593, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11594, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11595, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11596, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11597, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11598, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11599, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11600, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11601, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11602, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11603, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11604, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11605, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11606, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11607, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11608, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11609, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11610, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11611, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11612, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11613, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11614, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11615, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11616, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11617, 0, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11618, 0, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11619, 0, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11620, 0, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11621, 0, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11622, 0, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11623, 0, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11624, 0, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11625, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11626, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11627, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11628, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11629, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11630, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11631, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11632, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11633, 0, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11634, 0, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2022-02-16 17:18:12', '2022-07-22 00:14:06'),
(11635, 0, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11636, 0, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11637, 0, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11638, 0, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11639, 0, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11640, 0, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11641, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11642, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11643, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11644, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11645, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11646, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11647, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11648, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11649, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11650, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11651, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11652, 0, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11653, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11654, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11655, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11656, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11657, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11658, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11659, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11660, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11661, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11662, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11663, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11664, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11665, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11666, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11667, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11668, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11669, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11670, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11671, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11672, 0, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2022-02-16 17:18:13', '2022-07-22 00:14:06'),
(11673, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2022-02-16 17:18:13', '2022-07-22 00:14:06');

-- --------------------------------------------------------

--
-- Struttura della tabella `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `name`, `url`, `type`, `file_name`, `size`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Lesson', 3, '1621949565-char.php', 'http://www.diagnosiaziendale.it/storage/uploads/1621949565-char.php', 'application/octet-stream', '1621949565-char.php', 973, '2021-05-25 13:32:48', '2021-05-25 13:32:48'),
(2, 'App\\Models\\Course', 4, 'Engineering Math - video', 'https://www.youtube.com/watch?v=1Z5jtQ8UmeA', 'youtube', 'watch?v=1Z5jtQ8UmeA', 0, '2021-05-31 19:04:03', '2021-05-31 19:04:03'),
(3, 'App\\Models\\Course', 5, 'General Knowledge - video', 'https://www.youtube.com/watch?v=KaYrcQ2G5HM', 'youtube', 'watch?v=KaYrcQ2G5HM', 0, '2021-11-17 06:16:40', '2021-11-17 06:16:40'),
(4, 'App\\Models\\Lesson', 5, '1637126578-the-hindu-review-august-2021.pdf', 'http://www.diagnosiaziendale.it/storage/uploads/1637126578-the-hindu-review-august-2021.pdf', 'lesson_pdf', '1637126578-the-hindu-review-august-2021.pdf', 2077, '2021-11-17 06:22:59', '2021-11-17 06:22:59');

-- --------------------------------------------------------

--
-- Struttura della tabella `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `message_thread_participants`
--

CREATE TABLE `message_thread_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2016_07_29_171118_create_chatter_categories_table', 1),
(10, '2016_07_29_171118_create_chatter_discussion_table', 1),
(11, '2016_07_29_171118_create_chatter_post_table', 1),
(12, '2016_07_29_171128_create_foreign_keys', 1),
(13, '2016_08_02_183143_add_slug_field_for_discussions', 1),
(14, '2016_08_03_121747_add_color_row_to_chatter_discussions', 1),
(15, '2017_01_16_121747_add_markdown_and_lock_to_chatter_posts', 1),
(16, '2017_01_16_121747_create_chatter_user_discussion_pivot_table', 1),
(17, '2017_05_28_062751_create_categories_table', 1),
(18, '2017_07_19_082347_create_1500441827_courses_table', 1),
(19, '2017_07_19_082723_create_1500442043_lessons_table', 1),
(20, '2017_07_19_082929_create_1500442169_questions_table', 1),
(21, '2017_07_19_083047_create_1500442247_questions_options_table', 1),
(22, '2017_07_19_083236_create_1500442356_tests_table', 1),
(23, '2017_07_19_120808_create_596eece522a6e_course_user_table', 1),
(24, '2017_07_19_121657_create_596eeef709839_question_test_table', 1),
(25, '2017_08_07_165345_add_chatter_soft_deletes', 1),
(26, '2017_08_11_073824_create_menus_wp_table', 1),
(27, '2017_08_11_074006_create_menu_items_wp_table', 1),
(28, '2017_08_14_085956_create_course_students_table', 1),
(29, '2017_08_17_051131_create_tests_results_table', 1),
(30, '2017_08_17_051254_create_tests_results_answers_table', 1),
(31, '2017_08_18_060324_add_rating_to_course_student_table', 1),
(32, '2017_09_03_144628_create_permission_tables', 1),
(33, '2017_09_11_174816_create_social_accounts_table', 1),
(34, '2017_09_26_140332_create_cache_table', 1),
(35, '2017_09_26_140528_create_sessions_table', 1),
(36, '2017_09_26_140609_create_jobs_table', 1),
(37, '2017_10_10_221227_add_chatter_last_reply_at_discussion', 1),
(38, '2017_11_08_063801_create_threads_table', 1),
(39, '2017_11_08_063907_create_messages_table', 1),
(40, '2017_11_08_063923_create_participants_table', 1),
(41, '2017_11_08_063956_add_softdeletes_to_participants_table', 1),
(42, '2017_11_08_064015_add_softdeletes_to_threads_table', 1),
(43, '2017_11_08_064031_add_softdeletes_to_messages_table', 1),
(44, '2018_04_08_033256_create_password_histories_table', 1),
(45, '2018_06_27_072626_create_blog_module', 1),
(46, '2019_01_15_103052_create_media_table', 1),
(47, '2019_01_16_105633_create_video_progresses_table', 1),
(48, '2019_01_24_113831_create_invoices_table', 1),
(49, '2019_01_24_115120_create_cart_storage_table', 1),
(50, '2019_01_24_120730_create_orders_table', 1),
(51, '2019_01_24_120745_create_order_items_table', 1),
(52, '2019_01_29_052953_create_configs_table', 1),
(53, '2019_02_06_115555_create_course_timeline_table', 1),
(54, '2019_02_08_052619_create_sliders_table', 1),
(55, '2019_02_12_051827_create_sponsors_table', 1),
(56, '2019_02_12_101125_create_testimonials_table', 1),
(57, '2019_02_13_111625_create_faqs_table', 1),
(58, '2019_02_15_115610_create_reviews_table', 1),
(59, '2019_02_19_061120_create_reasons_table', 1),
(60, '2019_03_01_055054_create_chapter_students_table', 1),
(61, '2019_03_06_093703_create_contacts_table', 1),
(62, '2019_03_07_043443_create_pages_table', 1),
(63, '2019_04_25_095421_create_locales_table', 1),
(64, '2019_05_03_000001_create_customer_columns', 1),
(65, '2019_05_03_000002_create_subscriptions_table', 1),
(66, '2019_05_03_000003_create_subscription_items_table', 1),
(67, '2019_05_08_053815_create_certificates_table', 1),
(68, '2019_05_30_044853_create_bundles_table', 1),
(69, '2019_05_30_090702_create_bundle_courses_table', 1),
(70, '2019_05_31_055427_create_bundle_student_table', 1),
(71, '2019_05_31_120554_update_order_items_with_morph', 1),
(72, '2019_06_03_074229_add_foreign_key_to_courses', 1),
(73, '2019_06_03_074251_add_foreign_key_to_faqs', 1),
(74, '2019_06_03_074323_add_foreign_key_to_blogs', 1),
(75, '2019_06_07_073739_add_columns_in_users_table', 1),
(76, '2019_07_22_105142_add_free_column_in_courses', 1),
(77, '2019_07_22_105658_add_free_column_in_bundles', 1),
(78, '2019_07_30_055917_create_coupons_table', 1),
(79, '2019_07_30_061713_create_taxes_table', 1),
(80, '2019_07_30_063204_add_coupon_tax_id_in_orders_table', 1),
(81, '2019_08_19_054926_add_explanation_column_in_question_options', 1),
(82, '2019_09_10_061608_add_remarks_in_orders_table', 1),
(83, '2019_09_10_092512_create_teacher_profiles_table', 1),
(84, '2019_09_12_054932_create_earnings_table', 1),
(85, '2019_09_12_085707_create_withdraws_table', 1),
(86, '2019_09_18_210948_move_starred_column_from_threads_table_to_participants_table', 1),
(87, '2020_04_13_063958_add_description_column_in_teacher_profiles', 1),
(88, '2020_07_10_111516_create_failed_jobs_table', 1),
(89, '2020_08_08_092346_create_live_lesson_slots_table', 1),
(90, '2020_08_14_105647_add_live_lesson_column_lessons_table', 1),
(91, '2020_08_17_115140_create_lesson_slot_bookings_table', 1),
(92, '2020_09_25_073137_add_expire_at_column_in_courses_table', 1),
(93, '2020_09_28_121334_add_expire_at_column_in_bundles', 1),
(94, '2020_10_03_124424_fix_payment_type_cloumn_comments_orders_table', 1),
(95, '2020_10_13_055501_create_stripe_plans_table', 1),
(96, '2020_10_30_090754_add_order_type_column_in_orders_table', 1),
(97, '2020_10_30_111704_add_type_column_in_order_items_table', 1),
(98, '2020_11_03_104447_add_column_strike_price_courses_table', 2),
(99, '2020_12_07_102256_create_wish_lists_table', 2),
(100, '2022_03_04_084531_add_test_id_to_user_answer_table', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Auth\\User', 1),
(1, 'App\\Models\\Auth\\User', 5),
(2, 'App\\Models\\Auth\\User', 2),
(3, 'App\\Models\\Auth\\User', 3),
(3, 'App\\Models\\Auth\\User', 4),
(3, 'App\\Models\\Auth\\User', 6),
(3, 'App\\Models\\Auth\\User', 7),
(3, 'App\\Models\\Auth\\User', 8),
(3, 'App\\Models\\Auth\\User', 9),
(3, 'App\\Models\\Auth\\User', 10),
(3, 'App\\Models\\Auth\\User', 11),
(3, 'App\\Models\\Auth\\User', 12),
(3, 'App\\Models\\Auth\\User', 13),
(3, 'App\\Models\\Auth\\User', 15),
(3, 'App\\Models\\Auth\\User', 16),
(3, 'App\\Models\\Auth\\User', 17),
(3, 'App\\Models\\Auth\\User', 18);

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-stripe/card, 2 - Paypal, 3 - Offline, 4 - Instamojo, 5 - RazorPay, 6 - CashFree, 7 - PayUMoney ',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 - in progress, 1 - Completed',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=WebPayment, 1=subscribe',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `reference_no`, `amount`, `payment_type`, `status`, `transaction_id`, `remarks`, `order_type`, `created_at`, `updated_at`, `coupon_id`) VALUES
(1, 3, 'C6Ccg4HQ', 0.00, 0, 1, NULL, NULL, 0, '2021-03-08 15:21:54', '2021-03-08 15:21:54', 0),
(2, 3, 'sYA5Cb32', 0.00, 0, 1, NULL, NULL, 0, '2021-03-08 15:24:32', '2021-03-08 15:24:32', 0),
(3, 5, 'jQKf1IZ7', 0.00, 0, 1, NULL, NULL, 0, '2021-03-08 17:50:05', '2021-03-08 17:50:05', 0),
(4, 6, 'O0Pq6qhh', 0.00, 0, 1, NULL, NULL, 0, '2021-03-12 02:13:39', '2021-03-12 02:13:39', 0),
(5, 6, 'cZM5SM5X', 0.00, 0, 1, NULL, NULL, 0, '2021-03-12 02:59:26', '2021-03-12 02:59:26', 0),
(6, 8, 'xAgkCe33', 0.00, 0, 1, NULL, NULL, 0, '2021-03-13 13:28:14', '2021-03-13 13:28:14', 0),
(7, 3, 'rj7Dmdl8', 0.00, 0, 1, NULL, NULL, 0, '2021-03-14 09:07:51', '2021-03-14 09:07:51', 0),
(8, 3, '1FYQ87i6', 0.00, 0, 1, NULL, NULL, 0, '2021-06-03 09:48:18', '2021-06-03 09:48:18', 0),
(9, 3, '8Vr2EebM', 0.00, 0, 1, NULL, NULL, 0, '2021-11-17 06:39:23', '2021-11-17 06:39:23', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=WebPayment, 1=subscribe',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_type`, `item_id`, `price`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Course', 1, 0.00, 0, '2021-03-08 15:21:54', '2021-03-08 15:21:54'),
(2, 2, 'App\\Models\\Course', 2, 0.00, 0, '2021-03-08 15:24:32', '2021-03-08 15:24:32'),
(3, 3, 'App\\Models\\Course', 2, 0.00, 0, '2021-03-08 17:50:05', '2021-03-08 17:50:05'),
(4, 4, 'App\\Models\\Course', 1, 0.00, 0, '2021-03-12 02:13:39', '2021-03-12 02:13:39'),
(5, 5, 'App\\Models\\Course', 2, 0.00, 0, '2021-03-12 02:59:26', '2021-03-12 02:59:26'),
(6, 6, 'App\\Models\\Course', 2, 0.00, 0, '2021-03-13 13:28:14', '2021-03-13 13:28:14'),
(7, 7, 'App\\Models\\Course', 3, 0.00, 0, '2021-03-14 09:07:51', '2021-03-14 09:07:51'),
(8, 8, 'App\\Models\\Course', 4, 0.00, 0, '2021-06-03 09:48:18', '2021-06-03 09:48:18'),
(9, 9, 'App\\Models\\Course', 5, 0.00, 0, '2021-11-17 06:39:23', '2021-11-17 06:39:23');

-- --------------------------------------------------------

--
-- Struttura della tabella `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar` int(11) NOT NULL DEFAULT 0,
  `meta_title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `pages`
--

INSERT INTO `pages` (`id`, `user_id`, `title`, `slug`, `content`, `image`, `sidebar`, `meta_title`, `meta_keywords`, `meta_description`, `published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'About Us', 'about-us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna eu risus ultrices sagittis. In tortor turpis, lobortis a tincidunt non, congue a lorem. Quisque imperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.<br><br>\n\nMauris posuere sem at arcu commodo lobortis. Suspendisse sollicitudin dapibus congue. Etiam sit amet lacinia eros. In dictum lacinia tortor, nec mattis eros vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec posuere odio eget risus aliquam, quis ornare urna bibendum. Integer iaculis massa magna, et vehicula dui placerat a. Vestibulum ultricies mauris nunc, ut facilisis orci lobortis nec. Fusce cursus eget quam in elementum. Donec ipsum dui, semper ut commodo in, congue in urna.<br><br>\nimperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.', NULL, 1, NULL, NULL, NULL, 1, '2020-12-14 19:28:25', '2020-12-14 19:28:25', NULL),
(2, 1, 'Privacy Policy', 'privacy-policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna eu risus ultrices sagittis. In tortor turpis, lobortis a tincidunt non, congue a lorem. Quisque imperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.<br><br>\n\nMauris posuere sem at arcu commodo lobortis. Suspendisse sollicitudin dapibus congue. Etiam sit amet lacinia eros. In dictum lacinia tortor, nec mattis eros vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec posuere odio eget risus aliquam, quis ornare urna bibendum. Integer iaculis massa magna, et vehicula dui placerat a. Vestibulum ultricies mauris nunc, ut facilisis orci lobortis nec. Fusce cursus eget quam in elementum. Donec ipsum dui, semper ut commodo in, congue in urna.<br><br>\nimperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.', NULL, 1, NULL, NULL, NULL, 1, '2020-12-14 19:28:25', '2020-12-14 19:28:25', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_histories`
--

CREATE TABLE `password_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `password_histories`
--

INSERT INTO `password_histories` (`id`, `user_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, '$2y$10$Q/cHlD0bMuwNphKIyrfr5.rkOOJrtRwo4igKIPlvKBxE9uLznSEAy', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(2, 2, '$2y$10$ypZNoWy8Y/Xs8m./EOsJge2ZTcRUhBaOKBbyPru8In3JUVKzG2Om6', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(3, 3, '$2y$10$Yn5P3CBYrtnK0/WswLOOiuQo8IWTYkb/2HrgRmtkEHkP4zieOk3W.', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(4, 4, '$2y$10$ecn5Y.CHH64Ien0Pp1K4JuarPv0fgGJeqZXjJrIZfGLH2NcP.QC6i', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(5, 5, '$2y$10$rv.w/TYoVK496awDM243ieEdbHiQQnzIDiNXm.sl3EZwDf6GuK7BC', '2021-03-08 17:49:52', '2021-03-08 17:49:52'),
(6, 6, '$2y$10$ksMk6ieQilKtaoiAvSmYD.QCoE.Ai3v2h983xq9vAJC6xqBqlczLa', '2021-03-12 02:09:25', '2021-03-12 02:09:25'),
(7, 7, '$2y$10$UJ8FVDMylNUHKC27ULE0busl/rK.iwCqc5uiyMtTxlWxc.1xFkilm', '2021-03-13 13:25:03', '2021-03-13 13:25:03'),
(8, 8, '$2y$10$Zbp9nhOu5xUyB3JmKdxmM.JuPyCMk./KwHhYjOF7xFzh8bACoXuZm', '2021-03-13 13:27:26', '2021-03-13 13:27:26'),
(9, 9, '$2y$10$3.7D4ptZy/hoMl0FE.et1uw7ONuJ99a4gs7Le.B7OEGx4EuXF.ewa', '2021-05-17 20:08:54', '2021-05-17 20:08:54'),
(11, 11, '$2y$10$zpnk9jaxNi1bc1DPRE90Tu4MYDTiC4tmOaKGxc1.sSKVAx19dI/ma', '2021-06-26 14:25:46', '2021-06-26 14:25:46'),
(12, 12, '$2y$10$MpHwgkZt172RmRbCMsQbSuF8pi8Yr/5d7bNZkKXWoTkPD6xrWVMpa', '2021-10-11 08:31:18', '2021-10-11 08:31:18'),
(13, 1, '$2y$10$bxozkoos65CLZLgDFq7lZuoHn0SFHC7L70U6ZIWjaKWF/nZFg/1Mm', '2021-10-19 12:47:07', '2021-10-19 12:47:07'),
(14, 13, '$2y$10$V7n73RWT3azMutPeI2Ghj.qupYXjpuF8vklMiTVtoGK4Xsxa0ZQtK', '2021-10-20 10:17:00', '2021-10-20 10:17:00'),
(15, 15, '$2y$10$whuzBudgwi4DCf1yJyDSl.qhVzlxRyvCt.Qp/KsO91ldaxuYEkQhS', '2021-10-21 07:23:18', '2021-10-21 07:23:18'),
(16, 16, '$2y$10$XtUeaNmdlqlIdq9b7HECZuc/LJTm9U07Uy5TxhoNCdeNKJkCgQLIi', '2021-10-27 13:11:29', '2021-10-27 13:11:29'),
(17, 5, '$2y$10$Yn/xdzawpU.w9Hq9ZR3WxuDR49UcW50DU41sCgMtSphfpBTrwuyJ2', '2021-11-04 15:11:36', '2021-11-04 15:11:36'),
(18, 5, '$2y$10$b3Wb9HmYYe1a95kzI/8hg.bd8DgDLq3nUayHtXyKZ84P74Ek67nqW', '2021-11-11 19:59:41', '2021-11-11 19:59:41'),
(19, 17, '$2y$10$PpIVLHu.45sQ7phBRX0QaO4h4Cl2vCtLQxv2twhq0QcD.aaZiahc.', '2021-11-15 16:33:37', '2021-11-15 16:33:37'),
(20, 2, '$2y$10$upWoXEoaO1cZ20EzCNvA6OUCRS0Jifd2vPkkXYAkI.iLuoeZaADmC', '2021-11-17 06:14:19', '2021-11-17 06:14:19'),
(21, 18, '$2y$10$fhmLIL7wsygWYkePaesHiubRhuXfbz1wpPSnG2Il1xA9U9QQCut/2', '2022-02-15 18:47:13', '2022-02-15 18:47:13');

-- --------------------------------------------------------

--
-- Struttura della tabella `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('dmabdeveloper@gmail.com', '$2y$10$p0PeLWuhm9Bq8ARUadeWVOVOzw/jIjJlLE21Ul6xrGbJne54KWK1W', '2021-06-25 08:58:43'),
('pac.ros@tiscali.it', '$2y$10$5CTjDWhVA1py1gyfhLUT.udtKKXdwwVJUDXHEnFwctO/K9P3BQZz2', '2021-10-20 17:44:19'),
('info@wimedica.com', '$2y$10$g6h3OLEn/TnaoANcDPQDcOkA2GAn1PVlyiAuy4BBjPopFzuRWKNIG', '2021-11-03 16:40:24');

-- --------------------------------------------------------

--
-- Struttura della tabella `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user_management_access', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(2, 'user_management_create', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(3, 'user_management_edit', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(4, 'user_management_view', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(5, 'user_management_delete', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(6, 'permission_access', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(7, 'permission_create', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(8, 'permission_edit', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(9, 'permission_view', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(10, 'permission_delete', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(11, 'role_access', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(12, 'role_create', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(13, 'role_edit', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(14, 'role_view', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(15, 'role_delete', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(16, 'user_access', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(17, 'user_create', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(18, 'user_edit', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(19, 'user_view', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(20, 'user_delete', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(21, 'course_access', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(22, 'course_create', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(23, 'course_edit', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(24, 'course_view', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(25, 'course_delete', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(26, 'lesson_access', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(27, 'lesson_create', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(28, 'lesson_edit', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(29, 'lesson_view', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(30, 'lesson_delete', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(31, 'question_access', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(32, 'question_create', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(33, 'question_edit', 'web', '2020-12-14 19:28:22', '2020-12-14 19:28:22'),
(34, 'question_view', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(35, 'question_delete', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(36, 'questions_option_access', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(37, 'questions_option_create', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(38, 'questions_option_edit', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(39, 'questions_option_view', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(40, 'questions_option_delete', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(41, 'test_access', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(42, 'test_create', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(43, 'test_edit', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(44, 'test_view', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(45, 'test_delete', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(46, 'order_access', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(47, 'view backend', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(48, 'category_access', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(49, 'category_create', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(50, 'category_edit', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(51, 'category_view', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(52, 'category_delete', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(53, 'blog_access', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(54, 'blog_create', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(55, 'blog_edit', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(56, 'blog_view', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(57, 'blog_delete', 'web', '2020-12-14 19:28:23', '2020-12-14 19:28:23'),
(58, 'reason_access', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(59, 'reason_create', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(60, 'reason_edit', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(61, 'reason_view', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(62, 'reason_delete', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(63, 'page_access', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(64, 'page_create', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(65, 'page_edit', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(66, 'page_view', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(67, 'page_delete', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(68, 'bundle_access', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(69, 'bundle_create', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(70, 'bundle_edit', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(71, 'bundle_view', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(72, 'bundle_delete', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(73, 'live_lesson_access', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(74, 'live_lesson_create', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(75, 'live_lesson_edit', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(76, 'live_lesson_view', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(77, 'live_lesson_delete', 'web', '2020-12-14 19:28:24', '2020-12-14 19:28:24'),
(78, 'live_lesson_slot_access', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(79, 'live_lesson_slot_create', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(80, 'live_lesson_slot_edit', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(81, 'live_lesson_slot_view', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(82, 'live_lesson_slot_delete', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(83, 'stripe_plan_access', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(84, 'stripe_plan_create', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(85, 'stripe_plan_edit', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(86, 'stripe_plan_view', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(87, 'stripe_plan_delete', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25'),
(88, 'stripe_plan_restore', 'web', '2020-12-14 19:28:25', '2020-12-14 19:28:25');

-- --------------------------------------------------------

--
-- Struttura della tabella `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionimage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `test_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`test_id`)),
  `questiontype` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionpage` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionorder` int(11) DEFAULT NULL,
  `width` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indent` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `more_than_one_answer` tinyint(1) NOT NULL DEFAULT 0,
  `fontsize` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titlelocation` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answerposition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageposition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `help_info_location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_width` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_width` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_location` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_aligment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_aligment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagefit` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagewidth` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageheight` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columncount` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `logic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `question_bg_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `questions`
--

INSERT INTO `questions` (`id`, `question`, `help_info`, `questionimage`, `score`, `userid`, `test_id`, `questiontype`, `questionpage`, `questionorder`, `width`, `indent`, `required`, `more_than_one_answer`, `fontsize`, `state`, `titlelocation`, `answerposition`, `imageposition`, `help_info_location`, `max_width`, `min_width`, `size`, `title_location`, `image_aligment`, `answer_aligment`, `imagefit`, `imagewidth`, `imageheight`, `columncount`, `content`, `logic`, `created_at`, `updated_at`, `deleted_at`, `question_bg_color`) VALUES
(728, '<p>question 2 chck box. aa; BB; cc; 1 line; score 10,20,30</p>', NULL, '', 0, 1, '[\"65\",\"66\"]', '1', NULL, 727, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"aa\",\"score\":\"1\",\"is_checked\":0},{\"label\":\"bb\",\"score\":\"2\",\"is_checked\":0},{\"label\":\"cc\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(729, '<p>question 3 radio bax 2 line ff; gg; HH; score 10,20,30</p>', NULL, '', 0, 1, '[\"63\",\"65\",\"66\"]', '2', NULL, 728, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"ff\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"gg\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"hh\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-6\"},{\"display\":\"2\"}]', '[]', NULL, NULL, NULL, '#fff'),
(761, '<p>fsgfsgfsgf</p>', NULL, '', 100, 1, '[\"65\"]', '9', NULL, 749, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '{\"min_value\":\"100\",\"max_value\":\"1000\",\"steps\":\"100\",\"symbol\":\"1\",\"type\":\"1\"}', '[]', NULL, NULL, NULL, '#fff'),
(762, '<p>hjgjgh</p>', '', '', 0, 1, '[\"1\"]', '5', NULL, 750, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"100\",\"score\":\"0\",\"is_checked\":1},{\"label\":\"200\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"300\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"400\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"500\",\"score\":\"0\",\"is_checked\":0},{\"col\":\"col-6\"},{\"display\":\"2\"},{\"color\":\"#d81313\"}]', '[]', NULL, NULL, NULL, '#fff'),
(763, '<p>aaaaaaaaaaaaaaaaa</p>', NULL, '', 0, 1, '[\"65\"]', '5', NULL, 751, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"100\",\"score\":\"100\",\"is_checked\":1},{\"label\":\"200\",\"score\":\"200\",\"is_checked\":0},{\"label\":\"300\",\"score\":\"300\",\"is_checked\":0},{\"label\":\"400\",\"score\":\"400\",\"is_checked\":0},{\"label\":\"500\",\"score\":\"500\",\"is_checked\":0},{\"col\":\"col-6\"},{\"display\":\"2\"},{\"color\":\"#b53030\"}]', '[]', NULL, NULL, NULL, '#fff'),
(767, '<p>fdgfd</p>', NULL, '', 0, 1, '[\"68\"]', '1', NULL, 755, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(769, '<p>check 10,20,30</p>', '', '', 0, 1, '[\"69\"]', '1', NULL, 757, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(770, '<p>dfgdf radio 40,50,60</p>', NULL, '', 0, 1, '[\"1\",\"69\"]', '2', NULL, 758, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"radio1\",\"score\":\"40\",\"is_checked\":0},{\"label\":\"radio2\",\"score\":\"50\",\"is_checked\":0},{\"label\":\"radio3\",\"score\":\"60\",\"is_checked\":0},{\"col\":\"col-3\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(772, '<p>check box 100,110 condition check1 7-7--1 and&nbsp; 10</p>', '', '', 0, 1, '[\"70\"]', '1', NULL, 760, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"100\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"110\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[[\"0\",\"769\",\"0\",[\"10\"]],[\"0\",\"771\",\"0\",[1]]]', NULL, NULL, NULL, '#fff'),
(777, '<p>check 41,51,61</p>', NULL, '', 0, 1, '[\"69\",\"70\",\"71\",\"72\",\"73\"]', '1', NULL, 765, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check41\",\"score\":\"41\",\"is_checked\":0},{\"label\":\"Check51\",\"score\":\"51\",\"is_checked\":0},{\"label\":\"Check61\",\"score\":\"61\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[[\"0\",\"762\",\"0\",[4]]]', NULL, NULL, NULL, '#fff'),
(785, '<p>rating - 2 for test -- 1 10-7</p>', NULL, '', 0, 1, '[\"74\"]', '5', NULL, 770, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"10\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"20\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"30\",\"score\":\"30\",\"is_checked\":0},{\"label\":\"40\",\"score\":\"40\",\"is_checked\":0},{\"label\":\"50\",\"score\":\"50\",\"is_checked\":1},{\"col\":\"col-3\"},{\"display\":\"1\"},{\"color\":\"#000000\"}]', '[[\"0\",\"777\",\"0\",[\"61\"]]]', NULL, NULL, NULL, '#fff'),
(790, '<p>check 10,20,30</p>', '', '', 0, 1, '[\"2\",\"75\"]', '1', NULL, 791, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(791, '<p>check40,50,60</p>', NULL, '', 0, 1, '[\"75\"]', '1', NULL, 790, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check4\",\"score\":\"40\",\"is_checked\":0},{\"label\":\"Check5\",\"score\":\"50\",\"is_checked\":0},{\"label\":\"Check6\",\"score\":\"60\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(792, '<p>check 10,20,30</p>', '', '', 0, 1, '[\"1\",\"76\"]', '1', NULL, 773, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(793, '<p>chec condition logic 40, 50</p>', NULL, '', 0, 1, '[\"1\",\"76\"]', '1', NULL, 794, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check30\",\"score\":\"40\",\"is_checked\":0},{\"label\":\"Check40\",\"score\":\"50\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[[\"0\",\"802\",\"0\",[\"10\"]],[\"0\",\"800\",\"0\",[\"100\"]]]', NULL, NULL, NULL, '#fff'),
(794, '<p>chec condition logic 40, 50</p>', '', '', 0, 1, '[\"1\",\"76\"]', '1', NULL, 775, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check30\",\"score\":\"40\",\"is_checked\":0},{\"label\":\"Check40\",\"score\":\"50\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[[\"0\",\"790\",\"0\",[\"10\"]],[\"0\",\"792\",\"0\",[\"10\"]]]', NULL, NULL, NULL, '#fff'),
(795, '<p>radiobox 10,20,30</p>', NULL, '', 0, 1, '[\"1\",\"76\"]', '1', NULL, 793, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check12\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(796, '<p>test errro delate</p>', '', '', 0, 1, '[\"75\",\"76\"]', '1', NULL, 795, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"Check1\",\"score\":\"0\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(797, '<p>qqqq</p>', '', '', 0, 1, '[\"76\"]', '0', NULL, 796, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"value\":\"\"}]', '[]', NULL, NULL, NULL, '#fff'),
(798, '<p>111111</p>', '', '', 0, 1, '[\"75\"]', '0', NULL, 797, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"value\":\"\"}]', '[]', NULL, NULL, NULL, '#fff'),
(799, '<p>22222</p>', NULL, '', 0, 1, '[\"75\"]', '1', NULL, 798, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check1\",\"score\":\"20\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(800, '<p>radio box qq- 100, ww - 200 ,ee - 300</p>', NULL, '', 0, 1, '[\"76\"]', '2', NULL, 793, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"qq\",\"score\":\"100\",\"is_checked\":0},{\"label\":\"ww\",\"score\":\"200\",\"is_checked\":0},{\"label\":\"ee\",\"score\":\"300\",\"is_checked\":0},{\"col\":\"col-3\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(801, '<p>check 10,20,30</p>', '', '', 0, 1, '[\"75\"]', '1', NULL, 800, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(802, '<p>check 10,20,30</p>', '', '', 0, 1, '[\"75\"]', '1', NULL, 801, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"20\",\"is_checked\":0},{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(803, '<p>check 40,50,60</p>', NULL, '', 0, 1, '[\"1\",\"2\",\"75\",\"76\"]', '1', NULL, 802, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check4\",\"score\":\"40\",\"is_checked\":0},{\"label\":\"Check5\",\"score\":\"50\",\"is_checked\":0},{\"label\":\"Check6\",\"score\":\"60\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(804, '<p>&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://diagnosiaziendale.it/storage/photos/1/COSTI_GENERALI2081648626.gif\" style=\"float:left; height:344px; width:400px\" /></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p>This check is fineshd.&nbsp;<span style=\"color:#27ae60\"><span style=\"font-size:20px\">your commitment will help you improve your company. give you feedback of this checkup.</span></span></p>', NULL, '', 0, 1, '[\"77\"]', '8', NULL, 803, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"1\",\"score\":\"0\",\"is_checked\":1},{\"label\":\"2\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"3\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"4\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"5\",\"score\":\"0\",\"is_checked\":0},{\"col\":\"col-3\"},{\"display\":\"1\"},{\"color\":\"#2da973\"}]', '[]', NULL, NULL, NULL, '#fff'),
(805, '<p><span style=\"font-size:18px\">question 1 add some files</span></p>', '<p>Puoi aggiungere qui immagine del logo&nbsp;logo, immagine della tua azienda&nbsp; edei prodotti e servizi</p>', '', 0, 1, '[\"78\",\"79\"]', '7', NULL, 804, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"number\":\"5\"}]', '[]', NULL, NULL, NULL, '#fff'),
(806, '<p>test is request</p>', NULL, '', 0, 1, '[\"78\"]', '1', NULL, 805, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"Check2\",\"score\":\"1\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(807, '<p>radio box verify options</p>', NULL, '', 0, 1, '[\"78\"]', '2', NULL, 806, '', '', 0, 1, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"radio1\",\"score\":\"0\",\"is_checked\":0},{\"label\":\"radio1\",\"score\":\"1\",\"is_checked\":0},{\"label\":\"radio1\",\"score\":\"2\",\"is_checked\":0},{\"col\":\"col-3\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(808, '<p>what is your revenue?</p>', NULL, '', 10000, 1, '[\"78\"]', '9', NULL, 807, '', '', 1, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '{\"min_value\":\"10000\",\"max_value\":\"1000000\",\"steps\":\"10000\",\"symbol\":\"1\",\"type\":\"2\"}', '[]', NULL, NULL, NULL, '#fff'),
(809, '<p>input the&nbsp;cost of company?</p>', NULL, '', 0, 1, '[\"78\"]', '10', NULL, 808, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[]', '[]', NULL, NULL, NULL, '#fff'),
(810, '<p>name of company</p>', NULL, '', 0, 1, '[\"78\"]', '0', NULL, 809, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"value\":\"\"}]', '[]', NULL, NULL, NULL, '#fff'),
(811, '<p>check box</p>', NULL, '', 0, 1, '[\"78\"]', '1', NULL, 810, '', '', 0, 0, '', 'deafult', 'col-6 order-2', 'col-8 order-2', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check1\",\"score\":\"10\",\"is_checked\":0},{\"label\":\"Check12\",\"score\":\"20\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(812, '<p>check box 2</p>', NULL, '', 0, 1, '[\"78\"]', '1', NULL, 811, '', '', 0, 0, '', 'deafult', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '[{\"label\":\"Check3\",\"score\":\"30\",\"is_checked\":0},{\"label\":\"Check4\",\"score\":\"40\",\"is_checked\":0},{\"col\":\"col-12\"},{\"display\":\"1\"}]', '[]', NULL, NULL, NULL, '#fff'),
(813, '<p>matrix with&nbsp; value</p>', '', '', 0, 1, '[\"78\"]', '4', NULL, 812, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '<table id=\"add-matrix\" name=\"matrix\" data-id=\"813\" class=\"ml-2 table table-striped\">\n            <thead id=\"symbol_matrix_value\"><tr><th>Value in €</th></tr></thead>\n        <tr id=\"header_row_col1\"><th class=\"custom-hide\"></th><th class=\"\"></th><th scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label\">Column</label></th><th scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label\">Column</label></th><th scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label\">Column</label></th></tr><tr id=\"mr1\"><td class=\"custom-hide\"><button class=\"hide_btn\" id=\"\"><i class=\"fa fa-trash\"></i></button></td><td scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label \">Row</label></td><td class=\"col-3 custom-border\"><input id=\"q_id1\" type=\"text\" value=\"\" name=\"matrixtext1\" class=\"form-control radioselected d-inline  q_id8131\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id1\"></td><td class=\"col-3 custom-border\"><input id=\"q_id2\" type=\"text\" value=\"\" name=\"matrixtext1\" class=\"form-control radioselected d-inline  q_id8132\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id2\"></td><td class=\"col-3 custom-border\"><input id=\"q_id3\" type=\"text\" value=\"\" name=\"matrixtext1\" class=\"form-control radioselected d-inline  q_id8133\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id3\"></td></tr><tr id=\"mr2\"><td class=\"custom-hide\"><button class=\"hide_btn\" id=\"\"><i class=\"fa fa-trash\"></i></button></td><td scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label \">Row</label></td><td class=\"col-3 custom-border\"><input id=\"q_id4\" type=\"text\" value=\"\" name=\"matrixtext2\" class=\"form-control radioselected d-inline  q_id8134\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id4\"></td><td class=\"col-3 custom-border\"><input id=\"q_id5\" type=\"text\" value=\"\" name=\"matrixtext2\" class=\"form-control radioselected d-inline  q_id8135\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id5\"></td><td class=\"col-3 custom-border\"><input id=\"q_id6\" type=\"text\" value=\"\" name=\"matrixtext2\" class=\"form-control radioselected d-inline  q_id8136\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id6\"></td></tr><tr id=\"mr3\"><td class=\"custom-hide\"><button class=\"hide_btn\" id=\"\"><i class=\"fa fa-trash\"></i></button></td><td scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label \">Row</label></td><td class=\"col-3 custom-border\"><input id=\"q_id7\" type=\"text\" value=\"\" name=\"matrixtext3\" class=\"form-control radioselected d-inline  q_id8137\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id7\"></td><td class=\"col-3 custom-border\"><input id=\"q_id8\" type=\"text\" value=\"\" name=\"matrixtext3\" class=\"form-control radioselected d-inline  q_id8138\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id8\"></td><td class=\"col-3 custom-border\"><input id=\"q_id9\" type=\"text\" value=\"\" name=\"matrixtext3\" class=\"form-control radioselected d-inline  q_id8139\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id9\"></td></tr></table>', '[]', NULL, NULL, NULL, '#fff'),
(814, '<p>matrix with radio box</p>', '', '', 0, 1, '[\"78\"]', '4', NULL, 813, '', '', 0, 0, '', 'default', 'col-12 order-1', 'col-12 order-3', 'col-12 order-2', '', '', '', '', NULL, 'col-12', 'offset-md-0', '0', '', '', NULL, '<table id=\"add-matrix\" name=\"matrix\" data-id=\"814\" class=\"ml-2 table table-striped\" matrix-type=\"radio\">\n            <thead id=\"symbol_matrix_value\"><tr><th>Value in €</th></tr></thead>\n        <tr id=\"header_row_col1\"><th class=\"custom-hide\"></th><th class=\"\"></th><th scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label\">Column</label></th><th scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label\">Column</label></th><th scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label\">Column</label></th></tr><tr id=\"mr1\"><td class=\"custom-hide\"><button class=\"hide_btn\" id=\"\"><i class=\"fa fa-trash\"></i></button></td><td scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label \">Row</label></td><td class=\"col-3 custom-border\"><input id=\"q_id1\" type=\"radio\" value=\"\" name=\"matrixradio1\" class=\"form-control radioselected d-inline col-2 q_id8141\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id1\"><input type=\"text\" data-q_id=\"q_id1\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td><td class=\"col-3 custom-border\"><input id=\"q_id2\" type=\"radio\" value=\"\" name=\"matrixradio1\" class=\"form-control radioselected d-inline col-2 q_id8142\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id2\"><input type=\"text\" data-q_id=\"q_id2\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td><td class=\"col-3 custom-border\"><input id=\"q_id3\" type=\"radio\" value=\"\" name=\"matrixradio1\" class=\"form-control radioselected d-inline col-2 q_id8143\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id3\"><input type=\"text\" data-q_id=\"q_id3\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td></tr><tr id=\"mr2\"><td class=\"custom-hide\"><button class=\"hide_btn\" id=\"\"><i class=\"fa fa-trash\"></i></button></td><td scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label \">Row</label></td><td class=\"col-3 custom-border\"><input id=\"q_id4\" type=\"radio\" value=\"\" name=\"matrixradio2\" class=\"form-control radioselected d-inline col-2 q_id8144\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id4\"><input type=\"text\" data-q_id=\"q_id4\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td><td class=\"col-3 custom-border\"><input id=\"q_id5\" type=\"radio\" value=\"\" name=\"matrixradio2\" class=\"form-control radioselected d-inline col-2 q_id8145\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id5\"><input type=\"text\" data-q_id=\"q_id5\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td><td class=\"col-3 custom-border\"><input id=\"q_id6\" type=\"radio\" value=\"\" name=\"matrixradio2\" class=\"form-control radioselected d-inline col-2 q_id8146\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id6\"><input type=\"text\" data-q_id=\"q_id6\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td></tr><tr id=\"mr3\"><td class=\"custom-hide\"><button class=\"hide_btn\" id=\"\"><i class=\"fa fa-trash\"></i></button></td><td scope=\"row\" class=\"custom-border\"><label contenteditable=\"false\" class=\"form-label \">Row</label></td><td class=\"col-3 custom-border\"><input id=\"q_id7\" type=\"radio\" value=\"\" name=\"matrixradio3\" class=\"form-control radioselected d-inline col-2 q_id8147\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id7\"><input type=\"text\" data-q_id=\"q_id7\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td><td class=\"col-3 custom-border\"><input id=\"q_id8\" type=\"radio\" value=\"\" name=\"matrixradio3\" class=\"form-control radioselected d-inline col-2 q_id8148\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id8\"><input type=\"text\" data-q_id=\"q_id8\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td><td class=\"col-3 custom-border\"><input id=\"q_id9\" type=\"radio\" value=\"\" name=\"matrixradio3\" class=\"form-control radioselected d-inline col-2 q_id8149\" onchange=\"inputToData(this)\" data-questiontype=\"€\" data-value=\"\" data-selected=\"false\" data-q_id=\"q_id9\"><input type=\"text\" data-q_id=\"q_id9\" data-value=\"\" class=\"form-control col-10 d-inline radioscore\" value=\"\" onchange=\"radioScore(this)\"></td></tr></table>', '[]', NULL, NULL, NULL, '#fff');

-- --------------------------------------------------------

--
-- Struttura della tabella `questions_copy1`
--

CREATE TABLE `questions_copy1` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionimage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `test_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `questiontype` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionpage` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionorder` int(11) DEFAULT NULL,
  `width` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indent` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fontsize` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titlelocation` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagefit` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagewidth` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageheight` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columncount` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `logic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `questions_copy1`
--

INSERT INTO `questions_copy1` (`id`, `question`, `questionimage`, `score`, `userid`, `test_id`, `questiontype`, `questionpage`, `questionorder`, `width`, `indent`, `fontsize`, `titlelocation`, `imagefit`, `imagewidth`, `imageheight`, `columncount`, `content`, `logic`, `created_at`, `updated_at`, `deleted_at`) VALUES
(45, 'question marketing', NULL, '[\"\",\"\",\"\"]', 1, '[\"2\"]', '1', NULL, 19, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\",\"Check1\"]', '[]', NULL, NULL, NULL),
(46, 'DOMANDA CON CHECKBOX AND IMAGE', NULL, '[\"\",\"\",\"\",\"\"]', 1, '[\"2\"]', '1', NULL, 20, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"PROVA\",\"PROVA 1\",\"PROVA 2\",\"Check1\"]', '[]', NULL, NULL, NULL),
(47, 'prima domanda', NULL, '[[null,null,null],[null,null,null],[null,null,null]]', 1, '[\"2\"]', '4', NULL, 21, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[[null,null,null],[null,null,null],[null,null,null]]', '[]', NULL, NULL, NULL),
(55, 'domanda immagini', NULL, '[\"\",\"\",\"\",\"\",\"\",null]', 1, '[\"1\"]', '3', NULL, 27, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[]', '[]', NULL, NULL, NULL),
(62, 'fdsfsdfsdgfdsgfdsgdsfgdfsdfshdfsh', NULL, '[\"\",\"\"]', 1, '[\"1\"]', '1', NULL, 33, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\"]', '[]', NULL, NULL, NULL),
(63, 'Who is man?', '161544360076.png', '\"5\"', 1, '1', '0', NULL, 34, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(64, 'Who is man?', '161544360076.png', '\"5\"', 1, '2', '0', NULL, 34, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(65, 'Who is man?', '161544360076.png', '\"5\"', 1, '4', '0', NULL, 34, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(66, 'Who is man?', '161544360076.png', '\"5\"', 1, '5', '0', NULL, 34, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(67, 'Who is better', '161544385421.png', '[\"4\",\"5\",\"10\"]', 1, '1', '1', NULL, 35, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Cooker\",\"barber\",\"teacher\"]', '[]', NULL, NULL, NULL),
(68, 'Who is better', '161544385421.png', '[\"4\",\"5\",\"10\"]', 1, '3', '1', NULL, 35, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Cooker\",\"barber\",\"teacher\"]', '[]', NULL, NULL, NULL),
(69, 'Who is better', '161544385421.png', '[\"4\",\"5\",\"10\"]', 1, '4', '1', NULL, 35, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Cooker\",\"barber\",\"teacher\"]', '[]', NULL, NULL, NULL),
(70, 'Who is better', '161544385421.png', '[\"4\",\"5\",\"10\"]', 1, '5', '1', NULL, 35, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Cooker\",\"barber\",\"teacher\"]', '[]', NULL, NULL, NULL),
(71, 'Select images', '161544779333.png', '[\"5\",\"4\",\"5\",null]', 1, '1', '3', NULL, 36, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161544779333.png\",\"16154477936.png\"]', '[[\"0\",\"65\",\"2\",\"man\"],[\"0\",\"65\",\"2\",2]]', NULL, NULL, NULL),
(72, 'Select images', '161544779333.png', '[\"5\",\"4\",\"5\",null]', 1, '4', '3', NULL, 36, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161544779333.png\",\"16154477936.png\"]', '[[\"0\",\"65\",\"0\",\"man\"],[\"0\",\"69\",\"0\",2]]', NULL, NULL, NULL),
(73, 'Select images', '161544779333.png', '[\"5\",\"4\",\"5\",null]', 1, '5', '3', NULL, 36, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161544779333.png\",\"16154477936.png\"]', '[[\"0\",\"65\",\"2\",\"man\"],[\"0\",\"69\",\"2\",2]]', NULL, NULL, NULL),
(74, 'write number', NULL, '[[\" \",\"col1\",\"col2\"],[\"row1\",\"2\",\"3\"],[\"row2\",\"4\",\"5\"]]', 1, '1', '4', NULL, 37, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[[\" \",\"col1\",\"col2\"],[\"row1\",\"\",\"\"],[\"row2\",\"\",\"\"]]', '[[\"0\",\"65\",\"1\",\"woman\"],[\"1\",\"65\",\"2\",5]]', NULL, NULL, NULL),
(75, 'write number', NULL, '[[\" \",\"col1\",\"col2\"],[\"row1\",\"2\",\"3\"],[\"row2\",\"4\",\"5\"]]', 1, '4', '4', NULL, 37, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[[\" \",\"col1\",\"col2\"],[\"row1\",\"\",\"\"],[\"row2\",\"\",\"\"]]', '[[\"0\",\"65\",\"0\",\"34\"],[\"0\",\"72\",\"0\",1]]', NULL, NULL, NULL),
(76, 'write number', NULL, '[[\" \",\"col1\",\"col2\"],[\"row1\",\"2\",\"3\"],[\"row2\",\"4\",\"5\"]]', 1, '5', '4', NULL, 37, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[[\"#\",\"col1\",\"col2\"],[\"row1\",\"\",\"\"],[\"row2\",\"\",\"\"]]', '[[\"0\",\"65\",\"1\",\"woman\"],[\"1\",\"65\",\"2\",5]]', NULL, NULL, NULL),
(77, 'asdasdas', '161545514451.png', '[\"4\",\"3\",\"2\"]', 1, '1', '2', NULL, 38, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"radio1\",\"radio1\",\"radio1\"]', '[]', NULL, NULL, NULL),
(78, 'vvvvvvvvvvvvvvvvv', NULL, '\"\"', 1, '1', '0', NULL, 39, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(79, 'adasdsad', '161546540430.png', '[\"3\",\"4\"]', 1, '1', '1', NULL, 40, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\"]', '[[\"0\",null,\"0\",\"ewr\"],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",\"ewr\"]]', NULL, NULL, NULL),
(80, 'adasdsad', '161546540430.png', '[\"3\",\"4\"]', 1, '1', '1', NULL, 40, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\"]', '[[\"0\",null,\"0\",\"ewr\"],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",\"ewr\"]]', NULL, NULL, NULL),
(82, 'TTTTEEE', NULL, '[\"4\",\"5\"]', 1, '1', '1', NULL, 41, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\"]', '[[\"0\",null,\"2\",\"ertertert\"],[\"0\",null,\"3\",2],[\"0\",null,\"2\",null],[\"0\",null,\"3\",null],[\"0\",null,\"0\",\"ertertert\"]]', NULL, NULL, NULL),
(85, 'ggggggggggggggggggggggg', NULL, '[\"6\",\"6\"]', 1, '9', '1', NULL, 42, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\"]', '[[\"0\",null,\"0\",16],[\"0\",null,\"0\",1],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(88, NULL, NULL, '\"\"', 1, '9', '0', NULL, 43, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(90, NULL, NULL, '\"\"', 1, '5', '0', NULL, 44, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(92, 'asd', NULL, '\"4\"', 1, '3', '0', NULL, 45, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"asd\"', '[]', NULL, NULL, NULL),
(94, 'wqe', NULL, '\"3\"', 1, '1', '0', NULL, 46, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"qweqe\"', '[]', NULL, NULL, NULL),
(96, 'wqe', NULL, '\"3\"', 1, '9', '0', NULL, 46, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"qweqe\"', '[]', NULL, NULL, NULL),
(97, 'dfg', '161562858079.png', '[\"4\",\"4\",\"3\",\"4\",null]', 1, '1', '3', NULL, 47, '1200', '2', NULL, NULL, '0', NULL, NULL, NULL, '[\"161562858079.png\",\"161562858011.png\",\"161562858010.png\"]', '[]', NULL, NULL, NULL),
(98, 'asd', '161562881537.png', '\"5\"', 1, '1', '0', NULL, 48, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"asd\"', '[]', NULL, NULL, NULL),
(99, 'asd', '161562881537.png', '\"5\"', 1, '3', '0', NULL, 48, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"asd\"', '[]', NULL, NULL, NULL),
(100, NULL, NULL, '\"\"', 1, '1', '0', NULL, 49, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",\"asd\"],[\"1\",null,\"0\",\"sddsd\"],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",\"asd\"]]', NULL, NULL, NULL),
(101, NULL, NULL, '\"\"', 1, '1', '0', NULL, 50, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(102, NULL, '161562946173.png', '[\"5\",\"4\",\"5\",null]', 1, '1', '3', NULL, 51, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562946173.png\",\"16156294619.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(103, NULL, '161562953310.png', '[\"4\",\"5\",\"4\",null]', 1, '1', '3', NULL, 52, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562953310.png\",\"161562953381.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(104, NULL, NULL, '\"\"', 1, '1', '0', NULL, 53, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(105, NULL, NULL, '\"\"', 1, '1', '0', NULL, 54, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(106, NULL, NULL, '\"\"', 1, '1', '0', NULL, 55, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(107, NULL, NULL, '\"\"', 1, '1', '0', NULL, 56, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(108, NULL, NULL, '\"\"', 1, '1', '0', NULL, 57, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(109, NULL, NULL, '\"\"', 1, '1', '0', NULL, 58, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(110, NULL, '161562974922.png', '[\"4\",\"3\",\"4\",null]', 1, '1', '3', NULL, 59, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562974922.png\",\"161562974990.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(111, NULL, '161562979761.png', '[\"3\",\"4\",\"3\",null]', 1, '1', '3', NULL, 60, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562979761.png\",\"161562979757.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(112, NULL, '161562983454.png', '[\"5\",\"4\",\"5\",null]', 1, '1', '3', NULL, 61, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562983454.png\",\"161562983499.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(113, NULL, '161562987977.png', '[\"4\",\"5\",\"4\",null]', 1, '1', '3', NULL, 62, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562987977.png\",\"161562987938.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(114, NULL, '161562987977.png', '[\"4\",\"5\",\"4\",null]', 1, '3', '3', NULL, 62, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161562987977.png\",\"161562987938.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(115, NULL, NULL, '[[\"  \",\"Input\",\"Input\"],[\"Input\",\"sdf\",\"\"],[\"Input\",\"\",\"\"]]', 1, '1', '4', NULL, 63, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[[\"  \",\"Input\",\"Input\"],[\"Input\",\"\",\"\"],[\"Input\",\"\",\"\"]]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(116, NULL, '161563078770.png', '[\"\",\"4\",\"\"]', 1, '1', '3', NULL, 64, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161563078770.png\",\"161563078754.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(117, NULL, '161563101679.png', '[\"5\",\"5\"]', 1, '1', '3', NULL, 65, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"161563101679.png\",\"161563101675.png\"]', '[[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null]]', NULL, NULL, NULL),
(118, NULL, NULL, '\"\"', 1, '1', '0', NULL, 66, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",\"\"],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",\"\"]]', NULL, NULL, NULL),
(119, NULL, NULL, '\"\"', 1, '1', '0', NULL, 67, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",null,\"0\",\"asdsadasd\"],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",null],[\"0\",null,\"0\",\"asdsadasd\"]]', NULL, NULL, NULL),
(120, NULL, '161563408012.png', '[\"ds\",\"d\",\"fdd\"]', 1, '1', '1', NULL, 68, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '[\"Check1\",\"Check1\",\"df\"]', '[[\"0\",\"63\",\"0\",\"sdf\"],[\"0\",\"63\",\"0\",2],[\"0\",\"\",\"0\",null],[\"0\",\"\",\"0\",null],[\"0\",\"\",\"0\",\"sdf\"]]', NULL, NULL, NULL),
(121, NULL, NULL, '\"\"', 1, '1', '0', NULL, 69, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"67\",\"0\",2],[\"0\",\"67\",\"0\",\"dfgdfgdfg\"],[\"0\",\"\",\"0\",null],[\"0\",\"\",\"0\",null],[\"0\",\"\",\"0\",\"dfgdfgdfg\"]]', NULL, NULL, NULL),
(122, NULL, NULL, '\"\"', 1, '1', '0', NULL, 70, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"67\",\"0\",2],[\"0\",\"67\",\"0\",0],[\"0\",\"\",\"0\",null],[\"0\",\"\",\"0\",null],[\"0\",\"\",\"0\",null]]', NULL, NULL, NULL),
(123, NULL, NULL, '\"\"', 1, '1', '0', NULL, 71, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"88\",\"0\",\"asdasd\"],[\"0\",\"88\",\"0\",2]]', NULL, NULL, NULL),
(124, NULL, NULL, '\"\"', 1, '1', '0', NULL, 72, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"67\",\"0\",2],[\"0\",\"67\",\"0\",0]]', NULL, NULL, NULL),
(125, NULL, NULL, '\"\"', 1, '1', '0', NULL, 73, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"71\",\"0\",0],[\"0\",\"71\",\"0\",4]]', NULL, NULL, NULL),
(126, NULL, NULL, '\"\"', 1, '1', '0', NULL, 74, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"67\",\"0\",0],[\"0\",\"67\",\"0\",\"67.Who is better\"]]', NULL, NULL, NULL),
(127, NULL, NULL, '\"\"', 1, '1', '0', NULL, 75, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"67\",\"0\",0],[\"0\",\"67\",\"0\",4],[\"0\",\"74\",\"0\",\"74.write number\"],[\"0\",\"96\",\"0\",\"\"]]', NULL, NULL, NULL),
(128, NULL, NULL, '\"\"', 1, '1', '0', NULL, 76, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"63\",\"0\",\"\"],[\"0\",\"63\",\"0\",0]]', NULL, NULL, NULL),
(129, NULL, NULL, '\"\"', 1, '1', '0', NULL, 77, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"67\",\"0\",0],[\"0\",\"67\",\"0\",\"\"],[\"0\",\"78\",\"0\",\"\"]]', NULL, NULL, NULL),
(130, NULL, NULL, '\"\"', 1, '1', '0', NULL, 78, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[[\"0\",\"71\",\"0\",0],[\"0\",\"78\",\"0\",\"\"]]', NULL, NULL, NULL),
(131, NULL, '16156376508.png', '\"\"', 1, '1', '0', NULL, 79, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(132, 'asdddddddddddddddddddddddd', NULL, '\"\"', 1, '1', '0', NULL, 80, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(133, 'asdddddddddddddddddddddddd', NULL, '\"\"', 1, '5', '0', NULL, 80, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(134, 'asdasd', '161563781412.png', '\"s\"', 1, '1', '0', NULL, 81, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL),
(135, 'asdasd', '161563781412.png', '\"s\"', 1, '9', '0', NULL, 81, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '\"\"', '[]', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `questions_options`
--

CREATE TABLE `questions_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `option_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `question_test`
--

CREATE TABLE `question_test` (
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL,
  `question_order` int(10) NOT NULL DEFAULT 0,
  `page_number` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `question_test`
--

INSERT INTO `question_test` (`question_id`, `test_id`, `question_order`, `page_number`) VALUES
(728, 65, 727, 1),
(728, 66, 0, 1),
(762, 1, 0, 1),
(761, 65, 0, 1),
(763, 65, 0, 1),
(769, 69, 0, 1),
(772, 70, 0, 1),
(729, 63, 0, 1),
(729, 65, 0, 1),
(729, 66, 0, 1),
(762, 74, 0, 1),
(770, 1, 0, 1),
(770, 69, 0, 1),
(777, 69, 0, 1),
(777, 70, 0, 1),
(777, 71, 0, 1),
(777, 72, 0, 1),
(777, 73, 0, 1),
(762, 69, 0, 1),
(762, 70, 0, 1),
(762, 71, 0, 1),
(762, 72, 0, 1),
(762, 73, 0, 1),
(785, 74, 0, 1),
(777, 74, 0, 1),
(790, 2, 0, 1),
(792, 1, 0, 1),
(794, 1, 0, 1),
(790, 1, 0, 1),
(795, 1, 0, 1),
(793, 1, 0, 1),
(802, 75, 0, 1),
(767, 68, 0, 1),
(802, 2, 0, 1),
(767, 2, 0, 1),
(800, 1, 0, 1),
(803, 2, 0, 1),
(803, 75, 0, 1),
(804, 77, 0, 1),
(802, 1, 0, 1),
(803, 1, 0, 1),
(767, 1, 0, 1),
(805, 79, 0, 1),
(802, 76, 0, 1),
(803, 76, 0, 1),
(793, 76, 0, 1),
(800, 76, 0, 1),
(805, 78, 0, 1),
(808, 78, 0, 1),
(809, 78, 0, 1),
(810, 78, 0, 1),
(812, 78, 0, 1),
(813, 78, 0, 1),
(814, 78, 0, 1),
(811, 78, 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `question_test_copy1`
--

CREATE TABLE `question_test_copy1` (
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reviewable_id` int(11) NOT NULL,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `reviewable_id`, `reviewable_type`, `rating`, `content`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'App\\Models\\Course', 3, 'wdsadas', '2021-11-16 13:31:46', '2021-11-16 13:31:46');

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(2, 'teacher', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(3, 'student', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21'),
(4, 'user', 'web', '2020-12-14 19:28:21', '2020-12-14 19:28:21');

-- --------------------------------------------------------

--
-- Struttura della tabella `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(47, 1),
(47, 2),
(47, 3),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(51, 1),
(51, 2),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overlay` int(11) DEFAULT 0,
  `sequence` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `content`, `bg_image`, `overlay`, `sequence`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Slide 1', '{\"hero_text\":\"Innovativa soluzione di apprendimento e\",\"sub_text\":\"analisi aziendale\",\"buttons\":[{\"label\":\"Our Courses\",\"link\":\"https://diagnosiaziendale.it/search?q=&category=\"}]}', '1657648937-esperienza-riduzione-costi.jpg', 0, 1, 1, '2020-12-14 19:28:26', '2022-07-12 16:03:02'),
(2, 'Slide 2', '{\"hero_text\":\"Innovativa modalità di formazione e\",\"sub_text\":\"di miglioramento dell\'efficienza\",\"widget\":{\"type\":1}}', '1657649141-filosofia-collaborazione-riduzione-costi.jpg', 0, 2, 1, '2020-12-14 19:28:26', '2022-07-12 16:05:42'),
(3, 'Slide 3', '{\"hero_text\":\"Mobile Application Experiences : Mobile App Design\",\"sub_text\":\"\",\"widget\":{\"type\":2,\"timer\":\"2019/02/15 11:01\"},\"buttons\":[{\"label\":\"About Us\",\"link\":\"http://laravel-lms.test/about-us\"},{\"label\":\"Contact Us\",\"link\":\"http://laravel-lms.test/contact-us\"}]}', 'slider-3.jpg', 0, 3, 0, '2020-12-14 19:28:26', '2022-07-12 16:04:34');

-- --------------------------------------------------------

--
-- Struttura della tabella `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `stripe_plans`
--

CREATE TABLE `stripe_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` int(11) DEFAULT NULL,
  `bundle` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `surveys`
--

CREATE TABLE `surveys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `survey_results`
--

CREATE TABLE `survey_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `survey_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `teacher_profiles`
--

CREATE TABLE `teacher_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `facebook_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'paypal,bank',
  `payment_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `teacher_profiles`
--

INSERT INTO `teacher_profiles` (`id`, `user_id`, `facebook_link`, `twitter_link`, `linkedin_link`, `payment_method`, `payment_details`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'http://daniel.com/voluptate-dolores-voluptatum-et-dolorem-eveniet-dolores.html', 'http://schmeler.net/', 'http://www.barrows.net/sit-possimus-placeat-est-quia', 'paypal', '{\"bank_name\":\"\",\"ifsc_code\":\"\",\"account_number\":\"\",\"account_name\":\"\",\"paypal_email\":\"adminteacher@demo.com\"}', NULL, '2020-12-14 19:28:26', '2020-12-14 19:28:26', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `testreports`
--

CREATE TABLE `testreports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order` int(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `origin_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `published` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `testreports`
--

INSERT INTO `testreports` (`id`, `user_id`, `title`, `order`, `content`, `origin_content`, `published`) VALUES
(237, 1, 'copy shortcode', 64, '\"<p>jdslkdjl</p>\\n\\n<p>dkjsljlkdsjdlksjdlk</p>\\n\\n<p>assadsa</p>\\n\\n<p>d;sd;kdsd</p>\\n\\n<p></p><div id=\\\"bar-chartdiv1\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 696.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"696.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-e26efe\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clipe26efexyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"512\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipe26efex\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"512\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipe26efey\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"696.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipe26efexy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"512\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"512\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"592\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"592\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"131.2\\\" y=\\\"420.5\\\" width=\\\"409.6\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"51.2\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"540.8\\\" y=\\\"420.5\\\" width=\\\"51.2\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,379.47)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,338.93)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,298.4)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,257.87)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,217.32999999999998)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,176.8)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,136.27)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,420)\\\" d=\\\"M80,0h512\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clipe26efexyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M25.6,320V283.52H128V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M281.6,320V300.75H384V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M128,320V311.89H230.4V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M384,320V16H486.4V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2,019.5\\\" data-math=\\\"N\\\" transform=\\\"translate(80,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">2,019.5</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2020\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(208,0)\\\">2020</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2,020.5\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(336,0)\\\">2,020.5</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2021\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(464,0)\\\">2021</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2,021.5\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(592,0)\\\">2,021.5</text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"200\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,379.47)\\\">200</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"400\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,338.93)\\\">400</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"600\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,298.4)\\\">600</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"800\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,257.87)\\\">800</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"1000\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,217.32999999999998)\\\">1000</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"1200\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,176.8)\\\">1200</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"1400\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,136.27)\\\">1400</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"696.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-e26efe\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legende26efe\\\"><rect width=\\\"82\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(602.24,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\" width=\\\"82\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legende26efe)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"mateo\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">mateo</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"76.0625\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"jhone\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">jhone</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"76.0625\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-e26efe\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"696.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div><p></p>\\n\\n<p>KKK test text group</p>\\n\"', '\"<p>jdslkdjl</p>\\n\\n<p>dkjsljlkdsjdlksjdlk</p>\\n\\n<p>assadsa</p>\\n\\n<p>d;sd;kdsd</p>\\n\\n<p>[chart id=3]</p>\\n\\n<p>[text id=222]</p>\\n\"', 0);
INSERT INTO `testreports` (`id`, `user_id`, `title`, `order`, `content`, `origin_content`, `published`) VALUES
(240, 1, 'this is new test report', 85, '\"<p><span style=\\\"color:#e74c3c\\\">7 marzo nuovo report</span><span style=\\\"color:#27ae60\\\">&nbsp;This is textgroup for test for logic 6-21</span></p>\\n\\n<p style=\\\"text-align:center\\\">&nbsp;</p>\\n\\n<p><br>\\n</p><div id=\\\"bar-chartdiv1\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 416.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-317e9d\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clip317e9dxyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"241\\\" height=\\\"320\\\" transform=\\\"scale(1,1)\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip317e9dx\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"241\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip317e9dy\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"416.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip317e9dxy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"241\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"241\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"321\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"321\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"104.1\\\" y=\\\"420.5\\\" width=\\\"192.8\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"24.1\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"296.9\\\" y=\\\"420.5\\\" width=\\\"24.1\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,406.56)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,356.44)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,306.31)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,256.19)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,206.06)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,105.81)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,155.94)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)scale(1,1)\\\" clip-path=\\\"url(#clip317e9dxyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M-289.79,55.94V55.94H1125.53V55.94Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M1125.53,55.94V55.94H2540.85V55.94Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−0.5\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,406.56)\\\">−0.5</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,155.94)\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−0.4\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,356.44)\\\">−0.4</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−0.3\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,306.31)\\\">−0.3</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−0.2\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,256.19)\\\">−0.2</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−0.1\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,206.06)\\\">−0.1</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0.1\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,105.81)\\\">0.1</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-317e9d\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legend317e9d\\\"><rect width=\\\"78\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(325.82,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\" width=\\\"78\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legend317e9d)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"row1\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">row1</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"72.71484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"Input\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">Input</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"72.71484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-317e9d\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div><p></p>\\n\\n<p></p><div id=\\\"bar-chartdiv2\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 416.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-3187ee\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clip3187eexyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"241\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip3187eex\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"241\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip3187eey\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"416.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip3187eexy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"241\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"241\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"321\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"321\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"104.1\\\" y=\\\"420.5\\\" width=\\\"192.8\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"24.1\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"296.9\\\" y=\\\"420.5\\\" width=\\\"24.1\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,340)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,180)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,260)\\\" d=\\\"M80,0h241\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clip3187eexyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M12.05,160V160H44.18V160Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M132.55,160V160H164.68V160Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M44.18,160V160H76.32V160Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M164.68,160V160H196.82V160Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M76.32,160V160H108.45V160Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M196.82,160V160H228.95V160Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"col1\\\" data-math=\\\"N\\\" transform=\\\"translate(140.25,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">col1</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"Input\\\" data-math=\\\"N\\\" transform=\\\"translate(260.75,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">Input</text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−1\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">−1</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"−0.5\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,340)\\\">−0.5</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,260)\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0.5\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,180)\\\">0.5</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"1\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,100)\\\">1</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-3187ee\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legend3187ee\\\"><rect width=\\\"78\\\" height=\\\"67\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(325.82,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" width=\\\"78\\\" height=\\\"67\\\" x=\\\"0\\\" y=\\\"0\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legend3187ee)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"row1\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">row1</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"72.71484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"Input\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">Input</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"72.71484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,52.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"Input\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">Input</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"72.71484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" x=\\\"0\\\" y=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-3187ee\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div><p></p>\\n\\n<p></p><div id=\\\"d3bar-chartdiv3\\\" class=\\\"col-12\\\"><div style=\\\"width: 100%; height: 100%; position: relative; top: 0.34375px;\\\"><svg version=\\\"1.1\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" role=\\\"group\\\" style=\\\"width: 100%; height: 100%; overflow: visible;\\\"><defs><clipPath id=\\\"id-61\\\"><path d=\\\" M0,0  L25.9808,-15  L270.0008,-15  L270.0008,404  L244.02,419  L244.02,419  L0,419  Z\\\"></path></clipPath><clipPath id=\\\"id-62\\\"><rect width=\\\"386\\\" height=\\\"500\\\"></rect></clipPath><linearGradient id=\\\"gradient-id-85\\\" x1=\\\"1%\\\" x2=\\\"99%\\\" y1=\\\"59%\\\" y2=\\\"41%\\\"><stop stop-color=\\\"#474758\\\" offset=\\\"0\\\"></stop><stop stop-color=\\\"#474758\\\" stop-opacity=\\\"1\\\" offset=\\\"0.75\\\"></stop><stop stop-color=\\\"#3cabff\\\" stop-opacity=\\\"1\\\" offset=\\\"0.755\\\"></stop></linearGradient><filter id=\\\"filter-id-94\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"></filter><filter id=\\\"filter-id-114\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"></filter><clipPath id=\\\"id-134\\\"><path d=\\\"M0,0 L244.02,0 L244.02,419 L0,419 L0,0\\\"></path></clipPath><clipPath id=\\\"id-215\\\"><rect width=\\\"244.02\\\" height=\\\"419\\\"></rect></clipPath><filter id=\\\"filter-id-67\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter><filter id=\\\"filter-id-139\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter><filter id=\\\"filter-id-217\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"130%\\\" height=\\\"130%\\\" x=\\\"-15%\\\" y=\\\"-15%\\\"></filter><filter id=\\\"filter-id-82\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"120%\\\" height=\\\"120%\\\" x=\\\"-10%\\\" y=\\\"-10%\\\"><feColorMatrix type=\\\"saturate\\\" values=\\\"0\\\"></feColorMatrix></filter></defs><g><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"386\\\" height=\\\"500\\\"></rect></g><g><g role=\\\"region\\\" clip-path=\\\"url(&quot;#id-62&quot;)\\\" opacity=\\\"1\\\" aria-label=\\\"Chart\\\"><g transform=\\\"translate(15,15)\\\"><g><g><g><g transform=\\\"translate(0,15)\\\"><g><g><g transform=\\\"translate(86,0)\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"244.02\\\" height=\\\"419\\\"></rect></g><g><g><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(-244,0)\\\" display=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(-122,0)\\\" display=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(122,0)\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(244,0)\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(366,0)\\\" display=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(0,209)\\\"><path d=\\\" M0,0  L25.9808,-15  L270.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\" transform=\\\"translate(0,628)\\\"><path d=\\\" M0,0  L25.9808,-15  L270.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g><g clip-path=\\\"url(&quot;#id-61&quot;)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f44336\\\" fill-opacity=\\\"1\\\" stroke=\\\"#e91e63\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" transform=\\\"translate(122.01,41.9)\\\" opacity=\\\"1\\\" id=\\\"id-217\\\" style=\\\"outline: none;\\\"><g><g stroke-opacity=\\\"0.2\\\" stroke=\\\"#ffffff\\\" fill=\\\"#f44336\\\"><g><g fill=\\\"#c3362b\\\"><path d=\\\" M25.9808,-15  L25.9808,-15  L25.9808,320.2  L25.9808,320.2  Z\\\"></path></g><g fill=\\\"#7a221b\\\"><path d=\\\" M0,335.2  L25.9808,320.2  L25.9808,320.2  L0,335.2  Z\\\"></path></g><g fill=\\\"#922820\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,320.2  L0,335.2  Z\\\"></path></g><g fill=\\\"#c3362b\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,320.2  L0,335.2  Z\\\"></path></g><g fill=\\\"#dc3c31\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,-15  L0,0  Z\\\"></path></g><g><path d=\\\" M0,0  L0,0  L0,335.2  L0,335.2  Z\\\"></path></g></g></g></g></g></g></g><g role=\\\"group\\\" stroke-opacity=\\\"0\\\" fill-opacity=\\\"1\\\" stroke=\\\"#e91e63\\\" aria-label=\\\"Visits\\\"><g><g clip-path=\\\"url(&quot;#id-134&quot;)\\\"><g><g><g></g></g></g></g><g></g></g></g></g></g><g clip-path=\\\"url(&quot;#id-215&quot;)\\\"><g><g fill=\\\"#e91e63\\\" stroke=\\\"#e91e63\\\"><g></g></g></g></g><g><g><g><g></g></g><g><g></g></g></g></g><g><g></g></g><g><g></g></g><g role=\\\"button\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" transform=\\\"translate(204.02,-3)\\\" aria-labelledby=\\\"id-37-title\\\"><g fill=\\\"#6794dc\\\" stroke=\\\"#ffffff\\\" fill-opacity=\\\"1\\\" stroke-opacity=\\\"0\\\" transform=\\\"translate(0,8)\\\"><path d=\\\"M17,0 L18,0 a17,17 0 0 1 17,17 L35,17 a17,17 0 0 1 -17,17 L17,34 a17,17 0 0 1 -17,-17 L0,17 a17,17 0 0 1 17,-17 Z\\\"></path></g><g transform=\\\"translate(9,9)\\\"><g stroke=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,8)\\\"><path d=\\\" M0,0  L11,0 \\\" transform=\\\"translate(2.5,7.5)\\\"></path></g><g fill=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(17,8)\\\"><g display=\\\"none\\\"></g></g></g><title id=\\\"id-37-title\\\">Zoom Out</title></g></g></g><g><g><g aria-hidden=\\\"true\\\"><g><g fill=\\\"#000000\\\" transform=\\\"translate(0,209.5) rotate(-90)\\\"><g display=\\\"none\\\"></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\" transform=\\\"translate(86,419)\\\" opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\"><path transform=\\\"translate(-0.5,-0.5)\\\" d=\\\" M0,0  L244.02,0  L270.0008,-15 \\\"></path></g><g transform=\\\"translate(0,0)\\\"><g><g fill=\\\"#000000\\\" aria-label=\\\"L\\\" fill-opacity=\\\"0\\\" opacity=\\\"0\\\" stroke-opacity=\\\"0\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(86,209.5)\\\"><g transform=\\\"translate(-76,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>row1(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(86,209.5)\\\"><g transform=\\\"translate(-76,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>row1(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" display=\\\"none\\\" transform=\\\"translate(86,628.5)\\\"><g transform=\\\"translate(-10,0)\\\" display=\\\"none\\\"></g></g></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0\\\" fill=\\\"none\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(86,0)\\\"><path d=\\\" M0,0  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g></g></g><g transform=\\\"translate(330.02,0)\\\"><g></g></g></g></g><g><g transform=\\\"translate(86,0)\\\"></g></g><g transform=\\\"translate(0,419)\\\"><g transform=\\\"translate(86,0)\\\"><g aria-hidden=\\\"true\\\"><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0\\\" fill=\\\"none\\\" style=\\\"pointer-events: none;\\\"><path d=\\\" M0,0  L244.02,0 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g><g><g fill=\\\"#000000\\\" aria-label=\\\"L\\\" fill-opacity=\\\"0\\\" opacity=\\\"0\\\" stroke-opacity=\\\"0\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(122.01,0)\\\"><g transform=\\\"translate(-4,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>L</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(-244.02,0)\\\" display=\\\"none\\\"><g transform=\\\"translate(-6.5,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-3</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(-122.01,0)\\\" display=\\\"none\\\"><g transform=\\\"translate(-6.5,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-2</tspan></text></g></g><g fill=\\\"#000000\\\"><g transform=\\\"translate(-6.5,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-1</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(122.01,0)\\\"><g transform=\\\"translate(-4,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>0</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(244.02,0)\\\"><g transform=\\\"translate(-4,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>1</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(366.03,0)\\\" display=\\\"none\\\"><g transform=\\\"translate(-4,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>2</tspan></text></g></g></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(122,-419)\\\"><path transform=\\\"translate(-0.5,-0.5)\\\" d=\\\" M25.9808,-15  L0,0  L0,419 \\\"></path></g><g fill=\\\"#000000\\\" transform=\\\"translate(122,36)\\\"><g display=\\\"none\\\"></g></g></g></g></g></g></g></g></g></g><g></g></g></g><g><g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-67&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g><g visibility=\\\"hidden\\\" display=\\\"none\\\" style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"1\\\"><rect width=\\\"386\\\" height=\\\"500\\\"></rect></g><g><g transform=\\\"translate(193,250)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f3f3f3\\\" fill-opacity=\\\"0.8\\\"><g><g><path d=\\\" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 \\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#000000\\\" fill-opacity=\\\"0.2\\\"><g><g><path d=\\\" M50,0  a50,50,0,0,1,-100,0 a50,50,0,0,1,100,0 M45,0  a45,45,0,0,0,-90,0 a45,45,0,0,0,90,0 L45,0 \\\"></path></g></g></g><g fill=\\\"#000000\\\" fill-opacity=\\\"0.4\\\"><g transform=\\\"translate(-18,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"18px\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"middle\\\"><tspan>100%</tspan></text></g></g></g></g></g></g><g opacity=\\\"0.4\\\" aria-labelledby=\\\"id-82-title\\\" style=\\\"cursor: pointer;\\\" transform=\\\"translate(0,479)\\\" filter=\\\"url(&quot;#filter-id-82&quot;)\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"0\\\"><rect width=\\\"66\\\" height=\\\"21\\\"></rect></g><g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"#3cabff\\\"><path d=\\\" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15\\\"></path></g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"url(&quot;#gradient-id-85&quot;)\\\"><path d=\\\" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15\\\"></path></g></g><title id=\\\"id-82-title\\\">Chart created using amCharts library</title></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#000000\\\" fill-opacity=\\\"1\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-25,30)\\\"><path d=\\\"M0,0 L20,0 a0,0 0 0 1 0,0 L20,0 L20,0 L25,0 L20,10 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-15,30)\\\"><g transform=\\\"translate(0,5)\\\" display=\\\"none\\\"></g></g></g></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#000000\\\" fill-opacity=\\\"1\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(101,449)\\\"><path d=\\\"M0,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(111,449)\\\"><g transform=\\\"translate(0,5)\\\" display=\\\"none\\\"></g></g></g></g><g role=\\\"tooltip\\\" opacity=\\\"0\\\" aria-describedby=\\\"id-217\\\" transform=\\\"translate(223.01,239.5)\\\" aria-hidden=\\\"true\\\" visibility=\\\"hidden\\\"><g fill=\\\"#f44336\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-139&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-38,-13.5)\\\"><path d=\\\"M3,0 L29,0 a3,3 0 0 1 3,3 L32,3 L32,8.5 L38,13.5 L32,18.5 L32,24 a3,3 0 0 1 -3,3 L3,27 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-22,-13.5)\\\"><g transform=\\\"translate(-4,7)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>0</tspan></text></g></g></g></g></g></g></g></g></svg></div></div><p></p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p style=\\\"text-align:center\\\">&nbsp;</p>\\n\"', '\"<p><span style=\\\"color:#e74c3c\\\">7 marzo nuovo report</span><span style=\\\"color:#27ae60\\\">&nbsp;[text id=224]</span></p>\\n\\n<p style=\\\"text-align:center\\\">&nbsp;</p>\\n\\n<p><br />\\n[chart id=6]</p>\\n\\n<p>[chart id=7]</p>\\n\\n<p>[chart id=9]</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p style=\\\"text-align:center\\\">&nbsp;</p>\\n\"', 1);
INSERT INTO `testreports` (`id`, `user_id`, `title`, `order`, `content`, `origin_content`, `published`) VALUES
(241, 1, 'ckeditor report', 136, '\"<table align=\\\"center\\\" class=\\\"table\\\" style=\\\"height:1000px; width:1000px\\\">\\n\\t<tbody>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">super good</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">big....</td>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">CKEDITO REPORT</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\"></td>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">Test CKEDITOR Report</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\"><div id=\\\"radar1-chartdiv1\\\" class=\\\"col-12\\\" style=\\\"justify-content: center;\\\"><div style=\\\"width: 100%; height: 100%; position: relative; left: 0.484375px; top: -0.1875px;\\\"><svg version=\\\"1.1\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" role=\\\"group\\\" style=\\\"width: 100%; height: 100%; overflow: visible;\\\"><defs><clipPath id=\\\"id-1385\\\"><rect width=\\\"633\\\" height=\\\"500\\\"></rect></clipPath><linearGradient id=\\\"gradient-id-1408\\\" x1=\\\"1%\\\" x2=\\\"99%\\\" y1=\\\"59%\\\" y2=\\\"41%\\\"><stop stop-color=\\\"#474758\\\" offset=\\\"0\\\"></stop><stop stop-color=\\\"#474758\\\" stop-opacity=\\\"1\\\" offset=\\\"0.75\\\"></stop><stop stop-color=\\\"#3cabff\\\" stop-opacity=\\\"1\\\" offset=\\\"0.755\\\"></stop></linearGradient><filter id=\\\"filter-id-1434\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"></filter><filter id=\\\"filter-id-1455\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"></filter><clipPath id=\\\"id-1475\\\"><path d=\\\" M0,-188  a188,188,0,0,1,0,376 a188,188,0,0,1,0,-376\\\"></path></clipPath><clipPath id=\\\"id-1491\\\"><path d=\\\" M0,-188  a188,188,0,0,1,0,376 a188,188,0,0,1,0,-376\\\" r=\\\"0\\\"></path></clipPath><filter id=\\\"filter-id-1390\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter><filter id=\\\"filter-id-1405\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"120%\\\" height=\\\"120%\\\" x=\\\"-10%\\\" y=\\\"-10%\\\"><feColorMatrix type=\\\"saturate\\\" values=\\\"0\\\"></feColorMatrix></filter><filter id=\\\"filter-id-1480\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter></defs><g><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"633\\\" height=\\\"500\\\"></rect></g><g><g role=\\\"region\\\" clip-path=\\\"url(&quot;#id-1385&quot;)\\\" opacity=\\\"1\\\" aria-label=\\\"Chart\\\"><g transform=\\\"translate(15,15)\\\"><g><g><g><g><g><g><g transform=\\\"translate(0,0)\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" transform=\\\"translate(0,0)\\\"><rect width=\\\"603\\\" height=\\\"470\\\"></rect></g><g><g transform=\\\"translate(301.5,235)\\\"><g><g opacity=\\\"0\\\"></g><g><g></g></g><g aria-hidden=\\\"true\\\"><g><g><g><g><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,0  L0,-188 \\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,0  L0,188 \\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,0  L0,-188 \\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"L\\\" fill-opacity=\\\"0\\\" opacity=\\\"0\\\" stroke-opacity=\\\"0\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,-211)\\\"><g transform=\\\"translate(-4,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>L</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-211)\\\"><g transform=\\\"translate(-61,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>241+234+239(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,211)\\\"><g transform=\\\"translate(-57.5,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>241-234-239(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-203)\\\"><g display=\\\"none\\\"></g></g><g><g></g></g></g></g><g fill=\\\"#000000\\\"><g display=\\\"none\\\"></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\"><path transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0\\\" fill=\\\"none\\\" style=\\\"pointer-events: none;\\\"><path d=\\\" M0,-188  a188,188,0,0,1,0,376 a188,188,0,0,1,0,-376\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g></g></g><g aria-hidden=\\\"true\\\"><g><g><g><g fill=\\\"#000000\\\" aria-label=\\\"L\\\" fill-opacity=\\\"0\\\" opacity=\\\"0\\\" stroke-opacity=\\\"0\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,-94)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>10</tspan></text></g></g><g><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\"><path d=\\\" M0,0  a0,0,0,0,1,0,0 a0,0,0,0,1,0,0\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\"><path d=\\\" M0,0  a0,0,0,0,1,0,0 a0,0,0,0,1,0,0\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,0  a0,0,0,0,1,0,0 a0,0,0,0,1,0,0\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,-31.3  a31.3,31.3,0,0,1,0,62.6 a31.3,31.3,0,0,1,0,-62.6\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,-62.7  a62.7,62.7,0,0,1,0,125.4 a62.7,62.7,0,0,1,0,-125.4\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,-94  a94,94,0,0,1,0,188 a94,94,0,0,1,0,-188\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,-125.3  a125.3,125.3,0,0,1,0,250.6 a125.3,125.3,0,0,1,0,-250.6\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,-156.7  a156.7,156.7,0,0,1,0,313.4 a156.7,156.7,0,0,1,0,-313.4\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M0,-188  a188,188,0,0,1,0,376 a188,188,0,0,1,0,-376\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\"><path d=\\\" M0,-219.3  a219.3,219.3,0,0,1,0,438.6 a219.3,219.3,0,0,1,0,-438.6\\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g></g></g><g fill=\\\"#000000\\\" display=\\\"none\\\"><g transform=\\\"translate(-6.5,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-5</tspan></text></g></g><g fill=\\\"#000000\\\" display=\\\"none\\\"><g transform=\\\"translate(-4,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>0</tspan></text></g></g><g fill=\\\"#000000\\\"><g transform=\\\"translate(-4,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>5</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-31.3)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>10</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-62.7)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>15</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-94)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>20</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-125.3)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>25</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-156.7)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>30</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-188)\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>35</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-219.3)\\\" display=\\\"none\\\"><g transform=\\\"translate(-8,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>40</tspan></text></g></g></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(0,-94) rotate(90)\\\"><g display=\\\"none\\\"></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0\\\" fill=\\\"none\\\" style=\\\"pointer-events: none;\\\"><path d=\\\" M0,0  L0,-188 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g><g role=\\\"group\\\" stroke-opacity=\\\"1\\\" fill-opacity=\\\"0\\\" stroke=\\\"#f3c300\\\" aria-label=\\\"Score\\\" stroke-width=\\\"3\\\"><g><g clip-path=\\\"url(&quot;#id-1475&quot;)\\\"><g><g><g><g fill=\\\"#f3c300\\\" fill-opacity=\\\"0\\\" stroke=\\\"#f3c300\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"3\\\" style=\\\"pointer-events: none;\\\"><g><g stroke-opacity=\\\"0\\\"><path></path></g><g fill=\\\"none\\\" fill-opacity=\\\"0\\\"><path d=\\\" M-0.2,-156.9  M0,-156.7  L0,-156.7  L0,-156.7  L0,31.3  L0,-156.7 \\\"></path></g></g></g></g></g></g></g><g></g></g></g></g></g><g clip-path=\\\"url(&quot;#id-1491&quot;)\\\"><g><g fill=\\\"#f3c300\\\" stroke=\\\"#f3c300\\\"><g></g></g></g></g></g></g><g><g></g></g><g role=\\\"button\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" transform=\\\"translate(563,-3)\\\" aria-labelledby=\\\"id-1374-title\\\"><g fill=\\\"#6794dc\\\" stroke=\\\"#ffffff\\\" fill-opacity=\\\"1\\\" stroke-opacity=\\\"0\\\" transform=\\\"translate(0,8)\\\"><path d=\\\"M17,0 L18,0 a17,17 0 0 1 17,17 L35,17 a17,17 0 0 1 -17,17 L17,34 a17,17 0 0 1 -17,-17 L0,17 a17,17 0 0 1 17,-17 Z\\\"></path></g><g transform=\\\"translate(9,9)\\\"><g stroke=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,8)\\\"><path d=\\\" M0,0  L11,0 \\\" transform=\\\"translate(2.5,7.5)\\\"></path></g><g fill=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(17,8)\\\"><g display=\\\"none\\\"></g></g></g><title id=\\\"id-1374-title\\\">Zoom Out</title></g></g></g><g><g></g></g><g transform=\\\"translate(603,0)\\\"><g></g></g></g></g><g><g></g></g><g transform=\\\"translate(0,470)\\\"><g></g></g></g></g></g></g></g></g><g><g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-1390&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g><g visibility=\\\"hidden\\\" display=\\\"none\\\" style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"1\\\"><rect width=\\\"633\\\" height=\\\"500\\\"></rect></g><g><g transform=\\\"translate(316.5,250)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f3f3f3\\\" fill-opacity=\\\"0.8\\\"><g><g><path d=\\\" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 \\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#000000\\\" fill-opacity=\\\"0.2\\\"><g><g><path d=\\\" M50,0  a50,50,0,0,1,-100,0 a50,50,0,0,1,100,0 M45,0  a45,45,0,0,0,-90,0 a45,45,0,0,0,90,0 L45,0 \\\"></path></g></g></g><g fill=\\\"#000000\\\" fill-opacity=\\\"0.4\\\"><g transform=\\\"translate(-18,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"18px\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"middle\\\"><tspan>100%</tspan></text></g></g></g></g></g></g><g opacity=\\\"0.3\\\" aria-labelledby=\\\"id-1405-title\\\" filter=\\\"url(&quot;#filter-id-1405&quot;)\\\" style=\\\"cursor: pointer; visibility: hidden;\\\" transform=\\\"translate(0,479)\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"0\\\"><rect width=\\\"66\\\" height=\\\"21\\\"></rect></g><g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"#3cabff\\\"><path d=\\\" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15\\\"></path></g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"url(&quot;#gradient-id-1408&quot;)\\\"><path d=\\\" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15\\\"></path></g></g><title id=\\\"id-1405-title\\\">Chart created using amCharts library</title></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\" transform=\\\"translate(168.9718736470746,133.46909450795778)\\\"><g fill=\\\"#000000\\\" fill-opacity=\\\"1\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-10,-15)\\\"><path d=\\\"M0,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L20,10 L15,10 L10,15 L5,10 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,-15)\\\"><g transform=\\\"translate(0,5)\\\" display=\\\"none\\\"></g></g></g></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#000000\\\" fill-opacity=\\\"1\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(5,-5)\\\"><path d=\\\"M0,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,10 L0,10 L-5,5 L0,0 L0,0 a0,0 0 0 1 0,-0\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(15,-5)\\\"><g transform=\\\"translate(0,5)\\\" display=\\\"none\\\"></g></g></g></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-1480&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(6,0)\\\"><path d=\\\"M3,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,8 L0,8 L-6,0 L0,-2 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(18,0)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g></g></g></g></g></svg></div></div></td>\\n\\t\\t</tr>\\n\\t</tbody>\\n</table>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>I don\'t know, but if we can use enought pay it, if think that is a good (better than chartsjs. I don\'t know plotly. In demo page of amcharts I see that there are many type of charts. if it is simple add we can add now or in the futures (if it is necessary many charts), for example.... So you can advice me</p>\\n\"', '\"<table align=\\\"center\\\" class=\\\"table\\\" style=\\\"height:1000px; width:1000px\\\">\\n\\t<tbody>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">[text id=234]</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">[text id=241]</td>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">CKEDITO REPORT</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">[text id=239]</td>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">Test CKEDITOR Report</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">[chart id=27]</td>\\n\\t\\t</tr>\\n\\t</tbody>\\n</table>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>I don&#39;t know, but if we can use enought pay it, if think that is a good (better than chartsjs. I don&#39;t know plotly. In demo page of amcharts I see that there are many type of charts. if it is simple add we can add now or in the futures (if it is necessary many charts), for example.... So you can advice me</p>\\n\"', 1),
(242, 1, 'This is report for Acquisti-Wholesale', 90, '\"\"', '\"<p>Report [text id=227]</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>[chart id=9]</p>\\n\"', 1);
INSERT INTO `testreports` (`id`, `user_id`, `title`, `order`, `content`, `origin_content`, `published`) VALUES
(243, 1, NULL, 101, '\"<p>this is a report of 29 june (text that it is identic to all users)</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>next text is text group:</p>\\n\\n<p><span style=\\\"font-size:24px\\\"><span style=\\\"color:#2ecc71\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\">good (answer aa and answer ff)</span></span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p>the softwar emust show 3 chart 1 (right position, central postion, left position)</p>\\n\\n<p><span style=\\\"font-size:10.5pt\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"></span></span></span></p><div id=\\\"bar-chartdiv1\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 416.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-c47dde\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clipc47ddexyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"225\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipc47ddex\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"225\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipc47ddey\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"416.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipc47ddexy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"225\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"225\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"305\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"305\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"102.5\\\" y=\\\"420.5\\\" width=\\\"180\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"22.5\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"282.5\\\" y=\\\"420.5\\\" width=\\\"22.5\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,344)\\\" d=\\\"M80,0h225\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,268)\\\" d=\\\"M80,0h225\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,192)\\\" d=\\\"M80,0h225\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,116)\\\" d=\\\"M80,0h225\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,420)\\\" d=\\\"M80,0h225\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clipc47ddexyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M11.25,320V168H56.25V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M123.75,320V16H168.75V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M56.25,320V228.8H101.25V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M168.75,320V92H213.75V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2021\\\" data-math=\\\"N\\\" transform=\\\"translate(136.25,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">2021</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2022\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(248.75,0)\\\">2022</text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"500\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,344)\\\">500</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"1000\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,268)\\\">1000</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"1500\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,192)\\\">1500</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"2000\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,116)\\\">2000</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-c47dde\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legendc47dde\\\"><rect width=\\\"94\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(309.5,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\" width=\\\"94\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legendc47dde)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"revenue\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">revenue</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"88.75\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"cost\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">cost</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"88.75\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-c47dde\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div>&nbsp; &nbsp;&nbsp;<span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"><div id=\\\"bar-chartdiv2\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 416.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-44fa92\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clip44fa92xyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"186\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip44fa92x\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"186\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip44fa92y\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"416.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clip44fa92xy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"186\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"186\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"266\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"266\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"98.6\\\" y=\\\"420.5\\\" width=\\\"148.8\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"18.6\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"247.4\\\" y=\\\"420.5\\\" width=\\\"18.6\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,376.57)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,333.14)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,289.71000000000004)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,246.29)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,202.86)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,159.43)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,116)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,420)\\\" d=\\\"M80,0h186\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clip44fa92xyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M9.3,320V189.71H46.5V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M102.3,320V16H139.5V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M46.5,320V318H83.7V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M139.5,320V318H176.7V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2021\\\" data-math=\\\"N\\\" transform=\\\"translate(126.5,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">2021</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"2022\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(219.5,0)\\\">2022</text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"10\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,376.57)\\\">10</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"20\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,333.14)\\\">20</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"30\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,289.71000000000004)\\\">30</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"40\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,246.29)\\\">40</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"50\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,202.86)\\\">50</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"60\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,159.43)\\\">60</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"70\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,116)\\\">70</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-44fa92\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legend44fa92\\\"><rect width=\\\"134\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(269.72,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\" width=\\\"134\\\" height=\\\"48\\\" x=\\\"0\\\" y=\\\"0\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legend44fa92)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"total employer\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">total employer</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"128.388671875\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"% manager\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">% manager</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"128.388671875\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-44fa92\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div>&nbsp;&nbsp;<div id=\\\"pie-chartdiv3\\\" class=\\\"col-12\\\"><div style=\\\"width: 100%; height: 100%; position: relative; left: -0.5px; top: 0.34375px;\\\"><svg version=\\\"1.1\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" role=\\\"group\\\" style=\\\"width: 100%; height: 100%; overflow: visible;\\\"><defs><clipPath id=\\\"id-46\\\"><rect width=\\\"386\\\" height=\\\"500\\\"></rect></clipPath><linearGradient id=\\\"gradient-id-69\\\" x1=\\\"1%\\\" x2=\\\"99%\\\" y1=\\\"59%\\\" y2=\\\"41%\\\"><stop stop-color=\\\"#474758\\\" offset=\\\"0\\\"></stop><stop stop-color=\\\"#474758\\\" stop-opacity=\\\"1\\\" offset=\\\"0.75\\\"></stop><stop stop-color=\\\"#3cabff\\\" stop-opacity=\\\"1\\\" offset=\\\"0.755\\\"></stop></linearGradient><clipPath id=\\\"id-90\\\"></clipPath><filter id=\\\"filter-id-51\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter><filter id=\\\"filter-id-66\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"120%\\\" height=\\\"120%\\\" x=\\\"-10%\\\" y=\\\"-10%\\\"><feColorMatrix type=\\\"saturate\\\" values=\\\"0\\\"></feColorMatrix></filter><filter id=\\\"filter-id-95\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter></defs><g><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"386\\\" height=\\\"500\\\"></rect></g><g><g role=\\\"region\\\" clip-path=\\\"url(&quot;#id-46&quot;)\\\" opacity=\\\"1\\\" aria-label=\\\"Chart\\\"><g><g><g><g><g><g transform=\\\"translate(193,230.5)\\\"><g><g role=\\\"group\\\" opacity=\\\"1\\\" aria-label=\\\"Series\\\"><g><g clip-path=\\\"url(&quot;#id-90&quot;)\\\"><g></g></g><g></g><g><g><g stroke-opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" id=\\\"id-157\\\" fill=\\\"#673ab7\\\" stroke=\\\"#673ab7\\\"><g><g opacity=\\\"1\\\" fill=\\\"#4d2c89\\\" stroke=\\\"#4d2c89\\\"><path d=\\\" M0,-137.2444  L0,-68.6222  L0,-72.3722  L0,-140.9944  Z\\\"></path></g><g opacity=\\\"1\\\" fill=\\\"#4d2c89\\\" stroke=\\\"#4d2c89\\\"><path d=\\\" M-30.1219,-138.3573  A154.4,137.24444444444444,0,0,1,-20.1532,-139.8203 L-20.1532,-136.0703  A154.4,137.24444444444444,0,0,0,-30.1219,-134.6073 L-30.1219,-138.3573 z M-20.1532,-139.8203  A154.4,137.24444444444444,0,0,1,-10.0982,-140.7006 L-10.0982,-136.9506  A154.4,137.24444444444444,0,0,0,-20.1532,-136.0703 L-20.1532,-139.8203 z M-10.0982,-140.7006  A154.4,137.24444444444444,0,0,1,0,-140.9944 L0,-137.2444  A154.4,137.24444444444444,0,0,0,-10.0982,-136.9506 L-10.0982,-140.7006 z M-15.061,-71.0537  A77.2,68.62222222222222,0,0,1,-10.0766,-71.7851 L-10.0766,-68.0351  A77.2,68.62222222222222,0,0,0,-15.061,-67.3037 L-15.061,-71.0537 z M-10.0766,-71.7851  A77.2,68.62222222222222,0,0,1,-5.0491,-72.2253 L-5.0491,-68.4753  A77.2,68.62222222222222,0,0,0,-10.0766,-68.0351 L-10.0766,-71.7851 z M-5.0491,-72.2253  A77.2,68.62222222222222,0,0,1,0,-72.3722 L0,-68.6222  A77.2,68.62222222222222,0,0,0,-5.0491,-68.4753 L-5.0491,-72.2253 z\\\"></path></g><g transform=\\\"translate(0,-3.75)\\\"><path d=\\\" M-15.061,-67.3037  L-30.1219,-134.6073  a154.4,137.24444444444444,0,0,1,30.1219,-2.6371 L0,-68.6222  a77.2,68.62222222222222,0,0,0,-15.061,1.3186 L-15.061,-67.3037 \\\"></path></g><g></g><g opacity=\\\"1\\\" fill=\\\"#4d2c89\\\" stroke=\\\"#4d2c89\\\"><path d=\\\" M-15.061,-67.3037  L-30.1219,-134.6073  L-30.1219,-138.3573  L-15.061,-71.0537  Z\\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" id=\\\"id-120\\\" fill=\\\"#f44336\\\" stroke=\\\"#f44336\\\"><g><g opacity=\\\"1\\\" fill=\\\"#b73229\\\" stroke=\\\"#b73229\\\"><path d=\\\" M-30.1219,-134.6073  L-15.061,-67.3037  L-15.061,-183.5537  L-30.1219,-250.8573  Z\\\"></path></g><g opacity=\\\"1\\\" fill=\\\"#b73229\\\" stroke=\\\"#b73229\\\"><path d=\\\" M0,-68.6222  L0,-137.2444  L0,-253.4944  L0,-184.8722  Z\\\"></path></g><g opacity=\\\"1\\\" fill=\\\"#b73229\\\" stroke=\\\"#b73229\\\"><path d=\\\" M0,-253.4944  A154.4,137.24444444444444,0,0,1,13.4089,-252.9759 L13.4089,-136.7259  A154.4,137.24444444444444,0,0,0,0,-137.2444 L0,-253.4944 z M13.4089,-252.9759  A154.4,137.24444444444444,0,0,1,26.7165,-251.4242 L26.7165,-135.1742  A154.4,137.24444444444444,0,0,0,13.4089,-136.7259 L13.4089,-252.9759 z M26.7165,-251.4242  A154.4,137.24444444444444,0,0,1,39.8222,-248.8511 L39.8222,-132.6011  A154.4,137.24444444444444,0,0,0,26.7165,-135.1742 L26.7165,-251.4242 z M39.8222,-248.8511  A154.4,137.24444444444444,0,0,1,52.627,-245.276 L52.627,-129.026  A154.4,137.24444444444444,0,0,0,39.8222,-132.6011 L39.8222,-248.8511 z M52.627,-245.276  A154.4,137.24444444444444,0,0,1,65.0341,-240.7259 L65.0341,-124.4759  A154.4,137.24444444444444,0,0,0,52.627,-129.026 L52.627,-245.276 z M65.0341,-240.7259  A154.4,137.24444444444444,0,0,1,76.9498,-235.2353 L76.9498,-118.9853  A154.4,137.24444444444444,0,0,0,65.0341,-124.4759 L65.0341,-240.7259 z M76.9498,-235.2353  A154.4,137.24444444444444,0,0,1,88.2841,-228.8455 L88.2841,-112.5955  A154.4,137.24444444444444,0,0,0,76.9498,-118.9853 L76.9498,-235.2353 z M88.2841,-228.8455  A154.4,137.24444444444444,0,0,1,98.9512,-221.605 L98.9512,-105.355  A154.4,137.24444444444444,0,0,0,88.2841,-112.5955 L88.2841,-228.8455 z M98.9512,-221.605  A154.4,137.24444444444444,0,0,1,108.8706,-213.5683 L108.8706,-97.3183  A154.4,137.24444444444444,0,0,0,98.9512,-105.355 L98.9512,-221.605 z M108.8706,-213.5683  A154.4,137.24444444444444,0,0,1,117.9674,-204.7963 L117.9674,-88.5463  A154.4,137.24444444444444,0,0,0,108.8706,-97.3183 L108.8706,-213.5683 z M117.9674,-204.7963  A154.4,137.24444444444444,0,0,1,126.1727,-195.3551 L126.1727,-79.1051  A154.4,137.24444444444444,0,0,0,117.9674,-88.5463 L117.9674,-204.7963 z M126.1727,-195.3551  A154.4,137.24444444444444,0,0,1,133.4247,-185.3163 L133.4247,-69.0663  A154.4,137.24444444444444,0,0,0,126.1727,-79.1051 L126.1727,-195.3551 z M133.4247,-185.3163  A154.4,137.24444444444444,0,0,1,139.6684,-174.7555 L139.6684,-58.5055  A154.4,137.24444444444444,0,0,0,133.4247,-69.0663 L133.4247,-185.3163 z M139.6684,-174.7555  A154.4,137.24444444444444,0,0,1,144.8567,-163.7526 L144.8567,-47.5026  A154.4,137.24444444444444,0,0,0,139.6684,-58.5055 L139.6684,-174.7555 z M144.8567,-163.7526  A154.4,137.24444444444444,0,0,1,148.9505,-152.3908 L148.9505,-36.1408  A154.4,137.24444444444444,0,0,0,144.8567,-47.5026 L144.8567,-163.7526 z M148.9505,-152.3908  A154.4,137.24444444444444,0,0,1,151.9187,-140.7559 L151.9187,-24.5059  A154.4,137.24444444444444,0,0,0,148.9505,-36.1408 L148.9505,-152.3908 z M151.9187,-140.7559  A154.4,137.24444444444444,0,0,1,153.739,-128.9359 L153.739,-12.6859  A154.4,137.24444444444444,0,0,0,151.9187,-24.5059 L151.9187,-140.7559 z M153.739,-128.9359  A154.4,137.24444444444444,0,0,1,154.3976,-117.0199 L154.3976,-0.7699  A154.4,137.24444444444444,0,0,0,153.739,-12.6859 L153.739,-128.9359 z M154.3976,-117.0199  L154.3976,-0.7699  A154.4,137.24444444444444,0,0,1,153.8895,11.1518 L153.8895,-105.0982  A154.4,137.24444444444444,0,0,0,154.3976,-117.0199z M153.8895,-105.0982  L153.8895,11.1518  A154.4,137.24444444444444,0,0,1,152.2185,22.9893 L152.2185,-93.2607  A154.4,137.24444444444444,0,0,0,153.8895,-105.0982z M152.2185,-93.2607  L152.2185,22.9893  A154.4,137.24444444444444,0,0,1,149.3973,34.6531 L149.3973,-81.5969  A154.4,137.24444444444444,0,0,0,152.2185,-93.2607z M149.3973,-81.5969  L149.3973,34.6531  A154.4,137.24444444444444,0,0,1,145.4472,46.055 L145.4472,-70.195  A154.4,137.24444444444444,0,0,0,149.3973,-81.5969z M145.4472,-70.195  L145.4472,46.055  A154.4,137.24444444444444,0,0,1,140.3981,57.1089 L140.3981,-59.1411  A154.4,137.24444444444444,0,0,0,145.4472,-70.195z M140.3981,-59.1411  L140.3981,57.1089  A154.4,137.24444444444444,0,0,1,134.288,67.7313 L134.288,-48.5187  A154.4,137.24444444444444,0,0,0,140.3981,-59.1411z M134.288,-48.5187  L134.288,67.7313  A154.4,137.24444444444444,0,0,1,127.1633,77.8418 L127.1633,-38.4082  A154.4,137.24444444444444,0,0,0,134.288,-48.5187z M127.1633,-38.4082  L127.1633,77.8418  A154.4,137.24444444444444,0,0,1,119.0776,87.3642 L119.0776,-28.8858  A154.4,137.24444444444444,0,0,0,127.1633,-38.4082z M119.0776,-28.8858  L119.0776,87.3642  A154.4,137.24444444444444,0,0,1,110.0921,96.2264 L110.0921,-20.0236  A154.4,137.24444444444444,0,0,0,119.0776,-28.8858z M110.0921,-20.0236  L110.0921,96.2264  A154.4,137.24444444444444,0,0,1,100.2748,104.3615 L100.2748,-11.8885  A154.4,137.24444444444444,0,0,0,110.0921,-20.0236z M100.2748,-11.8885  L100.2748,104.3615  A154.4,137.24444444444444,0,0,1,89.6997,111.708 L89.6997,-4.542  A154.4,137.24444444444444,0,0,0,100.2748,-11.8885z M89.6997,-4.542  L89.6997,111.708  A154.4,137.24444444444444,0,0,1,78.4468,118.2104 L78.4468,1.9604  A154.4,137.24444444444444,0,0,0,89.6997,-4.542z M78.4468,1.9604  L78.4468,118.2104  A154.4,137.24444444444444,0,0,1,66.6012,123.8195 L66.6012,7.5695  A154.4,137.24444444444444,0,0,0,78.4468,1.9604z M66.6012,7.5695  L66.6012,123.8195  A154.4,137.24444444444444,0,0,1,54.2523,128.493 L54.2523,12.243  A154.4,137.24444444444444,0,0,0,66.6012,7.5695z M54.2523,12.243  L54.2523,128.493  A154.4,137.24444444444444,0,0,1,41.4934,132.1956 L41.4934,15.9456  A154.4,137.24444444444444,0,0,0,54.2523,12.243z M41.4934,15.9456  L41.4934,132.1956  A154.4,137.24444444444444,0,0,1,28.421,134.8993 L28.421,18.6493  A154.4,137.24444444444444,0,0,0,41.4934,15.9456z M28.421,18.6493  L28.421,134.8993  A154.4,137.24444444444444,0,0,1,15.1338,136.5836 L15.1338,20.3336  A154.4,137.24444444444444,0,0,0,28.421,18.6493z M15.1338,20.3336  L15.1338,136.5836  A154.4,137.24444444444444,0,0,1,1.7323,137.2358 L1.7323,20.9858  A154.4,137.24444444444444,0,0,0,15.1338,20.3336z M1.7323,20.9858  L1.7323,137.2358  A154.4,137.24444444444444,0,0,1,-11.6823,136.851 L-11.6823,20.601  A154.4,137.24444444444444,0,0,0,1.7323,20.9858z M-11.6823,20.601  L-11.6823,136.851  A154.4,137.24444444444444,0,0,1,-25.0086,135.4322 L-25.0086,19.1822  A154.4,137.24444444444444,0,0,0,-11.6823,20.601z M-25.0086,19.1822  L-25.0086,135.4322  A154.4,137.24444444444444,0,0,1,-38.146,132.9899 L-38.146,16.7399  A154.4,137.24444444444444,0,0,0,-25.0086,19.1822z M-38.146,16.7399  L-38.146,132.9899  A154.4,137.24444444444444,0,0,1,-50.9951,129.5427 L-50.9951,13.2927  A154.4,137.24444444444444,0,0,0,-38.146,16.7399z M-50.9951,13.2927  L-50.9951,129.5427  A154.4,137.24444444444444,0,0,1,-63.4589,125.1167 L-63.4589,8.8667  A154.4,137.24444444444444,0,0,0,-50.9951,13.2927z M-63.4589,8.8667  L-63.4589,125.1167  A154.4,137.24444444444444,0,0,1,-75.4431,119.7452 L-75.4431,3.4952  A154.4,137.24444444444444,0,0,0,-63.4589,8.8667z M-75.4431,3.4952  L-75.4431,119.7452  A154.4,137.24444444444444,0,0,1,-86.8573,113.4689 L-86.8573,-2.7811  A154.4,137.24444444444444,0,0,0,-75.4431,3.4952z M-86.8573,-2.7811  L-86.8573,113.4689  A154.4,137.24444444444444,0,0,1,-97.6152,106.3352 L-97.6152,-9.9148  A154.4,137.24444444444444,0,0,0,-86.8573,-2.7811z M-97.6152,-9.9148  L-97.6152,106.3352  A154.4,137.24444444444444,0,0,1,-107.6354,98.398 L-107.6354,-17.852  A154.4,137.24444444444444,0,0,0,-97.6152,-9.9148z M-107.6354,-17.852  L-107.6354,98.398  A154.4,137.24444444444444,0,0,1,-116.8423,89.7172 L-116.8423,-26.5328  A154.4,137.24444444444444,0,0,0,-107.6354,-17.852z M-116.8423,-26.5328  L-116.8423,89.7172  A154.4,137.24444444444444,0,0,1,-125.1663,80.3585 L-125.1663,-35.8915  A154.4,137.24444444444444,0,0,0,-116.8423,-26.5328z M-125.1663,-35.8915  L-125.1663,80.3585  A154.4,137.24444444444444,0,0,1,-132.5445,70.3926 L-132.5445,-45.8574  A154.4,137.24444444444444,0,0,0,-125.1663,-35.8915z M-132.5445,-45.8574  L-132.5445,70.3926  A154.4,137.24444444444444,0,0,1,-138.9211,59.8947 L-138.9211,-56.3553  A154.4,137.24444444444444,0,0,0,-132.5445,-45.8574z M-138.9211,-56.3553  L-138.9211,59.8947  A154.4,137.24444444444444,0,0,1,-144.248,48.9443 L-144.248,-67.3057  A154.4,137.24444444444444,0,0,0,-138.9211,-56.3553z M-144.248,-67.3057  L-144.248,48.9443  A154.4,137.24444444444444,0,0,1,-148.4849,37.6241 L-148.4849,-78.6259  A154.4,137.24444444444444,0,0,0,-144.248,-67.3057z M-148.4849,-78.6259  L-148.4849,37.6241  A154.4,137.24444444444444,0,0,1,-151.5998,26.0195 L-151.5998,-90.2305  A154.4,137.24444444444444,0,0,0,-148.4849,-78.6259z M-151.5998,-90.2305  L-151.5998,26.0195  A154.4,137.24444444444444,0,0,1,-153.5692,14.2183 L-153.5692,-102.0317  A154.4,137.24444444444444,0,0,0,-151.5998,-90.2305z M-153.5692,-102.0317  L-153.5692,14.2183  A154.4,137.24444444444444,0,0,1,-154.3781,2.3097 L-154.3781,-113.9403  A154.4,137.24444444444444,0,0,0,-153.5692,-102.0317z M-154.3781,-113.9403  A154.4,137.24444444444444,0,0,1,-154.0205,-125.8664 L-154.0205,-9.6164  A154.4,137.24444444444444,0,0,0,-154.3781,2.3097 L-154.3781,-113.9403 z M-154.0205,-125.8664  A154.4,137.24444444444444,0,0,1,-152.4991,-137.7198 L-152.4991,-21.4698  A154.4,137.24444444444444,0,0,0,-154.0205,-9.6164 L-154.0205,-125.8664 z M-152.4991,-137.7198  A154.4,137.24444444444444,0,0,1,-149.8253,-149.4109 L-149.8253,-33.1609  A154.4,137.24444444444444,0,0,0,-152.4991,-21.4698 L-152.4991,-137.7198 z M-149.8253,-149.4109  A154.4,137.24444444444444,0,0,1,-146.0194,-160.8515 L-146.0194,-44.6015  A154.4,137.24444444444444,0,0,0,-149.8253,-33.1609 L-149.8253,-149.4109 z M-146.0194,-160.8515  A154.4,137.24444444444444,0,0,1,-141.1101,-171.9551 L-141.1101,-55.7051  A154.4,137.24444444444444,0,0,0,-146.0194,-44.6015 L-146.0194,-160.8515 z M-141.1101,-171.9551  A154.4,137.24444444444444,0,0,1,-135.1345,-182.6377 L-135.1345,-66.3877  A154.4,137.24444444444444,0,0,0,-141.1101,-55.7051 L-141.1101,-171.9551 z M-135.1345,-182.6377  A154.4,137.24444444444444,0,0,1,-128.1378,-192.8187 L-128.1378,-76.5687  A154.4,137.24444444444444,0,0,0,-135.1345,-66.3877 L-135.1345,-182.6377 z M-128.1378,-192.8187  A154.4,137.24444444444444,0,0,1,-120.1728,-202.4211 L-120.1728,-86.1711  A154.4,137.24444444444444,0,0,0,-128.1378,-76.5687 L-128.1378,-192.8187 z M-120.1728,-202.4211  A154.4,137.24444444444444,0,0,1,-111.2998,-211.3724 L-111.2998,-95.1224  A154.4,137.24444444444444,0,0,0,-120.1728,-86.1711 L-120.1728,-202.4211 z M-111.2998,-211.3724  A154.4,137.24444444444444,0,0,1,-101.5857,-219.6049 L-101.5857,-103.3549  A154.4,137.24444444444444,0,0,0,-111.2998,-95.1224 L-111.2998,-211.3724 z M-101.5857,-219.6049  A154.4,137.24444444444444,0,0,1,-91.1041,-227.0564 L-91.1041,-110.8064  A154.4,137.24444444444444,0,0,0,-101.5857,-103.3549 L-101.5857,-219.6049 z M-91.1041,-227.0564  A154.4,137.24444444444444,0,0,1,-79.934,-233.6706 L-79.934,-117.4206  A154.4,137.24444444444444,0,0,0,-91.1041,-110.8064 L-91.1041,-227.0564 z M-79.934,-233.6706  A154.4,137.24444444444444,0,0,1,-68.1599,-239.3975 L-68.1599,-123.1475  A154.4,137.24444444444444,0,0,0,-79.934,-117.4206 L-79.934,-233.6706 z M-68.1599,-239.3975  A154.4,137.24444444444444,0,0,1,-55.8707,-244.1939 L-55.8707,-127.9439  A154.4,137.24444444444444,0,0,0,-68.1599,-123.1475 L-68.1599,-239.3975 z M-55.8707,-244.1939  A154.4,137.24444444444444,0,0,1,-43.1594,-248.0235 L-43.1594,-131.7735  A154.4,137.24444444444444,0,0,0,-55.8707,-127.9439 L-55.8707,-244.1939 z M-43.1594,-248.0235  A154.4,137.24444444444444,0,0,1,-30.1219,-250.8573 L-30.1219,-134.6073  A154.4,137.24444444444444,0,0,0,-43.1594,-131.7735 L-43.1594,-248.0235 z M0,-184.8722  A77.2,68.62222222222222,0,0,1,6.7045,-184.613 L6.7045,-68.363  A77.2,68.62222222222222,0,0,0,0,-68.6222 L0,-184.8722 z M6.7045,-184.613  A77.2,68.62222222222222,0,0,1,13.3582,-183.8371 L13.3582,-67.5871  A77.2,68.62222222222222,0,0,0,6.7045,-68.363 L6.7045,-184.613 z M13.3582,-183.8371  A77.2,68.62222222222222,0,0,1,19.9111,-182.5506 L19.9111,-66.3006  A77.2,68.62222222222222,0,0,0,13.3582,-67.5871 L13.3582,-183.8371 z M19.9111,-182.5506  A77.2,68.62222222222222,0,0,1,26.3135,-180.763 L26.3135,-64.513  A77.2,68.62222222222222,0,0,0,19.9111,-66.3006 L19.9111,-182.5506 z M26.3135,-180.763  A77.2,68.62222222222222,0,0,1,32.5171,-178.488 L32.5171,-62.238  A77.2,68.62222222222222,0,0,0,26.3135,-64.513 L26.3135,-180.763 z M32.5171,-178.488  A77.2,68.62222222222222,0,0,1,38.4749,-175.7426 L38.4749,-59.4926  A77.2,68.62222222222222,0,0,0,32.5171,-62.238 L32.5171,-178.488 z M38.4749,-175.7426  A77.2,68.62222222222222,0,0,1,44.142,-172.5478 L44.142,-56.2978  A77.2,68.62222222222222,0,0,0,38.4749,-59.4926 L38.4749,-175.7426 z M44.142,-172.5478  A77.2,68.62222222222222,0,0,1,49.4756,-168.9275 L49.4756,-52.6775  A77.2,68.62222222222222,0,0,0,44.142,-56.2978 L44.142,-172.5478 z M49.4756,-168.9275  A77.2,68.62222222222222,0,0,1,54.4353,-164.9092 L54.4353,-48.6592  A77.2,68.62222222222222,0,0,0,49.4756,-52.6775 L49.4756,-168.9275 z M54.4353,-164.9092  A77.2,68.62222222222222,0,0,1,58.9837,-160.5231 L58.9837,-44.2731  A77.2,68.62222222222222,0,0,0,54.4353,-48.6592 L54.4353,-164.9092 z M58.9837,-160.5231  A77.2,68.62222222222222,0,0,1,63.0864,-155.8026 L63.0864,-39.5526  A77.2,68.62222222222222,0,0,0,58.9837,-44.2731 L58.9837,-160.5231 z M63.0864,-155.8026  A77.2,68.62222222222222,0,0,1,66.7123,-150.7831 L66.7123,-34.5331  A77.2,68.62222222222222,0,0,0,63.0864,-39.5526 L63.0864,-155.8026 z M66.7123,-150.7831  A77.2,68.62222222222222,0,0,1,69.8342,-145.5027 L69.8342,-29.2527  A77.2,68.62222222222222,0,0,0,66.7123,-34.5331 L66.7123,-150.7831 z M69.8342,-145.5027  A77.2,68.62222222222222,0,0,1,72.4284,-140.0013 L72.4284,-23.7513  A77.2,68.62222222222222,0,0,0,69.8342,-29.2527 L69.8342,-145.5027 z M72.4284,-140.0013  A77.2,68.62222222222222,0,0,1,74.4752,-134.3204 L74.4752,-18.0704  A77.2,68.62222222222222,0,0,0,72.4284,-23.7513 L72.4284,-140.0013 z M74.4752,-134.3204  A77.2,68.62222222222222,0,0,1,75.9594,-128.503 L75.9594,-12.253  A77.2,68.62222222222222,0,0,0,74.4752,-18.0704 L74.4752,-134.3204 z M75.9594,-128.503  A77.2,68.62222222222222,0,0,1,76.8695,-122.5929 L76.8695,-6.3429  A77.2,68.62222222222222,0,0,0,75.9594,-12.253 L75.9594,-128.503 z M76.8695,-122.5929  A77.2,68.62222222222222,0,0,1,77.1988,-116.635 L77.1988,-0.385  A77.2,68.62222222222222,0,0,0,76.8695,-6.3429 L76.8695,-122.5929 z M77.1988,-116.635  L77.1988,-0.385  A77.2,68.62222222222222,0,0,1,76.9447,5.5759 L76.9447,-110.6741  A77.2,68.62222222222222,0,0,0,77.1988,-116.635z M76.9447,-110.6741  L76.9447,5.5759  A77.2,68.62222222222222,0,0,1,76.1092,11.4946 L76.1092,-104.7554  A77.2,68.62222222222222,0,0,0,76.9447,-110.6741z M76.1092,-104.7554  L76.1092,11.4946  A77.2,68.62222222222222,0,0,1,74.6986,17.3265 L74.6986,-98.9235  A77.2,68.62222222222222,0,0,0,76.1092,-104.7554z M74.6986,-98.9235  L74.6986,17.3265  A77.2,68.62222222222222,0,0,1,72.7236,23.0275 L72.7236,-93.2225  A77.2,68.62222222222222,0,0,0,74.6986,-98.9235z M72.7236,-93.2225  L72.7236,23.0275  A77.2,68.62222222222222,0,0,1,70.199,28.5544 L70.199,-87.6956  A77.2,68.62222222222222,0,0,0,72.7236,-93.2225z M70.199,-87.6956  L70.199,28.5544  A77.2,68.62222222222222,0,0,1,67.144,33.8656 L67.144,-82.3844  A77.2,68.62222222222222,0,0,0,70.199,-87.6956z M67.144,-82.3844  L67.144,33.8656  A77.2,68.62222222222222,0,0,1,63.5816,38.9209 L63.5816,-77.3291  A77.2,68.62222222222222,0,0,0,67.144,-82.3844z M63.5816,-77.3291  L63.5816,38.9209  A77.2,68.62222222222222,0,0,1,59.5388,43.6821 L59.5388,-72.5679  A77.2,68.62222222222222,0,0,0,63.5816,-77.3291z M59.5388,-72.5679  L59.5388,43.6821  A77.2,68.62222222222222,0,0,1,55.0461,48.1132 L55.0461,-68.1368  A77.2,68.62222222222222,0,0,0,59.5388,-72.5679z M55.0461,-68.1368  L55.0461,48.1132  A77.2,68.62222222222222,0,0,1,50.1374,52.1807 L50.1374,-64.0693  A77.2,68.62222222222222,0,0,0,55.0461,-68.1368z M50.1374,-64.0693  L50.1374,52.1807  A77.2,68.62222222222222,0,0,1,44.8499,55.854 L44.8499,-60.396  A77.2,68.62222222222222,0,0,0,50.1374,-64.0693z M44.8499,-60.396  L44.8499,55.854  A77.2,68.62222222222222,0,0,1,39.2234,59.1052 L39.2234,-57.1448  A77.2,68.62222222222222,0,0,0,44.8499,-60.396z M39.2234,-57.1448  L39.2234,59.1052  A77.2,68.62222222222222,0,0,1,33.3006,61.9098 L33.3006,-54.3402  A77.2,68.62222222222222,0,0,0,39.2234,-57.1448z M33.3006,-54.3402  L33.3006,61.9098  A77.2,68.62222222222222,0,0,1,27.1261,64.2465 L27.1261,-52.0035  A77.2,68.62222222222222,0,0,0,33.3006,-54.3402z M27.1261,-52.0035  L27.1261,64.2465  A77.2,68.62222222222222,0,0,1,20.7467,66.0978 L20.7467,-50.1522  A77.2,68.62222222222222,0,0,0,27.1261,-52.0035z M20.7467,-50.1522  L20.7467,66.0978  A77.2,68.62222222222222,0,0,1,14.2105,67.4496 L14.2105,-48.8004  A77.2,68.62222222222222,0,0,0,20.7467,-50.1522z M14.2105,-48.8004  L14.2105,67.4496  A77.2,68.62222222222222,0,0,1,7.5669,68.2918 L7.5669,-47.9582  A77.2,68.62222222222222,0,0,0,14.2105,-48.8004z M7.5669,-47.9582  L7.5669,68.2918  A77.2,68.62222222222222,0,0,1,0.8662,68.6179 L0.8662,-47.6321  A77.2,68.62222222222222,0,0,0,7.5669,-47.9582z M0.8662,-47.6321  L0.8662,68.6179  A77.2,68.62222222222222,0,0,1,-5.8411,68.4255 L-5.8411,-47.8245  A77.2,68.62222222222222,0,0,0,0.8662,-47.6321z M-5.8411,-47.8245  L-5.8411,68.4255  A77.2,68.62222222222222,0,0,1,-12.5043,67.7161 L-12.5043,-48.5339  A77.2,68.62222222222222,0,0,0,-5.8411,-47.8245z M-12.5043,-48.5339  L-12.5043,67.7161  A77.2,68.62222222222222,0,0,1,-19.073,66.495 L-19.073,-49.755  A77.2,68.62222222222222,0,0,0,-12.5043,-48.5339z M-19.073,-49.755  L-19.073,66.495  A77.2,68.62222222222222,0,0,1,-25.4975,64.7714 L-25.4975,-51.4786  A77.2,68.62222222222222,0,0,0,-19.073,-49.755z M-25.4975,-51.4786  L-25.4975,64.7714  A77.2,68.62222222222222,0,0,1,-31.7294,62.5584 L-31.7294,-53.6916  A77.2,68.62222222222222,0,0,0,-25.4975,-51.4786z M-31.7294,-53.6916  L-31.7294,62.5584  A77.2,68.62222222222222,0,0,1,-37.7216,59.8726 L-37.7216,-56.3774  A77.2,68.62222222222222,0,0,0,-31.7294,-53.6916z M-37.7216,-56.3774  L-37.7216,59.8726  A77.2,68.62222222222222,0,0,1,-43.4287,56.7345 L-43.4287,-59.5155  A77.2,68.62222222222222,0,0,0,-37.7216,-56.3774z M-43.4287,-59.5155  L-43.4287,56.7345  A77.2,68.62222222222222,0,0,1,-48.8076,53.1676 L-48.8076,-63.0824  A77.2,68.62222222222222,0,0,0,-43.4287,-59.5155z M-48.8076,-63.0824  L-48.8076,53.1676  A77.2,68.62222222222222,0,0,1,-53.8177,49.199 L-53.8177,-67.051  A77.2,68.62222222222222,0,0,0,-48.8076,-63.0824z M-53.8177,-67.051  L-53.8177,49.199  A77.2,68.62222222222222,0,0,1,-58.4211,44.8586 L-58.4211,-71.3914  A77.2,68.62222222222222,0,0,0,-53.8177,-67.051z M-58.4211,-71.3914  L-58.4211,44.8586  A77.2,68.62222222222222,0,0,1,-62.5831,40.1792 L-62.5831,-76.0708  A77.2,68.62222222222222,0,0,0,-58.4211,-71.3914z M-62.5831,-76.0708  L-62.5831,40.1792  A77.2,68.62222222222222,0,0,1,-66.2722,35.1963 L-66.2722,-81.0537  A77.2,68.62222222222222,0,0,0,-62.5831,-76.0708z M-66.2722,-81.0537  L-66.2722,35.1963  A77.2,68.62222222222222,0,0,1,-69.4606,29.9474 L-69.4606,-86.3026  A77.2,68.62222222222222,0,0,0,-66.2722,-81.0537z M-69.4606,-86.3026  L-69.4606,29.9474  A77.2,68.62222222222222,0,0,1,-72.124,24.4722 L-72.124,-91.7778  A77.2,68.62222222222222,0,0,0,-69.4606,-86.3026z M-72.124,-91.7778  L-72.124,24.4722  A77.2,68.62222222222222,0,0,1,-74.2425,18.812 L-74.2425,-97.438  A77.2,68.62222222222222,0,0,0,-72.124,-91.7778z M-74.2425,-97.438  L-74.2425,18.812  A77.2,68.62222222222222,0,0,1,-75.7999,13.0098 L-75.7999,-103.2402  A77.2,68.62222222222222,0,0,0,-74.2425,-97.438z M-75.7999,-103.2402  L-75.7999,13.0098  A77.2,68.62222222222222,0,0,1,-76.7846,7.1092 L-76.7846,-109.1408  A77.2,68.62222222222222,0,0,0,-75.7999,-103.2402z M-76.7846,-109.1408  L-76.7846,7.1092  A77.2,68.62222222222222,0,0,1,-77.1891,1.1549 L-77.1891,-115.0951  A77.2,68.62222222222222,0,0,0,-76.7846,-109.1408z M-77.1891,-115.0951  A77.2,68.62222222222222,0,0,1,-77.0103,-121.0582 L-77.0103,-4.8082  A77.2,68.62222222222222,0,0,0,-77.1891,1.1549 L-77.1891,-115.0951 z M-77.0103,-121.0582  A77.2,68.62222222222222,0,0,1,-76.2495,-126.9849 L-76.2495,-10.7349  A77.2,68.62222222222222,0,0,0,-77.0103,-4.8082 L-77.0103,-121.0582 z M-76.2495,-126.9849  A77.2,68.62222222222222,0,0,1,-74.9126,-132.8305 L-74.9126,-16.5805  A77.2,68.62222222222222,0,0,0,-76.2495,-10.7349 L-76.2495,-126.9849 z M-74.9126,-132.8305  A77.2,68.62222222222222,0,0,1,-73.0097,-138.5508 L-73.0097,-22.3008  A77.2,68.62222222222222,0,0,0,-74.9126,-16.5805 L-74.9126,-132.8305 z M-73.0097,-138.5508  A77.2,68.62222222222222,0,0,1,-70.555,-144.1025 L-70.555,-27.8525  A77.2,68.62222222222222,0,0,0,-73.0097,-22.3008 L-73.0097,-138.5508 z M-70.555,-144.1025  A77.2,68.62222222222222,0,0,1,-67.5672,-149.4439 L-67.5672,-33.1939  A77.2,68.62222222222222,0,0,0,-70.555,-27.8525 L-70.555,-144.1025 z M-67.5672,-149.4439  A77.2,68.62222222222222,0,0,1,-64.0689,-154.5344 L-64.0689,-38.2844  A77.2,68.62222222222222,0,0,0,-67.5672,-33.1939 L-67.5672,-149.4439 z M-64.0689,-154.5344  A77.2,68.62222222222222,0,0,1,-60.0864,-159.3356 L-60.0864,-43.0856  A77.2,68.62222222222222,0,0,0,-64.0689,-38.2844 L-64.0689,-154.5344 z M-60.0864,-159.3356  A77.2,68.62222222222222,0,0,1,-55.6499,-163.8112 L-55.6499,-47.5612  A77.2,68.62222222222222,0,0,0,-60.0864,-43.0856 L-60.0864,-159.3356 z M-55.6499,-163.8112  A77.2,68.62222222222222,0,0,1,-50.7929,-167.9274 L-50.7929,-51.6774  A77.2,68.62222222222222,0,0,0,-55.6499,-47.5612 L-55.6499,-163.8112 z M-50.7929,-167.9274  A77.2,68.62222222222222,0,0,1,-45.552,-171.6532 L-45.552,-55.4032  A77.2,68.62222222222222,0,0,0,-50.7929,-51.6774 L-50.7929,-167.9274 z M-45.552,-171.6532  A77.2,68.62222222222222,0,0,1,-39.967,-174.9603 L-39.967,-58.7103  A77.2,68.62222222222222,0,0,0,-45.552,-55.4032 L-45.552,-171.6532 z M-39.967,-174.9603  A77.2,68.62222222222222,0,0,1,-34.0799,-177.8238 L-34.0799,-61.5738  A77.2,68.62222222222222,0,0,0,-39.967,-58.7103 L-39.967,-174.9603 z M-34.0799,-177.8238  A77.2,68.62222222222222,0,0,1,-27.9354,-180.2219 L-27.9354,-63.9719  A77.2,68.62222222222222,0,0,0,-34.0799,-61.5738 L-34.0799,-177.8238 z M-27.9354,-180.2219  A77.2,68.62222222222222,0,0,1,-21.5797,-182.1367 L-21.5797,-65.8867  A77.2,68.62222222222222,0,0,0,-27.9354,-63.9719 L-27.9354,-180.2219 z M-21.5797,-182.1367  A77.2,68.62222222222222,0,0,1,-15.061,-183.5537 L-15.061,-67.3037  A77.2,68.62222222222222,0,0,0,-21.5797,-65.8867 L-21.5797,-182.1367 z\\\"></path></g><g transform=\\\"translate(0,-116.25)\\\"><path d=\\\" M0,-68.6222  L0,-137.2444  a154.4,137.24444444444444,0,0,1,15.1338,273.828 a154.4,137.24444444444444,0,0,1,-45.2557,-271.1909 L-15.061,-67.3037  a77.2,68.62222222222222,0,0,0,22.6279,135.5955 a77.2,68.62222222222222,0,0,0,-7.5669,-136.9141 L0,-68.6222 \\\"></path></g><g></g></g></g></g></g><g><g><g fill-opacity=\\\"0\\\" stroke-opacity=\\\"0.2\\\" stroke=\\\"#000000\\\" stroke-width=\\\"1\\\"><polyline points=\\\"15.133846462320001,136.58357493553777,162.12,167.31,168.12,167.31\\\"></polyline></g><g fill-opacity=\\\"0\\\" stroke-opacity=\\\"0.2\\\" stroke=\\\"#000000\\\" stroke-width=\\\"1\\\"><polyline points=\\\"-15.133846462320001,-136.58357493553777,-162.12,-167.31,-168.12,-167.31\\\"></polyline></g></g></g><g><g><g fill=\\\"#000000\\\" aria-label=\\\"row1(col1): 96.9%\\\" transform=\\\"translate(168.12,167.31)\\\"><g transform=\\\"translate(5,-9.5)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"19\\\" dy=\\\"-5.13\\\"><tspan>row1(col1): 96.9%</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"Input(col1): 3.1%\\\" transform=\\\"translate(-168.12,-167.31)\\\"><g transform=\\\"translate(-109,-9.5)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"19\\\" dy=\\\"-5.13\\\"><tspan>Input(col1): 3.1%</tspan></text></g></g></g></g></g></g></g></g><g transform=\\\"translate(193,250)\\\"><g><g><g></g></g></g></g></g></g><g role=\\\"group\\\" aria-label=\\\"Legend\\\" transform=\\\"translate(0,461)\\\"><g><g focusable=\\\"true\\\" tabindex=\\\"0\\\" role=\\\"switch\\\" aria-controls=\\\"id-120\\\" aria-labelledby=\\\"id-120\\\" aria-checked=\\\"true\\\" transform=\\\"translate(29,0)\\\" style=\\\"cursor: pointer;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"153\\\" height=\\\"39\\\"></rect></g><g transform=\\\"translate(0,8)\\\"><g style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" stroke-opacity=\\\"0\\\"><rect width=\\\"23\\\" height=\\\"23\\\"></rect></g><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f44336\\\" stroke=\\\"#f44336\\\"><path d=\\\"M3,0 L20,0 a3,3 0 0 1 3,3 L23,20 a3,3 0 0 1 -3,3 L3,23 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3 Z\\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"row1(col1)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(28,2)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"19\\\" overflow=\\\"hidden\\\" dy=\\\"-5.13\\\"><tspan>row1(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"%\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(98,2)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"50\\\" y=\\\"19\\\" dy=\\\"-5.13\\\" text-anchor=\\\"end\\\"><tspan>96.9%</tspan></text></g></g></g></g><g focusable=\\\"true\\\" tabindex=\\\"0\\\" role=\\\"switch\\\" aria-controls=\\\"id-157\\\" aria-labelledby=\\\"id-157\\\" aria-checked=\\\"true\\\" transform=\\\"translate(202,0)\\\" style=\\\"cursor: pointer;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"155\\\" height=\\\"39\\\"></rect></g><g transform=\\\"translate(0,8)\\\"><g style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" stroke-opacity=\\\"0\\\"><rect width=\\\"23\\\" height=\\\"23\\\"></rect></g><g><g stroke-opacity=\\\"1\\\" fill=\\\"#673ab7\\\" stroke=\\\"#673ab7\\\"><path d=\\\"M3,0 L20,0 a3,3 0 0 1 3,3 L23,20 a3,3 0 0 1 -3,3 L3,23 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3 Z\\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"Input(col1)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(28,2)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"19\\\" overflow=\\\"hidden\\\" dy=\\\"-5.13\\\"><tspan>Input(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"%\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(100,2)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"50\\\" y=\\\"19\\\" dy=\\\"-5.13\\\" text-anchor=\\\"end\\\"><tspan>3.1%</tspan></text></g></g></g></g></g></g></g></g></g></g><g><g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-51&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g><g visibility=\\\"hidden\\\" display=\\\"none\\\" style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"1\\\"><rect width=\\\"386\\\" height=\\\"500\\\"></rect></g><g><g transform=\\\"translate(193,250)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f3f3f3\\\" fill-opacity=\\\"0.8\\\"><g><g><path d=\\\" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 \\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#000000\\\" fill-opacity=\\\"0.2\\\"><g><g><path d=\\\" M50,0  a50,50,0,0,1,-100,0 a50,50,0,0,1,100,0 M45,0  a45,45,0,0,0,-90,0 a45,45,0,0,0,90,0 L45,0 \\\"></path></g></g></g><g fill=\\\"#000000\\\" fill-opacity=\\\"0.4\\\"><g transform=\\\"translate(-17.5,-9.5)\\\" style=\\\"user-select: none;\\\"><text x=\\\"17.5px\\\" y=\\\"19\\\" dy=\\\"-5.13\\\" text-anchor=\\\"middle\\\"><tspan>100%</tspan></text></g></g></g></g></g></g><g opacity=\\\"0.3\\\" aria-labelledby=\\\"id-66-title\\\" filter=\\\"url(&quot;#filter-id-66&quot;)\\\" style=\\\"cursor: pointer;\\\" transform=\\\"translate(0,479)\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"0\\\"><rect width=\\\"66\\\" height=\\\"21\\\"></rect></g><g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"#3cabff\\\"><path d=\\\" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15\\\"></path></g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"url(&quot;#gradient-id-69&quot;)\\\"><path d=\\\" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15\\\"></path></g></g><title id=\\\"id-66-title\\\">Chart created using amCharts library</title></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-95&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g></g></g></g></g></svg></div></div>&nbsp;<div id=\\\"bar-chartdiv4\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 416.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-eb60d1\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clipeb60d1xyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"256\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipeb60d1x\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"256\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipeb60d1y\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"416.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipeb60d1xy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"256\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"256\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"336\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"336\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"105.6\\\" y=\\\"420.5\\\" width=\\\"204.8\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"25.6\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"310.4\\\" y=\\\"420.5\\\" width=\\\"25.6\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,382)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,344)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,306)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,268)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,230)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,192)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,154)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,116)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,420)\\\" d=\\\"M80,0h256\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clipeb60d1xyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M8.53,320V282H76.8V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M93.87,320V54H162.13V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g><g class=\\\"point\\\"><path d=\\\"M179.2,320V16H247.47V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"rating\\\" data-math=\\\"N\\\" transform=\\\"translate(122.67,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">rating</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"range\\\" data-math=\\\"N\\\" transform=\\\"translate(208,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">range</text></g><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"delta\\\" data-math=\\\"N\\\" transform=\\\"translate(293.33000000000004,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">delta</text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"100\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,382)\\\">100</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"200\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,344)\\\">200</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"300\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,306)\\\">300</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"400\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,268)\\\">400</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"500\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,230)\\\">500</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"600\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,192)\\\">600</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"700\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,154)\\\">700</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"800\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,116)\\\">800</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-eb60d1\\\"><g class=\\\"clips\\\"></g></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-eb60d1\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div>&nbsp;&nbsp;</span></span></span><div id=\\\"bar-chartdiv5\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 416.328px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-e91ee9\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clipe91ee9xyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"203\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipe91ee9x\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"203\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipe91ee9y\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"416.328\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipe91ee9xy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"203\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"203\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"283\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"283\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"100.3\\\" y=\\\"420.5\\\" width=\\\"162.4\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"20.3\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"262.70000000000005\\\" y=\\\"420.5\\\" width=\\\"20.3\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,359.2)\\\" d=\\\"M80,0h203\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,298.4)\\\" d=\\\"M80,0h203\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,237.6)\\\" d=\\\"M80,0h203\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,176.8)\\\" d=\\\"M80,0h203\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,116)\\\" d=\\\"M80,0h203\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,420)\\\" d=\\\"M80,0h203\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clipe91ee9xyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M20.3,320V222.75H74.43V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M74.43,320V16H128.57V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M128.57,320V113.25H182.7V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"col1\\\" data-math=\\\"N\\\" transform=\\\"translate(181.5,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">col1</text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"20\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,359.2)\\\">20</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"40\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,298.4)\\\">40</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"60\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,237.6)\\\">60</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"80\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,176.8)\\\">80</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"100\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,116)\\\">100</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><defs id=\\\"topdefs-e91ee9\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legende91ee9\\\"><rect width=\\\"117\\\" height=\\\"67\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(287.06,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\" width=\\\"117\\\" height=\\\"67\\\" x=\\\"0\\\" y=\\\"0\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legende91ee9)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"single value\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">single value</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"111.390625\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"raitng\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">raitng</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"111.390625\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,52.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"delta\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">delta</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"111.390625\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-e91ee9\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"416.328\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div><p></p>\\n\"', '\"<p>this is a report of 29 june (text that it is identic to all users)</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>next text is text group:</p>\\n\\n<p><span style=\\\"font-size:24px\\\"><span style=\\\"color:#2ecc71\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\">[text id=228]</span></span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p>the softwar emust show 3 chart 1 (right position, central postion, left position)</p>\\n\\n<p><span style=\\\"font-size:10.5pt\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[chart id=10]&nbsp; &nbsp;&nbsp;</span></span><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[chart id=11]&nbsp;&nbsp;[chart id=16]&nbsp;[chart id=17]&nbsp;&nbsp;</span></span></span></span>[chart id=18]</p>\\n\"', 1);
INSERT INTO `testreports` (`id`, `user_id`, `title`, `order`, `content`, `origin_content`, `published`) VALUES
(244, 1, 'This is report for prova17marzo 2 - industry', 97, '\"<p>Hello</p>\\n\\n<p><span style=\\\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\\\"><span style=\\\"color:#e74c3c\\\"><span style=\\\"font-size:22px\\\"></span></span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p></p><div id=\\\"pie-chartdiv1\\\" class=\\\"col-12\\\"><div style=\\\"width: 100%; height: 100%; position: relative; top: 0.0625px;\\\"><svg version=\\\"1.1\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" role=\\\"group\\\" style=\\\"width: 100%; height: 100%; overflow: visible;\\\"><defs><clipPath id=\\\"id-46\\\"><rect width=\\\"666\\\" height=\\\"500\\\"></rect></clipPath><linearGradient id=\\\"gradient-id-69\\\" x1=\\\"1%\\\" x2=\\\"99%\\\" y1=\\\"59%\\\" y2=\\\"41%\\\"><stop stop-color=\\\"#474758\\\" offset=\\\"0\\\"></stop><stop stop-color=\\\"#474758\\\" stop-opacity=\\\"1\\\" offset=\\\"0.75\\\"></stop><stop stop-color=\\\"#3cabff\\\" stop-opacity=\\\"1\\\" offset=\\\"0.755\\\"></stop></linearGradient><clipPath id=\\\"id-90\\\"></clipPath><filter id=\\\"filter-id-51\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter><filter id=\\\"filter-id-66\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"120%\\\" height=\\\"120%\\\" x=\\\"-10%\\\" y=\\\"-10%\\\"><feColorMatrix type=\\\"saturate\\\" values=\\\"0\\\"></feColorMatrix></filter><filter id=\\\"filter-id-95\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter></defs><g><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"666\\\" height=\\\"500\\\"></rect></g><g><g role=\\\"region\\\" clip-path=\\\"url(&quot;#id-46&quot;)\\\" opacity=\\\"1\\\" aria-label=\\\"Chart\\\"><g><g><g><g><g><g transform=\\\"translate(333,211)\\\"><g><g role=\\\"group\\\" opacity=\\\"1\\\" aria-label=\\\"Series\\\"><g><g clip-path=\\\"url(&quot;#id-90&quot;)\\\"><g></g></g><g></g><g><g><g stroke-opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" id=\\\"id-455\\\" fill=\\\"#4caf50\\\" stroke=\\\"#4caf50\\\"><g><g opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" fill=\\\"#39833c\\\" stroke=\\\"#39833c\\\"></g><g><path d=\\\" M-65.9866,-46.7756  L-131.9732,-93.5512  a168.8,150.04444444444445,0,0,1,131.9732,-56.4933 L0,-75.0222  a84.4,75.02222222222223,0,0,0,-65.9866,28.2466 L-65.9866,-46.7756 \\\"></path></g><g opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" fill=\\\"#39833c\\\" stroke=\\\"#39833c\\\"></g><g opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" fill=\\\"#39833c\\\" stroke=\\\"#39833c\\\"></g><g></g></g></g><g stroke-opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" id=\\\"id-419\\\" fill=\\\"#03a9f4\\\" stroke=\\\"#03a9f4\\\"><g><g opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" fill=\\\"#027fb7\\\" stroke=\\\"#027fb7\\\"></g><g><path d=\\\" M-82.2839,16.694  L-164.5678,33.388  a168.8,150.04444444444445,0,0,1,32.5947,-126.9392 L-65.9866,-46.7756  a84.4,75.02222222222223,0,0,0,-16.2973,63.4696 L-82.2839,16.694 \\\"></path></g><g opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" fill=\\\"#027fb7\\\" stroke=\\\"#027fb7\\\"></g><g opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" fill=\\\"#027fb7\\\" stroke=\\\"#027fb7\\\"></g><g></g></g></g><g stroke-opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" id=\\\"id-346\\\" fill=\\\"#f44336\\\" stroke=\\\"#f44336\\\"><g><g opacity=\\\"1\\\" fill=\\\"#b73229\\\" stroke=\\\"#b73229\\\"><path d=\\\" M0,-75.0222  L0,-150.0444  L0,-184.3302  L0,-109.3079  Z\\\"></path></g><g opacity=\\\"1\\\" fill=\\\"#b73229\\\" stroke=\\\"#b73229\\\"><path d=\\\" M0,-184.3302  A168.8,150.04444444444445,0,0,1,14.4124,-183.7822 L14.4124,-149.4965  A168.8,150.04444444444445,0,0,0,0,-150.0444 L0,-184.3302 z M14.4124,-183.7822  A168.8,150.04444444444445,0,0,1,28.7195,-182.1425 L28.7195,-147.8568  A168.8,150.04444444444445,0,0,0,14.4124,-149.4965 L14.4124,-183.7822 z M28.7195,-182.1425  A168.8,150.04444444444445,0,0,1,42.8169,-179.4229 L42.8169,-145.1372  A168.8,150.04444444444445,0,0,0,28.7195,-147.8568 L28.7195,-182.1425 z M42.8169,-179.4229  A168.8,150.04444444444445,0,0,1,56.6016,-175.6434 L56.6016,-141.3577  A168.8,150.04444444444445,0,0,0,42.8169,-145.1372 L42.8169,-179.4229 z M56.6016,-175.6434  A168.8,150.04444444444445,0,0,1,69.9729,-170.8314 L69.9729,-136.5457  A168.8,150.04444444444445,0,0,0,56.6016,-141.3577 L56.6016,-175.6434 z M69.9729,-170.8314  A168.8,150.04444444444445,0,0,1,82.8331,-165.0222 L82.8331,-130.7365  A168.8,150.04444444444445,0,0,0,69.9729,-136.5457 L69.9729,-170.8314 z M82.8331,-165.0222  A168.8,150.04444444444445,0,0,1,95.0884,-158.2583 L95.0884,-123.9725  A168.8,150.04444444444445,0,0,0,82.8331,-130.7365 L82.8331,-165.0222 z M95.0884,-158.2583  A168.8,150.04444444444445,0,0,1,106.6493,-150.5888 L106.6493,-116.3031  A168.8,150.04444444444445,0,0,0,95.0884,-123.9725 L95.0884,-158.2583 z M106.6493,-150.5888  A168.8,150.04444444444445,0,0,1,117.4312,-142.07 L117.4312,-107.7843  A168.8,150.04444444444445,0,0,0,106.6493,-116.3031 L106.6493,-150.5888 z M117.4312,-142.07  A168.8,150.04444444444445,0,0,1,127.3555,-132.7641 L127.3555,-98.4783  A168.8,150.04444444444445,0,0,0,117.4312,-107.7843 L117.4312,-142.07 z M127.3555,-132.7641  A168.8,150.04444444444445,0,0,1,136.3497,-122.7388 L136.3497,-88.4531  A168.8,150.04444444444445,0,0,0,127.3555,-98.4783 L127.3555,-132.7641 z M136.3497,-122.7388  A168.8,150.04444444444445,0,0,1,144.3481,-112.0676 L144.3481,-77.7819  A168.8,150.04444444444445,0,0,0,136.3497,-88.4531 L136.3497,-122.7388 z M144.3481,-112.0676  A168.8,150.04444444444445,0,0,1,151.2923,-100.8284 L151.2923,-66.5426  A168.8,150.04444444444445,0,0,0,144.3481,-77.7819 L144.3481,-112.0676 z M151.2923,-100.8284  A168.8,150.04444444444445,0,0,1,157.1315,-89.1031 L157.1315,-54.8174  A168.8,150.04444444444445,0,0,0,151.2923,-66.5426 L151.2923,-100.8284 z M157.1315,-89.1031  A168.8,150.04444444444445,0,0,1,161.8231,-76.9775 L161.8231,-42.6918  A168.8,150.04444444444445,0,0,0,157.1315,-54.8174 L157.1315,-89.1031 z M161.8231,-76.9775  A168.8,150.04444444444445,0,0,1,165.3329,-64.5401 L165.3329,-30.2544  A168.8,150.04444444444445,0,0,0,161.8231,-42.6918 L161.8231,-76.9775 z M165.3329,-64.5401  A168.8,150.04444444444445,0,0,1,167.6352,-51.8817 L167.6352,-17.596  A168.8,150.04444444444445,0,0,0,165.3329,-30.2544 L165.3329,-64.5401 z M167.6352,-51.8817  A168.8,150.04444444444445,0,0,1,168.7133,-39.0949 L168.7133,-4.8092  A168.8,150.04444444444445,0,0,0,167.6352,-17.596 L167.6352,-51.8817 z M168.7133,-39.0949  L168.7133,-4.8092  A168.8,150.04444444444445,0,0,1,168.5591,8.0128 L168.5591,-26.2729  A168.8,150.04444444444445,0,0,0,168.7133,-39.0949z M168.5591,-26.2729  L168.5591,8.0128  A168.8,150.04444444444445,0,0,1,167.1739,20.7763 L167.1739,-13.5094  A168.8,150.04444444444445,0,0,0,168.5591,-26.2729z M167.1739,-13.5094  L167.1739,20.7763  A168.8,150.04444444444445,0,0,1,164.5678,33.388 L164.5678,-0.8977  A168.8,150.04444444444445,0,0,0,167.1739,-13.5094z M0,-109.3079  A84.4,75.02222222222223,0,0,1,7.2062,-109.034 L7.2062,-74.7483  A84.4,75.02222222222223,0,0,0,0,-75.0222 L0,-109.3079 z M7.2062,-109.034  A84.4,75.02222222222223,0,0,1,14.3598,-108.2141 L14.3598,-73.9284  A84.4,75.02222222222223,0,0,0,7.2062,-74.7483 L7.2062,-109.034 z M14.3598,-108.2141  A84.4,75.02222222222223,0,0,1,21.4084,-106.8543 L21.4084,-72.5686  A84.4,75.02222222222223,0,0,0,14.3598,-73.9284 L14.3598,-108.2141 z M21.4084,-106.8543  A84.4,75.02222222222223,0,0,1,28.3008,-104.9645 L28.3008,-70.6788  A84.4,75.02222222222223,0,0,0,21.4084,-72.5686 L21.4084,-106.8543 z M28.3008,-104.9645  A84.4,75.02222222222223,0,0,1,34.9864,-102.5586 L34.9864,-68.2729  A84.4,75.02222222222223,0,0,0,28.3008,-70.6788 L28.3008,-104.9645 z M34.9864,-102.5586  A84.4,75.02222222222223,0,0,1,41.4166,-99.654 L41.4166,-65.3683  A84.4,75.02222222222223,0,0,0,34.9864,-68.2729 L34.9864,-102.5586 z M41.4166,-99.654  A84.4,75.02222222222223,0,0,1,47.5442,-96.272 L47.5442,-61.9863  A84.4,75.02222222222223,0,0,0,41.4166,-65.3683 L41.4166,-99.654 z M47.5442,-96.272  A84.4,75.02222222222223,0,0,1,53.3246,-92.4373 L53.3246,-58.1516  A84.4,75.02222222222223,0,0,0,47.5442,-61.9863 L47.5442,-96.272 z M53.3246,-92.4373  A84.4,75.02222222222223,0,0,1,58.7156,-88.1779 L58.7156,-53.8922  A84.4,75.02222222222223,0,0,0,53.3246,-58.1516 L53.3246,-92.4373 z M58.7156,-88.1779  A84.4,75.02222222222223,0,0,1,63.6778,-83.5249 L63.6778,-49.2392  A84.4,75.02222222222223,0,0,0,58.7156,-53.8922 L58.7156,-88.1779 z M63.6778,-83.5249  A84.4,75.02222222222223,0,0,1,68.1749,-78.5123 L68.1749,-44.2266  A84.4,75.02222222222223,0,0,0,63.6778,-49.2392 L63.6778,-83.5249 z M68.1749,-78.5123  A84.4,75.02222222222223,0,0,1,72.174,-73.1767 L72.174,-38.891  A84.4,75.02222222222223,0,0,0,68.1749,-44.2266 L68.1749,-78.5123 z M72.174,-73.1767  A84.4,75.02222222222223,0,0,1,75.6461,-67.557 L75.6461,-33.2713  A84.4,75.02222222222223,0,0,0,72.174,-38.891 L72.174,-73.1767 z M75.6461,-67.557  A84.4,75.02222222222223,0,0,1,78.5657,-61.6944 L78.5657,-27.4087  A84.4,75.02222222222223,0,0,0,75.6461,-33.2713 L75.6461,-67.557 z M78.5657,-61.6944  A84.4,75.02222222222223,0,0,1,80.9116,-55.6316 L80.9116,-21.3459  A84.4,75.02222222222223,0,0,0,78.5657,-27.4087 L78.5657,-61.6944 z M80.9116,-55.6316  A84.4,75.02222222222223,0,0,1,82.6665,-49.4129 L82.6665,-15.1272  A84.4,75.02222222222223,0,0,0,80.9116,-21.3459 L80.9116,-55.6316 z M82.6665,-49.4129  A84.4,75.02222222222223,0,0,1,83.8176,-43.0837 L83.8176,-8.798  A84.4,75.02222222222223,0,0,0,82.6665,-15.1272 L82.6665,-49.4129 z M83.8176,-43.0837  A84.4,75.02222222222223,0,0,1,84.3566,-36.6903 L84.3566,-2.4046  A84.4,75.02222222222223,0,0,0,83.8176,-8.798 L83.8176,-43.0837 z M84.3566,-36.6903  L84.3566,-2.4046  A84.4,75.02222222222223,0,0,1,84.2796,4.0064 L84.2796,-30.2793  A84.4,75.02222222222223,0,0,0,84.3566,-36.6903z M84.2796,-30.2793  L84.2796,4.0064  A84.4,75.02222222222223,0,0,1,83.587,10.3881 L83.587,-23.8976  A84.4,75.02222222222223,0,0,0,84.2796,-30.2793z M83.587,-23.8976  L83.587,10.3881  A84.4,75.02222222222223,0,0,1,82.2839,16.694 L82.2839,-17.5917  A84.4,75.02222222222223,0,0,0,83.587,-23.8976z\\\"></path></g><g transform=\\\"translate(0,-34.286)\\\"><path d=\\\" M0,-75.0222  L0,-150.0444  a168.8,150.04444444444445,0,0,1,164.5678,183.4325 L82.2839,16.694  a84.4,75.02222222222223,0,0,0,-82.2839,-91.7162 L0,-75.0222 \\\"></path></g><g></g><g opacity=\\\"1\\\" fill=\\\"#b73229\\\" stroke=\\\"#b73229\\\"><path d=\\\" M164.5678,33.388  L82.2839,16.694  L82.2839,-17.5917  L164.5678,-0.8977  Z\\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" id=\\\"id-383\\\" fill=\\\"#673ab7\\\" stroke=\\\"#673ab7\\\"><g><g opacity=\\\"1\\\" fill=\\\"#4d2c89\\\" stroke=\\\"#4d2c89\\\"><path d=\\\" M-164.5678,33.388  L-82.2839,16.694  L-82.2839,-34.7346  L-164.5678,-18.0405  Z\\\"></path></g><g opacity=\\\"1\\\" fill=\\\"#4d2c89\\\" stroke=\\\"#4d2c89\\\"><path d=\\\" M82.2839,16.694  L164.5678,33.388  L164.5678,-18.0405  L82.2839,-34.7346  Z\\\"></path></g><g opacity=\\\"1\\\" fill=\\\"#4d2c89\\\" stroke=\\\"#4d2c89\\\"><path d=\\\" M164.5678,-18.0405  L164.5678,33.388  A168.8,150.04444444444445,0,0,1,160.6887,45.9529 L160.6887,-5.4757  A168.8,150.04444444444445,0,0,0,164.5678,-18.0405z M160.6887,-5.4757  L160.6887,45.9529  A168.8,150.04444444444445,0,0,1,155.5979,58.1713 L155.5979,6.7427  A168.8,150.04444444444445,0,0,0,160.6887,-5.4757z M155.5979,6.7427  L155.5979,58.1713  A168.8,150.04444444444445,0,0,1,149.3337,69.951 L149.3337,18.5224  A168.8,150.04444444444445,0,0,0,155.5979,6.7427z M149.3337,18.5224  L149.3337,69.951  A168.8,150.04444444444445,0,0,1,141.9435,81.2032 L141.9435,29.7746  A168.8,150.04444444444445,0,0,0,149.3337,18.5224z M141.9435,29.7746  L141.9435,81.2032  A168.8,150.04444444444445,0,0,1,133.4829,91.8431 L133.4829,40.4145  A168.8,150.04444444444445,0,0,0,141.9435,29.7746z M133.4829,40.4145  L133.4829,91.8431  A168.8,150.04444444444445,0,0,1,124.0158,101.7904 L124.0158,50.3619  A168.8,150.04444444444445,0,0,0,133.4829,40.4145z M124.0158,50.3619  L124.0158,101.7904  A168.8,150.04444444444445,0,0,1,113.6135,110.9702 L113.6135,59.5417  A168.8,150.04444444444445,0,0,0,124.0158,50.3619z M113.6135,59.5417  L113.6135,110.9702  A168.8,150.04444444444445,0,0,1,102.3545,119.3132 L102.3545,67.8846  A168.8,150.04444444444445,0,0,0,113.6135,59.5417z M102.3545,67.8846  L102.3545,119.3132  A168.8,150.04444444444445,0,0,1,90.3237,126.7565 L90.3237,75.3279  A168.8,150.04444444444445,0,0,0,102.3545,67.8846z M90.3237,75.3279  L90.3237,126.7565  A168.8,150.04444444444445,0,0,1,77.6118,133.244 L77.6118,81.8154  A168.8,150.04444444444445,0,0,0,90.3237,75.3279z M77.6118,81.8154  L77.6118,133.244  A168.8,150.04444444444445,0,0,1,64.3146,138.7267 L64.3146,87.2981  A168.8,150.04444444444445,0,0,0,77.6118,81.8154z M64.3146,87.2981  L64.3146,138.7267  A168.8,150.04444444444445,0,0,1,50.5325,143.1633 L50.5325,91.7347  A168.8,150.04444444444445,0,0,0,64.3146,87.2981z M50.5325,91.7347  L50.5325,143.1633  A168.8,150.04444444444445,0,0,1,36.3693,146.5204 L36.3693,95.0918  A168.8,150.04444444444445,0,0,0,50.5325,91.7347z M36.3693,95.0918  L36.3693,146.5204  A168.8,150.04444444444445,0,0,1,21.9319,148.7726 L21.9319,97.344  A168.8,150.04444444444445,0,0,0,36.3693,95.0918z M21.9319,97.344  L21.9319,148.7726  A168.8,150.04444444444445,0,0,1,7.329,149.9029 L7.329,98.4744  A168.8,150.04444444444445,0,0,0,21.9319,97.344z M7.329,98.4744  L7.329,149.9029  A168.8,150.04444444444445,0,0,1,-7.329,149.9029 L-7.329,98.4744  A168.8,150.04444444444445,0,0,0,7.329,98.4744z M-7.329,98.4744  L-7.329,149.9029  A168.8,150.04444444444445,0,0,1,-21.9319,148.7726 L-21.9319,97.344  A168.8,150.04444444444445,0,0,0,-7.329,98.4744z M-21.9319,97.344  L-21.9319,148.7726  A168.8,150.04444444444445,0,0,1,-36.3693,146.5204 L-36.3693,95.0918  A168.8,150.04444444444445,0,0,0,-21.9319,97.344z M-36.3693,95.0918  L-36.3693,146.5204  A168.8,150.04444444444445,0,0,1,-50.5325,143.1633 L-50.5325,91.7347  A168.8,150.04444444444445,0,0,0,-36.3693,95.0918z M-50.5325,91.7347  L-50.5325,143.1633  A168.8,150.04444444444445,0,0,1,-64.3146,138.7267 L-64.3146,87.2981  A168.8,150.04444444444445,0,0,0,-50.5325,91.7347z M-64.3146,87.2981  L-64.3146,138.7267  A168.8,150.04444444444445,0,0,1,-77.6118,133.244 L-77.6118,81.8154  A168.8,150.04444444444445,0,0,0,-64.3146,87.2981z M-77.6118,81.8154  L-77.6118,133.244  A168.8,150.04444444444445,0,0,1,-90.3237,126.7565 L-90.3237,75.3279  A168.8,150.04444444444445,0,0,0,-77.6118,81.8154z M-90.3237,75.3279  L-90.3237,126.7565  A168.8,150.04444444444445,0,0,1,-102.3545,119.3132 L-102.3545,67.8846  A168.8,150.04444444444445,0,0,0,-90.3237,75.3279z M-102.3545,67.8846  L-102.3545,119.3132  A168.8,150.04444444444445,0,0,1,-113.6135,110.9702 L-113.6135,59.5417  A168.8,150.04444444444445,0,0,0,-102.3545,67.8846z M-113.6135,59.5417  L-113.6135,110.9702  A168.8,150.04444444444445,0,0,1,-124.0158,101.7904 L-124.0158,50.3619  A168.8,150.04444444444445,0,0,0,-113.6135,59.5417z M-124.0158,50.3619  L-124.0158,101.7904  A168.8,150.04444444444445,0,0,1,-133.4829,91.8431 L-133.4829,40.4145  A168.8,150.04444444444445,0,0,0,-124.0158,50.3619z M-133.4829,40.4145  L-133.4829,91.8431  A168.8,150.04444444444445,0,0,1,-141.9435,81.2032 L-141.9435,29.7746  A168.8,150.04444444444445,0,0,0,-133.4829,40.4145z M-141.9435,29.7746  L-141.9435,81.2032  A168.8,150.04444444444445,0,0,1,-149.3337,69.951 L-149.3337,18.5224  A168.8,150.04444444444445,0,0,0,-141.9435,29.7746z M-149.3337,18.5224  L-149.3337,69.951  A168.8,150.04444444444445,0,0,1,-155.5979,58.1713 L-155.5979,6.7427  A168.8,150.04444444444445,0,0,0,-149.3337,18.5224z M-155.5979,6.7427  L-155.5979,58.1713  A168.8,150.04444444444445,0,0,1,-160.6887,45.9529 L-160.6887,-5.4757  A168.8,150.04444444444445,0,0,0,-155.5979,6.7427z M-160.6887,-5.4757  L-160.6887,45.9529  A168.8,150.04444444444445,0,0,1,-164.5678,33.388 L-164.5678,-18.0405  A168.8,150.04444444444445,0,0,0,-160.6887,-5.4757z M82.2839,-34.7346  L82.2839,16.694  A84.4,75.02222222222223,0,0,1,80.3444,22.9765 L80.3444,-28.4521  A84.4,75.02222222222223,0,0,0,82.2839,-34.7346z M80.3444,-28.4521  L80.3444,22.9765  A84.4,75.02222222222223,0,0,1,77.7989,29.0856 L77.7989,-22.3429  A84.4,75.02222222222223,0,0,0,80.3444,-28.4521z M77.7989,-22.3429  L77.7989,29.0856  A84.4,75.02222222222223,0,0,1,74.6669,34.9755 L74.6669,-16.4531  A84.4,75.02222222222223,0,0,0,77.7989,-22.3429z M74.6669,-16.4531  L74.6669,34.9755  A84.4,75.02222222222223,0,0,1,70.9718,40.6016 L70.9718,-10.827  A84.4,75.02222222222223,0,0,0,74.6669,-16.4531z M70.9718,-10.827  L70.9718,40.6016  A84.4,75.02222222222223,0,0,1,66.7415,45.9216 L66.7415,-5.507  A84.4,75.02222222222223,0,0,0,70.9718,-10.827z M66.7415,-5.507  L66.7415,45.9216  A84.4,75.02222222222223,0,0,1,62.0079,50.8952 L62.0079,-0.5333  A84.4,75.02222222222223,0,0,0,66.7415,-5.507z M62.0079,-0.5333  L62.0079,50.8952  A84.4,75.02222222222223,0,0,1,56.8068,55.4851 L56.8068,4.0565  A84.4,75.02222222222223,0,0,0,62.0079,-0.5333z M56.8068,4.0565  L56.8068,55.4851  A84.4,75.02222222222223,0,0,1,51.1773,59.6566 L51.1773,8.228  A84.4,75.02222222222223,0,0,0,56.8068,4.0565z M51.1773,8.228  L51.1773,59.6566  A84.4,75.02222222222223,0,0,1,45.1619,63.3783 L45.1619,11.9497  A84.4,75.02222222222223,0,0,0,51.1773,8.228z M45.1619,11.9497  L45.1619,63.3783  A84.4,75.02222222222223,0,0,1,38.8059,66.622 L38.8059,15.1934  A84.4,75.02222222222223,0,0,0,45.1619,11.9497z M38.8059,15.1934  L38.8059,66.622  A84.4,75.02222222222223,0,0,1,32.1573,69.3633 L32.1573,17.9348  A84.4,75.02222222222223,0,0,0,38.8059,15.1934z M32.1573,17.9348  L32.1573,69.3633  A84.4,75.02222222222223,0,0,1,25.2662,71.5816 L25.2662,20.1531  A84.4,75.02222222222223,0,0,0,32.1573,17.9348z M25.2662,20.1531  L25.2662,71.5816  A84.4,75.02222222222223,0,0,1,18.1847,73.2602 L18.1847,21.8316  A84.4,75.02222222222223,0,0,0,25.2662,20.1531z M18.1847,21.8316  L18.1847,73.2602  A84.4,75.02222222222223,0,0,1,10.9659,74.3863 L10.9659,22.9577  A84.4,75.02222222222223,0,0,0,18.1847,21.8316z M10.9659,22.9577  L10.9659,74.3863  A84.4,75.02222222222223,0,0,1,3.6645,74.9515 L3.6645,23.5229  A84.4,75.02222222222223,0,0,0,10.9659,22.9577z M3.6645,23.5229  L3.6645,74.9515  A84.4,75.02222222222223,0,0,1,-3.6645,74.9515 L-3.6645,23.5229  A84.4,75.02222222222223,0,0,0,3.6645,23.5229z M-3.6645,23.5229  L-3.6645,74.9515  A84.4,75.02222222222223,0,0,1,-10.9659,74.3863 L-10.9659,22.9577  A84.4,75.02222222222223,0,0,0,-3.6645,23.5229z M-10.9659,22.9577  L-10.9659,74.3863  A84.4,75.02222222222223,0,0,1,-18.1847,73.2602 L-18.1847,21.8316  A84.4,75.02222222222223,0,0,0,-10.9659,22.9577z M-18.1847,21.8316  L-18.1847,73.2602  A84.4,75.02222222222223,0,0,1,-25.2662,71.5816 L-25.2662,20.1531  A84.4,75.02222222222223,0,0,0,-18.1847,21.8316z M-25.2662,20.1531  L-25.2662,71.5816  A84.4,75.02222222222223,0,0,1,-32.1573,69.3633 L-32.1573,17.9348  A84.4,75.02222222222223,0,0,0,-25.2662,20.1531z M-32.1573,17.9348  L-32.1573,69.3633  A84.4,75.02222222222223,0,0,1,-38.8059,66.622 L-38.8059,15.1934  A84.4,75.02222222222223,0,0,0,-32.1573,17.9348z M-38.8059,15.1934  L-38.8059,66.622  A84.4,75.02222222222223,0,0,1,-45.1619,63.3783 L-45.1619,11.9497  A84.4,75.02222222222223,0,0,0,-38.8059,15.1934z M-45.1619,11.9497  L-45.1619,63.3783  A84.4,75.02222222222223,0,0,1,-51.1773,59.6566 L-51.1773,8.228  A84.4,75.02222222222223,0,0,0,-45.1619,11.9497z M-51.1773,8.228  L-51.1773,59.6566  A84.4,75.02222222222223,0,0,1,-56.8068,55.4851 L-56.8068,4.0565  A84.4,75.02222222222223,0,0,0,-51.1773,8.228z M-56.8068,4.0565  L-56.8068,55.4851  A84.4,75.02222222222223,0,0,1,-62.0079,50.8952 L-62.0079,-0.5333  A84.4,75.02222222222223,0,0,0,-56.8068,4.0565z M-62.0079,-0.5333  L-62.0079,50.8952  A84.4,75.02222222222223,0,0,1,-66.7415,45.9216 L-66.7415,-5.507  A84.4,75.02222222222223,0,0,0,-62.0079,-0.5333z M-66.7415,-5.507  L-66.7415,45.9216  A84.4,75.02222222222223,0,0,1,-70.9718,40.6016 L-70.9718,-10.827  A84.4,75.02222222222223,0,0,0,-66.7415,-5.507z M-70.9718,-10.827  L-70.9718,40.6016  A84.4,75.02222222222223,0,0,1,-74.6669,34.9755 L-74.6669,-16.4531  A84.4,75.02222222222223,0,0,0,-70.9718,-10.827z M-74.6669,-16.4531  L-74.6669,34.9755  A84.4,75.02222222222223,0,0,1,-77.7989,29.0856 L-77.7989,-22.3429  A84.4,75.02222222222223,0,0,0,-74.6669,-16.4531z M-77.7989,-22.3429  L-77.7989,29.0856  A84.4,75.02222222222223,0,0,1,-80.3444,22.9765 L-80.3444,-28.4521  A84.4,75.02222222222223,0,0,0,-77.7989,-22.3429z M-80.3444,-28.4521  L-80.3444,22.9765  A84.4,75.02222222222223,0,0,1,-82.2839,16.694 L-82.2839,-34.7346  A84.4,75.02222222222223,0,0,0,-80.3444,-28.4521z\\\"></path></g><g transform=\\\"translate(0,-51.429)\\\"><path d=\\\" M82.2839,16.694  L164.5678,33.388  a168.8,150.04444444444445,0,0,1,-329.1357,0 L-82.2839,16.694  a84.4,75.02222222222223,0,0,0,164.5678,0 L82.2839,16.694 \\\"></path></g><g></g></g></g></g></g><g><g><g fill-opacity=\\\"0\\\" stroke-opacity=\\\"0.2\\\" stroke=\\\"#000000\\\" stroke-width=\\\"1\\\"><polyline points=\\\"131.973154246,-93.55118094286223,177.24,-114.248,183.24,-114.248\\\"></polyline></g><g fill-opacity=\\\"0\\\" stroke-opacity=\\\"0.2\\\" stroke=\\\"#000000\\\" stroke-width=\\\"1\\\"><polyline points=\\\"0,150.04444444444445,177.24,183.24,183.24,183.24\\\"></polyline></g><g fill-opacity=\\\"0\\\" stroke-opacity=\\\"0.2\\\" stroke=\\\"#000000\\\" stroke-width=\\\"1\\\"><polyline points=\\\"-164.56783157936002,-33.38802991928889,-177.24,-40.775,-183.24,-40.775\\\"></polyline></g><g fill-opacity=\\\"0\\\" stroke-opacity=\\\"0.2\\\" stroke=\\\"#000000\\\" stroke-width=\\\"1\\\"><polyline points=\\\"-73.23957516008001,-135.18537324579555,-177.24,-165.094,-183.24,-165.094\\\"></polyline></g></g></g><g><g><g fill=\\\"#000000\\\" aria-label=\\\"row1(col1): 28.6%\\\" transform=\\\"translate(183.24,-114.248)\\\"><g transform=\\\"translate(5,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>row1(col1): 28.6%</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"row1(Input): 42.9%\\\" transform=\\\"translate(183.24,183.24)\\\"><g transform=\\\"translate(5,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>row1(Input): 42.9%</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"Input(col1): -14.3%\\\" transform=\\\"translate(-183.24,-40.775)\\\"><g transform=\\\"translate(-124,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>Input(col1): -14.3%</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"Input(Input): -14.3%\\\" transform=\\\"translate(-183.24,-165.094)\\\"><g transform=\\\"translate(-129,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>Input(Input): -14.3%</tspan></text></g></g></g></g></g></g></g></g><g transform=\\\"translate(333,250)\\\"><g><g><g></g></g></g></g></g></g><g role=\\\"group\\\" aria-label=\\\"Legend\\\" transform=\\\"translate(0,422)\\\"><g><g focusable=\\\"true\\\" tabindex=\\\"0\\\" role=\\\"switch\\\" aria-controls=\\\"id-346\\\" aria-labelledby=\\\"id-346\\\" aria-checked=\\\"true\\\" transform=\\\"translate(75.5,0)\\\" style=\\\"cursor: pointer;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"154\\\" height=\\\"39\\\"></rect></g><g transform=\\\"translate(0,8)\\\"><g style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" stroke-opacity=\\\"0\\\"><rect width=\\\"23\\\" height=\\\"23\\\"></rect></g><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f44336\\\" stroke=\\\"#f44336\\\"><path d=\\\"M3,0 L20,0 a3,3 0 0 1 3,3 L23,20 a3,3 0 0 1 -3,3 L3,23 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3 Z\\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"row1(col1)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(28,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" overflow=\\\"hidden\\\" dy=\\\"-4.32\\\"><tspan>row1(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"%\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(99,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"50\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"end\\\"><tspan>28.6%</tspan></text></g></g></g></g><g focusable=\\\"true\\\" tabindex=\\\"0\\\" role=\\\"switch\\\" aria-controls=\\\"id-383\\\" aria-labelledby=\\\"id-383\\\" aria-checked=\\\"true\\\" transform=\\\"translate(255.5,0)\\\" style=\\\"cursor: pointer;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"160\\\" height=\\\"39\\\"></rect></g><g transform=\\\"translate(0,8)\\\"><g style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" stroke-opacity=\\\"0\\\"><rect width=\\\"23\\\" height=\\\"23\\\"></rect></g><g><g stroke-opacity=\\\"1\\\" fill=\\\"#673ab7\\\" stroke=\\\"#673ab7\\\"><path d=\\\"M3,0 L20,0 a3,3 0 0 1 3,3 L23,20 a3,3 0 0 1 -3,3 L3,23 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3 Z\\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"row1(Input)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(28,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" overflow=\\\"hidden\\\" dy=\\\"-4.32\\\"><tspan>row1(Input)</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"%\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(105,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"50\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"end\\\"><tspan>42.9%</tspan></text></g></g></g></g><g focusable=\\\"true\\\" tabindex=\\\"0\\\" role=\\\"switch\\\" aria-controls=\\\"id-419\\\" aria-labelledby=\\\"id-419\\\" aria-checked=\\\"true\\\" transform=\\\"translate(435.5,0)\\\" style=\\\"cursor: pointer;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"155\\\" height=\\\"39\\\"></rect></g><g transform=\\\"translate(0,8)\\\"><g style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" stroke-opacity=\\\"0\\\"><rect width=\\\"23\\\" height=\\\"23\\\"></rect></g><g><g stroke-opacity=\\\"1\\\" fill=\\\"#03a9f4\\\" stroke=\\\"#03a9f4\\\"><path d=\\\"M3,0 L20,0 a3,3 0 0 1 3,3 L23,20 a3,3 0 0 1 -3,3 L3,23 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3 Z\\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"Input(col1)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(28,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" overflow=\\\"hidden\\\" dy=\\\"-4.32\\\"><tspan>Input(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"%\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(100,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"50\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"end\\\"><tspan>-14.3%</tspan></text></g></g></g></g><g focusable=\\\"true\\\" tabindex=\\\"0\\\" role=\\\"switch\\\" aria-controls=\\\"id-455\\\" aria-labelledby=\\\"id-455\\\" aria-checked=\\\"true\\\" transform=\\\"translate(75.5,39)\\\" style=\\\"cursor: pointer;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"160\\\" height=\\\"39\\\"></rect></g><g transform=\\\"translate(0,8)\\\"><g style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\" stroke-opacity=\\\"0\\\"><rect width=\\\"23\\\" height=\\\"23\\\"></rect></g><g><g stroke-opacity=\\\"1\\\" fill=\\\"#4caf50\\\" stroke=\\\"#4caf50\\\"><path d=\\\"M3,0 L20,0 a3,3 0 0 1 3,3 L23,20 a3,3 0 0 1 -3,3 L3,23 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3 Z\\\"></path></g></g></g><g fill=\\\"#000000\\\" aria-label=\\\"Input(Input)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(28,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" overflow=\\\"hidden\\\" dy=\\\"-4.32\\\"><tspan>Input(Input)</tspan></text></g></g><g fill=\\\"#000000\\\" aria-label=\\\"%\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(105,3.5)\\\"><g style=\\\"user-select: none;\\\"><text x=\\\"50\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"end\\\"><tspan>-14.3%</tspan></text></g></g></g></g></g></g></g></g></g></g><g><g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-51&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g><g visibility=\\\"hidden\\\" display=\\\"none\\\" style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"1\\\"><rect width=\\\"666\\\" height=\\\"500\\\"></rect></g><g><g transform=\\\"translate(333,250)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f3f3f3\\\" fill-opacity=\\\"0.8\\\"><g><g><path d=\\\" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 \\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#000000\\\" fill-opacity=\\\"0.2\\\"><g><g><path d=\\\" M50,0  a50,50,0,0,1,-100,0 a50,50,0,0,1,100,0 M45,0  a45,45,0,0,0,-90,0 a45,45,0,0,0,90,0 L45,0 \\\"></path></g></g></g><g fill=\\\"#000000\\\" fill-opacity=\\\"0.4\\\"><g transform=\\\"translate(-18,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"18px\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"middle\\\"><tspan>100%</tspan></text></g></g></g></g></g></g><g opacity=\\\"0.3\\\" aria-labelledby=\\\"id-66-title\\\" filter=\\\"url(&quot;#filter-id-66&quot;)\\\" style=\\\"cursor: pointer;\\\" transform=\\\"translate(0,479)\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"0\\\"><rect width=\\\"66\\\" height=\\\"21\\\"></rect></g><g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"#3cabff\\\"><path d=\\\" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15\\\"></path></g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"url(&quot;#gradient-id-69&quot;)\\\"><path d=\\\" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15\\\"></path></g></g><title id=\\\"id-66-title\\\">Chart created using amCharts library</title></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-95&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g></g></g></g></g></svg></div></div><p></p>\\n\\n<p></p><div id=\\\"d3bar-chartdiv2\\\" class=\\\"col-12\\\"><div style=\\\"width: 100%; height: 100%; position: relative; top: 0.0625px;\\\"><svg version=\\\"1.1\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" role=\\\"group\\\" style=\\\"width: 100%; height: 100%; overflow: visible;\\\"><defs><clipPath id=\\\"id-151\\\"><path d=\\\" M0,0  L25.9808,-15  L544.0008,-15  L544.0008,404  L518.02,419  L518.02,419  L0,419  Z\\\"></path></clipPath><clipPath id=\\\"id-152\\\"><rect width=\\\"666\\\" height=\\\"500\\\"></rect></clipPath><linearGradient id=\\\"gradient-id-175\\\" x1=\\\"1%\\\" x2=\\\"99%\\\" y1=\\\"59%\\\" y2=\\\"41%\\\"><stop stop-color=\\\"#474758\\\" offset=\\\"0\\\"></stop><stop stop-color=\\\"#474758\\\" stop-opacity=\\\"1\\\" offset=\\\"0.75\\\"></stop><stop stop-color=\\\"#3cabff\\\" stop-opacity=\\\"1\\\" offset=\\\"0.755\\\"></stop></linearGradient><filter id=\\\"filter-id-184\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"></filter><filter id=\\\"filter-id-204\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"></filter><clipPath id=\\\"id-224\\\"><path d=\\\"M0,0 L518.02,0 L518.02,419 L0,419 L0,0\\\"></path></clipPath><clipPath id=\\\"id-486\\\"><rect width=\\\"518.02\\\" height=\\\"419\\\"></rect></clipPath><filter id=\\\"filter-id-157\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter><filter id=\\\"filter-id-172\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"120%\\\" height=\\\"120%\\\" x=\\\"-10%\\\" y=\\\"-10%\\\"><feColorMatrix type=\\\"saturate\\\" values=\\\"0\\\"></feColorMatrix></filter><filter id=\\\"filter-id-229\\\" filterUnits=\\\"objectBoundingBox\\\" width=\\\"200%\\\" height=\\\"200%\\\" x=\\\"-50%\\\" y=\\\"-50%\\\"><feGaussianBlur result=\\\"blurOut\\\" in=\\\"SourceGraphic\\\" stdDeviation=\\\"1.5\\\"></feGaussianBlur><feOffset result=\\\"offsetBlur\\\" dx=\\\"1\\\" dy=\\\"1\\\"></feOffset><feFlood flood-color=\\\"#000000\\\" flood-opacity=\\\"0.5\\\"></feFlood><feComposite in2=\\\"offsetBlur\\\" operator=\\\"in\\\"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in=\\\"SourceGraphic\\\"></feMergeNode></feMerge></filter></defs><g><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"666\\\" height=\\\"500\\\"></rect></g><g><g role=\\\"region\\\" clip-path=\\\"url(&quot;#id-152&quot;)\\\" opacity=\\\"1\\\" aria-label=\\\"Chart\\\"><g transform=\\\"translate(15,15)\\\"><g><g><g><g transform=\\\"translate(0,15)\\\"><g><g><g transform=\\\"translate(92,0)\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0\\\"><rect width=\\\"518.02\\\" height=\\\"419\\\"></rect></g><g><g><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(-259,0)\\\" display=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(-130,0)\\\" display=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(130,0)\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(259,0)\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(389,0)\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(518,0)\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(648,0)\\\" display=\\\"none\\\"><path d=\\\" M25.9808,-15  L25.9808,404  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(0,52)\\\"><path d=\\\" M0,0  L25.9808,-15  L544.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(0,157)\\\"><path d=\\\" M0,0  L25.9808,-15  L544.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(0,262)\\\"><path d=\\\" M0,0  L25.9808,-15  L544.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(0,367)\\\"><path d=\\\" M0,0  L25.9808,-15  L544.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\" transform=\\\"translate(0,471)\\\"><path d=\\\" M0,0  L25.9808,-15  L544.0008,-15 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g><g><g><g clip-path=\\\"url(&quot;#id-151&quot;)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#673ab7\\\" fill-opacity=\\\"1\\\" stroke=\\\"#3f51b5\\\" opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" transform=\\\"translate(129.505,324.725)\\\" id=\\\"id-575\\\"><g><g stroke-opacity=\\\"0.2\\\" stroke=\\\"#ffffff\\\" fill=\\\"#673ab7\\\"><g><g fill=\\\"#522e92\\\"><path d=\\\" M25.9808,-15  L349.7438,-15  L349.7438,68.8  L25.9808,68.8  Z\\\"></path></g><g fill=\\\"#341d5c\\\"><path d=\\\" M0,83.8  L25.9808,68.8  L349.7438,68.8  L323.763,83.8  Z\\\"></path></g><g fill=\\\"#3e236e\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,68.8  L0,83.8  Z\\\"></path></g><g fill=\\\"#522e92\\\"><path d=\\\" M323.763,0  L349.7438,-15  L349.7438,68.8  L323.763,83.8  Z\\\"></path></g><g fill=\\\"#5d34a5\\\"><path d=\\\" M0,0  L25.9808,-15  L349.7438,-15  L323.763,0  Z\\\"></path></g><g><path d=\\\" M0,0  L323.763,0  L323.763,83.8  L0,83.8  Z\\\"></path></g></g></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#9c27b0\\\" fill-opacity=\\\"1\\\" stroke=\\\"#3f51b5\\\" opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" transform=\\\"translate(129.505,219.975)\\\"><g><g stroke-opacity=\\\"0.2\\\" stroke=\\\"#ffffff\\\" fill=\\\"#9c27b0\\\"><g><g fill=\\\"#7d1f8d\\\"><path d=\\\" M25.9808,-15  L220.2388,-15  L220.2388,68.8  L25.9808,68.8  Z\\\"></path></g><g fill=\\\"#4e1458\\\"><path d=\\\" M0,83.8  L25.9808,68.8  L220.2388,68.8  L194.258,83.8  Z\\\"></path></g><g fill=\\\"#5e176a\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,68.8  L0,83.8  Z\\\"></path></g><g fill=\\\"#7d1f8d\\\"><path d=\\\" M194.258,0  L220.2388,-15  L220.2388,68.8  L194.258,83.8  Z\\\"></path></g><g fill=\\\"#8c239e\\\"><path d=\\\" M0,0  L25.9808,-15  L220.2388,-15  L194.258,0  Z\\\"></path></g><g><path d=\\\" M0,0  L194.258,0  L194.258,83.8  L0,83.8  Z\\\"></path></g></g></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#e91e63\\\" fill-opacity=\\\"1\\\" stroke=\\\"#3f51b5\\\" opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" transform=\\\"translate(64.753,115.225)\\\"><g><g stroke-opacity=\\\"0.2\\\" stroke=\\\"#ffffff\\\" fill=\\\"#e91e63\\\"><g><g fill=\\\"#ba184f\\\"><path d=\\\" M25.9808,-15  L90.7338,-15  L90.7338,68.8  L25.9808,68.8  Z\\\"></path></g><g fill=\\\"#750f32\\\"><path d=\\\" M0,83.8  L25.9808,68.8  L90.7338,68.8  L64.753,83.8  Z\\\"></path></g><g fill=\\\"#8c123b\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,68.8  L0,83.8  Z\\\"></path></g><g fill=\\\"#ba184f\\\"><path d=\\\" M64.753,0  L90.7338,-15  L90.7338,68.8  L64.753,83.8  Z\\\"></path></g><g fill=\\\"#d21b59\\\"><path d=\\\" M0,0  L25.9808,-15  L90.7338,-15  L64.753,0  Z\\\"></path></g><g><path d=\\\" M0,0  L64.753,0  L64.753,83.8  L0,83.8  Z\\\"></path></g></g></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#f44336\\\" fill-opacity=\\\"1\\\" stroke=\\\"#3f51b5\\\" opacity=\\\"1\\\" role=\\\"menuitem\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" transform=\\\"translate(129.505,10.475)\\\"><g><g stroke-opacity=\\\"0.2\\\" stroke=\\\"#ffffff\\\" fill=\\\"#f44336\\\"><g><g fill=\\\"#c3362b\\\"><path d=\\\" M25.9808,-15  L155.4858,-15  L155.4858,68.8  L25.9808,68.8  Z\\\"></path></g><g fill=\\\"#7a221b\\\"><path d=\\\" M0,83.8  L25.9808,68.8  L155.4858,68.8  L129.505,83.8  Z\\\"></path></g><g fill=\\\"#922820\\\"><path d=\\\" M0,0  L25.9808,-15  L25.9808,68.8  L0,83.8  Z\\\"></path></g><g fill=\\\"#c3362b\\\"><path d=\\\" M129.505,0  L155.4858,-15  L155.4858,68.8  L129.505,83.8  Z\\\"></path></g><g fill=\\\"#dc3c31\\\"><path d=\\\" M0,0  L25.9808,-15  L155.4858,-15  L129.505,0  Z\\\"></path></g><g><path d=\\\" M0,0  L129.505,0  L129.505,83.8  L0,83.8  Z\\\"></path></g></g></g></g></g></g></g><g role=\\\"group\\\" stroke-opacity=\\\"0\\\" fill-opacity=\\\"1\\\" stroke=\\\"#3f51b5\\\" aria-label=\\\"Visits\\\"><g><g clip-path=\\\"url(&quot;#id-224&quot;)\\\"><g><g><g></g></g></g></g><g></g></g></g></g></g><g clip-path=\\\"url(&quot;#id-486&quot;)\\\"><g><g fill=\\\"#3f51b5\\\" stroke=\\\"#3f51b5\\\"><g></g></g></g></g><g><g><g><g></g></g><g><g></g></g></g></g><g><g></g></g><g><g></g></g><g role=\\\"button\\\" focusable=\\\"true\\\" tabindex=\\\"0\\\" opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\" transform=\\\"translate(478.02,-3)\\\" aria-labelledby=\\\"id-127-title\\\"><g fill=\\\"#6794dc\\\" stroke=\\\"#ffffff\\\" fill-opacity=\\\"1\\\" stroke-opacity=\\\"0\\\" transform=\\\"translate(0,8)\\\"><path d=\\\"M17,0 L18,0 a17,17 0 0 1 17,17 L35,17 a17,17 0 0 1 -17,17 L17,34 a17,17 0 0 1 -17,-17 L0,17 a17,17 0 0 1 17,-17 Z\\\"></path></g><g transform=\\\"translate(9,9)\\\"><g stroke=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,8)\\\"><path d=\\\" M0,0  L11,0 \\\" transform=\\\"translate(2.5,7.5)\\\"></path></g><g fill=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(17,8)\\\"><g display=\\\"none\\\"></g></g></g><title id=\\\"id-127-title\\\">Zoom Out</title></g></g></g><g><g><g aria-hidden=\\\"true\\\"><g><g fill=\\\"#000000\\\" transform=\\\"translate(0,209.5) rotate(-90)\\\"><g display=\\\"none\\\"></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" display=\\\"none\\\" transform=\\\"translate(92,419)\\\" opacity=\\\"0\\\" visibility=\\\"hidden\\\" aria-hidden=\\\"true\\\"><path transform=\\\"translate(-0.5,-0.5)\\\" d=\\\" M0,0  L518.02,0  L544.0008,-15 \\\"></path></g><g transform=\\\"translate(0,0)\\\"><g><g fill=\\\"#000000\\\" aria-label=\\\"L\\\" fill-opacity=\\\"0\\\" opacity=\\\"0\\\" stroke-opacity=\\\"0\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(92,209.5)\\\"><g transform=\\\"translate(-82,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>Input(Input)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(92,52.375)\\\"><g transform=\\\"translate(-76,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>row1(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(92,157.125)\\\"><g transform=\\\"translate(-82,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>row1(Input)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(92,261.875)\\\"><g transform=\\\"translate(-77,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>Input(col1)</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(92,366.625)\\\"><g transform=\\\"translate(-82,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>Input(Input)</tspan></text></g></g><g fill=\\\"#000000\\\" display=\\\"none\\\" transform=\\\"translate(92,471.375)\\\"><g transform=\\\"translate(-10,0)\\\" display=\\\"none\\\"></g></g></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0\\\" fill=\\\"none\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(92,0)\\\"><path d=\\\" M0,0  L0,419 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g></g></g></g></g><g transform=\\\"translate(610.02,0)\\\"><g></g></g></g></g><g><g transform=\\\"translate(92,0)\\\"></g></g><g transform=\\\"translate(0,419)\\\"><g transform=\\\"translate(92,0)\\\"><g aria-hidden=\\\"true\\\"><g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0\\\" fill=\\\"none\\\" style=\\\"pointer-events: none;\\\"><path d=\\\" M0,0  L518.02,0 \\\" transform=\\\"translate(-0.5,-0.5)\\\"></path></g><g><g><g fill=\\\"#000000\\\" aria-label=\\\"L\\\" fill-opacity=\\\"0\\\" opacity=\\\"0\\\" stroke-opacity=\\\"0\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(259.01,0)\\\"><g transform=\\\"translate(-4,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>L</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(-259.01,0)\\\" display=\\\"none\\\"><g transform=\\\"translate(-14.5,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-600</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(-129.505,0)\\\" display=\\\"none\\\"><g transform=\\\"translate(-14.5,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-400</tspan></text></g></g><g fill=\\\"#000000\\\"><g transform=\\\"translate(-14.5,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>-200</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(129.505,0)\\\"><g transform=\\\"translate(-4,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>0</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(259.01,0)\\\"><g transform=\\\"translate(-12,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>200</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(388.515,0)\\\"><g transform=\\\"translate(-12,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>400</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(518.02,0)\\\"><g transform=\\\"translate(-12,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>600</tspan></text></g></g><g fill=\\\"#000000\\\" transform=\\\"translate(647.525,0)\\\" display=\\\"none\\\"><g transform=\\\"translate(-12,10)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>800</tspan></text></g></g></g></g><g stroke=\\\"#000000\\\" stroke-opacity=\\\"0.15\\\" fill=\\\"none\\\" transform=\\\"translate(130,-419)\\\"><path transform=\\\"translate(-0.5,-0.5)\\\" d=\\\" M25.9808,-15  L0,0  L0,419 \\\"></path></g><g fill=\\\"#000000\\\" transform=\\\"translate(259,36)\\\"><g display=\\\"none\\\"></g></g></g></g></g></g></g></g></g></g><g></g></g></g><g><g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#ffffff\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-157&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(0,6)\\\"><path d=\\\"M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(12,6)\\\"><g transform=\\\"translate(0,7)\\\" display=\\\"none\\\"></g></g></g></g><g visibility=\\\"hidden\\\" display=\\\"none\\\" style=\\\"pointer-events: none;\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"1\\\"><rect width=\\\"666\\\" height=\\\"500\\\"></rect></g><g><g transform=\\\"translate(333,250)\\\"><g><g stroke-opacity=\\\"1\\\" fill=\\\"#f3f3f3\\\" fill-opacity=\\\"0.8\\\"><g><g><path d=\\\" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 \\\"></path></g></g></g><g stroke-opacity=\\\"1\\\" fill=\\\"#000000\\\" fill-opacity=\\\"0.2\\\"><g><g><path d=\\\" M50,0  a50,50,0,0,1,-100,0 a50,50,0,0,1,100,0 M45,0  a45,45,0,0,0,-90,0 a45,45,0,0,0,90,0 L45,0 \\\"></path></g></g></g><g fill=\\\"#000000\\\" fill-opacity=\\\"0.4\\\"><g transform=\\\"translate(-18,-8)\\\" style=\\\"user-select: none;\\\"><text x=\\\"18px\\\" y=\\\"16\\\" dy=\\\"-4.32\\\" text-anchor=\\\"middle\\\"><tspan>100%</tspan></text></g></g></g></g></g></g><g opacity=\\\"0.3\\\" aria-labelledby=\\\"id-172-title\\\" filter=\\\"url(&quot;#filter-id-172&quot;)\\\" style=\\\"cursor: pointer;\\\" transform=\\\"translate(0,479)\\\"><g fill=\\\"#ffffff\\\" opacity=\\\"0\\\"><rect width=\\\"66\\\" height=\\\"21\\\"></rect></g><g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"#3cabff\\\"><path d=\\\" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15\\\"></path></g><g shape-rendering=\\\"auto\\\" fill=\\\"none\\\" stroke-opacity=\\\"1\\\" stroke-width=\\\"1.7999999999999998\\\" stroke=\\\"url(&quot;#gradient-id-175&quot;)\\\"><path d=\\\" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15\\\"></path></g></g><title id=\\\"id-172-title\\\">Chart created using amCharts library</title></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#000000\\\" fill-opacity=\\\"1\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-25,30)\\\"><path d=\\\"M0,0 L20,0 a0,0 0 0 1 0,0 L20,0 L20,0 L25,0 L20,10 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-15,30)\\\"><g transform=\\\"translate(0,5)\\\" display=\\\"none\\\"></g></g></g></g><g role=\\\"tooltip\\\" visibility=\\\"hidden\\\" opacity=\\\"0\\\"><g fill=\\\"#000000\\\" fill-opacity=\\\"1\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#000000\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(107,449)\\\"><path d=\\\"M0,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(117,449)\\\"><g transform=\\\"translate(0,5)\\\" display=\\\"none\\\"></g></g></g></g><g role=\\\"tooltip\\\" opacity=\\\"0\\\" aria-describedby=\\\"id-575\\\" transform=\\\"translate(398.3865,396.625)\\\" aria-hidden=\\\"true\\\" visibility=\\\"hidden\\\"><g fill=\\\"#673ab7\\\" fill-opacity=\\\"0.9\\\" stroke-width=\\\"1\\\" stroke-opacity=\\\"1\\\" stroke=\\\"#ffffff\\\" filter=\\\"url(&quot;#filter-id-229&quot;)\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-54,-13.5)\\\"><path d=\\\"M3,0 L45,0 a3,3 0 0 1 3,3 L48,3 L48,8.5 L54,13.5 L48,18.5 L48,24 a3,3 0 0 1 -3,3 L3,27 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3\\\"></path></g><g><g fill=\\\"#ffffff\\\" style=\\\"pointer-events: none;\\\" transform=\\\"translate(-30,-13.5)\\\"><g transform=\\\"translate(-12,7)\\\" style=\\\"user-select: none;\\\"><text x=\\\"0\\\" y=\\\"16\\\" dy=\\\"-4.32\\\"><tspan>500</tspan></text></g></g></g></g></g></g></g></g></svg></div></div><p></p>\\n\"', '\"<p>Hello</p>\\n\\n<p><span style=\\\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\\\"><span style=\\\"color:#e74c3c\\\"><span style=\\\"font-size:22px\\\">[text id=232]</span></span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p>[chart id=13]</p>\\n\\n<p>[chart id=14]</p>\\n\"', 1);
INSERT INTO `testreports` (`id`, `user_id`, `title`, `order`, `content`, `origin_content`, `published`) VALUES
(245, 1, NULL, 103, '\"<p>sdfsdfsdfsdfdsfsda</p>\\n\\n<p>f</p>\\n\\n<p>text group<span style=\\\"color:#16a085\\\"><span style=\\\"font-size:24px\\\">&nbsp;</span></span></p>\\n\"', '\"<p>sdfsdfsdfsdfdsfsda</p>\\n\\n<p>f</p>\\n\\n<p>text group<span style=\\\"color:#16a085\\\"><span style=\\\"font-size:24px\\\">&nbsp;[text id=233]</span></span></p>\\n\"', 1),
(247, 1, NULL, 105, '\"\"', '\"<p>sdfsdfsdfsdfsdfsdfsd</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>[chart id=20]</p>\\n\"', 1),
(248, 1, NULL, 107, '\"\"', '\"<p>prova</p>\\n\\n<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:26px\\\"><span style=\\\"color:#e74c3c\\\">[text id=235]</span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p>[chart id=21]</p>\\n\"', 1),
(249, 1, NULL, 108, '\"<p>ffhgfjhgjhfh</p>\\n\\n<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:24px\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"></span></span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:10.5pt\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"></span></span></span></p><div id=\\\"bar-chartdiv1\\\" class=\\\"col-12 js-plotly-plot\\\"><div class=\\\"plot-container plotly\\\"><div class=\\\"user-select-none svg-container\\\" style=\\\"position: relative; width: 562.984px; height: 500px;\\\"><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"562.984\\\" height=\\\"500\\\" style=\\\"background: rgb(255, 255, 255);\\\"><defs id=\\\"defs-c134b0\\\"><g class=\\\"clips\\\"><clipPath id=\\\"clipc134b0xyplot\\\" class=\\\"plotclip\\\"><rect width=\\\"363\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipc134b0x\\\"><rect x=\\\"80\\\" y=\\\"0\\\" width=\\\"363\\\" height=\\\"500\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipc134b0y\\\"><rect x=\\\"0\\\" y=\\\"100\\\" width=\\\"562.984\\\" height=\\\"320\\\"></rect></clipPath><clipPath class=\\\"axesclip\\\" id=\\\"clipc134b0xy\\\"><rect x=\\\"80\\\" y=\\\"100\\\" width=\\\"363\\\" height=\\\"320\\\"></rect></clipPath></g><g class=\\\"gradients\\\"></g><g class=\\\"patterns\\\"></g></defs><g class=\\\"bglayer\\\"></g><g class=\\\"draglayer cursor-crosshair\\\"><g class=\\\"xy\\\"><rect class=\\\"nsewdrag drag\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"100\\\" width=\\\"363\\\" height=\\\"320\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nwdrag drag cursor-nw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nedrag drag cursor-ne-resize\\\" data-subplot=\\\"xy\\\" x=\\\"443\\\" y=\\\"80\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"swdrag drag cursor-sw-resize\\\" data-subplot=\\\"xy\\\" x=\\\"60\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sedrag drag cursor-se-resize\\\" data-subplot=\\\"xy\\\" x=\\\"443\\\" y=\\\"420\\\" width=\\\"20\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ewdrag drag cursor-ew-resize\\\" data-subplot=\\\"xy\\\" x=\\\"116.30000000000001\\\" y=\\\"420.5\\\" width=\\\"290.40000000000003\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"wdrag drag cursor-w-resize\\\" data-subplot=\\\"xy\\\" x=\\\"80\\\" y=\\\"420.5\\\" width=\\\"36.300000000000004\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"edrag drag cursor-e-resize\\\" data-subplot=\\\"xy\\\" x=\\\"406.7\\\" y=\\\"420.5\\\" width=\\\"36.300000000000004\\\" height=\\\"20\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"nsdrag drag cursor-ns-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"132\\\" width=\\\"20\\\" height=\\\"256\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"sdrag drag cursor-s-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"388\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect><rect class=\\\"ndrag drag cursor-n-resize\\\" data-subplot=\\\"xy\\\" x=\\\"59.5\\\" y=\\\"100\\\" width=\\\"20\\\" height=\\\"32\\\" style=\\\"fill: transparent; stroke-width: 0; pointer-events: all;\\\"></rect></g></g><g class=\\\"layer-below\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"cartesianlayer\\\"><g class=\\\"subplot xy\\\"><g class=\\\"layer-subplot\\\"><g class=\\\"shapelayer\\\"></g><g class=\\\"imagelayer\\\"></g></g><g class=\\\"gridlayer\\\"><g class=\\\"x\\\"></g><g class=\\\"y\\\"><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,369.75)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,319.5)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,269.26)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,219.01)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,168.76)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path><path class=\\\"ygrid crisp\\\" transform=\\\"translate(0,118.51)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(238, 238, 238); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g></g><g class=\\\"zerolinelayer\\\"><path class=\\\"yzl zl crisp\\\" transform=\\\"translate(0,420)\\\" d=\\\"M80,0h363\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; stroke-width: 1px;\\\"></path></g><path class=\\\"xlines-below\\\"></path><path class=\\\"ylines-below\\\"></path><g class=\\\"overlines-below\\\"></g><g class=\\\"xaxislayer-below\\\"></g><g class=\\\"yaxislayer-below\\\"></g><g class=\\\"overaxes-below\\\"></g><g class=\\\"plot\\\" transform=\\\"translate(80,100)\\\" clip-path=\\\"url(#clipc134b0xyplot)\\\"><g class=\\\"barlayer mlayer\\\"><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M36.3,320V244.63H133.1V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M133.1,320V292.36H229.9V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><g class=\\\"trace bars\\\" style=\\\"opacity: 1;\\\"><g class=\\\"points\\\"><g class=\\\"point\\\"><path d=\\\"M229.9,320V16H326.7V320Z\\\" style=\\\"vector-effect: non-scaling-stroke; opacity: 1; stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g></g></g></g></g><g class=\\\"overplot\\\"></g><path class=\\\"xlines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><path class=\\\"ylines-above crisp\\\" d=\\\"M0,0\\\" style=\\\"fill: none;\\\"></path><g class=\\\"overlines-above\\\"></g><g class=\\\"xaxislayer-above\\\"><g class=\\\"xtick\\\"><text text-anchor=\\\"middle\\\" x=\\\"0\\\" y=\\\"433\\\" data-unformatted=\\\"\\\" data-math=\\\"N\\\" transform=\\\"translate(261.5,0)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\"></text></g></g><g class=\\\"yaxislayer-above\\\"><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"0\\\" data-math=\\\"N\\\" transform=\\\"translate(0,420)\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\">0</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"20\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,369.75)\\\">20</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"40\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,319.5)\\\">40</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"60\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,269.26)\\\">60</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"80\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,219.01)\\\">80</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"100\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,168.76)\\\">100</text></g><g class=\\\"ytick\\\"><text text-anchor=\\\"end\\\" x=\\\"79\\\" y=\\\"4.199999999999999\\\" data-unformatted=\\\"120\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre; opacity: 1;\\\" transform=\\\"translate(0,118.51)\\\">120</text></g></g><g class=\\\"overaxes-above\\\"></g></g></g><g class=\\\"polarlayer\\\"></g><g class=\\\"smithlayer\\\"></g><g class=\\\"ternarylayer\\\"></g><g class=\\\"geolayer\\\"></g><g class=\\\"funnelarealayer\\\"></g><g class=\\\"pielayer\\\"></g><g class=\\\"iciclelayer\\\"></g><g class=\\\"treemaplayer\\\"></g><g class=\\\"sunburstlayer\\\"></g><g class=\\\"glimages\\\"></g></svg><div class=\\\"gl-container\\\"></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"562.984\\\" height=\\\"500\\\"><defs id=\\\"topdefs-c134b0\\\"><g class=\\\"clips\\\"></g><clipPath id=\\\"legendc134b0\\\"><rect width=\\\"101\\\" height=\\\"67\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></clipPath></defs><g class=\\\"indicatorlayer\\\"></g><g class=\\\"layer-above\\\"><g class=\\\"imagelayer\\\"></g><g class=\\\"shapelayer\\\"></g></g><g class=\\\"infolayer\\\"><g class=\\\"legend\\\" pointer-events=\\\"all\\\" transform=\\\"translate(450.26,100)\\\"><rect class=\\\"bg\\\" shape-rendering=\\\"crispEdges\\\" style=\\\"stroke: rgb(68, 68, 68); stroke-opacity: 1; fill: rgb(255, 255, 255); fill-opacity: 1; stroke-width: 0px;\\\" width=\\\"101\\\" height=\\\"67\\\" x=\\\"0\\\" y=\\\"0\\\"></rect><g class=\\\"scrollbox\\\" transform=\\\"\\\" clip-path=\\\"url(#legendc134b0)\\\"><g class=\\\"groups\\\"><g class=\\\"traces\\\" transform=\\\"translate(0,14.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"774\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">774</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(31, 119, 180); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"95.96484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,33.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"776\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">776</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(255, 127, 14); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"95.96484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g><g class=\\\"traces\\\" transform=\\\"translate(0,52.5)\\\" style=\\\"opacity: 1;\\\"><text class=\\\"legendtext\\\" text-anchor=\\\"start\\\" x=\\\"40\\\" y=\\\"4.680000000000001\\\" data-unformatted=\\\"777+775\\\" data-math=\\\"N\\\" style=\\\"font-family: &quot;Open Sans&quot;, verdana, arial, sans-serif; font-size: 12px; fill: rgb(68, 68, 68); fill-opacity: 1; white-space: pre;\\\">777+775</text><g class=\\\"layers\\\" style=\\\"opacity: 1;\\\"><g class=\\\"legendfill\\\"></g><g class=\\\"legendlines\\\"></g><g class=\\\"legendsymbols\\\"><g class=\\\"legendpoints\\\"><path class=\\\"legendundefined\\\" d=\\\"M6,6H-6V-6H6Z\\\" transform=\\\"translate(20,0)\\\" style=\\\"stroke-width: 0px; fill: rgb(44, 160, 44); fill-opacity: 1;\\\"></path></g></g></g><rect class=\\\"legendtoggle\\\" pointer-events=\\\"all\\\" x=\\\"0\\\" y=\\\"-9.5\\\" width=\\\"95.96484375\\\" height=\\\"19\\\" style=\\\"cursor: pointer; fill: rgb(0, 0, 0); fill-opacity: 0;\\\"></rect></g></g></g><rect class=\\\"scrollbar\\\" rx=\\\"20\\\" ry=\\\"3\\\" width=\\\"0\\\" height=\\\"0\\\" style=\\\"fill: rgb(128, 139, 164); fill-opacity: 1;\\\" x=\\\"0\\\" y=\\\"0\\\"></rect></g><g class=\\\"g-gtitle\\\"></g><g class=\\\"g-xtitle\\\"></g><g class=\\\"g-ytitle\\\"></g></g><g class=\\\"menulayer\\\"></g><g class=\\\"zoomlayer\\\"></g></svg><div class=\\\"modebar-container\\\" style=\\\"position: absolute; top: 0px; right: 0px; width: 100%;\\\"><div id=\\\"modebar-c134b0\\\" class=\\\"modebar modebar--hover ease-bg\\\"><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Download plot as a png\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m500 450c-83 0-150-67-150-150 0-83 67-150 150-150 83 0 150 67 150 150 0 83-67 150-150 150z m400 150h-120c-16 0-34 13-39 29l-31 93c-6 15-23 28-40 28h-340c-16 0-34-13-39-28l-31-94c-6-15-23-28-40-28h-120c-55 0-100-45-100-100v-450c0-55 45-100 100-100h800c55 0 100 45 100 100v450c0 55-45 100-100 100z m-400-550c-138 0-250 112-250 250 0 138 112 250 250 250 138 0 250-112 250-250 0-138-112-250-250-250z m365 380c-19 0-35 16-35 35 0 19 16 35 35 35 19 0 35-16 35-35 0-19-16-35-35-35z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn active\\\" data-title=\\\"Zoom\\\" data-attr=\\\"dragmode\\\" data-val=\\\"zoom\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000-25l-250 251c40 63 63 138 63 218 0 224-182 406-407 406-224 0-406-182-406-406s183-406 407-406c80 0 155 22 218 62l250-250 125 125z m-812 250l0 438 437 0 0-438-437 0z m62 375l313 0 0-312-313 0 0 312z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Pan\\\" data-attr=\\\"dragmode\\\" data-val=\\\"pan\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1000 350l-187 188 0-125-250 0 0 250 125 0-188 187-187-187 125 0 0-250-250 0 0 125-188-188 186-187 0 125 252 0 0-250-125 0 187-188 188 188-125 0 0 250 250 0 0-126 187 188z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Box Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"select\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 850l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-285l0-143 143 0 0 143-143 0z m857 0l0-143 143 0 0 143-143 0z m-857-286l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z m285 0l0-143 143 0 0 143-143 0z m286 0l0-143 143 0 0 143-143 0z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Lasso Select\\\" data-attr=\\\"dragmode\\\" data-val=\\\"lasso\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1031 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1018 538c-36 207-290 336-568 286-277-48-473-256-436-463 10-57 36-108 76-151-13-66 11-137 68-183 34-28 75-41 114-42l-55-70 0 0c-2-1-3-2-4-3-10-14-8-34 5-45 14-11 34-8 45 4 1 1 2 3 2 5l0 0 113 140c16 11 31 24 45 40 4 3 6 7 8 11 48-3 100 0 151 9 278 48 473 255 436 462z m-624-379c-80 14-149 48-197 96 42 42 109 47 156 9 33-26 47-66 41-105z m-187-74c-19 16-33 37-39 60 50-32 109-55 174-68-42-25-95-24-135 8z m360 75c-34-7-69-9-102-8 8 62-16 128-68 170-73 59-175 54-244-5-9 20-16 40-20 61-28 159 121 317 333 354s407-60 434-217c28-159-121-318-333-355z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom in\\\" data-attr=\\\"zoom\\\" data-val=\\\"in\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m1 787l0-875 875 0 0 875-875 0z m687-500l-187 0 0-187-125 0 0 187-188 0 0 125 188 0 0 187 125 0 0-187 187 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Zoom out\\\" data-attr=\\\"zoom\\\" data-val=\\\"out\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 875 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m0 788l0-876 875 0 0 876-875 0z m688-500l-500 0 0 125 500 0 0-125z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Autoscale\\\" data-attr=\\\"zoom\\\" data-val=\\\"auto\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 1000 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m250 850l-187 0-63 0 0-62 0-188 63 0 0 188 187 0 0 62z m688 0l-188 0 0-62 188 0 0-188 62 0 0 188 0 62-62 0z m-875-938l0 188-63 0 0-188 0-62 63 0 187 0 0 62-187 0z m875 188l0-188-188 0 0-62 188 0 62 0 0 62 0 188-62 0z m-125 188l-1 0-93-94-156 156 156 156 92-93 2 0 0 250-250 0 0-2 93-92-156-156-156 156 94 92 0 2-250 0 0-250 0 0 93 93 157-156-157-156-93 94 0 0 0-250 250 0 0 0-94 93 156 157 156-157-93-93 0 0 250 0 0 250z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a><a rel=\\\"tooltip\\\" class=\\\"modebar-btn\\\" data-title=\\\"Reset axes\\\" data-attr=\\\"zoom\\\" data-val=\\\"reset\\\" data-toggle=\\\"false\\\" data-gravity=\\\"n\\\"><svg viewBox=\\\"0 0 928.6 1000\\\" class=\\\"icon\\\" height=\\\"1em\\\" width=\\\"1em\\\"><path d=\\\"m786 296v-267q0-15-11-26t-25-10h-214v214h-143v-214h-214q-15 0-25 10t-11 26v267q0 1 0 2t0 2l321 264 321-264q1-1 1-4z m124 39l-34-41q-5-5-12-6h-2q-7 0-12 3l-386 322-386-322q-7-4-13-4-7 2-12 7l-35 41q-4 5-3 13t6 12l401 334q18 15 42 15t43-15l136-114v109q0 8 5 13t13 5h107q8 0 13-5t5-13v-227l122-102q5-5 6-12t-4-13z\\\" transform=\\\"matrix(1 0 0 -1 0 850)\\\"></path></svg></a></div><div class=\\\"modebar-group\\\"><a href=\\\"https://plotly.com/\\\" target=\\\"_blank\\\" data-title=\\\"Produced with Plotly.js (v2.9.0)\\\" class=\\\"modebar-btn plotlyjsicon modebar-btn--logo\\\"><svg xmlns=\\\"http://www.w3.org/2000/svg\\\" viewBox=\\\"0 0 132 132\\\" height=\\\"1em\\\" width=\\\"1em\\\"><defs><style>.cls-1 {fill: #3f4f75;} .cls-2 {fill: #80cfbe;} .cls-3 {fill: #fff;}</style></defs><title>plotly-logomark</title><g id=\\\"symbol\\\"><rect class=\\\"cls-1\\\" width=\\\"132\\\" height=\\\"132\\\" rx=\\\"6\\\" ry=\\\"6\\\"></rect><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"102\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"78\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"54\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"30\\\" r=\\\"6\\\"></circle><circle class=\\\"cls-2\\\" cx=\\\"30\\\" cy=\\\"54\\\" r=\\\"6\\\"></circle><path class=\\\"cls-3\\\" d=\\\"M30,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,30,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M78,72a6,6,0,0,0-6,6v24a6,6,0,0,0,12,0V78A6,6,0,0,0,78,72Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M54,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,54,48Z\\\"></path><path class=\\\"cls-3\\\" d=\\\"M102,48a6,6,0,0,0-6,6v48a6,6,0,0,0,12,0V54A6,6,0,0,0,102,48Z\\\"></path></g></svg></a></div></div></div><svg class=\\\"main-svg\\\" xmlns=\\\"http://www.w3.org/2000/svg\\\" xmlns:xlink=\\\"http://www.w3.org/1999/xlink\\\" width=\\\"562.984\\\" height=\\\"500\\\"><g class=\\\"hoverlayer\\\"></g></svg></div></div></div><p></p>\\n\"', '\"<p>ffhgfjhgjhfh</p>\\n\\n<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:24px\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[text id=239]</span></span></span></p>\\n\\n<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:10.5pt\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[chart id=22]</span></span></span></p>\\n\"', 1),
(250, 1, NULL, 147, '\"\"', '\"<p>hghjghjgjhgjh</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>[text id=240]</p>\\n\\n<p>[text id=241]</p>\\n\\n<p>&nbsp;</p>\\n\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"1\\\" cellspacing=\\\"1\\\" class=\\\"table\\\" style=\\\"height:400px; width:400px\\\">\\n\\t<caption>\\n\\t<p style=\\\"text-align:center\\\"><span style=\\\"font-size:24px\\\">ALL CHARTS</span></p>\\n\\t</caption>\\n\\t<tbody>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\"><span style=\\\"color:#2980b9\\\"><span style=\\\"font-size:24px\\\">cHart 1</span></span></td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\"><span style=\\\"color:#3498db\\\"><span style=\\\"font-size:20px\\\">charts</span></span></td>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">[chart id=23]</td>\\n\\t\\t\\t<td style=\\\"text-align:center\\\">[chart id=30]</td>\\n\\t\\t</tr>\\n\\t</tbody>\\n</table>\\n\\n<table align=\\\"center\\\" border=\\\"1\\\" cellpadding=\\\"1\\\" cellspacing=\\\"1\\\" class=\\\"table\\\" style=\\\"height:700px; width:700px\\\">\\n\\t<tbody>\\n\\t\\t<tr>\\n\\t\\t\\t<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[chart id=24]</td>\\n\\t\\t\\t<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [chart id=30]</td>\\n\\t\\t</tr>\\n\\t</tbody>\\n</table>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\"', 1),
(251, 1, NULL, 127, '\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size:28px\\\">FINAL REPORT</span></p>\\n\\n<p style=\\\"text-align: center;\\\">&nbsp;</p>\\n\\n<p style=\\\"text-align: center;\\\"><span style=\\\"font-size:20px\\\">THis is a final report.&nbsp;it is an asynthesis of all reports of the various topics and a final comment that will help you improve your company</span></p>\\n\"', '\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size:28px\\\">FINAL REPORT</span></p>\\n\\n<p style=\\\"text-align: center;\\\">&nbsp;</p>\\n\\n<p style=\\\"text-align: center;\\\"><span style=\\\"font-size:20px\\\">THis is a final report.&nbsp;it is an asynthesis of all reports of the various topics and a final comment that will help you improve your company</span></p>\\n\"', 1),
(252, 1, NULL, 146, '\"<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:22px\\\"><span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"> </span></span></span></span></span></p><table id=\\\"sortable_table1\\\" class=\\\"col-12 sortable\\\"><thead><tr><th></th><th></th></tr></thead><tbody><tr><td></td><td><div class=\\\"display-img mt-3\\\"><img src=\\\"https://www.diagnosiaziendale.it/uploads/storage/78_3_controllo-di-gestione.gif\\\" alt=\\\"78_3_controllo-di-gestione.gif\\\" class=\\\"mb-5\\\"></div>+<div class=\\\"display-files mt-3\\\"><a href=\\\"https://www.diagnosiaziendale.it/uploads/storage/78_3_Software Analisi di bilancio &amp; Rating - Cloud Finance.mp4\\\" class=\\\"mb-5\\\" download=\\\"\\\">78_3_Software Analisi di bilancio &amp; Rating - Cloud Finance.mp4</a></div></td></tr></tbody></table><p></p>\\n\\n<p><span style=\\\"font-size:20px\\\">the revenue of</span><span style=\\\"font-size:22px\\\">&nbsp;<span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"> </span></span></span></span></span></p><table id=\\\"responsive_table2\\\" class=\\\"col-12 responstable\\\"><thead><tr><th></th><th></th></tr></thead><tbody><tr><td></td><td>dsfsd</td></tr></tbody></table><span style=\\\"font-size:20px\\\">&nbsp;</span>for this year is <span style=\\\"font-size:11pt\\\"><span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"font-size:10.5pt\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"> <table id=\\\"responsive_table3\\\" class=\\\"col-12 responstable\\\"><thead><tr><th></th><th></th></tr></thead><tbody><tr><td></td><td>530000</td></tr></tbody></table> an dthe cost are&nbsp;<span style=\\\"font-size:22px\\\"> <table id=\\\"sortable_table4\\\" class=\\\"col-12 sortable\\\"><thead><tr><th></th><th></th></tr></thead><tbody><tr><td></td><td>4.99</td></tr></tbody></table></span></span></span></span></span></span></span><p></p>\\n\\n<p><span style=\\\"font-size:11pt\\\"><span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"font-size:10.5pt\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"><span style=\\\"font-size:22px\\\">so the business is&nbsp;</span></span></span></span><span style=\\\"font-size:22px\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"></span></span></span></span></span></span></p>\\n\"', '\"<p>&nbsp;</p>\\n\\n<p><span style=\\\"font-size:22px\\\"><span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[chart id=31]</span></span></span></span></span></p>\\n\\n<p><span style=\\\"font-size:20px\\\">the revenue of</span><span style=\\\"font-size:22px\\\">&nbsp;<span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[chart id=34]</span></span></span></span></span><span style=\\\"font-size:20px\\\">&nbsp;</span>for this year is <span style=\\\"font-size:11pt\\\"><span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"font-size:10.5pt\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[chart id=32] an dthe cost are&nbsp;<span style=\\\"font-size:22px\\\">[chart id=33]</span></span></span></span></span></span></span></p>\\n\\n<p><span style=\\\"font-size:11pt\\\"><span style=\\\"font-family:Calibri,sans-serif\\\"><span style=\\\"font-size:10.5pt\\\"><span style=\\\"background-color:white\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\"><span style=\\\"font-size:22px\\\">so the business is&nbsp;</span></span></span></span><span style=\\\"font-size:22px\\\"><span style=\\\"font-family:&quot;Segoe UI&quot;,sans-serif\\\"><span style=\\\"color:#23282c\\\">[text id=242]</span></span></span></span></span></span></p>\\n\"', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `testreport_test`
--

CREATE TABLE `testreport_test` (
  `testreport_id` int(10) UNSIGNED DEFAULT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `testreport_test`
--

INSERT INTO `testreport_test` (`testreport_id`, `test_id`) VALUES
(237, 60),
(240, 62),
(240, 64),
(242, 12),
(244, 43),
(243, 65),
(243, 66),
(245, 67),
(247, 68),
(248, 70),
(249, 72),
(251, 77),
(241, 1),
(252, 78),
(250, 76);

-- --------------------------------------------------------

--
-- Struttura della tabella `tests`
--

CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `tests`
--

INSERT INTO `tests` (`id`, `course_id`, `lesson_id`, `title`, `description`, `published`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'test1-production', 'dsadsa', 1, 'test1-production', '2021-03-08 14:45:08', '2021-03-08 14:45:08', NULL),
(2, 2, NULL, 'test1-service', 'sdfsdfsdf', 1, 'test1-service', '2021-03-08 14:47:15', '2021-03-08 14:47:15', NULL),
(3, 2, NULL, 'TEST SERVICE1', 'sdfsdf', 1, 'test-service1', '2021-03-08 17:51:54', '2021-03-08 17:51:54', NULL),
(4, 2, NULL, 'Marketing - service', 'Marketing Service Test', 1, 'marketing-service', '2021-03-08 18:11:00', '2021-07-19 03:15:44', NULL),
(5, 2, NULL, 'logistic - service', 'logistic', 1, 'logistic-service', '2021-03-08 18:11:35', '2021-03-08 18:22:36', NULL),
(6, 2, NULL, 'principal data - service', 'pricipal data', 1, 'principal-data-service', '2021-03-08 18:12:09', '2021-03-08 18:22:08', NULL),
(7, 2, NULL, 'Sales - Service', 'sales', 1, 'sales-service', '2021-03-08 18:23:21', '2021-03-08 18:23:21', NULL),
(8, 1, NULL, 'sales - Industry', 'sales', 1, 'sales-industry', '2021-03-08 18:24:28', '2021-03-14 08:56:16', NULL),
(9, 1, NULL, 'marketing- Industry', 'productio', 1, 'marketing-industry', '2021-03-08 18:24:57', '2021-03-14 08:55:52', NULL),
(10, 1, NULL, 'logistic- Industry', 'logistic', 1, 'logistic-industry', '2021-03-08 18:25:38', '2021-03-14 08:55:11', NULL),
(11, 1, NULL, 'principal data - Industry', 'sdfsadfs', 1, 'principal-data-industry', '2021-03-08 18:26:03', '2021-03-14 08:55:31', NULL),
(12, 3, NULL, 'Acquisti - Wholesale', 'dsfffffffffffffffffffffffffffffffffffff\r\ndsfffffffffffffffffffffff', 1, 'acquisti-wholesale', '2021-03-14 08:48:26', '2021-03-14 08:48:26', NULL),
(13, 3, NULL, 'Production - Wholesales', 'dsfds', 1, 'production-wholesales', '2021-03-14 08:48:51', '2021-03-14 08:48:51', NULL),
(14, 3, NULL, 'Marketing - Wholesales', 'dsfdfds', 1, 'marketing-wholesales', '2021-03-14 08:49:16', '2021-03-14 08:49:16', NULL),
(15, 3, NULL, 'Logistic - Wholesales', 'dfasd', 1, 'logistic-wholesales', '2021-03-14 08:49:35', '2021-03-14 08:49:35', NULL),
(16, 3, NULL, 'Principal data - Whalesales', 'asfasd', 1, 'principal-data-whalesales', '2021-03-14 08:50:03', '2021-03-14 08:50:03', NULL),
(17, 3, NULL, 'Economic Data - Wholesales', 'dsfds', 1, 'economic-data-wholesales', '2021-03-14 08:50:24', '2021-03-14 08:50:24', NULL),
(18, 2, NULL, 'economic Data - Service', 'sdfsd', 1, 'economic-data-service', '2021-03-14 08:51:41', '2021-03-14 08:51:41', NULL),
(19, 2, NULL, 'Acquisti - Service', 'sdfds', 1, 'acquisti-service', '2021-03-14 08:51:58', '2021-03-14 08:51:58', NULL),
(20, 1, NULL, 'Acquisti - Industry', 'sdfsd', 1, 'acquisti-industry', '2021-03-14 08:52:17', '2021-03-14 08:54:51', NULL),
(21, 1, NULL, 'economic Data - Industry', 'dsfdf', 1, 'economic-data-industry', '2021-03-14 08:52:36', '2021-03-14 08:54:33', NULL),
(22, 3, NULL, 'Your test', 'aS', 1, 'your-test', '2021-03-14 13:42:35', '2021-03-14 13:42:35', NULL),
(23, 1, NULL, 'Customer service - Industry', 'sdfsd', 1, 'customer-service-industry', '2021-03-14 18:14:15', '2021-03-14 18:14:15', NULL),
(24, 3, NULL, 'GENERAL DATA _ WHOLESALES', 'rwewrwe', 1, 'general-data-wholesales', '2021-03-15 10:28:30', '2021-03-15 10:28:30', NULL),
(25, 3, NULL, 'TEST CONDITION LOGIC', 'sdsdfsdf', 1, 'test-condition-logic', '2021-03-15 11:15:32', '2021-03-15 11:15:32', NULL),
(26, 2, NULL, 'TEST CONDITION LOGIC - SERVICE', 'fsdfdsfsdf', 1, 'test-condition-logic-service', '2021-03-15 11:16:01', '2021-03-15 11:16:01', NULL),
(27, 3, NULL, 'TEST 1 condition logic - whaolesale', 'dsfs', 1, 'test-1-condition-logic-whaolesale', '2021-03-15 11:16:27', '2021-03-15 11:16:27', NULL),
(28, 2, NULL, 'TEST CONDITION LOGIC 1 - SERVICE', 'asdsd', 1, 'test-condition-logic-1-service', '2021-03-15 11:16:54', '2021-03-15 11:16:54', NULL),
(29, 3, NULL, 'TEST creation of test', 'sadsafsd', 1, 'test-creation-of-test', '2021-03-15 11:29:57', '2021-03-15 11:29:57', NULL),
(30, 2, NULL, 'newtest1-servcie', 'assa', 1, 'newtest1-servcie', '2021-03-15 11:59:15', '2021-03-15 11:59:15', NULL),
(31, 3, NULL, 'newtest1-wholsale', 'asss', 1, 'newtest1-wholsale', '2021-03-15 11:59:40', '2021-03-15 11:59:40', NULL),
(32, 2, NULL, 'newtest 2 -service', 'asasa', 1, 'newtest-2-service', '2021-03-15 12:00:09', '2021-03-15 12:00:09', NULL),
(33, 3, NULL, 'newtest2 -whalesales', 'dsfdsf', 1, 'newtest2-whalesales', '2021-03-15 12:00:32', '2021-03-15 12:00:32', NULL),
(34, 2, NULL, 'test3', 'assdasd', 1, 'test3', '2021-03-15 13:14:44', '2021-03-15 13:14:44', NULL),
(35, 2, NULL, 'TEST 10 - service', 'asdas', 1, 'test-10-service', '2021-03-16 17:08:53', '2021-03-16 17:08:53', NULL),
(36, 3, NULL, 'TEST10 -wholesale', 'asdsad', 1, 'test10-wholesale', '2021-03-16 17:09:17', '2021-03-16 17:09:17', NULL),
(37, 2, NULL, 'TEST11-service', 'sda', 1, 'test11-service', '2021-03-16 17:09:38', '2021-03-16 17:09:38', NULL),
(38, 3, NULL, 'TEST11-wholesales', 'dsfds', 1, 'test11-wholesales', '2021-03-16 17:10:04', '2021-03-16 17:10:04', NULL),
(39, 1, NULL, 'Final Test', 'as', 1, 'final-test', '2021-03-18 22:53:58', '2021-03-18 22:53:58', NULL),
(40, 1, NULL, 'prova17marzo 1 - industry', 'dsfds', 1, 'prova17marzo-1-industry', '2021-03-19 15:09:59', '2021-03-19 15:10:50', NULL),
(41, 2, NULL, 'prova17marzo 2 - service', 'fgfdg', 1, 'prova17marzo-2-service', '2021-03-19 15:10:22', '2021-03-19 15:10:22', NULL),
(42, 3, NULL, 'prova17marzo 1 - wholesales', 'reeeee', 1, 'prova17marzo-1-wholesales', '2021-03-19 15:11:14', '2021-03-19 15:11:14', NULL),
(43, 1, NULL, 'prova17marzo 2 - industry', 'gdsgd', 1, 'prova17marzo-2-industry', '2021-03-19 15:11:32', '2021-03-19 15:11:32', NULL),
(44, 2, NULL, 'prova17marzo 1 - service', 'dfgdf', 1, 'prova17marzo-1-service', '2021-03-19 15:11:52', '2021-03-19 15:17:21', NULL),
(45, 3, NULL, 'prova17marzo 2 - wholesales', 'gsdfg', 1, 'prova17marzo-2-wholesales', '2021-03-19 15:12:18', '2021-03-19 15:12:18', NULL),
(46, 2, NULL, 'PROVA1 CCOMPLETA- SERVICE', 'AF', 1, 'prova1-ccompleta-service', '2021-04-08 08:11:56', '2021-04-08 08:11:56', NULL),
(47, 2, NULL, 'PROVA2COMPLETA-SERVICE', 'SASDF', 1, 'prova2completa-service', '2021-04-08 08:12:19', '2021-04-08 08:12:19', NULL),
(48, 3, NULL, 'PROVA1COMPLETA-WHOLESALE', 'DFSG', 1, 'prova1completa-wholesale', '2021-04-08 08:12:52', '2021-04-08 08:12:52', NULL),
(49, 3, NULL, 'PROVA2COMPLETA-WHOLESALE', 'SDFSDF', 1, 'prova2completa-wholesale', '2021-04-08 08:13:11', '2021-04-08 08:13:11', NULL),
(50, 4, NULL, 'Integration', 'Int', 1, 'integration', '2021-05-31 19:10:49', '2021-05-31 19:10:49', NULL),
(51, 4, NULL, 'Test', 'Test Desc', 1, 'test', '2021-07-14 07:40:55', '2021-07-14 07:40:55', NULL),
(52, 1, NULL, 'Test', 'asdfas', 1, 'test', '2021-07-15 08:37:46', '2021-07-15 08:37:46', NULL),
(53, 1, NULL, 'test 1 math', 'testing purpose', 1, 'test-1-math', '2021-08-28 12:08:00', '2021-08-28 12:08:00', NULL),
(54, 5, NULL, 'GK Test Title', 'Which city called pink city ?', 1, 'gk-test-title', '2021-11-16 14:35:53', '2021-11-17 06:25:38', NULL),
(55, 3, NULL, 'test', 'test', 1, 'test', '2021-11-26 15:09:23', '2021-11-26 15:09:23', NULL),
(56, 3, NULL, 'test 1', 'test 1', 1, 'test-1', '2021-11-26 15:10:06', '2021-11-26 15:10:06', NULL),
(57, 2, NULL, 'Proof 1 - service', 'Proof 1 - service', 1, 'proof-1-service', '2021-11-29 14:21:42', '2021-11-29 14:21:42', NULL),
(58, 2, NULL, 'Proof 2 - Service', 'Proof 2 - Service', 1, 'proof-2-service', '2021-11-29 14:22:07', '2021-11-29 14:22:07', NULL),
(59, 2, NULL, 'proof 3 - srvice', 'jhgjh', 1, 'proof-3-srvice', '2021-12-10 09:49:24', '2021-12-10 09:49:24', NULL),
(60, 6, NULL, 'B Course Test 1', 'Test is test okay', 1, 'b-course-test-1', '2021-12-28 03:07:59', '2021-12-28 03:07:59', NULL),
(61, 6, NULL, 'New Test 2', 'han g', 1, 'new-test-2', '2022-01-18 03:55:54', '2022-01-18 03:55:54', NULL),
(62, 1, NULL, 'This is test1', 'it is thing to for test1', 1, 'this-is-test1', '2022-02-19 05:44:53', '2022-02-19 05:44:53', NULL),
(63, 6, NULL, 'test for first point 2022-6-10', 'Hello\r\n\r\nThis test created at 2022-06-10', 1, 'test-for-first-point-2022-6-10', '2022-06-09 12:01:36', '2022-06-09 12:01:36', NULL),
(64, 6, NULL, 'test for logic 6-21', 'hope well', 1, 'test-for-logic-6-21', '2022-06-21 10:44:44', '2022-06-21 10:45:37', NULL),
(65, 6, NULL, '29luglio_bcourse', 'ddas', 1, '29luglio-bcourse', '2022-06-30 06:23:52', '2022-06-30 06:23:52', NULL),
(66, 1, NULL, '29luglio_industry', 'sadasdasd', 1, '29luglio-industry', '2022-06-30 06:24:15', '2022-06-30 06:24:15', NULL),
(67, 6, NULL, 'test 6_7', 'adsdAS', 1, 'test-6-7', '2022-07-06 17:03:06', '2022-07-06 17:03:06', NULL),
(68, 6, NULL, '7-7', 'dfsdg', 1, '7-7', '2022-07-06 19:37:16', '2022-07-06 19:37:16', NULL),
(69, 6, NULL, '8-7_1', 'sdfsd', 1, '8-7-1', '2022-07-07 06:21:30', '2022-07-07 06:21:30', NULL),
(70, 6, NULL, '8-7-2', 'sdfsaf', 1, '8-7-2', '2022-07-07 06:21:58', '2022-07-07 06:21:58', NULL),
(71, 6, NULL, '9 luglio test- bcourse', 'ghjg', 1, '9-luglio-test-bcourse', '2022-07-08 16:43:30', '2022-07-08 16:43:30', NULL),
(72, 6, NULL, '9 lugio test 1 - bcourse', 'hgjhgjh', 1, '9-lugio-test-1-bcourse', '2022-07-08 16:47:12', '2022-07-08 16:47:12', NULL),
(73, 6, NULL, 'test 1 8-7', 'test 1 8-7', 1, 'test-1-8-7', '2022-07-08 17:10:36', '2022-07-08 17:10:36', NULL),
(74, 6, NULL, 'test -- 1 10-7', 'Hello test --1 10-7', 1, 'test-1-10-7', '2022-07-10 12:46:00', '2022-07-10 12:50:43', NULL),
(75, 6, NULL, '11 prova 1', 'hghj', 1, '11-prova-1', '2022-07-11 05:22:24', '2022-07-11 05:22:24', NULL),
(76, 6, NULL, '11 prova 2', 'jjkhkjh', 1, '11-prova-2', '2022-07-11 05:22:44', '2022-07-11 05:22:44', NULL),
(77, 6, NULL, 'final report', 'sdfsfsdfsdfsad', 1, 'final-report', '2022-07-13 17:11:19', '2022-07-13 17:11:19', NULL),
(78, 6, NULL, 'organizzation  - b_course', 'asddASDAs', 1, 'organizzation-b-course', '2022-07-14 05:36:33', '2022-07-14 05:39:30', NULL),
(79, 1, NULL, 'Orgnaizzation  -  Industry', 'sdfsdafdasf', 1, 'orgnaizzation-industry', '2022-07-14 05:37:09', '2022-07-14 05:40:04', NULL),
(80, 2, NULL, 'organizzation - service', 'safsdf', 1, 'organizzation-service', '2022-07-14 05:40:32', '2022-07-14 05:40:32', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `tests_results`
--

CREATE TABLE `tests_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `test_result` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `tests_results_answers`
--

CREATE TABLE `tests_results_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `tests_result_id` int(10) UNSIGNED DEFAULT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` int(10) UNSIGNED DEFAULT NULL,
  `correct` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `textgroups`
--

CREATE TABLE `textgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `score` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `logic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `text_order` int(255) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `textgroups`
--

INSERT INTO `textgroups` (`id`, `score`, `user_id`, `title`, `logic`, `text_order`, `test_id`, `content`, `short_code`) VALUES
(216, '[\"123\"]', 1, 'asdasdasdsd', '[[]]', 9, NULL, '[\"nbasjkdbhasbdi\"]', '[text id=216]'),
(219, '[\"20\"]', 1, 'TextGroupTest', '[[[\"0\",\"465\",\"0\",\"[1,0]\"],[\"0\",\"466\",\"0\",\"[1,0,0]\"],[\"0\",\"467\",\"0\",\"[0,1]\"]]]', 10, NULL, '[\"TextGroupTest\"]', '[text id=217]'),
(221, '[\"10\",\"\"]', 1, 'test textgroup1', '[[[\"0\",\"478\",\"0\",\"[1,0]\"],[\"0\",\"477\",\"0\",\"[0,1]\"]],[[\"0\",\"477\",\"0\",\"[0,0]\"],[\"0\",\"478\",\"0\",\"[0,0]\"]]]', 12, NULL, '[\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"BBBBBBBBBBBBBBBBB\"]', '[text id=221]'),
(222, '[\"50\"]', 1, 'KKK test text group', '[[[\"0\",\"466\",\"0\",\"[1,0,0]\"],[\"0\",\"467\",\"0\",\"[1,1]\"],[\"0\",\"469\",\"0\",\"[\\\"50\\\",\\\"10\\\",\\\"20\\\",\\\"5\\\"]\"]]]', 13, NULL, '[\"KKK test text group\"]', '[text id=222]'),
(223, '[\"10\"]', 1, '7 marzo', '[[]]', 14, NULL, '[\"prova 1 7 marzo\"]', '[text id=223]'),
(224, '[\"30\"]', 1, 'test for logic 6-21', '[[]]', 15, NULL, '[\"This is textgroup for test for logic 6-21\"]', '[text id=224]'),
(227, '[\"20\",\"30\"]', 1, 'Acuqisti - Wholesale', '[[[\"0\",\"707\",\"0\",\"[1,0,0,0,0]\"],[\"0\",\"708\",\"0\",\"[0,0,0,0,1]\"]],[[\"0\",\"707\",\"0\",\"[0,1,0,0,0]\"],[\"0\",\"708\",\"0\",\"[0,0,0,1,0]\"]]]', 16, NULL, '[\"The business is good\",\"The business is bad\"]', '[text id=225]'),
(228, '[\"10\",\"30\",\"40\"]', 1, 'text29 giugno', '[[[\"0\",\"728\",\"0\",\"[1,0,0]\"],[\"1\",\"729\",\"0\",\"[1,0,0]\"]],[[\"0\",\"728\",\"0\",\"[0,1,0]\"],[\"0\",\"729\",\"0\",\"[0,1,0]\"]],[[\"0\",\"727\",\"4\",\"50\"]]]', 17, NULL, '[\"good (answer aa and answer ff)\",\"bed (answer aa and gg)\",\"medium (answer bb and gg)\"]', '[text id=228]'),
(232, '[\"100\",\"200\"]', 1, 'This text group is for prova17marzo', '[[[\"0\",\"742\",\"0\",\"[0,1,0,0]\"],[\"0\",\"748\",\"0\",\"[0,1,0,0]\"]],[[\"0\",\"742\",\"0\",\"[0,0,0,1]\"],[\"0\",\"748\",\"0\",\"[0,0,0,1]\"]]]', 18, NULL, '[\"The result is good\",\"The result is bad\"]', '[text id=229]'),
(233, '[\"10\",\"\"]', 1, 'ASDD', '[[[\"0\",\"765\",\"0\",\"[1,0]\"],[\"1\",\"766\",\"1\",\"[1,0,0]\"]],[[\"0\",\"765\",\"0\",\"[0,1]\"],[\"0\",\"766\",\"0\",\"[0,1,0]\"]]]', 19, NULL, '[\"good\",\"bed\"]', '[text id=233]'),
(234, '[\"10\",\"20\"]', 1, 'dfs', '[[[\"0\",\"767\",\"0\",\"[1,0,0]\"],[\"1\",\"768\",\"0\",\"[1,0,0]\"]],[[\"0\",\"767\",\"1\",\"[0,0,1]\"],[\"0\",\"768\",\"0\",\"[0,0,1]\"]]]', 20, NULL, '[\"super good\",\"superbed\"]', '[text id=234]'),
(238, '[\"11\",\"2\"]', 1, NULL, '[[[\"0\",\"742\",\"0\",\"[0,1,0,0]\"],[\"0\",\"743\",\"0\",\"[0,1,0,0]\"]],[[\"0\",\"742\",\"0\",\"[0,0,1,0]\"],[\"0\",\"743\",\"0\",\"[0,0,0,0]\"]]]', 24, NULL, '[\"good\",\"bad\"]', '[text id=238]'),
(239, '[\"\",\"\"]', 1, 'ghjg', '[[[\"0\",\"775\",\"0\",\"[0,0,1]\"]],[[\"0\",\"776\",\"0\",\"[1,0,0]\"],[\"0\",\"774\",\"0\",\"[1,0,0]\"]]]', 25, NULL, '[\"gooooood\",\"beeed\"]', '[text id=239]'),
(240, '[\"10\",\"30\"]', 1, 'hkjhjk', '[[[\"0\",\"802\",\"0\",\"[1,0,0]\"],[\"0\",\"800\",\"0\",\"[1,0,0]\"]],[[\"0\",\"802\",\"1\",\"[1,0,0]\"],[\"0\",\"800\",\"1\",\"[1,0,0]\"]]]', 26, NULL, '[\"gooood\",\"beeeed\"]', '[text id=240]'),
(241, '[\"20\",\"40\"]', 1, NULL, '[[[\"0\",\"802\",\"0\",\"[1,0,0]\"],[\"0\",\"803\",\"0\",\"[1,0,0]\"]],[[\"0\",\"802\",\"1\",\"[0,0,1]\"],[\"0\",\"803\",\"1\",\"[0,0,1]\"]]]', 27, NULL, '[\"big....\",\"small\"]', '[text id=241]'),
(242, '[\"\",\"\"]', 1, 'prova', '[[[\"0\",\"811\",\"0\",\"[1,0]\"]],[[\"0\",\"811\",\"1\",\"[1,0]\"]]]', 28, NULL, '[\"good\",\"bed\"]', '[text id=242]');

-- --------------------------------------------------------

--
-- Struttura della tabella `textgroup_test`
--

CREATE TABLE `textgroup_test` (
  `text_id` int(10) UNSIGNED DEFAULT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `textgroup_test`
--

INSERT INTO `textgroup_test` (`text_id`, `test_id`) VALUES
(216, 61),
(219, 61),
(221, 62),
(222, 62),
(223, 62),
(224, 64),
(227, 12),
(228, 65),
(228, 66),
(232, 1),
(233, 67),
(234, 68),
(235, 70),
(236, 1),
(237, 1),
(238, 1),
(239, 72),
(240, 76),
(241, 75),
(242, 78);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `dob`, `phone`, `gender`, `address`, `city`, `pincode`, `state`, `country`, `avatar_type`, `avatar_location`, `password`, `password_changed_at`, `active`, `confirmation_code`, `confirmed`, `timezone`, `last_login_at`, `last_login_ip`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`) VALUES
(1, 'b65b1a8e-e265-4b28-aa69-8acf10b7aa18', 'Admin', 'Istrator', 'admin@lms.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$qDDdBNqY3Y/9rBmvXZFuT.4wMQ.nS7gWEWlvdjohrSiImZ3p2mWJW', NULL, 1, '20637027fdcd7c1b5007c45a3add1163', 1, NULL, '2022-07-27 09:47:13', '110.226.124.211', NULL, '2020-12-14 19:28:21', '2022-07-27 09:47:13', NULL, NULL, NULL, NULL, NULL),
(2, '47e2f580-ee44-4dd3-bbb0-bd81e8fc2c6d', 'Teacher', 'Test', 'teacher@lms.com', NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$qDDdBNqY3Y/9rBmvXZFuT.4wMQ.nS7gWEWlvdjohrSiImZ3p2mWJW', NULL, 1, 'b625d3817a199870f749085d03f30cc7', 1, NULL, '2021-06-26 06:43:18', '188.43.136.32', NULL, '2020-12-14 19:28:21', '2021-11-17 06:14:19', NULL, NULL, NULL, NULL, NULL),
(3, '18e693f1-c276-4e98-8c93-71d9c36e686f', 'Student', 'User', 'student@lms.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'storage', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, '9016257594f0ab8e9cf9f48445c6e0a5', 1, NULL, '2022-07-27 09:23:33', '43.246.141.211', NULL, '2020-12-14 19:28:21', '2022-07-27 09:23:33', NULL, NULL, NULL, NULL, NULL),
(4, '146c3673-673e-4b4c-ade7-8cfd4f3e1dd7', 'Normal', 'User', 'user@lms.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, '97517de76bcb031e2b5a266e57f7bbfb', 1, NULL, NULL, NULL, NULL, '2020-12-14 19:28:21', '2020-12-14 19:28:21', NULL, NULL, NULL, NULL, NULL),
(5, '21f7b1a5-0405-41be-8fa5-9de55f8a7810', 'rosario', 'rosario', 'info@costisnelli.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$b3Wb9HmYYe1a95kzI/8hg.bd8DgDLq3nUayHtXyKZ84P74Ek67nqW', NULL, 1, NULL, 1, NULL, '2022-02-15 18:45:18', '188.217.50.46', NULL, '2021-03-08 17:49:52', '2022-02-15 18:45:18', NULL, NULL, NULL, NULL, NULL),
(6, 'fb5831e7-e4ce-4dd1-913b-f0953da2fb6e', 'harry', 'harry', 'harry@lms.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, NULL, 1, NULL, '2021-03-14 05:16:16', '188.43.136.32', NULL, '2021-03-12 02:09:25', '2021-03-14 05:16:16', NULL, NULL, NULL, NULL, NULL),
(7, 'c7666c30-3484-4e32-949e-b5e833938a6c', 'alex', 'alex', 'alex@lms.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, '2021-03-13 13:25:03', '2021-03-13 13:25:03', NULL, NULL, NULL, NULL, NULL),
(8, '4d375f31-a5ad-4f1a-9435-cc3589e1849c', 'dvo', 'dvo', 'dvo@lms.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, NULL, 1, NULL, '2021-03-13 13:44:10', '127.0.0.1', NULL, '2021-03-13 13:27:26', '2021-03-13 13:44:10', NULL, NULL, NULL, NULL, NULL),
(9, 'dd3b5cd3-b9f3-455f-8bd5-701dc473d2eb', 'Mykola', 'Kulpa', 'talent.webstar0225@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, NULL, 1, NULL, '2021-05-17 20:09:29', '188.43.136.32', NULL, '2021-05-17 20:08:54', '2021-05-17 20:09:29', NULL, NULL, NULL, NULL, NULL),
(11, '78041f01-55d6-4f37-9930-4254d8d192c6', 'fdsfsf', 'adadasd', 'pac.ros68@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$nMPC8OIB3icB6Gub/K.hHOvl9ncoJY0HRWTg1rmdX9nKP8tdW0d3y', NULL, 1, NULL, 1, NULL, '2021-10-20 17:17:17', '109.117.188.201', NULL, '2021-06-26 14:25:46', '2021-10-20 17:17:17', NULL, NULL, NULL, NULL, NULL),
(12, 'e9e33b28-7796-4c0e-9b1d-088b7cf7ba2a', 'Viktoria', 'Elsa', 'khanmaiprogram@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$MpHwgkZt172RmRbCMsQbSuF8pi8Yr/5d7bNZkKXWoTkPD6xrWVMpa', NULL, 1, NULL, 1, NULL, '2021-10-11 09:45:52', '80.237.47.16', NULL, '2021-10-11 08:31:18', '2021-10-11 09:45:52', NULL, NULL, NULL, NULL, NULL),
(13, '691749d9-b4c4-400a-bbc9-57326acd5f66', 'Pranav', 'Dubey', 'pranav@topsinfosolution.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$V7n73RWT3azMutPeI2Ghj.qupYXjpuF8vklMiTVtoGK4Xsxa0ZQtK', NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, '2021-10-20 10:17:00', '2021-10-20 10:17:00', NULL, NULL, NULL, NULL, NULL),
(14, 'b65b1a8e-e265-4b28-aa69-8acf10b7aa18', 'Admin', 'Istrator', 'info@wimedica.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$bxozkoos65CLZLgDFq7lZuoHn0SFHC7L70U6ZIWjaKWF/nZFg/1Mm', NULL, 1, '20637027fdcd7c1b5007c45a3add1163', 1, NULL, '2021-10-19 12:45:03', '80.237.47.16', NULL, '2020-12-14 19:28:21', '2021-10-19 12:47:06', NULL, NULL, NULL, NULL, NULL),
(15, 'f2d5d2c4-8f8e-4f1c-a53b-5afb2cd3f7dc', 'rosario', 'pace', 'info@diagnosiaziendale.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$whuzBudgwi4DCf1yJyDSl.qhVzlxRyvCt.Qp/KsO91ldaxuYEkQhS', NULL, 1, NULL, 1, NULL, '2021-10-21 07:23:37', '109.117.188.201', NULL, '2021-10-21 07:23:18', '2021-10-21 07:23:37', NULL, NULL, NULL, NULL, NULL),
(16, 'bbd973fa-f551-4cc8-82ca-1b75fd51df58', 'li', 'hikap', 'hikap888@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$XtUeaNmdlqlIdq9b7HECZuc/LJTm9U07Uy5TxhoNCdeNKJkCgQLIi', NULL, 1, NULL, 1, NULL, '2021-10-27 13:11:34', '188.43.136.33', NULL, '2021-10-27 13:11:29', '2021-10-27 13:11:34', NULL, NULL, NULL, NULL, NULL),
(17, 'e13af582-43f2-4681-a943-d2e7247c9cd0', 'Vikas', 'William', 'vikaswilliam222@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$PpIVLHu.45sQ7phBRX0QaO4h4Cl2vCtLQxv2twhq0QcD.aaZiahc.', NULL, 1, NULL, 1, NULL, '2021-11-15 16:33:39', '80.237.47.16', NULL, '2021-11-15 16:33:37', '2021-11-15 16:33:39', NULL, NULL, NULL, NULL, NULL),
(18, '2e091f91-4ea0-486c-b049-ded567872af5', 'rosario', 'rosario', 'prova15febbraio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$fhmLIL7wsygWYkePaesHiubRhuXfbz1wpPSnG2Il1xA9U9QQCut/2', NULL, 1, NULL, 1, NULL, '2022-02-16 11:17:11', '188.217.50.46', NULL, '2022-02-15 18:47:13', '2022-02-16 11:17:11', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_answer`
--

CREATE TABLE `user_answer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_id` varchar(191) DEFAULT NULL,
  `question_id` varchar(250) DEFAULT NULL,
  `q_id` varchar(10) NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `score` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `user_answer`
--

INSERT INTO `user_answer` (`id`, `user_id`, `test_id`, `question_id`, `q_id`, `answer`, `score`) VALUES
(6393, 3, '2', '755', '755', '10', '10'),
(8757, 3, '43', '741', '741', '100', '0'),
(8758, 3, '43', '743', '743', '2', '2'),
(8759, 3, '43', '747', '747', '1', '10'),
(8760, 3, '43', '742', '742', '10', '10'),
(8761, 3, '43', '750', '750', '6400', '0'),
(8762, 3, '43', '748', '748', '2', '2'),
(8763, 3, '43', '749', '749', '3', '3'),
(8764, 3, '43', '745', 'q_id1', '10', '0'),
(8765, 3, '43', '745', 'q_id2', '20', '0'),
(8766, 3, '43', '745', 'q_id3', '30', '0'),
(8767, 3, '43', '745', 'q_id4', '40', '0'),
(8768, 3, '43', '746', 'q_id2', '200', '200'),
(8769, 3, '43', '746', 'q_id3', '300', '300'),
(10568, 3, '68', '767', '767', '10', '10'),
(10602, 3, '69', '770', '770', '60', '60'),
(10603, 3, '69', '769', '769', '10', '10'),
(10636, 3, '71', '774', '774', '10', '10'),
(10637, 3, '71', '775', '775', '40', '40'),
(10738, 3, '70', '762', '762', '1', '0'),
(10739, 3, '70', '762', '762', '1', '0'),
(12655, 3, '72', '762', '762', '4', '0'),
(12656, 3, '72', '777', '777', '61', '61'),
(13477, 3, '66', '729', '729', '20', '20'),
(13478, 3, '66', '728', '728', '1', '1'),
(13806, 3, '65', '761', '761', '900', '900'),
(13809, 3, '77', '804', '804', '4', '0'),
(14285, 3, '1', '770', '770', '40', '40'),
(14286, 3, '1', '800', '800', '100', '100'),
(14287, 3, '1', '762', '762', '4', '0'),
(14288, 3, '1', '767', '767', '10', '10'),
(14289, 3, '1', '792', '792', '10', '10'),
(14290, 3, '1', '794', '794', '50', '50'),
(14291, 3, '1', '790', '790', '10', '10'),
(14292, 3, '1', '795', '795', '10', '10'),
(14293, 3, '1', '793', '793', '40', '40'),
(14294, 3, '1', '802', '802', '10', '10'),
(14295, 3, '1', '803', '803', '40', '40'),
(14432, 3, '78', '805', '805', '[{\"name\":\"78_3_controllo-di-gestione.gif\",\"type\":\"image\"},{\"name\":\"78_3_Software Analisi di bilancio & Rating - Cloud Finance.mp4\",\"type\":\"other\"}]', '0'),
(15151, 3, '78', '810', '810', 'dsfsd', 'dsfsd'),
(15152, 3, '78', '812', '812', '40', '40'),
(15153, 3, '78', '808', '808', '340000', '340000'),
(15154, 3, '78', '809', '809', '4.99', '4.99'),
(15155, 3, '78', '813', 'q_id1', '10', '0'),
(15156, 3, '78', '813', 'q_id2', '20', '0'),
(15157, 3, '78', '813', 'q_id3', '30', '0'),
(15158, 3, '78', '813', 'q_id4', '40', '0'),
(15159, 3, '78', '813', 'q_id5', '50', '0'),
(15160, 3, '78', '813', 'q_id6', '60', '0'),
(15161, 3, '78', '813', 'q_id7', '70', '0'),
(15162, 3, '78', '813', 'q_id8', '80', '0'),
(15163, 3, '78', '813', 'q_id9', '90', '0'),
(15164, 3, '78', '814', 'q_id2', '0', '0'),
(15165, 3, '78', '814', 'q_id4', '0', '0'),
(15166, 3, '78', '814', 'q_id9', '0', '0'),
(15167, 3, '75', '802', '802', '10', '10'),
(15168, 3, '75', '803', '803', '40', '40'),
(15169, 3, '76', '800', '800', '200', '200'),
(15170, 3, '76', '802', '802', '10', '10'),
(15171, 3, '76', '803', '803', '40', '40');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_test`
--

CREATE TABLE `user_test` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `test_id` int(10) NOT NULL,
  `reported` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `user_test`
--

INSERT INTO `user_test` (`id`, `user_id`, `test_id`, `reported`, `created_at`) VALUES
(3, 3, 66, 1, '2022-07-05 08:14:57'),
(5, 3, 43, 1, '2022-07-05 14:20:55'),
(6, 3, 43, 1, '2022-07-05 14:23:01'),
(7, 3, 43, 1, '2022-07-05 14:24:46'),
(8, 3, 43, 1, '2022-07-05 14:29:35'),
(9, 3, 43, 1, '2022-07-05 14:29:55'),
(10, 3, 43, 1, '2022-07-05 18:00:52'),
(11, 3, 43, 1, '2022-07-06 12:23:45'),
(12, 3, 43, 1, '2022-07-06 12:24:55'),
(13, 3, 43, 1, '2022-07-06 12:26:27'),
(14, 3, 43, 1, '2022-07-06 12:27:12'),
(15, 3, 43, 1, '2022-07-06 12:31:57'),
(16, 3, 43, 1, '2022-07-06 12:37:08'),
(17, 3, 43, 1, '2022-07-06 12:38:38'),
(18, 3, 43, 1, '2022-07-06 12:38:51'),
(19, 3, 43, 1, '2022-07-06 12:44:24'),
(20, 3, 43, 1, '2022-07-06 12:44:53'),
(21, 3, 43, 1, '2022-07-06 12:45:03'),
(22, 3, 43, 1, '2022-07-06 12:47:46'),
(23, 3, 43, 1, '2022-07-06 12:48:11'),
(24, 3, 43, 1, '2022-07-06 12:48:23'),
(25, 3, 43, 1, '2022-07-06 12:48:57'),
(26, 3, 43, 1, '2022-07-06 12:52:02'),
(27, 3, 43, 1, '2022-07-06 12:52:12'),
(28, 3, 43, 1, '2022-07-06 12:55:31'),
(29, 3, 43, 1, '2022-07-06 12:55:41'),
(30, 3, 43, 1, '2022-07-06 12:57:34'),
(31, 3, 43, 1, '2022-07-06 12:58:51'),
(32, 3, 43, 1, '2022-07-06 14:06:15'),
(33, 3, 43, 1, '2022-07-06 14:06:49'),
(34, 3, 43, 1, '2022-07-06 14:27:36'),
(35, 3, 65, 1, '2022-07-06 14:54:40'),
(36, 3, 65, 1, '2022-07-06 15:33:13'),
(37, 3, 66, 1, '2022-07-06 16:01:57'),
(38, 3, 65, 1, '2022-07-06 16:02:06'),
(39, 3, 66, 1, '2022-07-06 16:06:23'),
(40, 3, 66, 1, '2022-07-06 16:10:17'),
(41, 3, 65, 1, '2022-07-06 16:18:04'),
(42, 3, 65, 1, '2022-07-06 16:22:10'),
(43, 3, 65, 1, '2022-07-06 17:34:39'),
(44, 3, 65, 1, '2022-07-06 18:14:51'),
(45, 3, 65, 1, '2022-07-06 18:20:37'),
(46, 3, 65, 1, '2022-07-06 18:20:43'),
(47, 3, 65, 1, '2022-07-06 18:30:48'),
(48, 3, 65, 1, '2022-07-06 18:39:31'),
(49, 3, 65, 1, '2022-07-06 18:40:10'),
(50, 3, 65, 1, '2022-07-06 18:44:01'),
(51, 3, 65, 1, '2022-07-06 18:45:16'),
(52, 3, 65, 1, '2022-07-06 18:45:45'),
(53, 3, 65, 1, '2022-07-06 18:46:35'),
(54, 3, 67, 1, '2022-07-06 19:14:20'),
(55, 3, 67, 1, '2022-07-06 19:14:38'),
(56, 3, 67, 1, '2022-07-06 19:14:39'),
(57, 3, 67, 1, '2022-07-06 19:22:40'),
(58, 3, 67, 1, '2022-07-06 19:30:07'),
(59, 3, 67, 1, '2022-07-06 19:30:15'),
(60, 3, 67, 1, '2022-07-06 19:49:42'),
(61, 3, 67, 1, '2022-07-06 19:51:27'),
(62, 3, 67, 1, '2022-07-06 20:04:21'),
(63, 3, 67, 1, '2022-07-06 20:04:52'),
(64, 3, 67, 1, '2022-07-06 20:05:13'),
(65, 3, 67, 1, '2022-07-06 20:07:06'),
(66, 3, 67, 1, '2022-07-06 20:08:09'),
(67, 3, 67, 1, '2022-07-06 20:08:13'),
(68, 3, 67, 1, '2022-07-06 20:08:25'),
(69, 3, 67, 1, '2022-07-06 20:08:50'),
(70, 3, 67, 1, '2022-07-06 20:09:02'),
(71, 3, 67, 1, '2022-07-06 20:09:20'),
(72, 3, 67, 1, '2022-07-06 20:09:21'),
(73, 3, 67, 1, '2022-07-06 20:09:22'),
(74, 3, 67, 1, '2022-07-06 20:09:22'),
(75, 3, 67, 1, '2022-07-06 20:10:40'),
(76, 3, 67, 1, '2022-07-06 20:12:56'),
(77, 3, 67, 1, '2022-07-06 20:13:21'),
(78, 3, 67, 1, '2022-07-06 20:16:11'),
(79, 3, 67, 1, '2022-07-06 23:26:34'),
(80, 3, 68, 1, '2022-07-07 08:15:21'),
(81, 3, 68, 1, '2022-07-07 08:20:23'),
(82, 3, 70, 1, '2022-07-07 08:39:53'),
(83, 3, 68, 1, '2022-07-07 10:18:12'),
(84, 3, 70, 1, '2022-07-08 15:29:13'),
(85, 3, 70, 1, '2022-07-08 15:32:42'),
(86, 3, 70, 1, '2022-07-08 18:42:11'),
(87, 3, 70, 1, '2022-07-08 18:42:26'),
(88, 3, 72, 1, '2022-07-08 18:59:32'),
(89, 3, 72, 1, '2022-07-08 19:00:41'),
(90, 3, 72, 1, '2022-07-08 19:02:13'),
(91, 3, 72, 1, '2022-07-08 19:03:52'),
(92, 3, 72, 1, '2022-07-08 19:21:38'),
(93, 3, 72, 1, '2022-07-08 19:30:55'),
(94, 3, 72, 1, '2022-07-08 19:31:17'),
(95, 3, 72, 1, '2022-07-08 19:31:27'),
(96, 3, 72, 1, '2022-07-08 19:31:55'),
(97, 3, 72, 1, '2022-07-08 19:32:59'),
(98, 3, 72, 1, '2022-07-08 19:33:01'),
(99, 3, 72, 1, '2022-07-08 19:34:41'),
(100, 3, 72, 1, '2022-07-08 19:50:24'),
(101, 3, 72, 1, '2022-07-11 05:35:10'),
(102, 3, 76, 1, '2022-07-11 07:52:58'),
(103, 3, 76, 1, '2022-07-11 08:18:54'),
(104, 3, 76, 1, '2022-07-11 08:57:02'),
(105, 3, 76, 1, '2022-07-11 08:58:50'),
(106, 3, 76, 1, '2022-07-11 09:06:35'),
(107, 3, 76, 1, '2022-07-11 09:16:45'),
(108, 3, 76, 1, '2022-07-11 09:17:23'),
(109, 3, 76, 1, '2022-07-11 09:17:25'),
(110, 3, 76, 1, '2022-07-11 09:17:29'),
(111, 3, 76, 1, '2022-07-11 09:17:32'),
(112, 3, 76, 1, '2022-07-11 09:18:39'),
(113, 3, 76, 1, '2022-07-11 09:19:13'),
(114, 3, 76, 1, '2022-07-11 09:25:15'),
(115, 3, 76, 1, '2022-07-11 10:39:34'),
(116, 3, 76, 1, '2022-07-11 11:02:45'),
(117, 3, 76, 1, '2022-07-11 11:02:56'),
(118, 3, 76, 1, '2022-07-11 11:51:37'),
(119, 3, 1, 1, '2022-07-12 03:40:10'),
(120, 3, 1, 1, '2022-07-12 05:02:28'),
(121, 3, 1, 1, '2022-07-12 05:07:39'),
(122, 3, 1, 1, '2022-07-12 05:57:47'),
(123, 3, 1, 1, '2022-07-12 08:09:40'),
(124, 3, 1, 1, '2022-07-12 08:10:01'),
(125, 3, 1, 1, '2022-07-12 08:10:54'),
(126, 3, 1, 1, '2022-07-12 08:59:57'),
(127, 3, 1, 1, '2022-07-12 09:00:10'),
(128, 3, 1, 1, '2022-07-12 09:01:35'),
(129, 3, 1, 1, '2022-07-12 09:03:35'),
(130, 3, 76, 1, '2022-07-12 09:12:19'),
(131, 3, 76, 1, '2022-07-12 09:17:43'),
(132, 3, 76, 1, '2022-07-12 09:18:17'),
(133, 3, 76, 1, '2022-07-12 09:20:04'),
(134, 3, 66, 1, '2022-07-12 09:27:09'),
(135, 3, 76, 1, '2022-07-12 09:30:34'),
(136, 3, 76, 1, '2022-07-12 09:33:34'),
(137, 3, 76, 1, '2022-07-12 09:35:03'),
(138, 3, 76, 1, '2022-07-12 09:38:23'),
(139, 3, 76, 1, '2022-07-12 09:40:13'),
(140, 3, 76, 1, '2022-07-12 09:41:36'),
(141, 3, 76, 1, '2022-07-12 09:52:31'),
(142, 3, 76, 1, '2022-07-12 09:52:54'),
(143, 3, 76, 1, '2022-07-12 09:53:20'),
(144, 3, 76, 1, '2022-07-12 09:54:31'),
(145, 3, 76, 1, '2022-07-12 09:55:49'),
(146, 3, 76, 1, '2022-07-12 09:58:24'),
(147, 3, 76, 1, '2022-07-12 11:56:03'),
(148, 3, 76, 1, '2022-07-12 12:01:50'),
(149, 3, 76, 1, '2022-07-12 17:13:10'),
(150, 3, 76, 1, '2022-07-12 17:20:51'),
(151, 3, 76, 1, '2022-07-12 17:29:56'),
(152, 3, 1, 1, '2022-07-12 17:32:25'),
(153, 3, 76, 1, '2022-07-12 17:33:20'),
(154, 3, 76, 1, '2022-07-12 17:33:39'),
(155, 3, 76, 1, '2022-07-12 18:07:23'),
(156, 3, 76, 1, '2022-07-12 18:23:39'),
(157, 3, 76, 1, '2022-07-13 00:48:46'),
(158, 3, 76, 1, '2022-07-13 00:54:34'),
(159, 3, 76, 1, '2022-07-13 00:54:53'),
(160, 3, 77, 1, '2022-07-13 19:21:03'),
(161, 3, 77, 1, '2022-07-13 19:21:46'),
(162, 3, 1, 1, '2022-07-14 00:46:42'),
(163, 3, 1, 1, '2022-07-14 01:46:53'),
(164, 3, 1, 1, '2022-07-14 01:48:11'),
(165, 3, 1, 1, '2022-07-14 01:49:22'),
(166, 3, 1, 1, '2022-07-14 01:50:09'),
(167, 3, 1, 1, '2022-07-14 01:51:30'),
(168, 3, 1, 1, '2022-07-14 01:52:37'),
(169, 3, 1, 1, '2022-07-14 01:54:19'),
(170, 3, 1, 1, '2022-07-14 01:55:17'),
(171, 3, 1, 1, '2022-07-14 01:55:52'),
(172, 3, 1, 1, '2022-07-14 01:58:05'),
(173, 3, 1, 1, '2022-07-14 01:59:30'),
(174, 3, 1, 1, '2022-07-14 02:00:30'),
(175, 3, 1, 1, '2022-07-14 02:03:41'),
(176, 3, 1, 1, '2022-07-14 02:09:02'),
(177, 3, 1, 1, '2022-07-14 02:10:06'),
(178, 3, 1, 1, '2022-07-14 02:20:30'),
(179, 3, 1, 1, '2022-07-14 04:35:41'),
(180, 3, 1, 1, '2022-07-14 04:36:40'),
(181, 3, 1, 1, '2022-07-14 06:36:01'),
(182, 3, 76, 1, '2022-07-14 12:56:45'),
(183, 3, 76, 1, '2022-07-14 13:03:30'),
(184, 3, 76, 1, '2022-07-14 13:08:27'),
(185, 3, 76, 1, '2022-07-14 15:30:18'),
(186, 3, 76, 1, '2022-07-14 15:33:46'),
(187, 3, 76, 1, '2022-07-14 15:35:09'),
(188, 3, 76, 1, '2022-07-14 15:36:11'),
(189, 3, 76, 1, '2022-07-14 16:06:25'),
(190, 3, 76, 1, '2022-07-14 16:15:55'),
(191, 3, 76, 1, '2022-07-14 19:39:22'),
(192, 3, 1, 1, '2022-07-15 13:23:17'),
(193, 3, 78, 1, '2022-07-17 16:03:43'),
(194, 3, 78, 1, '2022-07-17 16:11:34'),
(195, 3, 78, 1, '2022-07-18 08:15:12'),
(196, 3, 78, 1, '2022-07-18 08:18:16'),
(197, 3, 78, 1, '2022-07-18 09:00:44'),
(198, 3, 78, 1, '2022-07-18 16:54:48'),
(199, 3, 78, 1, '2022-07-19 10:51:20'),
(200, 3, 78, 1, '2022-07-19 10:51:32'),
(201, 3, 78, 1, '2022-07-19 10:52:05'),
(202, 3, 78, 1, '2022-07-19 10:54:21'),
(203, 3, 78, 1, '2022-07-19 10:59:39'),
(204, 3, 78, 1, '2022-07-19 11:32:34'),
(205, 3, 78, 1, '2022-07-19 11:35:15'),
(206, 3, 78, 1, '2022-07-19 15:14:12'),
(207, 3, 78, 1, '2022-07-19 15:15:53'),
(208, 3, 78, 1, '2022-07-19 20:33:28'),
(209, 3, 78, 1, '2022-07-19 20:37:16'),
(210, 3, 78, 1, '2022-07-19 23:48:34'),
(211, 3, 78, 1, '2022-07-20 00:21:37'),
(212, 3, 78, 1, '2022-07-20 00:22:22'),
(213, 3, 78, 1, '2022-07-20 00:25:43'),
(214, 3, 78, 1, '2022-07-21 17:15:33'),
(215, 3, 78, 1, '2022-07-21 17:30:05'),
(216, 3, 78, 1, '2022-07-21 17:42:28'),
(217, 3, 78, 1, '2022-07-21 17:48:37'),
(218, 3, 78, 1, '2022-07-21 17:49:21'),
(219, 3, 78, 1, '2022-07-21 23:22:12'),
(220, 3, 78, 1, '2022-07-21 23:25:08'),
(221, 3, 78, 1, '2022-07-22 00:25:38'),
(222, 3, 78, 1, '2022-07-22 00:31:45'),
(223, 3, 78, 1, '2022-07-22 00:33:08'),
(224, 3, 78, 1, '2022-07-22 00:33:53'),
(225, 3, 78, 1, '2022-07-22 00:55:33'),
(226, 3, 78, 1, '2022-07-22 00:56:54'),
(227, 3, 76, 1, '2022-07-22 06:54:36'),
(228, 3, 76, 1, '2022-07-22 06:59:06'),
(229, 3, 78, 1, '2022-07-22 07:41:24'),
(230, 3, 76, 1, '2022-07-22 07:45:24'),
(231, 3, 78, 1, '2022-07-22 10:00:20'),
(232, 3, 78, 1, '2022-07-22 10:01:07'),
(233, 3, 78, 1, '2022-07-22 10:01:32'),
(234, 3, 78, 1, '2022-07-23 09:38:12'),
(235, 3, 76, 1, '2022-07-23 09:38:21'),
(236, 3, 78, 1, '2022-07-24 14:25:52'),
(237, 3, 76, 1, '2022-07-24 14:26:11'),
(238, 3, 78, 1, '2022-07-27 08:37:37'),
(239, 3, 76, 1, '2022-07-27 08:38:06');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_textgroup`
--

CREATE TABLE `user_textgroup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `textgroup_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dump dei dati per la tabella `user_textgroup`
--

INSERT INTO `user_textgroup` (`id`, `user_id`, `textgroup_id`, `answer`, `score`) VALUES
(29, 3, 210, 'rettetewrtewtew', 6),
(30, 3, 221, 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBB', 10),
(31, 3, 222, 'KKK test text group', 50),
(32, 3, 224, 'This is textgroup for test for logic 6-21', 30),
(33, 3, 226, 'The marketing is goodThe marketing is bad', 0),
(34, 3, 228, '', 0),
(35, 3, 230, '', 0),
(36, 3, 232, '', 0),
(37, 3, 233, 'good', 10),
(38, 3, 239, '', 0),
(39, 3, 240, 'goooodbeeeed', 40),
(40, 3, 241, '', 0),
(41, 3, 234, 'super good', 10),
(42, 3, 242, 'goodbed', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `video_progresses`
--

CREATE TABLE `video_progresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `media_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `duration` double(8,2) NOT NULL,
  `progress` double(8,2) NOT NULL,
  `complete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.Pending 1.Complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struttura della tabella `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '0=Bank, 1=Paypal,2=offline',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=accepted,2=rejected',
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `admin_menu_items_menu_foreign` (`menu`) USING BTREE;

--
-- Indici per le tabelle `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `blogs_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indici per le tabelle `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bundles_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `bundles_deleted_at_index` (`deleted_at`) USING BTREE;

--
-- Indici per le tabelle `bundle_courses`
--
ALTER TABLE `bundle_courses`
  ADD KEY `bundle_courses_bundle_id_foreign` (`bundle_id`) USING BTREE,
  ADD KEY `bundle_courses_course_id_foreign` (`course_id`) USING BTREE;

--
-- Indici per le tabelle `bundle_student`
--
ALTER TABLE `bundle_student`
  ADD KEY `bundle_student_bundle_id_foreign` (`bundle_id`) USING BTREE,
  ADD KEY `bundle_student_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`) USING BTREE;

--
-- Indici per le tabelle `cart_storage`
--
ALTER TABLE `cart_storage`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cart_storage_id_index` (`id`) USING BTREE;

--
-- Indici per le tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `certificates_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `certificates_course_id_foreign` (`course_id`) USING BTREE;

--
-- Indici per le tabelle `chapter_students`
--
ALTER TABLE `chapter_students`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `chapter_students_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE,
  ADD KEY `chapter_students_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `chapter_students_course_id_foreign` (`course_id`) USING BTREE;

--
-- Indici per le tabelle `charts`
--
ALTER TABLE `charts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `chatter_categories`
--
ALTER TABLE `chatter_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `chatter_discussion_slug_unique` (`slug`) USING BTREE,
  ADD KEY `chatter_discussion_chatter_category_id_foreign` (`chatter_category_id`) USING BTREE,
  ADD KEY `chatter_discussion_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `chatter_post_chatter_discussion_id_foreign` (`chatter_discussion_id`) USING BTREE,
  ADD KEY `chatter_post_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD PRIMARY KEY (`user_id`,`discussion_id`) USING BTREE,
  ADD KEY `chatter_user_discussion_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `chatter_user_discussion_discussion_id_index` (`discussion_id`) USING BTREE;

--
-- Indici per le tabelle `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `chat_participants_thread_id_user_id_unique` (`thread_id`,`user_id`) USING BTREE,
  ADD KEY `chat_participants_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `chat_threads`
--
ALTER TABLE `chat_threads`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `courses_deleted_at_index` (`deleted_at`) USING BTREE,
  ADD KEY `courses_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indici per le tabelle `course_student`
--
ALTER TABLE `course_student`
  ADD KEY `course_student_course_id_foreign` (`course_id`) USING BTREE,
  ADD KEY `course_student_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `course_timeline`
--
ALTER TABLE `course_timeline`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `course_timeline_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE;

--
-- Indici per le tabelle `course_user`
--
ALTER TABLE `course_user`
  ADD KEY `fk_p_54418_54417_user_cou_596eece522b73` (`course_id`) USING BTREE,
  ADD KEY `fk_p_54417_54418_course_u_596eece522bee` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `earnings_course_id_foreign` (`course_id`) USING BTREE,
  ADD KEY `earnings_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `faqs_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indici per le tabelle `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `jobs_queue_index` (`queue`) USING BTREE;

--
-- Indici per le tabelle `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `54419_596eedbb6686e` (`course_id`) USING BTREE,
  ADD KEY `lessons_deleted_at_index` (`deleted_at`) USING BTREE;

--
-- Indici per le tabelle `lesson_slot_bookings`
--
ALTER TABLE `lesson_slot_bookings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `lesson_slot_bookings_live_lesson_slot_id_foreign` (`live_lesson_slot_id`) USING BTREE,
  ADD KEY `lesson_slot_bookings_lesson_id_foreign` (`lesson_id`) USING BTREE,
  ADD KEY `lesson_slot_bookings_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `live_lesson_slots`
--
ALTER TABLE `live_lesson_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `live_lesson_slots_lesson_id_foreign` (`lesson_id`) USING BTREE;

--
-- Indici per le tabelle `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE;

--
-- Indici per le tabelle `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `messages_sender_id_foreign` (`sender_id`) USING BTREE,
  ADD KEY `messages_thread_id_foreign` (`thread_id`) USING BTREE;

--
-- Indici per le tabelle `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `message_thread_participants`
--
ALTER TABLE `message_thread_participants`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `message_thread_participants_thread_id_user_id_unique` (`thread_id`,`user_id`) USING BTREE,
  ADD KEY `message_thread_participants_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE;

--
-- Indici per le tabelle `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE;

--
-- Indici per le tabelle `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_clients_user_id_index` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`) USING BTREE;

--
-- Indici per le tabelle `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`) USING BTREE;

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `pages_slug_unique` (`slug`) USING BTREE,
  ADD KEY `pages_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `password_histories_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indici per le tabelle `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `multiquestions_userid_foreign` (`userid`) USING BTREE,
  ADD KEY `multiquestions_deleted_at_index` (`deleted_at`) USING BTREE;

--
-- Indici per le tabelle `questions_copy1`
--
ALTER TABLE `questions_copy1`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `multiquestions_userid_foreign` (`userid`) USING BTREE,
  ADD KEY `multiquestions_deleted_at_index` (`deleted_at`) USING BTREE;

--
-- Indici per le tabelle `questions_options`
--
ALTER TABLE `questions_options`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `54421_596eee8745a1e` (`question_id`) USING BTREE,
  ADD KEY `questions_options_deleted_at_index` (`deleted_at`) USING BTREE;

--
-- Indici per le tabelle `question_test`
--
ALTER TABLE `question_test`
  ADD KEY `fk_p_54420_54422_test_que_596eeef70992f` (`question_id`) USING BTREE,
  ADD KEY `fk_p_54422_54420_question_596eeef7099af` (`test_id`) USING BTREE;

--
-- Indici per le tabelle `question_test_copy1`
--
ALTER TABLE `question_test_copy1`
  ADD KEY `fk_p_54420_54422_test_que_596eeef70992f` (`question_id`) USING BTREE,
  ADD KEY `fk_p_54422_54420_question_596eeef7099af` (`test_id`) USING BTREE;

--
-- Indici per le tabelle `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `reviews_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `roles_name_index` (`name`) USING BTREE;

--
-- Indici per le tabelle `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indici per le tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`) USING BTREE;

--
-- Indici per le tabelle `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `social_accounts_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `stripe_plans`
--
ALTER TABLE `stripe_plans`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`) USING BTREE;

--
-- Indici per le tabelle `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`) USING BTREE,
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`) USING BTREE;

--
-- Indici per le tabelle `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `survey_results`
--
ALTER TABLE `survey_results`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `teacher_profiles_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `testreports`
--
ALTER TABLE `testreports`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `54422_596eeef514d00` (`course_id`) USING BTREE,
  ADD KEY `54422_596eeef53411a` (`lesson_id`) USING BTREE,
  ADD KEY `tests_deleted_at_index` (`deleted_at`) USING BTREE;

--
-- Indici per le tabelle `tests_results`
--
ALTER TABLE `tests_results`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tests_results_test_id_foreign` (`test_id`) USING BTREE,
  ADD KEY `tests_results_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `tests_results_answers`
--
ALTER TABLE `tests_results_answers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tests_results_answers_tests_result_id_foreign` (`tests_result_id`) USING BTREE,
  ADD KEY `tests_results_answers_question_id_foreign` (`question_id`) USING BTREE,
  ADD KEY `tests_results_answers_option_id_foreign` (`option_id`) USING BTREE;

--
-- Indici per le tabelle `textgroups`
--
ALTER TABLE `textgroups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  ADD KEY `users_stripe_id_index` (`stripe_id`) USING BTREE;

--
-- Indici per le tabelle `user_answer`
--
ALTER TABLE `user_answer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `user_test`
--
ALTER TABLE `user_test`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `user_textgroup`
--
ALTER TABLE `user_textgroup`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indici per le tabelle `video_progresses`
--
ALTER TABLE `video_progresses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `video_progresses_media_id_foreign` (`media_id`) USING BTREE,
  ADD KEY `video_progresses_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indici per le tabelle `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wish_lists_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `wish_lists_course_id_foreign` (`course_id`) USING BTREE;

--
-- Indici per le tabelle `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `chapter_students`
--
ALTER TABLE `chapter_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT per la tabella `charts`
--
ALTER TABLE `charts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT per la tabella `chatter_categories`
--
ALTER TABLE `chatter_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `chatter_post`
--
ALTER TABLE `chatter_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `chat_participants`
--
ALTER TABLE `chat_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `chat_threads`
--
ALTER TABLE `chat_threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT per la tabella `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `course_timeline`
--
ALTER TABLE `course_timeline`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT per la tabella `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `lesson_slot_bookings`
--
ALTER TABLE `lesson_slot_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `live_lesson_slots`
--
ALTER TABLE `live_lesson_slots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13755;

--
-- AUTO_INCREMENT per la tabella `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `message_thread_participants`
--
ALTER TABLE `message_thread_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT per la tabella `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=815;

--
-- AUTO_INCREMENT per la tabella `questions_copy1`
--
ALTER TABLE `questions_copy1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT per la tabella `questions_options`
--
ALTER TABLE `questions_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `stripe_plans`
--
ALTER TABLE `stripe_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `survey_results`
--
ALTER TABLE `survey_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `testreports`
--
ALTER TABLE `testreports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT per la tabella `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT per la tabella `tests_results`
--
ALTER TABLE `tests_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tests_results_answers`
--
ALTER TABLE `tests_results_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `textgroups`
--
ALTER TABLE `textgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15172;

--
-- AUTO_INCREMENT per la tabella `user_test`
--
ALTER TABLE `user_test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT per la tabella `user_textgroup`
--
ALTER TABLE `user_textgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT per la tabella `video_progresses`
--
ALTER TABLE `video_progresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD CONSTRAINT `admin_menu_items_menu_foreign` FOREIGN KEY (`menu`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `bundles`
--
ALTER TABLE `bundles`
  ADD CONSTRAINT `bundles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `bundle_courses`
--
ALTER TABLE `bundle_courses`
  ADD CONSTRAINT `bundle_courses_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bundle_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `bundle_student`
--
ALTER TABLE `bundle_student`
  ADD CONSTRAINT `bundle_student_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bundle_student_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `chapter_students`
--
ALTER TABLE `chapter_students`
  ADD CONSTRAINT `chapter_students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapter_students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD CONSTRAINT `chatter_discussion_chatter_category_id_foreign` FOREIGN KEY (`chatter_category_id`) REFERENCES `chatter_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD CONSTRAINT `chatter_post_chatter_discussion_id_foreign` FOREIGN KEY (`chatter_discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD CONSTRAINT `chatter_user_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatter_user_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD CONSTRAINT `chat_participants_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `course_student`
--
ALTER TABLE `course_student`
  ADD CONSTRAINT `course_student_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_student_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `fk_p_54417_54418_course_u_596eece522bee` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_p_54418_54417_user_cou_596eece522b73` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `earnings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `54419_596eedbb6686e` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `lesson_slot_bookings`
--
ALTER TABLE `lesson_slot_bookings`
  ADD CONSTRAINT `lesson_slot_bookings_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_slot_bookings_live_lesson_slot_id_foreign` FOREIGN KEY (`live_lesson_slot_id`) REFERENCES `live_lesson_slots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_slot_bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `live_lesson_slots`
--
ALTER TABLE `live_lesson_slots`
  ADD CONSTRAINT `live_lesson_slots_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `message_threads` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `message_thread_participants`
--
ALTER TABLE `message_thread_participants`
  ADD CONSTRAINT `message_thread_participants_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `message_threads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_thread_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `password_histories`
--
ALTER TABLE `password_histories`
  ADD CONSTRAINT `password_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `multiquestions_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `questions_copy1`
--
ALTER TABLE `questions_copy1`
  ADD CONSTRAINT `questions_copy1_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `questions_options`
--
ALTER TABLE `questions_options`
  ADD CONSTRAINT `54421_596eee8745a1e` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `question_test_copy1`
--
ALTER TABLE `question_test_copy1`
  ADD CONSTRAINT `question_test_copy1_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_test_copy1_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
