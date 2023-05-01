-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 01, 2023 at 05:47 AM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `unique_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `user_id`, `unique_id`, `name`, `city`, `state`, `landmark`, `category`, `last_updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, 2, 'ganesh cake shop', 'Pune', 'Maharashtra', 'Pune', 'cake shop', '19', '1', '2023-04-11 07:45:05', '2023-04-11 07:45:05'),
(2, 20, 20, 'MY Shop', 'Kolhapur', 'Maharshtra', 'ST', 'Shop', '20', '1', '2023-04-11 08:49:23', '2023-04-11 08:49:23'),
(3, 23, 23, 'Test', 'Waranan', 'Maharashtra', 'Warana', 'Bekary', '23', '1', '2023-04-11 11:36:00', '2023-04-11 11:36:00'),
(4, 27, 27, 'test', 'Kolhapur', 'Maharshtra', 'St Stand', 'Shop', '27', '1', '2023-04-11 15:14:41', '2023-04-11 15:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0bd5dcfee007b582d6a5e7718ba092edd519dee498ce9a8caa0b6824a55617e2ca69ff654140b367', 23, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:36:58', '2023-04-11 11:36:58', '2024-04-11 11:36:58'),
('109f943890170bf02f374139757e172a6a175167dd248740be3f3c1f94668fa712ced5365e6b3fdc', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:03:39', '2023-04-03 12:03:39', '2024-04-03 17:33:39'),
('11fc99c44803e99d6aed93c283262422ec37ed656dd5ec6e555266e21882365a32b3e7db4659a7eb', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 13:32:35', '2023-04-11 13:32:35', '2024-04-11 13:32:35'),
('19e6c75dfc9f2becb6ae71435e354b7bd20af796fb8619b2d87fa846606ee29fadfc7993b681e439', 19, 5, 'TutsForWeb', '[]', 0, '2023-04-11 07:42:20', '2023-04-11 07:42:20', '2024-04-11 07:42:20'),
('19faa9dfd6622bbd0c2018688a67962f35a9fd2d5157c098777ab40c1d6a14c06789f4130e638b7b', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 12:15:15', '2023-04-11 12:15:15', '2024-04-11 12:15:15'),
('1ec8b6a2ed6f2f9cbf56a56d1de8e9b04a7ec388b0dd72aeca8bb383981d5cc279c747920dcc67dd', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 05:58:47', '2023-04-11 05:58:47', '2024-04-11 05:58:47'),
('2150b60a561901c389cdc0495d6b9fe0808a80073396f15776977f0ff8ad952cdea31a22d32db373', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 20:23:21', '2023-04-03 20:23:21', '2024-04-04 01:53:21'),
('2469d52f6860e3e2b1cf9d19a558fdeb64899617a2abe6bafcbcc1e86729818765af05523c46afc5', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 06:21:18', '2023-04-11 06:21:18', '2024-04-11 06:21:18'),
('25d041f8c9fcf479b525f0bb0e03a9f39f3cb450d8de2ea7ccc2196b15fa3cd3cc6411228256dd1c', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:05:37', '2023-04-03 12:05:37', '2024-04-03 17:35:37'),
('25e76a8be0a6dc11b161371865559e10fdc6aa8084288cf2cecee7f30dc31b8fbbe041995569640f', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:17:15', '2023-04-11 11:17:15', '2024-04-11 11:17:15'),
('2bc2b1774b5327e68106079afab24b7728cfa5f9ae1ceb07b74486d6a75f9f4667e3719b1e485502', 1, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:00:50', '2023-04-03 12:00:50', '2024-04-03 17:30:50'),
('2d17c9b7516923546fb91137626e66dad82c4db4aec891eb9f7fe4287d629ee5bd1d5ad6b82dbdf7', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:17:40', '2023-04-11 11:17:40', '2024-04-11 11:17:40'),
('37b5829aa8512995540e0fea0bf20d25f05cac27f506028c5cad4eb250abda628ac4c6e585d98139', 27, 5, 'TutsForWeb', '[]', 0, '2023-04-11 15:12:30', '2023-04-11 15:12:30', '2024-04-11 15:12:30'),
('412f6c254cf7e134229994e56941476b7337365a1239723008fa3f6c3d97e64af203eb5536f1e41c', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 13:17:15', '2023-04-11 13:17:15', '2024-04-11 13:17:15'),
('46f998e8413c3e2dd50333cb1c9e35de69a1295bd77ba7dd7740ee0a68d10be4d4c3730c783fec98', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 20:43:34', '2023-04-03 20:43:34', '2024-04-04 02:13:34'),
('480b7a47d85093afb5feec469c97c2d23afddb6eedabe702ceaf33d7dde93dacb90004a79bbeea6c', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:12:56', '2023-04-11 11:12:56', '2024-04-11 11:12:56'),
('4a5a05cce719b55c8db2b62804c022c88816129a69fb18481ea64e3ed2dafa30a5a074f235f88261', 23, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:13:59', '2023-04-11 11:13:59', '2024-04-11 11:13:59'),
('4ee3970988e63c9d8b9c5cafc9d2e025e2cde86969e65ac512b64da524876cab82600fe21bbdf078', 17, 5, 'TutsForWeb', '[]', 0, '2023-04-10 17:21:43', '2023-04-10 17:21:43', '2024-04-10 17:21:43'),
('51a51fa54ee8eaa55b061fcf380f86fa72dd3e4c785449694bb43a6464a8b2a511b9c54ae87dec18', 23, 5, 'TutsForWeb', '[]', 0, '2023-04-11 13:46:29', '2023-04-11 13:46:29', '2024-04-11 13:46:29'),
('54a5a9f2a705112b8c6abb387422d048372ff7cd800955f9f43726b5f315cc36706fe1c11b5d421c', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:54:28', '2023-04-03 12:54:28', '2024-04-03 18:24:28'),
('6452525ab9288773ec07b9353407ed0a9fc4cd8db86e90ab4cba3d3cfeeaba7ee3cea7de7ee94e69', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 20:25:51', '2023-04-03 20:25:51', '2024-04-04 01:55:51'),
('647bc3da7b62179c31e23426e0a2fc37ee6c9e919c7e37592225b59842bb552cbb0b31719cd7177c', 17, 5, 'TutsForWeb', '[]', 0, '2023-04-10 17:21:57', '2023-04-10 17:21:57', '2024-04-10 17:21:57'),
('72a399dfa8b52e9151fb778422ce13be1e3572a57b75985fbd081874b33a692874777c45bc13000d', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:12:13', '2023-04-11 11:12:13', '2024-04-11 11:12:13'),
('7af039a6c2378056059d73f0af0c0457f974ac5b15444cd60acadf603cc96496deaa3861a875e8fd', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 15:08:45', '2023-04-11 15:08:45', '2024-04-11 15:08:45'),
('846460d8f8279ed5ecb6d7250f2f54fe6edc9185c6cf66b4a2d111c202a3897243f7d74c9a3784a2', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 05:44:36', '2023-04-11 05:44:36', '2024-04-11 05:44:36'),
('84a44d13ebe52452e6314e5eacc9722177d6857563327d4826b8b061070a7a8dd33b633e5f142eb8', 25, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:24:06', '2023-04-11 11:24:06', '2024-04-11 11:24:06'),
('8747b14489d7f09ae5d30c3e2bc60c3dd0e86e648a8a3a22ef346bd0b0bbcbae012c87290bf64123', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:12:53', '2023-04-11 11:12:53', '2024-04-11 11:12:53'),
('8aa2c2143d9e38c0e1d7118561192d98196f8c0fd470a48421b620f271142539692a2e48f3afc51a', 17, 5, 'TutsForWeb', '[]', 0, '2023-04-10 17:23:55', '2023-04-10 17:23:55', '2024-04-10 17:23:55'),
('8ff50ea91fb3c749ba4b8c6860ad807d4fc1d1a5a5c864300a469027493540ec690ab4ec4085d883', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 06:44:34', '2023-04-11 06:44:34', '2024-04-11 06:44:34'),
('a61d79051daa0225e5a009337e71d9f75681b5fb43cb033ab6fae17b31b54aca2cf3dc4cd8dc5acd', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:33:41', '2023-04-11 11:33:41', '2024-04-11 11:33:41'),
('adbac6fb14bfd99f583867b15df4d271db0b0001317dce8c942a58fd419c11fc118b787ac037782b', 19, 5, 'TutsForWeb', '[]', 0, '2023-04-11 02:15:54', '2023-04-11 02:15:54', '2024-04-11 02:15:54'),
('aedf4cfc9b7d5829c56b47041c379ed654f6039822e80af46d3a2229e299952553d7c3a850939c78', 19, 5, 'TutsForWeb', '[]', 0, '2023-04-11 02:12:41', '2023-04-11 02:12:41', '2024-04-11 02:12:41'),
('b51ddef28ca2f003df5e75616c0032ef54b8aaa8fb130d13fb916b4836d7cdbfdc011fda43f8e2f3', 24, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:14:57', '2023-04-11 11:14:57', '2024-04-11 11:14:57'),
('bdfd67a4c77c5a22596a9b7c78f2a618c4b4ae9b71af2f91c2876b8d6a731d2a3b797b215223d2c8', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 13:38:18', '2023-04-11 13:38:18', '2024-04-11 13:38:18'),
('c9942f582d52ceb351747147a6e097dde205b07d51e88c74d031a91e1582fbafa61b7093b2a2229e', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 13:41:53', '2023-04-11 13:41:53', '2024-04-11 13:41:53'),
('e8db4bd7875eb01880584645fcd2e0241611a9bef5170095198884cd34f7aa44f8bc1b134f24babf', 24, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:15:39', '2023-04-11 11:15:39', '2024-04-11 11:15:39'),
('ec0c8361c5e257313fd18e60d11b4c095bd16cde2b2a3aa42f563d6b71d5605314a0ea515f254c0d', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:19:20', '2023-04-11 11:19:20', '2024-04-11 11:19:20'),
('ee1d68c7e69348c8759e33a984da01bf96b335a7634e14c6d10b128139771eaa2e465c328822b890', 23, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:13:20', '2023-04-11 11:13:20', '2024-04-11 11:13:20'),
('f42d294a6e3d81c776b65b058a8c0d4e618bdb0c2105de17497edc90f121e452d1efb82461b1075b', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:05:03', '2023-04-03 12:05:03', '2024-04-03 17:35:03'),
('fb2c9f196e7e5c4f118986c7c23666c182bf4ed5003d58d45328882e98aa1f6bdcc2c1890297920b', 20, 5, 'TutsForWeb', '[]', 0, '2023-04-11 11:12:05', '2023-04-11 11:12:05', '2024-04-11 11:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'mCdxCbHupMVDcZAIBrxaf7VrAjMTP64sOfB7s1Ob', NULL, 'http://localhost', 1, 0, 0, '2023-04-01 12:08:51', '2023-04-01 12:08:51'),
(2, NULL, 'Laravel Password Grant Client', 'zx31nXWdzpDBRIOdWsiFvrneI5EEPfVqJCIGENqw', 'users', 'http://localhost', 0, 1, 0, '2023-04-01 12:08:51', '2023-04-01 12:08:51'),
(3, NULL, 'BillBook Personal Access Client', 'gJGokFVRAyHl2OhTPnggcce0RE6BD76tvwauUXSF', NULL, 'http://localhost', 1, 0, 0, '2023-04-05 13:31:05', '2023-04-05 13:31:05'),
(4, NULL, 'BillBook Password Grant Client', 'ftHhlxtnzjVnyel97hZYXrL4HzwhuC4t59HmvtTH', 'users', 'http://localhost', 0, 1, 0, '2023-04-05 13:31:06', '2023-04-05 13:31:06'),
(5, NULL, 'BillBook Personal Access Client', 'vdMJU9dUKNRoHYJaENIwUrasBPp5az1Uj97sozj8', NULL, 'http://localhost', 1, 0, 0, '2023-04-10 17:21:21', '2023-04-10 17:21:21'),
(6, NULL, 'BillBook Password Grant Client', 'OmgcXZtrU5VjkX568zRwBjR9udUNuNaw23yPLYjW', 'users', 'http://localhost', 0, 1, 0, '2023-04-10 17:21:21', '2023-04-10 17:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-01 12:08:51', '2023-04-01 12:08:51'),
(2, 3, '2023-04-05 13:31:06', '2023-04-05 13:31:06'),
(3, 5, '2023-04-10 17:21:21', '2023-04-10 17:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_verification`
--

CREATE TABLE `otp_verification` (
  `id` bigint NOT NULL,
  `otp` varchar(10) NOT NULL,
  `mobile_no` bigint NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `otp_verification`
--

INSERT INTO `otp_verification` (`id`, `otp`, `mobile_no`, `status`, `created_at`, `updated_at`) VALUES
(1, '123456', 9890319604, '0', '2023-04-11 02:06:46', '2023-04-11 02:12:41'),
(2, '123456', 9890319604, '0', '2023-04-11 02:15:52', '2023-04-11 02:15:54'),
(3, '123456', 1234567890, '1', '2023-04-11 05:35:05', '2023-04-11 05:35:05'),
(4, '123456', 1234567890, '0', '2023-04-11 05:44:21', '2023-04-11 05:44:36'),
(5, '123456', 1234567890, '1', '2023-04-11 05:56:44', '2023-04-11 05:56:44'),
(6, '123456', 1234567890, '0', '2023-04-11 05:58:41', '2023-04-11 05:58:47'),
(7, '123456', 1234567890, '0', '2023-04-11 05:59:10', '2023-04-11 11:17:40'),
(8, '123456', 1234567890, '0', '2023-04-11 06:01:48', '2023-04-11 11:17:15'),
(9, '123456', 1234567890, '0', '2023-04-11 06:02:57', '2023-04-11 11:12:56'),
(10, '123456', 1234567890, '0', '2023-04-11 06:19:20', '2023-04-11 11:12:13'),
(11, '123456', 1234567890, '0', '2023-04-11 06:21:10', '2023-04-11 06:21:18'),
(12, '123456', 1234567890, '0', '2023-04-11 06:44:17', '2023-04-11 06:44:34'),
(13, '123456', 9890319604, '0', '2023-04-11 07:42:16', '2023-04-11 07:42:20'),
(14, '123456', 1234567890, '0', '2023-04-11 11:11:57', '2023-04-11 11:12:05'),
(15, '123456', 1234567890, '0', '2023-04-11 11:12:43', '2023-04-11 11:12:53'),
(16, '123456', 8857896026, '0', '2023-04-11 11:13:12', '2023-04-11 11:13:20'),
(17, '123456', 8857896026, '0', '2023-04-11 11:13:52', '2023-04-11 11:13:59'),
(18, '123456', 8888230067, '0', '2023-04-11 11:14:32', '2023-04-11 11:14:57'),
(19, '123456', 8888230067, '0', '2023-04-11 11:15:29', '2023-04-11 11:15:39'),
(20, '123456', 1234567890, '0', '2023-04-11 11:19:07', '2023-04-11 11:19:20'),
(21, '123456', 1222222222, '0', '2023-04-11 11:23:55', '2023-04-11 11:24:06'),
(22, '123456', 1234567890, '0', '2023-04-11 11:33:29', '2023-04-11 11:33:41'),
(23, '123456', 8857896026, '0', '2023-04-11 11:36:51', '2023-04-11 11:36:58'),
(24, '123456', 1234567890, '1', '2023-04-11 11:53:10', '2023-04-11 11:53:10'),
(25, '123456', 1234567890, '1', '2023-04-11 12:13:15', '2023-04-11 12:13:15'),
(26, '123456', 1234567890, '0', '2023-04-11 12:14:53', '2023-04-11 12:15:15'),
(27, '123456', 1234567890, '0', '2023-04-11 13:17:05', '2023-04-11 13:17:15'),
(28, '123456', 1234567890, '0', '2023-04-11 13:32:28', '2023-04-11 13:32:35'),
(29, '123456', 1234567890, '0', '2023-04-11 13:37:46', '2023-04-11 13:38:18'),
(30, '123456', 1234567890, '0', '2023-04-11 13:41:43', '2023-04-11 13:41:53'),
(31, '123456', 8857896026, '1', '2023-04-11 13:44:04', '2023-04-11 13:44:04'),
(32, '123456', 8857896026, '0', '2023-04-11 13:46:01', '2023-04-11 13:46:29'),
(33, '123456', 1234567890, '1', '2023-04-11 13:46:27', '2023-04-11 13:46:27'),
(34, '123456', 1234567890, '1', '2023-04-11 13:47:05', '2023-04-11 13:47:05'),
(35, '123456', 1234567890, '1', '2023-04-11 15:05:54', '2023-04-11 15:05:54'),
(36, '123456', 1234567890, '0', '2023-04-11 15:08:35', '2023-04-11 15:08:45'),
(37, '123456', 1234567777, '0', '2023-04-11 15:12:24', '2023-04-11 15:12:30'),
(38, '123456', 8329096034, '1', '2023-04-11 15:29:47', '2023-04-11 15:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bsolanke1234@gmail.com', '$2y$10$DgiN7v3gZZXJw8zJLDFm.unl6Nfc131ZM928bkgXK9Kdp4juTAxJK', '2023-04-11 15:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `business_id` bigint NOT NULL,
  `subscription_type` enum('annual','halfYearly','monthly','') DEFAULT 'annual',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `subscriptions_amount` varchar(10) DEFAULT NULL,
  `fees_paid` varchar(10) NOT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `business_id`, `subscription_type`, `start_date`, `end_date`, `subscriptions_amount`, `fees_paid`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(3, 23, 3, 'annual', '2023-04-11 15:25:36', '2024-04-11 15:25:36', '10000', '10000', '1-Bhagavat Solanke', '2023-04-11 15:25:36', '2023-04-11 15:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` bigint DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `user_type` enum('user','subUser','superAdmin','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `activate_free_trial` datetime DEFAULT NULL,
  `activate_free_trial_status` enum('active','inactive','expire','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_id` bigint DEFAULT NULL,
  `business_id` bigint DEFAULT NULL,
  `last_updated_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile_no`, `date_of_birth`, `address`, `gender`, `age`, `role`, `email_verified_at`, `password`, `remember_token`, `status`, `user_type`, `user_id`, `activate_free_trial`, `activate_free_trial_status`, `unique_id`, `business_id`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Bhagavat Solanke', 'bsolanke1234@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$RTvYcE5dcS.MqGTHsH5BTuwprS/zjhYWoWnvuyu9q3WVaEDbKwl2.', '7w3P4866p2Q3cXupcGtdTEkA9VWHeZ3mxJ1w2hu7uJYTdOFrfZP7DUfRIPQc', '1', 'superAdmin', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 11:49:06', '2023-04-01 11:49:06'),
(19, 'B Solanke', 'bSolanke@gmail.com', 9890319604, '1995-06-15', 'Pune', 'm', NULL, NULL, NULL, '$2y$10$TnHUGxPx0hePrGywz2rFtee1pJK.6mdSdMKr2VjoKi06YlLGabfWa', NULL, '1', 'user', NULL, NULL, NULL, 2, NULL, 'self', '2023-04-11 02:06:02', '2023-04-11 02:06:02'),
(20, 'P K', 'p@gmail.com', 1234567890, '2023-04-05', 'p@gmail.com', 'f', NULL, NULL, NULL, '$2y$10$Tc0ey.WJjnfAQOzOZllA0eny.zBBjfPQ4yOaR9MB0OBMxAFTQuu.K', NULL, '0', 'user', NULL, NULL, NULL, 20, NULL, '1-Bhagavat Solanke', '2023-04-11 05:26:39', '2023-04-11 15:24:59'),
(21, 'Pk', 'ss@gmailc.com', 1234555555, NULL, 'mjsj', 'f', '20', 'test', NULL, '$2y$10$3gVwndP9MUdzud4Nlh1F4.Y7DT6xeFjA8DdsX0XFTLZBPfRfrXG7C', NULL, '1', 'subUser', 20, NULL, NULL, 20, 2, NULL, '2023-04-11 09:40:46', '2023-04-11 09:40:46'),
(22, 'Shiv', 'ss@gmail.com', 1234566777, NULL, 'ass', 'f', '20', 'test', NULL, '$2y$10$fteOsdz5kOcDPdUjAR0YlOWU6Rz1F72QXSBB84GDsv.7pK5v7wMnm', NULL, '1', 'subUser', 20, NULL, NULL, 20, 2, NULL, '2023-04-11 09:44:44', '2023-04-11 09:44:44'),
(23, 'Pratik Patil', 'pratikpatil2355@gmail.com', 8857896026, '1995-08-10', 'A/p Warananagar', 'f', NULL, NULL, NULL, '$2y$10$.VgCLB.33iHI7z1XUEUDj.0WkBZfdgiISFExKb6lzMLrCn.H0Wm1i', NULL, '1', 'user', NULL, NULL, NULL, 23, NULL, 'self', '2023-04-11 11:12:59', '2023-04-11 11:12:59'),
(24, 'Bhagwat Slanke', 'pun@gmail.com', 8888230067, '1997-04-18', 'pune', 'f', NULL, NULL, NULL, '$2y$10$2Mz5mdR0wmtR0icmXlFYzOdaFh/GivFjU52ebt4HuKdgN/T/v/7JG', NULL, '1', 'user', NULL, NULL, NULL, 24, NULL, 'self', '2023-04-11 11:14:17', '2023-04-11 11:14:17'),
(25, 'Test aa', 'aaa@gmail.com', 1222222222, '2023-04-11', 'aaa@gmail.com', 'f', NULL, NULL, NULL, '$2y$10$G2MTvXIMbJ9MaOFSAtvQ.OCCzIrEK9k2ZoXx7LP.MU7AgKOd0OGdq', NULL, '1', 'user', NULL, NULL, NULL, 25, NULL, 'self', '2023-04-11 11:23:48', '2023-04-11 11:23:48'),
(26, 'Vishwjit', 'vishwjit@yopmail.com', 1234566666, NULL, 'Kolhapur', 'f', '28', 'test', NULL, '$2y$10$wxHK4NggYyIcaZQjc3diWuGnqh5bEyms2nXcukp55tj1rIEzSXaGK', NULL, '1', 'subUser', 20, NULL, NULL, 20, 2, NULL, '2023-04-11 15:10:14', '2023-04-11 15:10:14'),
(27, 'Pratik Patil', 'pratik@yopmail.com', 1234567777, '2011-04-02', 'Varana', 'f', NULL, NULL, NULL, '$2y$10$UqFMKlv26aEDp364nqVoOOyUhKQem6IB9R.nIVyhUxA6GFU2pimjy', NULL, '1', 'user', NULL, NULL, NULL, 27, NULL, 'self', '2023-04-11 15:12:09', '2023-04-11 15:12:09'),
(29, 'vishal123 patil', 'vpatil@gmail.com', 8329096034, '1995-04-04', 'vpatil@gmail.com', 'f', NULL, NULL, NULL, '$2y$10$Ze9f.ib3qWPpWK0o/W1iJ.sTP8.uvZ1S4QpseAchMWijFqcBQNb4i', NULL, '1', 'user', NULL, NULL, NULL, 28, NULL, 'self', '2023-04-11 15:29:37', '2023-04-11 15:29:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `otp_verification`
--
ALTER TABLE `otp_verification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
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
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `otp_verification`
--
ALTER TABLE `otp_verification`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
