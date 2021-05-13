-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: groceryshopping
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addid` varchar(200) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('ADD1595681238874','aditya','raj','India','bauliya road','sasaram','bihar',821115,'8318874454','aditya@gmail.com');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `userid` varchar(50) DEFAULT NULL,
  `pro_id` varchar(50) DEFAULT NULL,
  `quantiy` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES ('pawan@gmail.com','p102',1),('pawan@gmail.com','p103',1),('pawan@gmail.com','p104',1),('pawan@gmail.com','p105',1),('pawan@gmail.com','p108',1),('pawan@gmail.com','p107',1);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` varchar(50) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('c101','soft drink'),('c102','fruits & vegitables'),('c103','foodgrains,oil & masala'),('c104','bakery,cakes & dairy'),('c105','beverages'),('c106','snacks & branded foods'),('c107','beauty & hygiene'),('c108','cleaning & household'),('c109','kitchen,garden & pets'),('c110','Eggs,meat & fish'),('c111','gourmet & World Food'),('c112','baby cares');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `prod_id` varchar(50) DEFAULT NULL,
  `img1` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('p101','images/fruits_veg/apple.jpg'),('p102','images/fruits_veg/banana.jpg'),('p103','images/product/orange.jpg'),('p104','images/product/cocacola.jpg'),('p105','images/product/mustard.jpg'),('p106','images/product/baby_powder.jpg'),('p107','images/product/olive-oil-pure.jpg'),('p108','images/product/shampoo-gentle-baby.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` varchar(50) DEFAULT NULL,
  `pd_name` varchar(100) DEFAULT NULL,
  `mrp` int DEFAULT NULL,
  `disc` int DEFAULT NULL,
  `tprice` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_avi` varchar(10) DEFAULT NULL,
  `cat_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('p101','apple',100,2,98,'apple','yes','c102'),('p102','Banana',50,2,49,'banana','yes','c102'),('p103','orange',70,10,60,'fresh fruit.','yes','c102'),('p104','coca cola',45,5,40,'We produce, sell and distribute Coca&#8209;Cola, the world\'s most recognised drinks brand and its leading non-alcoholic ready-to-drink beverage brand in terms of sales volume. Coca&#8209;Cola has been ranked the third most valuable global brand on Interbrand\'s annual Best Global Brands ranking for four consecutive years.','yes','c101'),('p105','Mustard Oil',100,0,100,'The term mustard oil is used for two different oils that are made from mustard seeds: A fatty vegetable oil resulting from pressing the seeds, An essential oil resulting from grinding the seeds, mixing them with water, and extracting the resulting volatile oil by distillation.','yes','c103'),('p106','baby powder',200,10,190,'Himalayas Baby Powder eliminates dryness and keeps babys skin cool and comfortable','yes','c112'),('p107','olive-oil-pure',3999,851,3148,'Figaros Olive Oil is derived from the cold extraction of the Olive fruit within 24 hours of harvesting, which gives an amazing flavour to your salads and other recipes and being low in cholesterol makes it the ideal choice for health conscious folks who are looking to burn fat and cut weight','no','c112'),('p108','shampoo-gentel-baby',160,12,148,'Himalaya Gentle Baby Shampoo, Hibiscus, Chickpea: A Specially formulated mild shampoo that gently cleanes the hair making it soft, shiny and easy to manage. ','yes','c112');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `pro_id` varchar(50) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `add_id` varchar(200) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `orderid` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('p104',1,'ADD1595681238874','pawan@gmail.com','ORD1595681238874');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('pawan@gmail.com','pawan','pawan malhotra','7309860735',NULL,'USER'),('admin@gmail.com','admin','admin','8986078187',NULL,'ADMIN'),('neha@gmail.com','neha','neha','8986078187',NULL,'USER');
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

-- Dump completed on 2021-05-14  3:06:15
