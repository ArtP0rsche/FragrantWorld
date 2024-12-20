-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `Status` text NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `OrderDate` datetime NOT NULL,
  `ReceiptCode` int NOT NULL,
  `PickupPoint` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserId` (`UserId`),
  KEY `PickupPoint` (`PickupPoint`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`PickupPoint`) REFERENCES `pickuppoint` (`PickupPointID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,NULL,'Новый','2022-05-10 00:00:00','2022-05-04 00:00:00',201,24),(2,NULL,'Новый','2022-05-11 00:00:00','2022-05-05 00:00:00',202,25),(3,NULL,'Новый','2022-05-12 00:00:00','2022-05-06 00:00:00',203,26),(4,NULL,'Новый','2022-05-13 00:00:00','2022-05-07 00:00:00',204,27),(5,NULL,'Новый','2022-05-14 00:00:00','2022-05-08 00:00:00',205,28),(6,NULL,'Новый','2022-05-15 00:00:00','2022-05-09 00:00:00',206,29),(7,NULL,'Новый','2022-05-16 00:00:00','2022-05-10 00:00:00',207,30),(8,NULL,'Новый','2022-05-17 00:00:00','2022-05-11 00:00:00',208,31),(9,NULL,'Новый','2022-05-18 00:00:00','2022-05-12 00:00:00',209,32),(10,NULL,'Завершён','2022-05-19 00:00:00','2022-05-13 00:00:00',210,33);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `OrderID` int NOT NULL,
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ProductAmount` int NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductArticleNumber`),
  KEY `ProductArticleNumber` (`ProductArticleNumber`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductArticleNumber`) REFERENCES `product` (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES (1,'A112T4',2),(1,'F893T5',2),(2,'E530Y6',1),(2,'F346G5',2),(3,'D344Y7',2),(3,'J432E4',1),(4,'D378D3',2),(4,'E245R5',1),(5,'H732R5',3),(5,'R464G6',2),(6,'E573G6',3),(6,'K535G6',3),(7,'F344S4',6),(7,'G532R5',5),(8,'D526R4',5),(8,'S753T5',4),(9,'A436H7',3),(9,'V472S3',3),(10,'E479G6',1),(10,'O875F6',4);
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickuppoint`
--

DROP TABLE IF EXISTS `pickuppoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickuppoint` (
  `PickupPointID` int NOT NULL AUTO_INCREMENT,
  `PostCode` int NOT NULL,
  `Address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`PickupPointID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickuppoint`
--

LOCK TABLES `pickuppoint` WRITE;
/*!40000 ALTER TABLE `pickuppoint` DISABLE KEYS */;
INSERT INTO `pickuppoint` VALUES (1,344288,'ул. Чехова 1'),(2,614164,'ул. Степная 30'),(3,394242,'ул. Коммунистическая 43'),(4,660540,'ул. Солнечная 25'),(5,125837,'ул. Шоссейная 40'),(6,125703,'ул. Партизанская 49'),(7,625283,'ул. Победы 46'),(8,614611,'ул. Молодёжная 50'),(9,454311,'ул. Новая 19'),(10,660007,'ул. Октябрьская 19'),(11,603036,'ул. Садовая 4'),(12,450983,'ул. Комсомольская 26'),(13,394782,'ул. Чехова 2'),(14,603002,'ул. Дзержинского 28'),(15,450558,'ул. Набережная 30'),(16,394060,'ул. Фрунзе 43'),(17,410661,'ул. Школьная 50'),(18,625590,'ул. Коммунистическая 20'),(19,625683,'ул. 8 Марта'),(20,400562,'ул. Зелёная 32'),(21,614510,'ул. Маяковского 47'),(22,410542,'ул. Светлая 46'),(23,620839,'ул. Цветочная 8'),(24,443890,'ул. Коммунистическая 1'),(25,603379,'ул. Спортивная 46'),(26,603721,'ул. Гоголя 41'),(27,410172,'ул. Северная 13'),(28,420151,'ул. Вишнёвая 32'),(29,125061,'ул. Подгорная 8'),(30,630370,'ул. Шоссейная 24'),(31,614753,'ул. Полевая 35'),(32,426030,'ул. Маяковского 44'),(33,450375,'ул. Клубная 44'),(34,625560,'ул. Некрасова 12'),(35,630201,'ул. Комсомольская 17'),(36,190949,'ул. Мичурина 26');
/*!40000 ALTER TABLE `pickuppoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Name` text NOT NULL,
  `Description` text,
  `Category` text NOT NULL,
  `Photo` blob,
  `Manufacturer` text NOT NULL,
  `Cost` decimal(19,4) NOT NULL,
  `DiscountAmount` tinyint DEFAULT NULL,
  `QuantityInStock` int NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('A112T4','Scalpers Yacht Club Eau de Parfum','Парфюмерная вода','Парфюмерия',NULL,'Scalpers',5200.0000,20,50,'В наличии'),('A436H7','Clarins Aroma Eau Dynamisante','Тонизирующая ароматическая вода для тела','Парфюмерия',NULL,'Clarins',4400.0000,25,14,'В наличии'),('D344Y7','Clinique Lash Power Mascara','Влагостойкая тушь для ресниц','Макияж',NULL,'Clinique',3350.0000,41,20,'В наличии'),('D378D3','Clarins Water Lip Stain','Пигмент для губ','Макияж',NULL,'Clarins',2650.0000,30,0,'Нет в наличии'),('D526R4','Proraso Azur Lime Cologne','Одеколон','Парфюмерия',NULL,'Proraso',2565.0000,0,12,'В наличии'),('E245R5','Clarins Summer CollectionBronzing Compact Powder','Бронзирующая пудра','Макияж',NULL,'Clarins',5100.0000,25,46,'В наличии'),('E479G6','Bobbi Brown Skin Corrector Stick','Устойчивый корректор в стике','Макияж',NULL,'Bobbi Brown',3800.0000,20,0,'Нет в наличии'),('E530Y6','Focallure Pure Matte Lipstick','Матовая губная помада с экстрактами розы и жасмина','Макияж',NULL,'Focallure',650.0000,10,0,'Нет в наличии'),('E573G6','Press Gurwitz Perfumerie №3 Tobacco, Cinnamon, Vanilla Eau de Toilette','Туалетная вода','Парфюмерия',NULL,'Press Gurwitz Perfumerie',6500.0000,20,16,'В наличии'),('F344S4','Acqua Di Parma Colonia C.L.U.B. Eau de Cologne','Одеколон','Парфюмерия',NULL,'Acqua Di Parma',12500.0000,0,0,'Нет в наличии'),('F346G5','Jusbox Night Flow Eau de Parfum','Парфюмерная вода','Парфюмерия',NULL,'Jusbox',16400.0000,0,15,'В наличии'),('F893T5','Atelier Rebul Grapefruit Delight Intense Eau de Cologne','Одеколон','Парфюмерия',NULL,'Atelier Rebul',3500.0000,43,10,'В наличии'),('G532R5','MAC Squirt Plumping Gloss Stick','Бальзам для губ, придающий объём','Макияж',NULL,'MAC',2690.0000,0,13,'В наличии'),('H732R5','Tous Man Spritz Eau de Toilette','Туалетная вода','Парфюмерия',NULL,'Tous',6500.0000,20,17,'В наличии'),('J432E4','Kilian Good Girl Gone Bad Full Range Set','Парфюмерный набор','Парфюмерия',NULL,'Kilian',67500.0000,0,0,'Нет в наличии'),('K535G6','MAC MACximal Matte Lipstick','Матовая губная помада','Макияж',NULL,'MAC',2690.0000,0,43,'В наличии'),('O875F6','Clarins Aroma Eau Ressourcante','Расслабляющая ароматическая вода для тела','Парфюмерия',NULL,'Clarins',4400.0000,25,16,'В наличии'),('R464G6','Maison Lamyris Cosaque Eau de Parfume','Парфюмерная вода','Парфюмерия',NULL,'Maison Lamyris',2900.0000,20,3,'В наличии'),('S753T5','Kilian Love, don\'t be shy Eau de Parfum','Парфюмерная вода','Парфюмерия',NULL,'Kilian',28530.0000,0,0,'Нет в наличии'),('V472S3','Tom Ford Grey Vetiver Parfum','Духи','Парфюмерия',NULL,'Tom Ford',15600.0000,0,0,'Нет в наличии');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator'),(2,'Manager'),(3,'Customer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `RoleID` int NOT NULL,
  `Surname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Patronymic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Login` text NOT NULL,
  `Password` text NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,2,'Константинова','Вероника','Агафоновна','loginDEsgg2018','qhgYnW'),(2,3,'Меркушев','Мартын','Федотович','loginDEdcd2018','LxR6YI'),(3,2,'Казаков','Федот','Кондратович','loginDEisg2018','Cp8ddU'),(4,1,'Карпов','Улеб','Леонидович','loginDEcph2018','7YpE0p'),(5,3,'Королёв','Матвей','Вадимович','loginDEgco2018','nMr|ss'),(6,3,'Юдин','Герман','Кондратович','loginDEwjg2018','9UfqWQ'),(7,1,'Беляева','Анна','Вячеславовна','loginDEjbz2018','xIAWNI'),(8,2,'Беляев','Валентин','Артёмович','loginDEmgu2018','0gC3bk'),(9,2,'Семёнов','Герман','Дмитрьевич','loginDErdg2018','ni0ue0'),(10,3,'Шестаков','Илья','Антонинович','loginDEjtv2018','f2ZaN6'),(11,3,'Власов','Вадим','Васильевич','loginDEtfj2018','{{ksPn'),(12,1,'Савельев','Арсений','Авксентьевич','loginDEpnb2018','{ADBdc'),(13,1,'Ефимов','Руслан','Якунович','loginDEzer2018','5&R+zs'),(14,3,'Бурова','Марфа','Федотовна','loginDEiin2018','y9l*b}'),(15,3,'Селезнёв','Александр','Никитевич','loginDEqda2018','|h+r}I'),(16,3,'Кулакова','Виктория','Георгьевна','loginDEbnj2018','#ИМЯ?'),(17,3,'Дорофеева','Кира','Демьянова','loginDEqte2018','dC8bDI'),(18,3,'Сафонова','Нинель','Якововна','loginDEfeo2018','8cI7vq'),(19,3,'Ситникова','София','Лукьевна','loginDEvni2018','e4pVIv'),(20,2,'Медведев','Ириней','Геннадьевич','loginDEjis2018','A9K++2'),(21,2,'Суханова','Евгения','Улебовна','loginDExvv2018','R1zh}|'),(22,2,'Игнатьев','Владлен','Дамирович','loginDEadl2018','F&IWf4'),(23,3,'Ефремов','Христофор','Владиславович','loginDEyzn2018','P1v24R'),(24,3,'Кошелев','Ростислав','Куприянович','loginDEphn2018','F}jGsJ'),(25,1,'Галкина','Тамара','Авксентьевна','loginDEdvk2018','NKNkup'),(26,2,'Журавлёва','Вера','Арсеньевна','loginDEtld2018','c+CECK'),(27,1,'Савина','Таисия','Глебовна','loginDEima2018','XK3sOA'),(28,3,'Иванов','Яков','Мэлорович','loginDEyfe2018','4Bbzpa'),(29,2,'Лыткин','Ким','Алексеевич','loginDEwqc2018','vRtAP*'),(30,2,'Логинов','Федот','Святославович','loginDEgtt2018','7YD|BR'),(31,2,'Русакова','Марина','Юлиановна','loginDEiwl2018','LhlmIl'),(32,1,'Константинов','Пётр','Кондратович','loginDEyvi2018','22beR}'),(33,3,'Поляков','Анатолий','Игоревич','loginDEtfz2018','uQY0ZQ'),(34,1,'Панфилова','Василиса','Григорьевна','loginDEikb2018','*QkUxc'),(35,3,'Воробьёв','Герман','Романович','loginDEdmi2018','HOGFbU'),(36,1,'Андреев','Ростислав','Федосеевич','loginDEtlo2018','58Jxrg'),(37,1,'Бобров','Агафон','Владимирович','loginDEsnd2018','lLHqZf'),(38,1,'Лапин','Алексей','Витальевич','loginDEgno2018','4fqLiO'),(39,3,'Шестаков','Авдей','Иванович','loginDEgnl2018','wdio{u'),(40,3,'Гаврилова','Алина','Эдуардовна','loginDEzna2018','yz1iMB'),(41,2,'Жуков','Юлиан','Валерьянович','loginDEsyh2018','&4jYGs'),(42,3,'Пономарёв','Максим','Альвианович','loginDExex2018','rnh36{'),(43,2,'Зиновьева','Мария','Лаврентьевна','loginDEdjm2018','KjI1JR'),(44,3,'Осипов','Артём','Мэлорович','loginDEgup2018','36|KhF'),(45,1,'Лапин','Вячеслав','Геласьевич','loginDEdat2018','ussd8Q'),(46,3,'Зуев','Ириней','Вадимович','loginDEffj2018','cJP+HC'),(47,2,'Коновалова','Агафья','Митрофановна','loginDEisp2018','dfz5Ii'),(48,2,'Исаев','Дмитрий','Аристархович','loginDEfrp2018','6dcR|9'),(49,3,'Белозёрова','Алевтина','Лаврентьевна','loginDEaee2018','5&qONH'),(50,3,'Самсонов','Агафон','Максимович','loginDEthu2018','|0xWzV');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 16:00:53
