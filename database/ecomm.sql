-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2022 at 02:39 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Drama', 'fiction'),
(2, 'Educational', 'educational'),
(3, 'Children\'s Books', 'history');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`) VALUES
(10, 'Ervin Malluta ', 'ervinmalluta2@gmail.com', 'Feedback', 'Hi!\r\nI just received the book. Such a great service from your side. All the best!');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(27, 15, 35, 1),
(28, 15, 33, 1),
(29, 16, 33, 1),
(30, 16, 34, 1),
(31, 16, 36, 1),
(32, 17, 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`) VALUES
(12, 1, 34),
(13, 20, 33);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`, `owner_id`) VALUES
(33, 2, 'Python programming in Context', '<p>Python Programming in Context, Third Edition&nbsp;<strong>provides a comprehensive and accessible introduction to Python fundamentals</strong>. Updated with Python 3.8, the new Third Edition offers a thorough overview of multiple applied areas, including image processing, cryptography, astronomy, the Internet, and bioinformatics.</p>\r\n', 'python-programming-context', 100, 'python-programming-context.jpg', '2022-11-03', 3, NULL),
(34, 2, 'Network security', '<p>Network Security&nbsp;<strong>protects your network and data from breaches, intrusions and other threats</strong>. This is a vast and overarching term that describes hardware and software solutions as well as processes or rules and configurations relating to network use, accessibility, and overall threat protection.</p>\r\n', 'network-security', 100, 'network-security.jpg', '2022-11-03', 2, NULL),
(35, 1, 'Three-in-the-back-two-in-the-head', '<p>The issue of loyalty and betrayal is dramatized through dialogue in the Governor-General&#39;s-Award-winning&nbsp;<em>Three in the Back, Two in the Head</em>, which appears to have been based on the assassination of Gerald Bull, the brilliant Canadian scientist who designed the first Star Wars system twenty years before Reagan announced his version. Bull ran afoul of the Pentagon and the CIA by his dealings with China, Chile, Yugoslavia, and Iraq. But Sherman&#39;s play is not a docudrama in any sense, for it merely uses some of the circumstances of the murdered scientist&#39;s career in order to concentrate on questions of personal and state morality as these circumscribe issues of loyalty and betrayal.</p>\r\n', 'three-back-two-head', 12, 'three-back-two-head.jpg', '2022-11-03', 7, NULL),
(36, 3, 'The Hobbit', '<p>This Definitive Paperback Edition Features Nine Illustrations And Two Maps Drawn By J.R.R. Tolkien, And A Preface By Christopher Tolkien. Bilbo Baggins Is A Hobbit Who Enjoys A Comfortable, Unambitious Life, Rarely Travelling Further Than The Pantry Of His Hobbit-Hole In Bag End. But His Contentment Is Disturbed When The Wizard, Gandalf, And A Company Of Thirteen Dwarves Arrive On His Doorstep One Day To Whisk Him Away On An Unexpected Journey &lsquo;There And Back Again&rsquo;. They Have A Plot To Raid The Treasure Hoard Of Smaug The Magnificent, A Large And Very Dangerous Dragon&hellip; The Prelude To The Lord Of The Rings, The Hobbit Has Sold Many Millions Of Copies Since Its Publication In 1937, Establishing Itself As One Of The Most Beloved And Influential Books Of The Twentieth Century.</p>\r\n', 'hobbit', 17, 'hobbit.jpg', '2022-11-03', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `product_id`, `user_id`, `comment`, `created_on`) VALUES
(18, 35, 20, 'This is an amazing book.', '2022-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(15, 1, '6360c75362fec', '2022-11-01'),
(16, 1, '636360d822e84', '2022-11-03'),
(17, 1, '636365645bb34', '2022-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$WIWUfsec1PAq9K5jAriI9uGXg3odVUsIwpbtUSU1Y2HDrumiftr/O', 1, 'Super', 'Admin', '', '', 'super_admin.png', 1, '', '', '2022-10-01'),
(17, 'Test@test.com', '$2y$10$iwLi5lQBLYFwOhoEY25h9eA8gnWhnae56RIynU68Ld/B/UnTtiOci', 0, 'Ben', 'Ten', '', '', '', 1, 'sxXqM28SNQwn', '', '2022-10-13'),
(18, 'ana@test.com', '$2y$10$iwLi5lQBLYFwOhoEY25h9eA8gnWhnae56RIynU68Ld/B/UnTtiOci', 0, 'Anna', 'Bana', '', '', '', 1, '9l5GvaZgIpU2', '', '2022-10-13'),
(19, 'anatest@test.com', '$2y$10$iwLi5lQBLYFwOhoEY25h9eA8gnWhnae56RIynU68Ld/B/UnTtiOci', 0, 'AnnaTest', 'Bana', '', '', 'female3.jpg', 1, 'zSI5orjvVXWL', '', '2022-10-13'),
(20, 'ervinmalluta2@gmail.com', '$2y$10$mUM3swAXuvWJVwkXpDZxj.UhMYTYYwBVcwoJY.9vKeClydja0aEpu', 0, 'vini', 'vini', '', '', '', 1, 'SFf2cKAjitZT', 'bAdc7Qy4nVRWIJX', '2022-11-01'),
(21, 'klementbinaj@gmail.com', '$2y$10$oO9qLV9r0rp92IZYIDRHBOc0DqllCCJWrjdBzz6AmvlDX09o6XbZe', 0, 'klement', 'binaj', '', '', '', 1, 'XGgnPZkSH3u9', 'dD8KY9b7piOvhwt', '2022-11-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_FK` (`user_id`),
  ADD KEY `product_FK` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_foreign_key` (`sales_id`),
  ADD KEY `product_foreign_key` (`product_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`product_id`),
  ADD KEY `product_FK_1` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_FK_1` (`owner_id`),
  ADD KEY `category_FK` (`category_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`user_id`),
  ADD KEY `user_FK_2` (`user_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_foriegn_key` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `user_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `product_foreign_key` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sales_foreign_key` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `product_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `user_FK_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `owner_FK_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `product_FK_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_FK_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `user_foriegn_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
