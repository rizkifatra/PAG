-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2025 at 08:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PAG`
--

-- --------------------------------------------------------

--
-- Table structure for table `fill_blank_questions`
--

CREATE TABLE `fill_blank_questions` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answers`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fill_blank_questions`
--

INSERT INTO `fill_blank_questions` (`id`, `level`, `question_text`, `answers`) VALUES
(3, 1, 'Phishing emails often create a sense of [blank] to make you act quickly.', '[\"urgency\"]'),
(4, 1, 'A legitimate company will never ask for your [blank] through email.', '[\"password\"]'),
(5, 1, 'Always check the sender\'s [blank] address carefully in suspicious emails.', '[\"email\"]'),
(6, 1, 'Links in phishing emails often lead to [blank] websites that look real.', '[\"fake\"]'),
(7, 2, 'If an email offers something too good to be [blank], it\'s probably a scam.', '[\"true\"]'),
(8, 2, 'Never click on [blank] attachments from unknown senders.', '[\"suspicious\"]'),
(9, 2, 'Phishing attempts can come through [blank], email, or social media.', '[\"text\"]'),
(10, 2, 'Always verify the website\'s [blank] before entering sensitive information.', '[\"security\"]'),
(11, 3, 'A common sign of phishing is poor [blank] and spelling errors.', '[\"grammar\"]'),
(12, 3, 'If you\'re unsure about an email, always [blank] before taking action.', '[\"verify\"]'),
(13, 1, 'HTML stands for [blank] Text Markup Language.', '[\"Hyper\"]'),
(14, 1, 'CSS stands for Cascading [blank] Sheets.', '[\"Style\"]'),
(15, 1, 'PHP is a [blank] programming language.', '[\"server-side\"]');

-- --------------------------------------------------------

--
-- Table structure for table `mcq_questions`
--

CREATE TABLE `mcq_questions` (
  `id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `options` text NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcq_questions`
--

INSERT INTO `mcq_questions` (`id`, `question_text`, `options`, `correct_answer`, `level`) VALUES
(36, 'What is phishing?', '[\"A cybercrime that uses email or websites to steal personal information\",\"A computer virus\",\"A type of firewall\",\"A secure email protocol\"]', 0, 1),
(37, 'Which of these is a common sign of a phishing email?', '[\"Urgent requests for personal information\",\"Professional company logo\",\"Correct spelling and grammar\",\"Normal sender email address\"]', 0, 1),
(38, 'What should you do if you receive a suspicious email?', '[\"Do not click any links and report it\",\"Click the link to check if it\'s real\",\"Download the attachment to scan it\",\"Reply to ask if it\'s legitimate\"]', 0, 1),
(39, 'What personal information do phishers commonly try to steal?', '[\"Passwords and bank details\",\"Favorite color\",\"Birth place\",\"Hobby information\"]', 0, 1),
(40, 'What is a safe way to verify a suspicious email from your bank?', '[\"Call your bank using their official phone number\",\"Click the link in the email\",\"Reply to the email\",\"Use the contact information in the email\"]', 0, 1),
(41, 'What is a suspicious sign in a sender\'s email address?', '[\"facebook-security@mail.com instead of @facebook.com\",\"support@facebook.com\",\"help@facebook.com\",\"security@facebook.com\"]', 0, 2),
(42, 'Which email subject line is most likely to be phishing?', '[\"URGENT: Your account will be suspended in 24 hours\",\"Your monthly statement is ready\",\"Thank you for your purchase\",\"Welcome to our newsletter\"]', 0, 2),
(43, 'What should you check before clicking an email link?', '[\"Hover over the link to preview the URL\",\"Click it quickly\",\"Open it in a new tab\",\"Download it first\"]', 0, 2),
(44, 'What is \"spear phishing\"?', '[\"Targeted phishing using personal information\",\"Mass email scams\",\"Regular spam emails\",\"Virus attachments\"]', 0, 2),
(45, 'Which attachment file type is most suspicious?', '[\".exe file\",\".pdf file\",\".jpg file\",\".txt file\"]', 0, 2),
(46, 'What is a sign of a fake social media profile?', '[\"Recently created with few friends/posts\",\"Has many photos\",\"Has many friends\",\"Posts regularly\"]', 0, 3),
(47, 'How can you verify a company\'s social media message?', '[\"Visit the company\'s official website directly\",\"Click the link they sent\",\"Send them your details\",\"Download their app from the message\"]', 0, 3),
(48, 'What is \"catfishing\"?', '[\"Creating fake profiles to deceive people\",\"Sending spam messages\",\"Hacking accounts\",\"Sharing fake news\"]', 0, 3),
(49, 'What should you avoid sharing on social media?', '[\"Personal financial information\",\"Holiday photos\",\"Pet photos\",\"Food pictures\"]', 0, 3),
(50, 'How can you protect your social media account?', '[\"Use two-factor authentication\",\"Share your password with friends\",\"Use simple passwords\",\"Keep login info in bio\"]', 0, 3),
(51, 'How can you identify a secure shopping website?', '[\"Look for HTTPS and padlock icon\",\"Amazing discounts\",\"Countdown timers\",\"Pop-up ads\"]', 0, 4),
(52, 'What is a safe way to pay online?', '[\"Use secure payment services like PayPal\",\"Direct bank transfer\",\"Western Union to stranger\",\"Cash by mail\"]', 0, 4),
(53, 'Which URL is legitimate for Amazon?', '[\"www.amazon.com\",\"amazon.shopping-deals.com\",\"amazonshopping.net\",\"amazon-secure-shopping.com\"]', 0, 4),
(54, 'What is a sign of a fake shopping website?', '[\"Prices that are too good to be true\",\"Professional looking design\",\"Many product reviews\",\"Contact information\"]', 0, 4),
(55, 'What should you do before entering credit card details?', '[\"Verify the website is secure and legitimate\",\"Enter details quickly\",\"Share link with friends\",\"Save details for later\"]', 0, 4),
(56, 'What is pharming?', '[\"Redirecting users to fake websites even with correct URL\",\"Regular phishing\",\"Email scanning\",\"Password theft\"]', 0, 5),
(57, 'What is smishing?', '[\"Phishing through SMS messages\",\"Email phishing\",\"Voice phishing\",\"Social media phishing\"]', 0, 5),
(58, 'How does vishing work?', '[\"Phone calls pretending to be official organizations\",\"Email attachments\",\"Text messages\",\"Social media posts\"]', 0, 5),
(59, 'What is a man-in-the-middle attack?', '[\"Intercepting communications between two parties\",\"Direct hacking\",\"Password guessing\",\"Social engineering\"]', 0, 5),
(60, 'What is clone phishing?', '[\"Copying legitimate emails with malicious content\",\"New email scams\",\"Fake websites\",\"Virus attacks\"]', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `temp_registrations`
--

CREATE TABLE `temp_registrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `verification_code` VARCHAR(6) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `temp_registrations`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `score` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verification_code` varchar(6) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `google_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `score`, `created_at`, `updated_at`, `verification_code`, `is_verified`, `reset_token`, `reset_token_expiry`, `profile_picture`, `is_admin`, `google_id`) VALUES
(4, 'aaaa', 'aaaa@gmail.com', 'test1234', 130, '2025-04-11 18:56:47', '2025-04-11 19:37:31', NULL, 0, NULL, NULL, NULL, 0, NULL),
(11, 'Test User', 'test@example.com', 'test1234', 0, '2025-01-26 11:32:18', '2025-04-11 19:38:27', NULL, 0, NULL, NULL, NULL, 0, NULL),
(12, 'Muhammad rizki fatra', 'rizkifatra22@gmail.com', '$2y$10$9I6eNf1FNOAq9.nyTkZxHuKlYWjyCHd7aHdPjm4/P7GC6bC3DY/Dy', 2424, '2025-01-26 11:42:27', '2025-04-28 18:05:57', '071817', 0, 'c2cdaea18181f16c835188c67bc6ceb90639fe7505613a8ce452576755c4832a', '2025-04-28 21:05:57', '12_1744446460_IMG_9402.jpg', 1, NULL),
(14, 'Rizki Fatra', 'rizki.fatra31@gmail.com', '$2y$10$xa53D/qpVPM6lDaydSxO3uCSL2et4sKC29noCGQ8a7RJhLHIYo2qq', 0, '2025-04-29 02:46:08', '2025-04-29 02:46:39', NULL, 0, NULL, NULL, NULL, 1, '111297036446488676261'),
(15, 'Muhammad Rizki Fatra', 'rizki.fatra22@gmail.com', '$2y$10$CNB0tdI2xroSNzxQR0sNAeS6e2TUHWrVifmGf1eEVcI8qBJ9C52xW', 0, '2025-04-30 06:01:11', '2025-04-30 06:01:11', NULL, 0, NULL, NULL, NULL, 0, '113297163681051473774');

