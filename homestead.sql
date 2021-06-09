-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2021 at 02:15 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homestead`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `booking_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill` decimal(10,2) NOT NULL,
  `expire` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `bookings`
--
DELIMITER $$
CREATE TRIGGER `restore_booking` BEFORE DELETE ON `bookings` FOR EACH ROW BEGIN
          SET @oldP = (SELECT passenger FROM detail_bookings WHERE booking_id = OLD.id);
          SET @oldC = (SELECT class FROM detail_bookings WHERE booking_id = OLD.id);
          IF old.vehicle = 'plane' THEN
            IF @oldC = 'eco_seat' THEN
              UPDATE plane_schedules SET eco_seat = eco_seat + @oldP WHERE id = OLD.schedule_id;
            ELSEIF @oldC = 'bus_seat' THEN
              UPDATE plane_schedules SET bus_seat = bus_seat + @oldP WHERE id = OLD.schedule_id;
            ELSEIF @oldC = 'first_seat' THEN
              UPDATE plane_schedules SET first_seat = first_seat + @oldP WHERE id = OLD.schedule_id;
            END IF;
          ELSEIF old.vehicle = 'train' THEN
            IF @oldC = 'eco_seat' THEN
              UPDATE train_schedules SET eco_seat = eco_seat + @oldP WHERE id = OLD.schedule_id;
            ELSEIF @oldC = 'bus_seat' THEN
              UPDATE train_schedules SET bus_seat = bus_seat + @oldP WHERE id = OLD.schedule_id;
            ELSEIF @oldC = 'exec_seat' THEN
              UPDATE train_schedules SET exec_seat = exec_seat + @oldP WHERE id = OLD.schedule_id;
            END IF;
          END IF;
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_bookings`
--

CREATE TABLE `detail_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `passenger` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group`, `created_at`, `updated_at`) VALUES
(1, 'member', '2019-11-29 03:52:38', '2019-11-29 03:52:38'),
(2, 'admin', '2019-11-29 03:52:38', '2019-11-29 03:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-11-29 03:52:38', '2019-11-29 03:52:38'),
(2, 2, 2, '2019-11-29 03:52:38', '2019-11-29 03:52:38');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_100001_create_groups_table', 1),
(4, '2014_10_12_100002_create_group_user_table', 1),
(5, '2018_01_25_154144_create_bookings_table', 1),
(6, '2018_01_25_154250_create_detail_bookings_table', 1),
(7, '2018_01_25_154251_create_transactions_table', 1),
(8, '2018_01_25_154314_create_passengers_table', 1),
(9, '2018_01_25_154441_create_planes_table', 1),
(10, '2018_01_25_154442_create_plane_fares_table', 1),
(11, '2018_01_25_154443_create_airports_table', 1),
(12, '2018_01_25_154453_create_plane_schedules_table', 1),
(13, '2018_02_11_150535_create_trains_table', 1),
(14, '2018_02_11_150536_create_train_stations', 1),
(15, '2018_02_11_150537_create_train_fares', 1),
(16, '2018_02_11_150620_create_train_schedules', 1),
(17, '2018_02_21_084438_create_bank_accounts_table', 1),
(18, '2018_03_10_210210_create_trigger_booking', 1);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int(10) UNSIGNED NOT NULL,
  `detail_booking_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tanggal_berangkat` date DEFAULT NULL,
  `no_hp` varchar(13) NOT NULL,
  `dewasa` int(11) NOT NULL,
  `anak` int(11) NOT NULL,
  `kota_asal` varchar(200) NOT NULL,
  `kelas_kereta` varchar(200) NOT NULL,
  `perjalanan` varchar(200) NOT NULL,
  `kota_tujuan` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `nama_lengkap`, `tanggal_berangkat`, `no_hp`, `dewasa`, `anak`, `kota_asal`, `kelas_kereta`, `perjalanan`, `kota_tujuan`, `created_at`, `updated_at`) VALUES
(1, 'Nesty Tampubolon', NULL, '082276636822', 2, 0, 'zUnRA', 'Bisnis', 'Sekali Jalan', 'u7GJF', '2021-06-09 10:17:24.000000', '2021-06-09 10:17:24.000000'),
(2, 'Tria', NULL, '8980238782', 2, 3, 'in4Fg', 'Eksekutif', 'Sekali Jalan', 'in4Fg', '2021-06-09 10:20:02.000000', '2021-06-09 10:20:02.000000');

-- --------------------------------------------------------

--
-- Table structure for table `train_stations`
--

CREATE TABLE `train_stations` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `station_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `train_stations`
--

INSERT INTO `train_stations` (`id`, `code`, `city`, `station_name`, `created_at`, `updated_at`) VALUES
(1, 'zUnRA', 'Sipoholon', 'Tapanuli Utara', '2021-06-04 03:52:38', '2021-06-04 03:52:38'),
(2, 'u7GJF', 'Balige', 'Toba', '2021-06-04 03:52:38', '2021-06-04 03:52:38'),
(3, 'in4Fg', 'Porsea', 'Toba', '2021-06-08 15:27:44', '2021-06-10 15:27:44'),
(4, '2in45', 'Sigumpar', 'Toba', '2021-06-04 11:40:12', '2021-06-04 11:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ammount` decimal(10,2) DEFAULT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `verification_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `phone`, `email`, `password`, `verified`, `verification_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Member EzGoo', 'Member', 'EzGoo', '082220279970', 'member@ezgoo.com', '$2y$10$MnAR9nKryfJpDEiJ85RJdebqaXO8ik1pnQHGmZbHXG8brjm4cxFNq', 1, '123tokenm', 'do1LSzXSVOUumhg2PdKs6aRSrKfXdYY4sR6bNBL4YK1a9Os2lR4GAsdvMaTD', '2019-11-29 03:52:38', '2019-11-29 03:52:38'),
(2, 'Admin EzGoo', 'Admin', 'EzGoo', '082220279970', 'admin@ezgoo.com', '$2y$10$LDg.ZEP1IzflXuB5swzCpuiDcUNP61RLdeD9.i959xzejjIhoThL6', 1, '123tokena', 'RXNuMvE3Hzk0wytXZgJv2y2V6FQ5w3Bnz3m9555d5gOzHBRZodCHfUqDb3HW', '2019-11-29 03:52:38', '2019-11-29 03:52:38'),
(3, 'Albert Butarbutar', 'Albert', 'Butarbutar', '082166165145', 'albertbutarbutar16@gmail.com', '$2y$10$Jt/pXQ409GXhO9enR8zR7uKhlI5rwdvL8uxGih09p5JuXTd6Ld0QS', 0, NULL, 'refBzunGdSRTjGDCi3oDlyCAANB9OgZJSm26a8NXP4qJjsnu2Mre2wTIXPPn', '2021-06-04 10:38:31', '2021-06-04 10:38:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `detail_bookings`
--
ALTER TABLE `detail_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_bookings_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_user_group_id_foreign` (`group_id`),
  ADD KEY `group_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passengers_detail_booking_id_foreign` (`detail_booking_id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `train_stations`
--
ALTER TABLE `train_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_booking_id_foreign` (`booking_id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_bookings`
--
ALTER TABLE `detail_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `train_stations`
--
ALTER TABLE `train_stations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
