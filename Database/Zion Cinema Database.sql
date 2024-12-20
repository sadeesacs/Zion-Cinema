-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 07:53 AM
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

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Username`, `Password`) VALUES
(1, 'Admin', '$2a$10$hkdrcUdOP960WugJ4loXMeQqU4GINNixFKsYbIkvZs6du/U64uzEe');

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
  `Showtime_ID` int(11) DEFAULT NULL,
  `FoodID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foodorder`
--

INSERT INTO `foodorder` (`FoodOrderID`, `Showtime_ID`, `FoodID`, `Quantity`, `Price`, `UserID`) VALUES
(27, 322, 22, 1, 450.00, 981262),
(28, 322, 23, 1, 500.00, 981262),
(29, 322, 8, 2, 400.00, 981262),
(30, 322, 1, 1, 500.00, 981262),
(34, 323, 22, 2, 900.00, 981262),
(35, 323, 24, 1, 550.00, 981262),
(36, 323, 25, 1, 600.00, 981262),
(37, 323, 8, 2, 400.00, 981262),
(38, 323, 1, 1, 500.00, 981262),
(41, 324, 22, 1, 450.00, 813700);

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
(7, 'Adventure'),
(8, 'Thriller'),
(9, 'Fantasy'),
(10, 'Animation'),
(11, 'Documentary'),
(12, 'Musical'),
(13, 'Mystery'),
(14, 'Biography'),
(15, 'Crime'),
(16, 'Family'),
(17, 'Western');

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
(132, 14, 3),
(133, 4, 8),
(135, 6, 10),
(137, 6, 12),
(139, 7, 10),
(141, 7, 12),
(143, 8, 2),
(145, 10, 9),
(147, 12, 9),
(149, 14, 10);

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
(1, 'Avengers: Endgame', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.', '3h 1min', 'https://youtu.be/TcMBFSGVi1c\r\n', '2019', 'PG-13', 'Now Showing', 'images/poster/End Game.jpg', 'images/banner/End Game.jpg', 'images/Carousal/End Game.png'),
(2, 'Gladiator 2', 'The sequel to the Academy Award-winning Gladiator.', '2h 35min', 'https://www.youtube.com/watch?v=7S8ElnXTzm4', '2024', 'R', 'Coming Soon', 'images/poster/Gladiator 2.jpg', 'images/banner/Gladiator 2.jpg', NULL),
(3, 'Avengers: Infinity War', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', '2h 29min', 'https://youtu.be/6ZfuNTqbHE8', '2018', 'PG-13', 'Coming Soon', 'images/poster/Infinity War.jpeg', 'images/banner/Infinity War.png', NULL),
(4, 'Kraven the Hunter', '“Kraven the Hunter” tells the dark origin of Sergei Kravinoff (Aaron Taylor-Johnson), a fierce antihero driven by vengeance and primal instincts, becoming Marvel\'s ultimate hunter in this action-packed, gritty tale.', '2h 10min', 'https://www.youtube.com/watch?v=rze8QYwWGMs', '2023', 'R', 'Now Showing', 'images/poster/Kraven The Hunter.png', 'images/banner/Kraven The Hunter.png', NULL),
(5, 'Man of Steel', 'Clark Kent, one of the last of an extinguished race disguised as an unremarkable human, is forced to reveal his identity when Earth is invaded by an army of survivors.', '2h 23min', 'https://youtu.be/T6DJcgm3wNY', '2013', 'PG-13', 'Coming Soon', 'images/poster/Man of Steel.jpeg', 'images/banner/Man of Steel.jpg', NULL),
(6, 'Moana 2', '“Moana 2” follows Moana as she sets sail on a new, daring adventure across uncharted waters of Oceania. Guided by ancestral visions, she seeks to lift a mysterious curse and reconnect her people, discovering new lands and challenges.\r\n', '1h 55min', 'https://www.youtube.com/watch?v=hDZ7y8RP5HE', '2024', 'PG', 'Now Showing', 'images/poster/Moana 2.jpeg', 'images/banner/Moana 2.png', NULL),
(7, 'Mufasa: The Lion King', 'Journey into the majestic pride lands with Mufasa: The Lion King! Uncover the untold story of Simba\'s father, as young Mufasa rises from humble beginnings to become a legendary king. Experience breathtaking visuals, heartfelt bonds!', '1h 30min', 'https://www.youtube.com/watch?v=o17MF9vnabg', '2024', 'PG', 'Now Showing', 'images/poster/Mufasa The Lion King.png', 'images/banner/Mufasa The Lion King.png', 'images/Carousal/Mufasa The Lion King.jpg'),
(8, 'Dead Men Tell No Tales', 'In Pirates of the Caribbean: Dead Men Tell No Tales, Captain Jack Sparrow faces deadly ghost sailors, led by Captain Salazar, who escape the Devil\'s Triangle to exterminate all pirates. Jack\'s survival hinges on finding the legendary Trident of Poseidon.', '2h 9min', 'https://www.youtube.com/watch?v=KrGyD4kHTSE', '2017', 'PG-13', 'Now Showing', 'images/poster/Pirates of The Caribbean 5.jpeg', 'images/banner/Pirates of The Caribbean 5.png', NULL),
(9, 'Sonic the Hedgehog 3', 'Sonic and his friends team up once again to face a new enemy threatening their world.', '2h 0min', 'https://www.youtube.com/watch?v=qSu6i2iFMO0', '2024', 'PG', 'Coming Soon', 'images/poster/Sonic 3.png', 'images/banner/Sonic 3.jpg', NULL),
(10, 'Spider-Man: Homecoming', 'In Spider-Man: Homecoming, Peter Parker (Tom Holland) balances high school life with his role as Spider-Man under Tony Stark\'s mentorship. When the Vulture (Michael Keaton) emerges as a new threat, everything Peter holds dear is jeopardized. ', '2h 13min', 'https://youtu.be/U0D3AOldjMU', '2017', 'PG-13', 'Now Showing', 'images/poster/Spider Man Homecoming.jpeg', 'images/banner/Spider Man Homecoming.jpg', ''),
(11, 'Spider-Man: No Way Home', 'Experience the thrill of the big screen with Spider-Man: No Way Home! Witness Peter Parker\'s epic battle to restore his secret identity, featuring jaw-dropping action, multiverse twists, and your favorite iconic villains.!', '2h 28min', 'https://youtu.be/JfVOs4VSpmA', '2021', 'PG-13', 'Coming Soon', 'images/poster/Spider Man No Way Home.png', 'images/banner/Spider Man No Way Home.png', 'images/Carousal/Spider Man No Way Home.jpg'),
(12, 'Spider-Man: Far From Home', 'In Spider-Man: Far From Home, Peter Parker\'s European vacation is disrupted when Nick Fury recruits him to battle the Elementals alongside Mysterio. Struggling with his responsibilities, Peter faces new challenges in a world changed after the Avengers\' Endgame.', '2h 9min', 'https://youtu.be/DYYtuKyMtY8', '2019', 'PG-13', 'Now Showing', 'images/poster/Spider Man Far From Home.jpg', 'images/banner/Spider Man Far From Home.jpeg', ''),
(13, 'Venom: The Last Dance', 'Eddie Brock attempts to reignite his career while grappling with the alien symbiote Venom, facing a new symbiotic threat, Carnage.', '2h 0min', 'https://youtu.be/samplelink6', '2021', 'PG-13', 'Coming Soon', 'images/poster/Venom The Last Dance.png', 'images/banner/Venom The Last Dance.png', NULL),
(14, 'The Wild Robot', 'In The Wild Robot, Roz, a robot stranded on a remote island, must learn to survive in the wild. Through adaptation and earning the trust of animals, she embarks on a heartwarming journey of self-discovery and connection with nature.', '1h 45min', 'https://www.youtube.com/watch?v=67vbA5ZJdKQ', '2024', 'PG', 'Now Showing', 'images/poster/Wild Robot.png', 'images/banner/Wild Robot.png', 'images/Carousal/Wild Robot.jpg');

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
  `SeatID` int(11) NOT NULL,
  `TicketType` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Showtime_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seatreservation`
