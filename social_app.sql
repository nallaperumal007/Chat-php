-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2024 at 06:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `passwords`
--

CREATE TABLE `passwords` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_history`
--

CREATE TABLE `password_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_history`
--

INSERT INTO `password_history` (`id`, `user_id`, `password_hash`, `created_at`) VALUES
(1, 19, '$2y$10$BudTgWdwT9KDzA2EVnOoTedVF1qStm9fw5wjk3neBB./XcGBN2uN.', '2024-07-27 13:09:45'),
(2, 21, '$2y$10$MU6SO9ebGRn3twSlLfCBNuU7p9zc/BdeNFgct3j0XLlYgjUxaSt1W', '2024-07-27 13:11:51'),
(3, 21, '$2y$10$nIWmWFslm2Ss3hSTlcq3VOEIyl52XxBBl5Pi9rgat2yXrHKheexO6', '2024-07-27 13:12:33'),
(4, 21, '$2y$10$71GCmBdpG6BRpmwik9274eBikfSvKz6yXJ3qx2./F3wQvMJpAI.C2', '2024-07-27 13:13:48'),
(5, 25, '$2y$10$NWnvGIhAYQ5bCnL81E.2aeKSKRMSgalweTaF5bBpXOLjMMYOxe2s6', '2024-07-27 14:02:50'),
(6, 25, '$2y$10$imsPYCJDfyAfvcAWDvVi0uksujkErFwKaKL.pBdmLa0fgsnTczC8a', '2024-07-27 14:03:08'),
(7, 25, '$2y$10$6FQn8eg9ggY26hwKQez0cOPOwMFFZc34gfmSNM/K.0Rk00j8z48Hy', '2024-07-27 14:03:23'),
(8, 26, '$2y$10$8DsYe9bLEw23Q/B5d3BUBuMqGlIwLJ7hSGaBGvygAw9mQ0PBQ7c.y', '2024-07-27 14:08:01'),
(9, 26, '$2y$10$ignm92UFJcIvUkQn3ft1HeYtEt2LvKkPSAcVDXQ0lGKFjL7nSYoHO', '2024-07-27 14:08:09'),
(10, 26, '$2y$10$CToX0we9okCEoIbcRUxy6O4MVEQeVEc6TXQDJ3H4GFcqoYYVOCYvO', '2024-07-27 14:08:18'),
(12, 27, '$2y$10$PYltFQjotOLV4HhEvMFbQuFdIv9LzKVSF9Lk.aXpGE8SlMF9R8Fp.', '2024-07-27 14:14:10'),
(13, 27, '$2y$10$BKUOr2ivO5A04wVi/IWG1OCTY5rBkOp3yHIEgCqfwCIG4b32q3L66', '2024-07-27 14:16:19'),
(14, 27, '$2y$10$DaAoLFwDQcW4cq/2tudoZeBv/LCw.Xzy7WKnndNT896QfmUsuVgAi', '2024-07-27 14:16:39'),
(15, 29, '$2y$10$pmx/jaYLHqGckF.9IfzxaOYihzO04KdOYAalgK9tG0UMxtkD4SnKy', '2024-07-29 14:07:59'),
(16, 29, '$2y$10$amBXDTJUTIP5vReF/jGbaONHpFnNdUqQVIl98WesgKE69GT5j/Wy2', '2024-07-29 14:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `is_public`, `created_at`) VALUES
(14, 7, 'hi', 1, '2024-06-23 03:18:00'),
(15, 7, 'good morning', 1, '2024-06-23 03:18:21'),
(17, 11, 'hi', 1, '2024-06-23 03:27:55'),
(18, 12, 'welcome', 1, '2024-06-23 03:30:58'),
(19, 13, 'Good', 1, '2024-06-23 05:14:15'),
(20, 14, 'eswar', 1, '2024-06-23 06:12:29'),
(22, 17, 'hi', 1, '2024-07-27 12:14:49'),
(30, 17, 'hiii', 1, '2024-07-27 12:24:53'),
(31, 28, 'HI i am waste', 1, '2024-07-27 14:20:33'),
(32, 29, 'hello', 1, '2024-07-29 14:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `private_messages`
--

CREATE TABLE `private_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `private_messages`
--

