-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: zion_cinema
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerInquiries`
--

DROP TABLE IF EXISTS `CustomerInquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerInquiries` (
  `InquiryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Message` text,
  PRIMARY KEY (`InquiryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerInquiries`
--

LOCK TABLES `CustomerInquiries` WRITE;
/*!40000 ALTER TABLE `CustomerInquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerInquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodItem`
--

DROP TABLE IF EXISTS `FoodItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FoodItem` (
  `FoodID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text,
  `FoodImage` varchar(255) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FoodID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodItem`
--

LOCK TABLES `FoodItem` WRITE;
/*!40000 ALTER TABLE `FoodItem` DISABLE KEYS */;
INSERT INTO `FoodItem` VALUES (1,'Popcorn','A classic, light, and crunchy snack served with butter or caramel.',NULL,'LKR 300'),(2,'Nachos','Tortilla chips topped with melted cheese and other toppings.',NULL,'LKR 600'),(3,'Candy','A selection of sweet treats like chocolate, gummies, and mints.',NULL,'LKR 400'),(4,'Hot Dogs','A sausage in a bun, served with ketchup, mustard, and relish.',NULL,'LKR 700'),(5,'Soda','Carbonated drinks like cola, lemon-lime, or fruit flavors.',NULL,'LKR 200'),(6,'Ice Cream','A scoop of creamy ice cream in various flavors.',NULL,'LKR 200'),(7,'Pretzels','Soft, salty dough snacks, often served with cheese or mustard.',NULL,'LKR 500'),(8,'Slushies','Frozen, flavored drinks in bright colors and refreshing tastes.',NULL,'LKR 600'),(9,'Pizza','Personal-sized pizza with toppings like cheese, pepperoni, and veggies.',NULL,'LKR 800'),(10,'French Fries','Crispy fried potato sticks, usually served with ketchup.',NULL,'LKR 200'),(11,'Chicken Tenders','Breaded and fried chicken pieces with dipping sauces.',NULL,'LKR 700'),(12,'Cookies','Soft and warm cookies, often in chocolate chip or oatmeal varieties.',NULL,'LKR 100'),(13,'Churros','Fried dough pastries, dusted with cinnamon and sugar.',NULL,'LKR 300'),(14,'Popcorn Chicken','Bite-sized fried chicken, perfect for dipping sauces.',NULL,'LKR 600'),(15,'Vegan Snacks','Plant-based and gluten-free options like veggie chips and dips.',NULL,'LKR 100'),(16,'Smoothies','Blended fruit drinks, often made with fresh berries and bananas.',NULL,'LKR 100'),(17,'Loaded Fries','Fries topped with cheese, bacon, and sour cream.',NULL,'LKR 600'),(18,'Sandwiches','Simple sandwiches with fillings like ham, turkey, or veggies.',NULL,'LKR 300'),(19,'Fruit Cups','Fresh, cut-up fruit in bite-sized pieces for a healthy snack.',NULL,'LKR 200'),(20,'Cheese Sticks','Fried mozzarella sticks served with marinara sauce.',NULL,'LKR 400');
/*!40000 ALTER TABLE `FoodItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodOrder`
--

DROP TABLE IF EXISTS `FoodOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FoodOrder` (
  `FoodOrderID` int NOT NULL AUTO_INCREMENT,
  `TransactionID` int DEFAULT NULL,
  `FoodID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`FoodOrderID`),
  KEY `TransactionID_idx` (`TransactionID`),
  KEY `FoodID_idx` (`FoodID`),
  CONSTRAINT `FK_FoodOrder_FoodItem` FOREIGN KEY (`FoodID`) REFERENCES `FoodItem` (`FoodID`),
  CONSTRAINT `FK_FoodOrder_Transaction` FOREIGN KEY (`TransactionID`) REFERENCES `Transaction` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodOrder`
--

LOCK TABLES `FoodOrder` WRITE;
/*!40000 ALTER TABLE `FoodOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `FoodOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Animation'),(4,'Comody'),(5,'Drama'),(6,'Fantasy'),(7,'Romance'),(8,'Sci-Fi'),(9,'Thriller'),(10,'Crime'),(11,'Documentary'),(12,'Family'),(13,'Musical'),(14,'Historical'),(15,'Biography'),(16,'WAR'),(17,'Western\n'),(18,'Sporrts'),(19,'Film Noir'),(20,'Rom-Com'),(21,'Superhero'),(22,'Disaster'),(23,'Erotic'),(24,'Experimental');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MovieGenre`
--