--

INSERT INTO `seatreservation` (`SeatReservationID`, `SeatID`, `TicketType`, `Price`, `Showtime_ID`, `UserID`) VALUES
(31, 1, 'Adult', 2000.00, 322, 981262),
(32, 2, 'Child', 1000.00, 322, 981262),
(34, 5, 'Adult', 3000.00, 323, 981262),
(35, 6, 'Adult', 3000.00, 323, 981262),
(37, 1, 'Adult', 2500.00, 324, 813700),
(38, 2, 'Adult', 2500.00, 324, 813700);

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

--
-- Dumping data for table `showtime`
--

INSERT INTO `showtime` (`ShowtimeID`, `Movie_ID`, `Date`, `Show_Time`) VALUES
(322, 1, '2024-12-20', '10:00:00'),
(323, 14, '2024-12-20', '10:00:00'),
(324, 8, '2024-12-20', '13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `temporaryfoodorder`
--

CREATE TABLE `temporaryfoodorder` (
  `TempFoodOrderID` int(11) NOT NULL,
  `Showtime_ID` varchar(255) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temporarymovies`
--

CREATE TABLE `temporarymovies` (
  `TempMovieID` int(11) NOT NULL,
  `Movie_ID` int(11) NOT NULL,
  `Showtime_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temporaryseats`
--

CREATE TABLE `temporaryseats` (
  `TempSeatID` int(11) NOT NULL,
  `SeatID` int(11) NOT NULL,
  `TicketType` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Showtime_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
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

--
-- Dumping data for table `ticketprice`
--

INSERT INTO `ticketprice` (`TicketPriceID`, `ShowtimeID`, `Category`, `Price`) VALUES
(503, 322, 'Adult', 2000.00),
(504, 322, 'Child', 1000.00),
(505, 323, 'Adult', 3000.00),
(506, 323, 'Child', 2000.00),
(507, 324, 'Adult', 2500.00),
(508, 324, 'Child', 1500.00);

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
  `PaymentStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`Transaction_ID`, `UserID`, `ShowtimeID`, `TransactionDate`, `TotalAmount`, `PaymentStatus`) VALUES
(14, 981262, 322, '2024-12-20 12:04:16', 16995.00, 'Completed'),
(15, 981262, 323, '2024-12-20 12:10:02', 39655.00, 'Completed'),
(16, 813700, 324, '2024-12-20 12:13:43', 6077.00, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `IsGuest` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Email`, `PhoneNumber`, `Password`, `FirstName`, `LastName`, `IsGuest`) VALUES
(813700, 'guest.user@example.com', '0778834319', NULL, 'GuestUserF', 'GuestUserL', 1),
(981250, 'john.doe1@example.com', '1234567890', '$2a$10$XIXeec/wuwfCDs4LpmZ2TOsRyIJEcnjyjSlu1RWSfA.tHlUH9MSa2', 'John', 'Doe', 0),
(981251, 'jane.smith2@example.com', '0778834319', '$2a$10$6FS8smDtbfjxvB7PE5aLIO5trvy9vnhSecKle4yN77pb0QN5Cj5xK', 'Jane ', 'Smith', 0),
(981253, 'emyerobot@gmail.com', '0778834319', '$2a$10$7nxAvNFqoV0gOBfiwwBsJOMJijVDjl.DaoN6NAgdwvKFiCl1vKVyq', 'Emmy', 'Robot', 0),
(981254, 'randyhdsd@gmail.com', '0778833357', '$2a$10$FOINFe2drTy6voi.LaZcKuvbJi.vsZjtTrjsCvF861./bII6IzhJm', 'Randy', 'Orton', 0),
(981255, 'Kamani@gmail.com', '07605439833', '$2a$10$Ugi4G8Vo4pg8F8ruE7Gz3uyhoN51XUHuBrNpCORy8MFiUg99A8x2u', 'Kamani', 'Liyan', 0),
(981256, 'grewil@gmail.com', '077 883 4319', '$2a$10$NxmDsVbtLdjqvJOV.o5u0.FnQ6HWLgNu0CR2u63T1O2Ve5oghCzPO', 'Greg', 'Willson', 0),
(981262, 'emily.bennett@example.com', '+44 7911 123456', '$2a$10$VUQjZqVA3/G8X7O/rw1bqOtv4...Pb4YwZVJiuno9AUgclKM.UssG', 'Emily', 'Bennett', 0);

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
  ADD KEY `Showtime_ID` (`Showtime_ID`),
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `UserID` (`UserID`);

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
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`SeatID`);

--
-- Indexes for table `seatreservation`
--
ALTER TABLE `seatreservation`
  ADD PRIMARY KEY (`SeatReservationID`),
  ADD KEY `SeatID` (`SeatID`),
  ADD KEY `FK_ShowtimeID` (`Showtime_ID`),
  ADD KEY `fk_UserID` (`UserID`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`ShowtimeID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Indexes for table `temporaryfoodorder`
--
ALTER TABLE `temporaryfoodorder`
  ADD PRIMARY KEY (`TempFoodOrderID`),
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `fk_temporaryfoodorder_user` (`UserID`);

--
-- Indexes for table `temporarymovies`
--
ALTER TABLE `temporarymovies`
  ADD PRIMARY KEY (`TempMovieID`),
  ADD KEY `MovieID` (`Movie_ID`),
  ADD KEY `ShowtimeID` (`Showtime_ID`),
  ADD KEY `fk_TempMovie_UserID` (`UserID`);

--
-- Indexes for table `temporaryseats`
--
ALTER TABLE `temporaryseats`
  ADD PRIMARY KEY (`TempSeatID`),
  ADD KEY `SeatID` (`SeatID`),
  ADD KEY `FK_ShowtimeID` (`Showtime_ID`),
  ADD KEY `fk_UserID` (`UserID`);

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
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customerinquiries`
--
ALTER TABLE `customerinquiries`
  MODIFY `InquiryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `foodorder`
--
ALTER TABLE `foodorder`
  MODIFY `FoodOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `GenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `moviegenre`
--
ALTER TABLE `moviegenre`
  MODIFY `MovieGenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `Movie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `seatreservation`
--
ALTER TABLE `seatreservation`
  MODIFY `SeatReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `ShowtimeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `temporaryfoodorder`
--
ALTER TABLE `temporaryfoodorder`
  MODIFY `TempFoodOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `temporarymovies`
--
ALTER TABLE `temporarymovies`
  MODIFY `TempMovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `temporaryseats`
--
ALTER TABLE `temporaryseats`
  MODIFY `TempSeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `ticketprice`
--
ALTER TABLE `ticketprice`
  MODIFY `TicketPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=981263;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD CONSTRAINT `foodorder_ibfk_1` FOREIGN KEY (`Showtime_ID`) REFERENCES `showtime` (`ShowtimeID`),
  ADD CONSTRAINT `foodorder_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `fooditem` (`FoodID`),
  ADD CONSTRAINT `foodorder_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `moviegenre`
--
ALTER TABLE `moviegenre`
  ADD CONSTRAINT `moviegenre_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`),
  ADD CONSTRAINT `moviegenre_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`);

--
-- Constraints for table `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`);

--
-- Constraints for table `temporaryfoodorder`
--
ALTER TABLE `temporaryfoodorder`
  ADD CONSTRAINT `fk_temporaryfoodorder_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `temporaryfoodorder_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `fooditem` (`FoodID`) ON DELETE CASCADE;

--
-- Constraints for table `temporarymovies`
--
ALTER TABLE `temporarymovies`
  ADD CONSTRAINT `fk_TempMovie_UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `temporarymovies_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `temporarymovies_ibfk_2` FOREIGN KEY (`Showtime_ID`) REFERENCES `showtime` (`ShowtimeID`) ON DELETE CASCADE;

--
-- Constraints for table `temporaryseats`
--
ALTER TABLE `temporaryseats`
  ADD CONSTRAINT `FK_ShowtimeID` FOREIGN KEY (`Showtime_ID`) REFERENCES `showtime` (`ShowtimeID`),
  ADD CONSTRAINT `fk_UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `temporaryseats_ibfk_1` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`) ON DELETE CASCADE;

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