INSERT INTO `private_messages` (`id`, `sender_id`, `recipient_id`, `message_content`, `created_at`) VALUES
(1, 17, 7, 'hi\r\n\r\n', '2024-07-27 12:33:50'),
(2, 17, 7, 'Hello', '2024-07-27 12:35:09'),
(3, 17, 14, 'Good Evening', '2024-07-27 12:37:30'),
(4, 7, 17, 'hi bro\r\n', '2024-07-27 12:40:16'),
(5, 28, 27, 'hi', '2024-07-27 14:21:06'),
(6, 28, 27, 'i am nalla perumal', '2024-07-27 14:21:18'),
(7, 29, 26, 'hi', '2024-07-29 14:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `password_hash`) VALUES
(1, 'nalla', '$2y$10$XJB7lig/hPi7RU/i3X8A7OQquvi3Z5qjljpLcBUynPuOqVYZ.8svS', ''),
(3, 'nallaperumal', '$2y$10$Ds1xhe3IOtarJhb2xZpGkuHgGdwK/v7qbMcIM1h4D4FnLGQh707o.', ''),
(5, 'admin', '$2y$10$waZZm4BWYi06g4ORzmUGG.Q4zt6L4Q7YmG5e55/sGRU/tdG1d3o7m', ''),
(6, 'sundram', '$2y$10$wOP5Mzb4c828C/EcCayDQOA21QJOPNutGv/XGW9e2.9QoLePw2xfK', ''),
(7, 'arun', '$2y$10$CCaAduldumMdyXdjfa6dSOl1YzIcpDfjrMl56RpkBcHs5FeiwYtDK', ''),
(10, 'john', '$2y$10$zwgDFf29Jxzt5zCi723aaeL.Jib2k669jxeCTaOOfxl0nv5hF8ueu', ''),
(11, 'john1', '$2y$10$tS64K8Vi3Cd2W8wPkzkaOulVNQIqMoz2HZYByW84YprNEwhsb9EY.', ''),
(12, 'perumal', '$2y$10$wjF0AhdXARgY/1e/D35W8O/1mp4UlnLHifMxBPXpDu.qXF07hcZgm', ''),
(13, 'ram', '$2y$10$Cc44tQihoQOXH6n4D8mxBertTGF7kMPqQFuqxcMiVksYstxchU3wK', ''),
(14, 'eswar', '$2y$10$ci6ZsQmLOJffTgKh4yHFYOa1ypbsuighVyFD/kUVlUddegn3xJrG6', ''),
(17, 'nalla@gmail.com', '$2y$10$xX/8fkG8xylSaM7pk9rYqeu.kEuFzT6.AFHwb2OP9LKiqSGqVEbaS', ''),
(19, 'nalla007', '$2y$10$7P6NrrZ7bGJeJowKbsd1S.NOaw.W2C.5o5vb2sn6WK5JM82W6Zwky', '$2y$10$BudTgWdwT9KDzA2EVnOoTedVF1qStm9fw5wjk3neBB./XcGBN2uN.'),
(21, 'sundram005', '$2y$10$0GuKixkQV2v9MwNntpbCFO2nzYV73xBCLn0bWbZV3egfF7R5WTtyG', '$2y$10$71GCmBdpG6BRpmwik9274eBikfSvKz6yXJ3qx2./F3wQvMJpAI.C2'),
(22, 'raj', '', ''),
(25, 'raja', '', '$2y$10$6FQn8eg9ggY26hwKQez0cOPOwMFFZc34gfmSNM/K.0Rk00j8z48Hy'),
(26, 'don', '', '$2y$10$CToX0we9okCEoIbcRUxy6O4MVEQeVEc6TXQDJ3H4GFcqoYYVOCYvO'),
(27, '1', '', '$2y$10$DaAoLFwDQcW4cq/2tudoZeBv/LCw.Xzy7WKnndNT896QfmUsuVgAi'),
(28, '10', '', '$2y$10$c7sIUqHY7.H8MNSHMO0WMui/v2GYYo8/Fb/MAGyFOoRPY1VOuRReS'),
(29, 'rajaa', '', '$2y$10$amBXDTJUTIP5vReF/jGbaONHpFnNdUqQVIl98WesgKE69GT5j/Wy2'),
(31, 'kal@gmail.com', '', '$2y$10$S.hL/x.89ct9HWZd6iC8IuQS1yAjBrKIpL8tslk6ENvbFMB67kY0a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `passwords`
--
ALTER TABLE `passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_history`
--
ALTER TABLE `password_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `private_messages`
--
ALTER TABLE `private_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passwords`
--
ALTER TABLE `passwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_history`
--
ALTER TABLE `password_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `private_messages`
--
ALTER TABLE `private_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `passwords`
--
ALTER TABLE `passwords`
  ADD CONSTRAINT `passwords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `password_history`
--
ALTER TABLE `password_history`
  ADD CONSTRAINT `password_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `private_messages`
--
ALTER TABLE `private_messages`
  ADD CONSTRAINT `private_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `private_messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
