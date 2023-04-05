-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 07:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `user_id`, `name`, `city`, `state`, `landmark`, `category`, `last_updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'ganesh cake shop1', 'Pune2', 'Maharashtra3', 'Pune4', 'cake shop5', '9', '1', '2023-04-03 18:26:48', '2023-04-03 18:47:24'),
(2, 9, 'ganesh cake shop 22', 'Pune', 'Maharashtra', 'Pune', 'cake shop', '9', '1', '2023-04-04 01:25:57', '2023-04-04 01:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('109f943890170bf02f374139757e172a6a175167dd248740be3f3c1f94668fa712ced5365e6b3fdc', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:03:39', '2023-04-03 12:03:39', '2024-04-03 17:33:39'),
('2150b60a561901c389cdc0495d6b9fe0808a80073396f15776977f0ff8ad952cdea31a22d32db373', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 20:23:21', '2023-04-03 20:23:21', '2024-04-04 01:53:21'),
('25d041f8c9fcf479b525f0bb0e03a9f39f3cb450d8de2ea7ccc2196b15fa3cd3cc6411228256dd1c', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:05:37', '2023-04-03 12:05:37', '2024-04-03 17:35:37'),
('2bc2b1774b5327e68106079afab24b7728cfa5f9ae1ceb07b74486d6a75f9f4667e3719b1e485502', 1, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:00:50', '2023-04-03 12:00:50', '2024-04-03 17:30:50'),
('46f998e8413c3e2dd50333cb1c9e35de69a1295bd77ba7dd7740ee0a68d10be4d4c3730c783fec98', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 20:43:34', '2023-04-03 20:43:34', '2024-04-04 02:13:34'),
('54a5a9f2a705112b8c6abb387422d048372ff7cd800955f9f43726b5f315cc36706fe1c11b5d421c', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:54:28', '2023-04-03 12:54:28', '2024-04-03 18:24:28'),
('6452525ab9288773ec07b9353407ed0a9fc4cd8db86e90ab4cba3d3cfeeaba7ee3cea7de7ee94e69', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 20:25:51', '2023-04-03 20:25:51', '2024-04-04 01:55:51'),
('f42d294a6e3d81c776b65b058a8c0d4e618bdb0c2105de17497edc90f121e452d1efb82461b1075b', 9, 1, 'TutsForWeb', '[]', 0, '2023-04-03 12:05:03', '2023-04-03 12:05:03', '2024-04-03 17:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
(2, NULL, 'Laravel Password Grant Client', 'zx31nXWdzpDBRIOdWsiFvrneI5EEPfVqJCIGENqw', 'users', 'http://localhost', 0, 1, 0, '2023-04-01 12:08:51', '2023-04-01 12:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-01 12:08:51', '2023-04-01 12:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_verification`
--

