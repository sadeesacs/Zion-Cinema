-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2024 at 12:52 PM
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
-- Database: `zioncinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customerinquiries`
--

CREATE TABLE `customerinquiries` (
  `InquiryID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customerinquiries`
--

INSERT INTO `customerinquiries` (`InquiryID`, `Name`, `Email`, `Message`) VALUES
(1, 'John Doe', 'johndoe@gmail.com', 'I would like to know the timings of the shows.'),
(2, 'Jane Smith', 'janesmith@gmail.com', 'Do you have wheelchair accessibility in the hall?'),
(3, 'Alice Brown', 'alicebrown@gmail.com', 'Can I book tickets for a group event online?'),
(4, 'Mark Taylor', 'marktaylor@gmail.com', 'Are there any discounts available for students?'),
(5, 'Emily Clark', 'emilyclark@gmail.com', 'Is outside food allowed in the cinema hall?');

-- --------------------------------------------------------

--
-- Table structure for table `fooditem`
--

CREATE TABLE `fooditem` (
  `FoodID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Food_Image` varchar(255) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fooditem`
--

INSERT INTO `fooditem` (`FoodID`, `Name`, `Food_Image`, `Type`, `Price`) VALUES
(1, 'Salt Popcorn - Large', 'images/Food/Salt Popcorn - Large.jpg', 'Popcorn', 500.00),
(2, 'Salt Popcorn - Medium', 'images/Food/Salt Popcorn - Medium.jpg', 'Popcorn', 350.00),
(3, 'Caramel Popcorn - Large', 'images/Food/Caramel Popcorn - Large.jpg', 'Popcorn', 600.00),
(4, 'Caramel Popcorn - Medium', 'images/Food/Caramel Popcorn - Medium.jpg', 'Popcorn', 400.00),
(5, 'Cheese Popcorn - Large', 'images/Food/Cheese Popcorn - Large.jpg', 'Popcorn', 650.00),
(6, 'Cheese Popcorn - Medium', 'images/Food/Cheese Popcorn - Medium.jpg', 'Popcorn', 450.00),
(7, 'Butter Salt Popcorn - Large', 'images/Food/Butter Salt Popcorn - Large.jpg', 'Popcorn', 550.00),
(8, 'CocaCola', 'images/Food/CocaCola.jpg', 'Beverages', 200.00),
(9, 'Fanta', 'images/Food/Fanta.jpg', 'Beverages', 200.00),
(10, 'CocaColaZero', 'images/Food/CocaColaZero.jpg', 'Beverages', 220.00),
(11, 'Sprite', 'images/Food/Sprite.jpg', 'Beverages', 200.00),
(12, 'Iced Coffee Hazelnut', 'images/Food/Iced Coffee Hazelnut.jpg', 'Beverages', 350.00),
(13, 'Iced Coffee Fresh Vannila', 'images/Food/Iced Coffee Fresh Vannila.jpg', 'Beverages', 350.00),
(14, 'Iced Coffee Latte', 'images/Food/Iced Coffee Latte.jpg', 'Beverages', 350.00),
(15, 'Choco Coffee', 'images/Food/Choco Coffee.jpg', 'Coffee', 300.00),
(16, 'Espresso', 'images/Food/Espresso.jpg', 'Coffee', 250.00),
(17, 'Hot Chocolate', 'images/Food/Hot Chocolate.jpg', 'Coffee', 320.00),
(18, 'Americano', 'images/Food/Americano.jpg', 'Coffee', 250.00),
(19, 'Cappuccino', 'images/Food/Cappuccino.jpg', 'Coffee', 280.00),
(20, 'Latte', 'images/Food/Latte.jpg', 'Coffee', 300.00),
(21, 'Latte Macchiato', 'images/Food/Latte Macchiato.jpg', 'Coffee', 320.00),
(22, 'Steak Fries', 'images/Food/Steak Fries.jpg', 'Hot Kitchen', 450.00),
(23, 'Slawdog & Cheese Kievs', 'images/Food/Slawdog & Cheese Kievs.jpg', 'Hot Kitchen', 500.00),
(24, 'Hashbrown Burger (Veg)', 'images/Food/Hashbrown Burger (Veg).jpg', 'Hot Kitchen', 550.00),
(25, 'Crispy Beef Wrap', 'images/Food/Crispy Beef Wrap.jpg', 'Hot Kitchen', 600.00),
(26, 'Grilled Beef Burger', 'images/Food/Grilled Beef Burger.jpg', 'Hot Kitchen', 650.00),
(27, 'Nachos', 'images/Food/Nachos.png\r\n', 'Hot Kitchen', 500.00),
(28, 'Thai Beef Salad', 'images/Food/Thai Beef Salad.jpg', 'Hot Kitchen', 550.00),
(29, 'Fruity Smoothie - Mango', 'images/Food/Fruity Smoothie - Mango.jpg', 'Juice', 400.00),
(30, 'Fresh Juice - Watermelon', 'images/Food/Fresh Juice - Watermelon.jpg', 'Juice', 350.00),
(31, 'Strawberry Cheesecake Milkshake', 'images/Food/Strawberry Cheesecake Milkshake.jpg', 'Juice', 500.00),
(32, 'Salt Caramel with Honeycomb Milkshake', 'images/Food/Salt Caramel with Honeycomb Milkshake.jpg', 'Juice', 520.00),
(33, 'Rocky Road Milkshake', 'images/Food/Rocky Road Milkshake.jpeg', 'Juice', 520.00),
(34, 'Cookie Espresso Milkshake', 'images/Food/Cookie Espresso Milkshake.jpg', 'Juice', 550.00);

-- --------------------------------------------------------

--
-- Table structure for table `foodorder`
--

CREATE TABLE `foodorder` (
  `FoodOrderID` int(11) NOT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `FoodID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `GenreID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`GenreID`, `Name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror'),
(5, 'Romance'),
(6, 'Sci-Fi'),
(7, 'Adventure');

-- --------------------------------------------------------

--
-- Table structure for table `moviegenre`
--

CREATE TABLE `moviegenre` (
  `MovieGenreID` int(11) NOT NULL,
  `Movie_ID` int(11) DEFAULT NULL,
  `GenreID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moviegenre`
--

INSERT INTO `moviegenre` (`MovieGenreID`, `Movie_ID`, `GenreID`) VALUES
(89, 1, 1),
(90, 1, 7),
(91, 1, 6),
(92, 1, 3),
(93, 2, 1),
(94, 2, 3),
(95, 2, 7),
(96, 3, 1),
(97, 3, 7),
(98, 3, 6),
(99, 3, 3),
(100, 4, 1),
(101, 4, 7),
(102, 4, 3),
(103, 5, 1),
(104, 5, 6),
(105, 5, 3),
(106, 5, 7),
(107, 6, 7),
(108, 6, 2),
(109, 7, 7),
(110, 7, 3),
(111, 8, 7),
(112, 8, 1),
(113, 8, 3),
(114, 9, 7),
(115, 9, 6),
(116, 10, 1),
(117, 10, 7),
(118, 10, 6),
(119, 11, 1),
(120, 11, 6),
(121, 11, 3),
(122, 11, 7),
(123, 12, 1),
(124, 12, 6),
(125, 12, 7),
(126, 13, 1),
(127, 13, 6),
(128, 13, 4),
(129, 13, 3),
(130, 14, 7),
(131, 14, 6),
(132, 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `Movie_ID` int(11) NOT NULL,
  `Movie_Name` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Duration` varchar(12) DEFAULT NULL,
  `Trailer` varchar(255) DEFAULT NULL,
  `Year` varchar(4) DEFAULT NULL,
  `Rating` varchar(5) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Poster` varchar(255) DEFAULT NULL,
  `Banner` varchar(255) DEFAULT NULL,
  `Carousal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`Movie_ID`, `Movie_Name`, `Description`, `Duration`, `Trailer`, `Year`, `Rating`, `Status`, `Poster`, `Banner`, `Carousal`) VALUES
(1, 'Avengers: Endgame', 'After the devastating events of Avengers: Infinity War, the Avengers assemble once more to reverse Thanos\' actions and restore balance to the universe.', '3h 1min', 'https://youtu.be/TcMBFSGVi1c', '2019', 'PG-13', 'Now Showing', 'images/poster/End Game.jpg', 'images/banner/End Game.jpg', 'images/Carousal/End Game.png'),
(2, 'Gladiator 2', 'The sequel to the Academy Award-winning Gladiator.', '2h 35min', 'https://youtu.be/samplelink1', '2024', 'R', 'Coming Soon', 'images/poster/Gladiator 2.jpg', 'images/banner/Gladiator 2.jpg', NULL),
(3, 'Avengers: Infinity War', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', '2h 29min', 'https://youtu.be/6ZfuNTqbHE8', '2018', 'PG-13', 'Now Showing', 'images/poster/Infinity War.jpeg', 'images/banner/Infinity War.png', NULL),
(4, 'Kraven the Hunter', 'Sergei Kravinoff embarks on a mission to prove that he is the greatest hunter in the world, taking on his fiercest challenge yet.', '2h 10min', 'https://youtu.be/samplelink2', '2023', 'R', 'Coming Soon', 'images/poster/Kraven The Hunter.png', 'images/banner/Kraven The Hunter.png', NULL),
(5, 'Man of Steel', 'Clark Kent, one of the last of an extinguished race disguised as an unremarkable human, is forced to reveal his identity when Earth is invaded by an army of survivors.', '2h 23min', 'https://youtu.be/T6DJcgm3wNY', '2013', 'PG-13', 'Now Showing', 'images/poster/Man of Steel.jpeg', 'images/banner/Man of Steel.jpg', NULL),
(6, 'Moana 2', 'Moana ventures beyond the reef on another daring journey to save her people from a new mysterious threat.', '1h 55min', 'https://youtu.be/samplelink3', '2024', 'PG', 'Coming Soon', 'images/poster/Moana 2.jpeg', 'images/banner/Moana 2.png', NULL),
(7, 'Mufasa: The Lion King', 'A prequel to The Lion King, telling the story of how Mufasa rose to royalty in the Pride Lands.', '1h 30min', 'https://youtu.be/samplelink4', '2024', 'PG', 'Coming Soon', 'images/poster/Mufasa The Lion King.png', 'images/banner/Mufasa The Lion King.png', NULL),
(8, 'Pirates of the Caribbean: Dead Men Tell No Tales', 'Captain Jack Sparrow searches for the legendary Trident of Poseidon while being pursued by an undead sea captain and his crew.', '2h 9min', 'https://youtu.be/1xo3af_6_Jk', '2017', 'PG-13', 'Now Showing', 'images/poster/Pirates of The Caribbean 5.jpeg', 'images/banner/Pirates of The Caribbean 5.png', NULL),
(9, 'Sonic the Hedgehog 3', 'Sonic and his friends team up once again to face a new enemy threatening their world.', '2h 0min', 'https://youtu.be/samplelink5', '2024', 'PG', 'Coming Soon', 'images/poster/Sonic 3.png', 'images/banner/Sonic 3.jpg', NULL),
(10, 'Spider-Man: Homecoming', 'Peter Parker balances his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man and finds himself on the trail of a new menace.', '2h 13min', 'https://youtu.be/U0D3AOldjMU', '2017', 'PG-13', 'Now Showing', 'images/poster/Spider Man Homecoming.jpeg', 'images/banner/Spider Man Homecoming.jpg', 'images/Carousal/Spider Man Homecoming.png'),
(11, 'Spider-Man: No Way Home', 'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help, leading to a dangerous adventure across the multiverse.', '2h 28min', 'https://youtu.be/JfVOs4VSpmA', '2021', 'PG-13', 'Now Showing', 'images/poster/Spider Man No Way Home.png', 'images/banner/Spider Man No Way Home.png', 'images/Carousal/Spider Man No Way Home.jpg'),
(12, 'Spider-Man: Far From Home', 'Following the events of Avengers: Endgame, Spider-Man must step up to take on new threats in a world that has changed forever.', '2h 9min', 'https://youtu.be/DYYtuKyMtY8', '2019', 'PG-13', 'Now Showing', 'images/poster/Spider Man Far From Home.jpg', 'images/banner/Spider Man Far From Home.jpeg', NULL),
(13, 'Venom: Let There Be Carnage', 'Eddie Brock attempts to reignite his career while grappling with the alien symbiote Venom, facing a new symbiotic threat, Carnage.', '2h 0min', 'https://youtu.be/samplelink6', '2021', 'PG-13', 'Now Showing', 'images/poster/Venom The Last Dance.png', 'images/banner/Venom The Last Dance.png', NULL),
(14, 'The Wild Robot', 'A lone robot must adapt to the wilderness and forge unlikely friendships in order to survive and uncover the mystery of its past.', '1h 45min', 'https://youtu.be/samplelink7', '2024', 'PG', 'Coming Soon', 'images/poster/Wild Robot.png', 'images/banner/Wild Robot.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `BookingID` int(11) DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `PaymentAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `SeatID` int(11) NOT NULL,
  `SeatNumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`SeatID`, `SeatNumber`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'A3'),
(4, 'A4'),
(5, 'A5'),
(6, 'A6'),
(7, 'B1'),
(8, 'B2'),
(9, 'B3'),
(10, 'B4'),
(11, 'B5'),
(12, 'B6'),
(13, 'C1'),
(14, 'C2'),
(15, 'C3'),
(16, 'C4'),
(17, 'C5'),
(18, 'C6'),
(19, 'C7'),
(20, 'C8'),
(21, 'D1'),
(22, 'D2'),
(23, 'D3'),
(24, 'D4'),
(25, 'D5'),
(26, 'D6'),
(27, 'D7'),
(28, 'D8'),
(29, 'E1'),
(30, 'E2'),
(31, 'E3'),
(32, 'E4'),
(33, 'E5'),
(34, 'E6'),
(35, 'E7'),
(36, 'E8'),
(37, 'F1'),
(38, 'F2'),
(39, 'F3'),
(40, 'F4'),
(41, 'F5'),
(42, 'F6'),
(43, 'F7'),
(44, 'F8');

-- --------------------------------------------------------

--
-- Table structure for table `seatreservation`
--

CREATE TABLE `seatreservation` (
  `SeatReservationID` int(11) NOT NULL,
  `ShowtimeID` int(11) DEFAULT NULL,
  `SeatID` int(11) DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `showtime`
--

CREATE TABLE `showtime` (
  `ShowtimeID` int(11) NOT NULL,
  `Movie_ID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Show_Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TicketID` int(11) NOT NULL,
  `Transaction_ID` int(11) DEFAULT NULL,
  `SeatID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticketprice`
--

CREATE TABLE `ticketprice` (
  `TicketPriceID` int(11) NOT NULL,
  `ShowtimeID` int(11) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Transaction_ID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ShowtimeID` int(11) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` varchar(50) DEFAULT NULL,
  `AdultSeatsCount` int(11) DEFAULT NULL,
  `ChildSeatsCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `customerinquiries`
--
ALTER TABLE `customerinquiries`
  ADD PRIMARY KEY (`InquiryID`);

--
-- Indexes for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`FoodID`);

--
-- Indexes for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD PRIMARY KEY (`FoodOrderID`),
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `moviegenre`
--
ALTER TABLE `moviegenre`
  ADD PRIMARY KEY (`MovieGenreID`),
  ADD KEY `Movie_ID` (`Movie_ID`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Movie_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `BookingID` (`BookingID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`SeatID`);

--
-- Indexes for table `seatreservation`
--
ALTER TABLE `seatreservation`
  ADD PRIMARY KEY (`SeatReservationID`),
  ADD KEY `ShowtimeID` (`ShowtimeID`),
  ADD KEY `SeatID` (`SeatID`),
  ADD KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`ShowtimeID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TicketID`),
  ADD KEY `Transaction_ID` (`Transaction_ID`),
  ADD KEY `SeatID` (`SeatID`);

--
-- Indexes for table `ticketprice`
--
ALTER TABLE `ticketprice`
  ADD PRIMARY KEY (`TicketPriceID`),
  ADD KEY `ShowtimeID` (`ShowtimeID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ShowtimeID` (`ShowtimeID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customerinquiries`
--
ALTER TABLE `customerinquiries`
  MODIFY `InquiryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `foodorder`
--
ALTER TABLE `foodorder`
  MODIFY `FoodOrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `GenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `moviegenre`
--
ALTER TABLE `moviegenre`
  MODIFY `MovieGenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `Movie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `seatreservation`
--
ALTER TABLE `seatreservation`
  MODIFY `SeatReservationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `ShowtimeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `TicketID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketprice`
--
ALTER TABLE `ticketprice`
  MODIFY `TicketPriceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD CONSTRAINT `foodorder_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transaction` (`Transaction_ID`),
  ADD CONSTRAINT `foodorder_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `fooditem` (`FoodID`);

--
-- Constraints for table `moviegenre`
--
ALTER TABLE `moviegenre`
  ADD CONSTRAINT `moviegenre_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`),
  ADD CONSTRAINT `moviegenre_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `transaction` (`Transaction_ID`);

--
-- Constraints for table `seatreservation`
--
ALTER TABLE `seatreservation`
  ADD CONSTRAINT `seatreservation_ibfk_1` FOREIGN KEY (`ShowtimeID`) REFERENCES `showtime` (`ShowtimeID`),
  ADD CONSTRAINT `seatreservation_ibfk_2` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`),
  ADD CONSTRAINT `seatreservation_ibfk_3` FOREIGN KEY (`TransactionID`) REFERENCES `transaction` (`Transaction_ID`);

--
-- Constraints for table `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Transaction_ID`) REFERENCES `transaction` (`Transaction_ID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`);

--
-- Constraints for table `ticketprice`
--
ALTER TABLE `ticketprice`
  ADD CONSTRAINT `ticketprice_ibfk_1` FOREIGN KEY (`ShowtimeID`) REFERENCES `showtime` (`ShowtimeID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`ShowtimeID`) REFERENCES `showtime` (`ShowtimeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