-- --------------------------------------------------------

--
-- Table structure for table `user_scores`
--

CREATE TABLE `user_scores` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_type` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time_taken` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_scores`
--

INSERT INTO `user_scores` (`id`, `user_id`, `game_type`, `level`, `score`, `time_taken`, `created_at`, `updated_at`) VALUES
(1, 12, 'mcq', 1, 530, 12, '2025-04-07 14:41:21', '2025-04-07 14:41:51'),
(2, 12, 'mcq', 3, 506, 8, '2025-04-07 15:36:52', NULL),
(3, 5, 'fillblank', 2, 480, 12, '2025-04-07 15:40:20', NULL),
(4, 12, 'word_puzzle', 1, 626, 18, '2025-04-07 15:41:17', '2025-04-07 15:42:39'),
(5, 4, 'word_puzzle', 2, 602, 60, '2025-04-07 15:44:02', NULL),
(6, 13, 'mcq', 1, 491, 5, '2025-04-08 22:20:05', NULL),
(10, 11, 'mcq', 3, 1000, 12, '2025-04-11 17:07:27', '2025-01-26 19:23:37'),
(20, 11, 'mcq', 2, 1320, 120, '2025-04-11 17:08:22', NULL),
(21, 12, 'mcq', 2, 455, 57, '2025-04-25 16:19:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `word_search_puzzles`
--

CREATE TABLE `word_search_puzzles` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `words` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`words`)),
  `grid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`grid`)),
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Stores word positions and directions' CHECK (json_valid(`answers`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `word_search_puzzles`
--