DROP TABLE IF EXISTS `MovieGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MovieGenre` (
  `MovieGenreID` int NOT NULL AUTO_INCREMENT,
  `MovieID` int DEFAULT NULL,
  `GenreID` int DEFAULT NULL,
  PRIMARY KEY (`MovieGenreID`),
  KEY `MovieID_idx` (`MovieID`),
  KEY `GenreID_idx` (`GenreID`),
  CONSTRAINT `FK_MovieGenre_Genre` FOREIGN KEY (`GenreID`) REFERENCES `Genre` (`GenreID`),
  CONSTRAINT `FK_MovieGenre_Movie` FOREIGN KEY (`MovieID`) REFERENCES `Movies` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovieGenre`
--

LOCK TABLES `MovieGenre` WRITE;
/*!40000 ALTER TABLE `MovieGenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `MovieGenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movies`
--

DROP TABLE IF EXISTS `Movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movies` (
  `MovieID` int NOT NULL AUTO_INCREMENT,
  `MovieName` varchar(100) DEFAULT NULL,
  `Description` text,
  `Duration` varchar(45) DEFAULT NULL,
  `Trailer` text,
  `Year` year DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Poster` text,
  `Banner` text,
  `Carousal` text,
  `ShowStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movies`
--

LOCK TABLES `Movies` WRITE;
/*!40000 ALTER TABLE `Movies` DISABLE KEYS */;
INSERT INTO `Movies` VALUES (1,'WICKED','Wicked tells the story of Elphaba, the future Wicked Witch of the West and her relationship with Glinda, the Good Witch of the North. Their friendship struggles through their opposing personalities and viewpoints, rivalry over the same love-interest, their reactions to the Wizard\'s corrupt government, and, ultimately, Elphaba\'s public fall from grace. The plot is set mostly before Dorothy\'s arrival from Kansas, and includes several references to well-known scenes and dialogue in the 1939 film The Wizard of Oz as a backstory.','2 hr 40 min','https://youtu.be/6COmYeLsz4c?si=tDFpbK7dUa08N0kK',2024,8.1,NULL,NULL,NULL,NULL,NULL),(2,'BHOOL BHULAIYA 3','In Kolkata, Rooh Baba enters a spooky estate where he confronts a pair of vindictive ghosts, both asserting to be Manjulika.','2 hr 40 min','https://youtu.be/6YMY62tMLUA?si=A-EhLXm1hPd0Z0PS',2024,5.2,NULL,NULL,NULL,NULL,NULL),(3,'SMILE 2','About to embark on a world tour, global pop sensation Skye Riley begins experiencing increasingly terrifying and inexplicable events. Overwhelmed by the escalating horrors and the pressures of fame, Skye is forced to face her past.','2hr 13 min','https://youtu.be/0HY6QFlBzUY?si=UqlWd_rC_lwg-Z05',2024,6.9,NULL,NULL,NULL,NULL,NULL),(4,'ENDGAME','After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.','3h 1min','https://youtu.be/TcMBFSGVi1c?si=F79hbJHAbza5Cjuc',2019,8.4,NULL,NULL,NULL,NULL,NULL),(5,'DEADP00L X W0LVERINE','Deadpool\'s peaceful existence comes crashing down when the Time Variance Authority recruits him to help safeguard the multiverse. He soon unites with his would-be pal, Wolverine, to complete the mission and save his world from an existential threat.','2hr 7min','https://youtu.be/73_1biulkYk?si=nCwflQros-BZnWNN',2024,7.7,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `TransactionID` int DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `PaymentMethod` varchar(20) DEFAULT NULL,
  `PaymentAmount` float DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `TransactionID_idx` (`TransactionID`),
  CONSTRAINT `FK_Payment_Transaction` FOREIGN KEY (`TransactionID`) REFERENCES `Transaction` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `SeatID` int NOT NULL AUTO_INCREMENT,
  `SeatNumber` int DEFAULT NULL,
  PRIMARY KEY (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeatReservation`
--

DROP TABLE IF EXISTS `SeatReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SeatReservation` (
  `SeatReservationID` int NOT NULL AUTO_INCREMENT,
  `ShowtimeID` int DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `TransactionID` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SeatReservationID`),
  KEY `ShowtimeID_idx` (`ShowtimeID`),
  KEY `SeatID_idx` (`SeatID`),
  KEY `TransactionID_idx` (`TransactionID`),
  CONSTRAINT `FK_SeatReservation_Seat` FOREIGN KEY (`SeatID`) REFERENCES `Seat` (`SeatID`),
  CONSTRAINT `FK_SeatReservation_Showtime` FOREIGN KEY (`ShowtimeID`) REFERENCES `Showtime` (`ShowtimeID`),
  CONSTRAINT `FK_SeatReservation_Transaction` FOREIGN KEY (`TransactionID`) REFERENCES `Transaction` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeatReservation`
--

LOCK TABLES `SeatReservation` WRITE;
/*!40000 ALTER TABLE `SeatReservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeatReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Showtime`
--

DROP TABLE IF EXISTS `Showtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Showtime` (
  `ShowtimeID` int NOT NULL AUTO_INCREMENT,
  `MovieID` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `ShowTime` time DEFAULT NULL,
  PRIMARY KEY (`ShowtimeID`),
  KEY `MovieID_idx` (`MovieID`),
  CONSTRAINT `FK_Showtime_Movie` FOREIGN KEY (`MovieID`) REFERENCES `Movies` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Showtime`
--

LOCK TABLES `Showtime` WRITE;
/*!40000 ALTER TABLE `Showtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `Showtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `TicketID` int NOT NULL AUTO_INCREMENT,
  `TransactionID` int DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `TransactionID_idx` (`TransactionID`),
  KEY `SeatID_idx` (`SeatID`),
  CONSTRAINT `FK_Ticket_Seat` FOREIGN KEY (`SeatID`) REFERENCES `Seat` (`SeatID`),
  CONSTRAINT `FK_Ticket_Transaction` FOREIGN KEY (`TransactionID`) REFERENCES `Transaction` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketPrice`
--

DROP TABLE IF EXISTS `TicketPrice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TicketPrice` (
  `TicketPriceID` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`TicketPriceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketPrice`
--

LOCK TABLES `TicketPrice` WRITE;
/*!40000 ALTER TABLE `TicketPrice` DISABLE KEYS */;
/*!40000 ALTER TABLE `TicketPrice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `ShowtimeID` int DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `TotalAmount` float DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  `AdultSeatCount` int DEFAULT NULL,
  `ChildSeatCount` int DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `ShowtimeID_idx` (`ShowtimeID`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `FK_Transaction_Showtime` FOREIGN KEY (`ShowtimeID`) REFERENCES `Showtime` (`ShowtimeID`),
  CONSTRAINT `FK_Transaction_User` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 20:15:23
