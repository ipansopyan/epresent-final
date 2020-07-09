-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 09 Jul 2020 pada 14.02
-- Versi Server: 5.7.21-1ubuntu1
-- PHP Version: 7.2.3-1ubuntu1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkuls`
--

CREATE TABLE `matkuls` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name_matkul` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `matkuls`
--

INSERT INTO `matkuls` (`id`, `user_id`, `name_matkul`, `created_at`, `updated_at`) VALUES
(52, 8, 'sdsd', '2020-07-05 11:42:47', '2020-07-05 11:42:47'),
(53, 8, 'sdsdd', '2020-07-05 11:43:19', '2020-07-05 11:59:07'),
(54, 9, 'gfhgf', '2020-07-06 12:55:27', '2020-07-06 12:55:27'),
(55, 9, 'fdgdfg', '2020-07-06 12:55:38', '2020-07-06 12:55:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presents`
--

CREATE TABLE `presents` (
  `id` bigint(20) NOT NULL,
  `mhs_id` bigint(20) NOT NULL,
  `mtkl_id` bigint(20) NOT NULL,
  `prt1` int(2) DEFAULT NULL,
  `prt2` int(2) DEFAULT NULL,
  `prt3` int(2) DEFAULT NULL,
  `prt4` int(2) DEFAULT NULL,
  `prt5` int(2) DEFAULT NULL,
  `prt6` int(2) DEFAULT NULL,
  `prt7` int(2) DEFAULT NULL,
  `prt8` int(2) DEFAULT NULL,
  `prt9` int(2) DEFAULT NULL,
  `prt10` int(2) DEFAULT NULL,
  `prt11` int(2) DEFAULT NULL,
  `prt12` int(2) DEFAULT NULL,
  `prt13` int(2) DEFAULT NULL,
  `prt14` int(2) DEFAULT NULL,
  `prt15` int(2) DEFAULT NULL,
  `prt16` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `presents`
--

INSERT INTO `presents` (`id`, `mhs_id`, `mtkl_id`, `prt1`, `prt2`, `prt3`, `prt4`, `prt5`, `prt6`, `prt7`, `prt8`, `prt9`, `prt10`, `prt11`, `prt12`, `prt13`, `prt14`, `prt15`, `prt16`, `created_at`, `updated_at`) VALUES
(13, 6, 52, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-05 11:46:52', '2020-07-05 11:46:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'ipan', 'ipan@mail.com', NULL, '$2y$10$a7f.H8tn16hD8qvwiSCMleIA52zn/pZ5CkqSX/62hKNzcG2bPa1Ci', 1, NULL, NULL, NULL),
(7, 'Admin', 'admin@test.com', NULL, '$2y$10$PSbE7Tcl3t7UhweMRc41geSrbXFq9FZy3QzRA3G8QT74kooCoLg6q', 3, NULL, '2020-06-11 01:02:59', '2020-06-11 01:02:59'),
(8, 'nama dosen', 'user@test.com', NULL, '$2y$10$a7f.H8tn16hD8qvwiSCMleIA52zn/pZ5CkqSX/62hKNzcG2bPa1Ci', 2, NULL, '2020-06-11 01:02:59', '2020-06-11 01:02:59'),
(9, 'dosendua', 'd@test.com', NULL, 'secret', 2, NULL, NULL, NULL),
(20, 'mhs1', 'mhs10@mail.com', NULL, '123', 1, NULL, NULL, NULL),
(21, 'mhs2', 'mhs1@mail.com', NULL, '123', 1, NULL, NULL, NULL),
(22, 'mhs3', 'mhs3@mail.com', NULL, '123', 1, NULL, NULL, NULL),
(23, 'mhs4', 'mhs4@mail.com', NULL, '123', 1, NULL, NULL, NULL),
(24, 'mhs5', 'mhs5@mail.com', NULL, '123', 1, NULL, NULL, NULL),
(25, 'ipan', 'ipan@maio.com', NULL, '$2y$10$sIHTPVHdje5WQdPAJc9lgei3TDR6om9ttT.OkAaVzlD1cjclIXP46', 1, NULL, '2020-07-02 13:11:53', '2020-07-02 13:11:53'),
(26, 'ipan', 'ipan12@mail.com', NULL, '$2y$10$CYi2ITyMVbHZGYkW9.G4VexXIbn6FAGBH8TSbvc9w.lYfpYN0SQ2G', 1, NULL, '2020-07-02 13:45:39', '2020-07-02 13:45:39'),
(34, 'fsd', 'sdipan@mail.com', NULL, '$2y$10$5LxvYf1QxHCcLpzoH57.2ejxX7IXqfTwUDtmU//E7431Tq0NjGU2O', 1, NULL, '2020-07-02 14:15:09', '2020-07-02 14:15:09'),
(35, 'sjdksj', 'test@test.com', NULL, '$2y$10$bCaSO6cvJ5GQYqs8Y5D2GeDjL5Cf7Tcu8NlQcdklUWszKJG1WaXhK', 2, NULL, '2020-07-05 11:32:02', '2020-07-05 11:32:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matkuls`
--
ALTER TABLE `matkuls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `presents`
--
ALTER TABLE `presents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dosen_id` (`mhs_id`),
  ADD KEY `mtkl_id` (`mtkl_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `matkuls`
--
ALTER TABLE `matkuls`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `presents`
--
ALTER TABLE `presents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `matkuls`
--
ALTER TABLE `matkuls`
  ADD CONSTRAINT `matkuls_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `presents`
--
ALTER TABLE `presents`
  ADD CONSTRAINT `presents_ibfk_1` FOREIGN KEY (`mhs_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presents_ibfk_2` FOREIGN KEY (`mtkl_id`) REFERENCES `matkuls` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
