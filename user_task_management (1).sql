-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 01:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `s_no` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`s_no`, `title`, `description`, `due_date`, `priority`, `assigned_to`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'test1', 'test for edit', '2024-02-05', 'high', 1, '2024-06-14 12:03:56', '2024-06-14 17:34:17', 1, 'pending'),
(2, 'testing 2 ', 'testing for userq', '2024-05-15', 'low', 2, '2024-06-14 13:18:57', '2024-06-14 13:18:57', 0, 'pending'),
(3, 'testing for user', 'df', '2024-12-05', 'medium', 2, '2024-06-14 13:19:20', '2024-06-14 18:55:16', 1, 'pending'),
(5, 'task for demo ', 'This is for demo task ', '2024-06-15', 'high', 2, '2024-06-18 05:42:23', '2024-06-18 05:42:23', 0, 'pending'),
(6, 'task for demo ', 'This is demo task ', '2024-05-16', 'medium', 2, '2024-06-18 05:48:08', '2024-06-18 05:48:08', 0, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'aaquib', 'Aaquibkhann0@gmail.com', '$2y$10$LTUsyVxk.EVCz5lMVSSXKueADKqVvLJz/V3VP2oAJt.K0b5zh9yOm', 'admin', '2024-06-14 09:52:40', '2024-06-14 11:46:07'),
(2, 'abc', 'abc@abc.com', '$2y$10$DvGV6Yx.roZQmjOD9SvUOOAWPnRUKGB0Oi774BlXMUDExWSy.BNpi', 'user', '2024-06-14 09:56:53', '2024-06-14 09:56:53'),
(4, 'user2', 'user@gmail.com', '$2y$10$zM5wbl5taMnTlTg29Fx2Ae.CYyTxEvWCXSASEMN8vNAUAWSsh1hDW', 'user', '2024-06-14 11:49:17', '2024-06-14 11:49:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