CREATE TABLE `otp_verification` (
  `id` bigint(20) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp_verification`
--

INSERT INTO `otp_verification` (`id`, `otp`, `mobile_no`, `status`, `created_at`, `updated_at`) VALUES
(1, '209614', 9890319604, '0', '2023-04-03 16:33:03', '2023-04-03 16:33:03'),
(2, '716254', 9890319604, '0', '2023-04-03 16:55:36', '2023-04-03 17:04:29'),
(3, '394189', 9890319604, '1', '2023-04-03 16:58:25', '2023-04-03 16:58:25'),
(4, '611155', 9890319604, '1', '2023-04-03 17:01:22', '2023-04-03 17:01:22'),
(5, '263462', 9890319604, '1', '2023-04-03 17:01:42', '2023-04-03 17:01:42'),
(6, '244345', 9890319604, '1', '2023-04-03 17:05:19', '2023-04-03 17:05:19'),
(7, '123456', 9890319604, '0', '2023-04-03 17:06:09', '2023-04-03 17:06:16'),
(8, '123456', 9890319604, '0', '2023-04-03 17:12:47', '2023-04-03 17:12:50'),
(9, '123456', 9890319604, '0', '2023-04-03 17:16:42', '2023-04-03 17:16:45'),
(10, '123456', 9890319604, '0', '2023-04-03 17:33:36', '2023-04-03 17:33:39'),
(11, '123456', 9890319604, '0', '2023-04-03 17:34:39', '2023-04-03 17:34:42'),
(12, '123456', 9890319604, '0', '2023-04-03 17:35:00', '2023-04-03 17:35:03'),
(13, '123456', 9890319604, '0', '2023-04-03 17:35:32', '2023-04-03 17:35:37'),
(14, '123456', 9890319604, '0', '2023-04-03 18:24:23', '2023-04-03 18:24:27'),
(15, '123456', 9890319604, '0', '2023-04-04 01:53:16', '2023-04-04 01:53:21'),
(16, '123456', 9890319604, '0', '2023-04-04 01:55:48', '2023-04-04 01:55:51'),
(17, '123456', 9890319604, '0', '2023-04-04 02:13:30', '2023-04-04 02:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `user_type` enum('user','subUser','superAdmin','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `activate_free_trial` datetime DEFAULT NULL,
  `activate_free_trial_status` enum('active','inactive','expire','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile_no`, `date_of_birth`, `address`, `gender`, `age`, `role`, `email_verified_at`, `password`, `remember_token`, `status`, `user_type`, `user_id`, `activate_free_trial`, `activate_free_trial_status`, `created_at`, `updated_at`) VALUES
(1, 'Bhagavat Solanke', 'bsolanke1234@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$RTvYcE5dcS.MqGTHsH5BTuwprS/zjhYWoWnvuyu9q3WVaEDbKwl2.', NULL, '1', 'superAdmin', NULL, NULL, NULL, '2023-04-01 11:49:06', '2023-04-01 11:49:06'),
(9, 'B Solanke', 'bSolanke@gmail.com', 9890319604, '1995-06-15', 'Pune', 'm', NULL, NULL, NULL, '$2y$10$JKKkJ1avjqBplAxq4EtaRe190kN489bjv5Cg8cVB9UP3o6wD0RdLK', NULL, '1', 'user', NULL, '2023-04-14 01:57:44', 'active', '2023-04-03 11:55:05', '2023-04-03 20:27:44'),
(10, 'Kedar 2', 'bSolanke1@gmail.com', 9890319204, NULL, 'Pune', 'm', '24', 'testq', NULL, '$2y$10$q2ly1A0x92nZyEjzYQI6bucTlWEVmhUVxWoijQ8dxFYFZ.2y3yhcu', NULL, '1', 'subUser', 9, NULL, NULL, '2023-04-03 19:45:47', '2023-04-03 19:45:47'),
(12, 'N Solanke', 'testnSolanke@gmail.com', 9890319609, NULL, 'Pune', 'm', '28', 'testq', NULL, '$2y$10$wxU.1DqIOVcwFaQssCIAJeXGO6ek3Z6yUf1RwX3gyTUXz6K9noqtO', NULL, '1', 'subUser', 9, NULL, NULL, '2023-04-03 19:52:01', '2023-04-03 19:52:01'),
(13, 'B Solanke', 'bSolanke11@gmail.com', 9890319608, '1995-06-15', 'Pune', 'm', NULL, NULL, NULL, '$2y$10$rHeCwbie47AO/Xlxh6cSBuj.PnF2crERwoW4171ksrS1F4eSut.c6', NULL, '1', 'user', NULL, NULL, NULL, '2023-04-03 20:34:47', '2023-04-03 20:34:47'),
(14, 'N Solanke1', 'testnSolanke1@gmail.com', 9890319602, NULL, 'Pune', 'm', '28', 'testq', NULL, '$2y$10$AhYPKCPGzdAWhZkwJejHbe8kzCrDwoWo9D9rsZ2ynZWGMp89h8j5C', NULL, '1', 'subUser', 9, NULL, NULL, '2023-04-03 20:51:43', '2023-04-03 20:51:43');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otp_verification`
--
ALTER TABLE `otp_verification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