INSERT INTO `word_search_puzzles` (`id`, `level`, `category`, `words`, `grid`, `answers`, `created_at`) VALUES
(3, 1, 'Basic Phishing Terms', '[\"PHISHING\", \"SCAM\", \"SPAM\", \"FRAUD\", \"BAIT\", \"FAKE\"]', '[\r\n    [\"P\",\"H\",\"I\",\"S\",\"H\",\"I\",\"N\",\"G\",\"F\",\"B\"],\r\n    [\"S\",\"C\",\"A\",\"M\",\"F\",\"R\",\"K\",\"S\",\"R\",\"A\"],\r\n    [\"B\",\"F\",\"E\",\"S\",\"A\",\"K\",\"P\",\"P\",\"A\",\"I\"],\r\n    [\"S\",\"R\",\"T\",\"P\",\"K\",\"S\",\"A\",\"A\",\"U\",\"T\"],\r\n    [\"P\",\"A\",\"S\",\"A\",\"E\",\"B\",\"M\",\"M\",\"D\",\"F\"],\r\n    [\"A\",\"U\",\"P\",\"M\",\"S\",\"A\",\"F\",\"E\",\"S\",\"R\"],\r\n    [\"M\",\"D\",\"H\",\"S\",\"C\",\"I\",\"K\",\"L\",\"N\",\"T\"],\r\n    [\"F\",\"A\",\"K\",\"E\",\"M\",\"T\",\"B\",\"K\",\"S\",\"A\"],\r\n    [\"S\",\"P\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"],\r\n    [\"B\",\"N\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"]\r\n]', '[\r\n    {\"word\": \"PHISHING\", \"row\": 0, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"SCAM\", \"row\": 1, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"SPAM\", \"row\": 5, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"FRAUD\", \"row\": 2, \"col\": 1, \"direction\": \"vertical\"},\r\n    {\"word\": \"BAIT\", \"row\": 0, \"col\": 9, \"direction\": \"vertical\"},\r\n    {\"word\": \"FAKE\", \"row\": 7, \"col\": 0, \"direction\": \"horizontal\"}\r\n]', '2025-01-21 17:06:46'),
(4, 2, 'Online Security', '[\"PASSWORD\", \"SECURE\", \"ALERT\", \"VIRUS\", \"HACK\", \"SAFE\"]', '[\r\n    [\"P\",\"A\",\"S\",\"S\",\"W\",\"O\",\"R\",\"D\",\"F\",\"B\"],\r\n    [\"S\",\"E\",\"C\",\"U\",\"R\",\"E\",\"K\",\"S\",\"R\",\"A\"],\r\n    [\"H\",\"F\",\"V\",\"I\",\"R\",\"U\",\"S\",\"P\",\"A\",\"L\"],\r\n    [\"A\",\"R\",\"T\",\"P\",\"K\",\"S\",\"A\",\"A\",\"U\",\"E\"],\r\n    [\"C\",\"A\",\"S\",\"A\",\"E\",\"B\",\"F\",\"M\",\"D\",\"R\"],\r\n    [\"K\",\"U\",\"P\",\"M\",\"S\",\"A\",\"E\",\"E\",\"S\",\"T\"],\r\n    [\"S\",\"D\",\"H\",\"S\",\"C\",\"I\",\"K\",\"L\",\"N\",\"T\"],\r\n    [\"A\",\"F\",\"K\",\"E\",\"M\",\"T\",\"B\",\"K\",\"S\",\"A\"],\r\n    [\"F\",\"E\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"],\r\n    [\"E\",\"N\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"]\r\n]', '[\r\n    {\"word\": \"PASSWORD\", \"row\": 0, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"SECURE\", \"row\": 1, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"ALERT\", \"row\": 0, \"col\": 9, \"direction\": \"vertical\"},\r\n    {\"word\": \"VIRUS\", \"row\": 2, \"col\": 2, \"direction\": \"horizontal\"},\r\n    {\"word\": \"HACK\", \"row\": 2, \"col\": 0, \"direction\": \"vertical\"},\r\n    {\"word\": \"SAFE\", \"row\": 7, \"col\": 0, \"direction\": \"diagonal\"}\r\n]', '2025-01-21 17:06:46'),
(5, 3, 'Email Safety', '[\"MALWARE\", \"TROJAN\", \"SUSPECT\", \"LINK\", \"ATTACH\", \"URL\"]', '[\r\n    [\"M\",\"A\",\"L\",\"W\",\"A\",\"R\",\"E\",\"D\",\"F\",\"B\"],\r\n    [\"T\",\"R\",\"O\",\"J\",\"A\",\"N\",\"K\",\"S\",\"R\",\"A\"],\r\n    [\"S\",\"F\",\"V\",\"L\",\"I\",\"N\",\"K\",\"P\",\"A\",\"L\"],\r\n    [\"U\",\"R\",\"T\",\"P\",\"K\",\"S\",\"A\",\"A\",\"U\",\"E\"],\r\n    [\"S\",\"L\",\"S\",\"A\",\"E\",\"B\",\"F\",\"M\",\"D\",\"R\"],\r\n    [\"P\",\"U\",\"P\",\"M\",\"S\",\"A\",\"E\",\"E\",\"S\",\"T\"],\r\n    [\"E\",\"D\",\"H\",\"S\",\"C\",\"I\",\"K\",\"L\",\"N\",\"T\"],\r\n    [\"C\",\"F\",\"K\",\"E\",\"M\",\"T\",\"B\",\"K\",\"S\",\"A\"],\r\n    [\"T\",\"E\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"],\r\n    [\"ATTACH\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"]\r\n]', '[\r\n    {\"word\": \"MALWARE\", \"row\": 0, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"TROJAN\", \"row\": 1, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"SUSPECT\", \"row\": 2, \"col\": 0, \"direction\": \"vertical\"},\r\n    {\"word\": \"LINK\", \"row\": 2, \"col\": 3, \"direction\": \"horizontal\"},\r\n    {\"word\": \"ATTACH\", \"row\": 9, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"URL\", \"row\": 3, \"col\": 0, \"direction\": \"horizontal\"}\r\n]', '2025-01-21 17:06:46'),
(6, 4, 'Social Engineering', '[\"IDENTITY\", \"SOCIAL\", \"TRUST\", \"THREAT\", \"DATA\", \"STEAL\"]', '[\r\n    [\"I\",\"D\",\"E\",\"N\",\"T\",\"I\",\"T\",\"Y\",\"F\",\"B\"],\r\n    [\"S\",\"O\",\"C\",\"I\",\"A\",\"L\",\"K\",\"S\",\"R\",\"A\"],\r\n    [\"T\",\"F\",\"V\",\"T\",\"R\",\"U\",\"S\",\"T\",\"A\",\"L\"],\r\n    [\"E\",\"R\",\"H\",\"P\",\"K\",\"S\",\"A\",\"E\",\"U\",\"E\"],\r\n    [\"A\",\"A\",\"R\",\"A\",\"E\",\"B\",\"F\",\"A\",\"D\",\"R\"],\r\n    [\"L\",\"U\",\"E\",\"M\",\"S\",\"A\",\"E\",\"L\",\"S\",\"T\"],\r\n    [\"D\",\"D\",\"A\",\"T\",\"A\",\"I\",\"K\",\"L\",\"N\",\"T\"],\r\n    [\"T\",\"F\",\"T\",\"E\",\"M\",\"T\",\"B\",\"K\",\"S\",\"A\"],\r\n    [\"F\",\"E\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"],\r\n    [\"E\",\"N\",\"L\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"]\r\n]', '[\r\n    {\"word\": \"IDENTITY\", \"row\": 0, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"SOCIAL\", \"row\": 1, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"TRUST\", \"row\": 2, \"col\": 4, \"direction\": \"horizontal\"},\r\n    {\"word\": \"THREAT\", \"row\": 2, \"col\": 0, \"direction\": \"vertical\"},\r\n    {\"word\": \"DATA\", \"row\": 6, \"col\": 1, \"direction\": \"horizontal\"},\r\n    {\"word\": \"STEAL\", \"row\": 0, \"col\": 0, \"direction\": \"vertical\"}\r\n]', '2025-01-21 17:06:46'),
(7, 5, 'Advanced Threats', '[\"PHARMING\", \"VISHING\", \"SMISHING\", \"SPOOFING\", \"HOOK\", \"BREACH\"]', '[\r\n    [\"P\",\"H\",\"A\",\"R\",\"M\",\"I\",\"N\",\"G\",\"F\",\"B\"],\r\n    [\"V\",\"I\",\"S\",\"H\",\"I\",\"N\",\"G\",\"S\",\"R\",\"A\"],\r\n    [\"S\",\"F\",\"M\",\"L\",\"B\",\"U\",\"S\",\"P\",\"E\",\"L\"],\r\n    [\"M\",\"R\",\"I\",\"P\",\"R\",\"S\",\"A\",\"O\",\"U\",\"E\"],\r\n    [\"I\",\"A\",\"S\",\"A\",\"E\",\"B\",\"F\",\"O\",\"D\",\"R\"],\r\n    [\"S\",\"U\",\"H\",\"M\",\"A\",\"A\",\"E\",\"F\",\"S\",\"T\"],\r\n    [\"H\",\"D\",\"I\",\"S\",\"C\",\"I\",\"K\",\"I\",\"N\",\"T\"],\r\n    [\"I\",\"F\",\"N\",\"E\",\"H\",\"T\",\"B\",\"N\",\"S\",\"A\"],\r\n    [\"N\",\"E\",\"G\",\"K\",\"S\",\"N\",\"D\",\"G\",\"A\",\"P\"],\r\n    [\"G\",\"BREACH\",\"K\",\"S\",\"N\",\"D\",\"T\",\"A\",\"P\"]\r\n]', '[\r\n    {\"word\": \"PHARMING\", \"row\": 0, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"VISHING\", \"row\": 1, \"col\": 0, \"direction\": \"horizontal\"},\r\n    {\"word\": \"SMISHING\", \"row\": 2, \"col\": 0, \"direction\": \"vertical\"},\r\n    {\"word\": \"SPOOFING\", \"row\": 2, \"col\": 3, \"direction\": \"diagonal\"},\r\n    {\"word\": \"HOOK\", \"row\": 4, \"col\": 6, \"direction\": \"vertical\"},\r\n    {\"word\": \"BREACH\", \"row\": 9, \"col\": 1, \"direction\": \"horizontal\"}\r\n]', '2025-01-21 17:06:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fill_blank_questions`
--
ALTER TABLE `fill_blank_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mcq_questions`
--
ALTER TABLE `mcq_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_registrations`
--
ALTER TABLE `temp_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_code` (`email`, `verification_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_scores`
--
ALTER TABLE `user_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_game_level` (`user_id`,`game_type`,`level`);

--
-- Indexes for table `word_search_puzzles`
--
ALTER TABLE `word_search_puzzles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fill_blank_questions`
--
ALTER TABLE `fill_blank_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mcq_questions`
--
ALTER TABLE `mcq_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `temp_registrations`
--
ALTER TABLE `temp_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_scores`
--
ALTER TABLE `user_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `word_search_puzzles`
--
ALTER TABLE `word_search_puzzles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
