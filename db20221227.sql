CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ADDRESS`
--

DROP TABLE IF EXISTS `ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADDRESS` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '地址編號',
  `ZIP` varchar(5) NOT NULL,
  `REGION` varchar(45) NOT NULL COMMENT '省市',
  `DISTRICT` varchar(45) NOT NULL COMMENT '區域',
  `LOCATION` varchar(256) NOT NULL COMMENT '詳細地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS`
--

LOCK TABLES `ADDRESS` WRITE;
/*!40000 ALTER TABLE `ADDRESS` DISABLE KEYS */;
INSERT INTO `ADDRESS` VALUES (1,'104','台北市','中山區','南京東路三段219號5樓');
/*!40000 ALTER TABLE `ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOKING`
--

DROP TABLE IF EXISTS `BOOKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOKING` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '預約編號',
  `PRICE` mediumint NOT NULL COMMENT '單價',
  `STATUS` tinyint NOT NULL COMMENT '預約狀態',
  `STATUS_DATE` timestamp NOT NULL COMMENT '預約狀態更新日期',
  `STATUS_REASON` varchar(128) NOT NULL COMMENT '預約狀態原因',
  `START_DATE` date NOT NULL COMMENT '開始使用日期',
  `END_DATE` date NOT NULL COMMENT '最後使用日期',
  `BOOKING_NOTE` varchar(256) DEFAULT NULL COMMENT '預約備註',
  `CS_BOOKING_NOTE` varchar(256) DEFAULT NULL COMMENT '客服預約備註',
  `CREATE_DATE` timestamp NOT NULL COMMENT '下單日期',
  `FK_BOOKING_MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  `FK_LOCATION_ID` int NOT NULL COMMENT 'FK_場地編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_BOOKING_MEMBER_ID`),
  KEY `FK_LOCATION_ID_idx` (`FK_LOCATION_ID`),
  CONSTRAINT `FK_BOOKING_MEMBER_ID` FOREIGN KEY (`FK_BOOKING_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_LOCATION_ID` FOREIGN KEY (`FK_LOCATION_ID`) REFERENCES `LOCATION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOKING`
--

LOCK TABLES `BOOKING` WRITE;
/*!40000 ALTER TABLE `BOOKING` DISABLE KEYS */;
INSERT INTO `BOOKING` VALUES (1,10000,0,'2022-12-25 08:54:25','','2022-12-31','2023-01-07','BOOKING_NOTE','','2022-12-25 08:54:25',5,1);
/*!40000 ALTER TABLE `BOOKING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CART`
--

DROP TABLE IF EXISTS `CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CART` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '購物車編號',
  `QTY` smallint NOT NULL COMMENT '數量',
  `CART_DATE` timestamp NOT NULL COMMENT '加入購物車日期',
  `FK_CART_MEMBER_ID` int NOT NULL COMMENT '會員編號',
  `FK_CART_PRODUCT_ID` int NOT NULL COMMENT '商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_CART_MEMBER_ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_CART_PRODUCT_ID`),
  CONSTRAINT `FK_CART_MEMBER_ID` FOREIGN KEY (`FK_CART_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_CART_PRODUCT_ID` FOREIGN KEY (`FK_CART_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CART`
--

LOCK TABLES `CART` WRITE;
/*!40000 ALTER TABLE `CART` DISABLE KEYS */;
INSERT INTO `CART` VALUES (1,2,'2022-12-26 03:32:07',5,1);
/*!40000 ALTER TABLE `CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPO`
--

DROP TABLE IF EXISTS `EXPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '展覽編號',
  `TITLE` varchar(128) NOT NULL COMMENT '展覽標題',
  `CONTENT` mediumtext COMMENT '展覽內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '展覽主圖',
  `FK_EXPO_PAGE_ID` int NOT NULL COMMENT 'FK_展覽分頁編號',
  `START_DATE` date NOT NULL COMMENT '展覽開始日期',
  `END_DATE` date NOT NULL COMMENT '展覽結束日期',
  `CREATE_DATE` timestamp NOT NULL COMMENT '展覽新增時間',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後更新日期',
  `ADULT_PRICE` smallint NOT NULL COMMENT '一般票票價',
  `CONC_PRICE` smallint NOT NULL COMMENT '優待票票價 concession',
  `GROUP_PRICE` smallint NOT NULL COMMENT '團體票票價',
  `FK_BOOKING_ID` int DEFAULT NULL COMMENT 'FK_預約編號',
  `INFO` mediumtext COMMENT '展覽資訊',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_EXPO_PAGE_ID`),
  KEY `FK_BOOKING_ID_idx` (`FK_BOOKING_ID`),
  CONSTRAINT `FK_BOOKING_ID` FOREIGN KEY (`FK_BOOKING_ID`) REFERENCES `BOOKING` (`ID`),
  CONSTRAINT `FK_EXPO_PAGE_ID` FOREIGN KEY (`FK_EXPO_PAGE_ID`) REFERENCES `PAGE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPO`
--

LOCK TABLES `EXPO` WRITE;
/*!40000 ALTER TABLE `EXPO` DISABLE KEYS */;
INSERT INTO `EXPO` VALUES (1,'《Lindsayooo》新興畫家特展','最近在Instagram點擊量爆增粉絲人數達百萬最熱門的新創插畫家Lindsayoo，畫家細膩的筆觸與寫實的作畫風格，短時間快速達到百萬人數訂閱，應許多粉絲留言要求，多次連繫畫家展出活動接洽此次為韶光文創園區特別限定期間展出，千萬不要錯過好機會！限定期間2024.12.01~2024.12.32 ，購票即送限量明信片。','EXPO.JPG',3,'2022-12-26','2023-01-15','2022-12-26 04:36:13','2022-12-26 04:36:13',300,250,230,NULL,NULL);
/*!40000 ALTER TABLE `EXPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INFO`
--

DROP TABLE IF EXISTS `INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INFO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息編號',
  `TITLE` varchar(100) NOT NULL COMMENT '消息標題',
  `CONTENT` mediumtext COMMENT '消息內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '消息主圖',
  `PERIOD` varchar(35) NOT NULL COMMENT '公告期間',
  `STATUS` tinyint(1) NOT NULL COMMENT '消息頁狀態',
  `CREATE_DATE` timestamp NOT NULL COMMENT '新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後編輯日期',
  `FK_INFO_PAGE_ID` int NOT NULL COMMENT 'FK_消息頁編號',
  `FK_INFO_TYPE_ID` int NOT NULL COMMENT 'FK_消息頁類型編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_INFO_PAGE_ID`),
  KEY `FK_INFO_TYPE_ID_idx` (`FK_INFO_TYPE_ID`),
  CONSTRAINT `FK_INFO_PAGE_ID` FOREIGN KEY (`FK_INFO_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_INFO_TYPE_ID` FOREIGN KEY (`FK_INFO_TYPE_ID`) REFERENCES `INFO_TYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFO`
--

LOCK TABLES `INFO` WRITE;
/*!40000 ALTER TABLE `INFO` DISABLE KEYS */;
INSERT INTO `INFO` VALUES (1,'動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！','{\"消息內文\": \"動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！\"}','{\"0\": \"PRODUCT1.JPG\"}','2022/12/25 00:00 - 2023/01/07 23:59',0,'2022-12-25 09:08:56','2022-12-25 09:08:56',1,1);
/*!40000 ALTER TABLE `INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INFO_TYPE`
--

DROP TABLE IF EXISTS `INFO_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INFO_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息類型',
  `DESC` varchar(100) NOT NULL COMMENT '消息類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFO_TYPE`
--

LOCK TABLES `INFO_TYPE` WRITE;
/*!40000 ALTER TABLE `INFO_TYPE` DISABLE KEYS */;
INSERT INTO `INFO_TYPE` VALUES (1,'園區公告');
/*!40000 ALTER TABLE `INFO_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATION`
--

DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCATION` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '場地編號',
  `NAME` varchar(45) NOT NULL COMMENT '場地名稱',
  `PRICE` mediumint NOT NULL COMMENT '出租訂價',
  `DESC` json NOT NULL COMMENT '場地描述',
  `DEVICE` varchar(256) NOT NULL COMMENT '場地設備',
  `RULE` varchar(256) NOT NULL COMMENT '場地規範',
  `AREA` varchar(128) NOT NULL COMMENT '場地空間',
  `MAIN_PHOTO` json NOT NULL COMMENT '場地主圖',
  `LOCATED` varchar(64) NOT NULL COMMENT '場地位置',
  `STATUS` tinyint(1) NOT NULL COMMENT '開放預約狀態',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATION`
--

LOCK TABLES `LOCATION` WRITE;
/*!40000 ALTER TABLE `LOCATION` DISABLE KEYS */;
INSERT INTO `LOCATION` VALUES (1,'1號倉庫',10000,'{\"構造\": \"室內為長廊式空間，鋼骨鋼筋混凝土柱樑系統，加強磚造結構\"}','基礎照明、空調、簡易掃具','園區嚴禁使用任何火具。','141坪','{\"0\": \"場地主圖\"}','由大門進來後左轉到底即可抵達1號倉庫',0);
/*!40000 ALTER TABLE `LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `USERNAME` varchar(100) NOT NULL COMMENT '會員名稱',
  `EMAIL` varchar(100) NOT NULL COMMENT '會員電郵',
  `PASSWORD` varchar(45) NOT NULL COMMENT '會員密碼',
  `PHONE` varchar(10) NOT NULL COMMENT '會員電話',
  `VERIFY` tinyint(1) NOT NULL COMMENT '會員狀態',
  `FK_ADDRESS_ID` int NOT NULL COMMENT '會員地址編號',
  `FK_ROLE_ID` int NOT NULL COMMENT '會員權限代碼',
  PRIMARY KEY (`ID`),
  KEY `FK_ADDRESS_ID_idx` (`FK_ADDRESS_ID`),
  KEY `FK_ROLE_ID_idx` (`FK_ROLE_ID`),
  CONSTRAINT `FK_ADDRESS_ID` FOREIGN KEY (`FK_ADDRESS_ID`) REFERENCES `ADDRESS` (`ID`),
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`FK_ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'admin','admin@goodtime.com','g3_@dmin','0987654321',0,1,1),(5,'member1','member@goodtime.com','member1','0987654321',0,1,2);
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAGE`
--

DROP TABLE IF EXISTS `PAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAGE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '頁面編號',
  `TYPE` varchar(45) NOT NULL COMMENT '頁面類型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE`
--

LOCK TABLES `PAGE` WRITE;
/*!40000 ALTER TABLE `PAGE` DISABLE KEYS */;
INSERT INTO `PAGE` VALUES (1,'消息頁'),(2,'商品頁'),(3,'展覽頁');
/*!40000 ALTER TABLE `PAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO`
--

DROP TABLE IF EXISTS `PO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主單編號',
  `FREIGHT` smallint NOT NULL COMMENT '運費',
  `ETD` date NOT NULL,
  `SHIP_DATE` date DEFAULT NULL,
  `BL` varchar(45) DEFAULT NULL,
  `STATUS` tinyint NOT NULL,
  `STATUS_DATE` timestamp NOT NULL,
  `STATUS_REASON` varchar(128) DEFAULT NULL,
  `PO_NOTE` varchar(256) DEFAULT NULL,
  `CS_PO_NOTE` varchar(256) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `FK_PO_MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_PO_MEMBER_ID`),
  CONSTRAINT `FK_PO_MEMBER_ID` FOREIGN KEY (`FK_PO_MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO`
--

LOCK TABLES `PO` WRITE;
/*!40000 ALTER TABLE `PO` DISABLE KEYS */;
INSERT INTO `PO` VALUES (1,60,'2022-12-31',NULL,NULL,0,'2022-12-26 03:43:21',NULL,NULL,NULL,'2022-12-26 03:43:21',5);
/*!40000 ALTER TABLE `PO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO_DETAIL`
--

DROP TABLE IF EXISTS `PO_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PO_DETAIL` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `FK_PO_DETAIL_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  `UNIT_PRICE` mediumint NOT NULL COMMENT '單價',
  `QTY` tinyint NOT NULL COMMENT '下單數量',
  `FK_PO_DETAIL_PO_ID` int NOT NULL COMMENT 'FK_訂單_訂單編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_PO_DETAIL_PRODUCT_ID`),
  KEY `FK_PO_ID_idx` (`FK_PO_DETAIL_PO_ID`),
  CONSTRAINT `FK_PO_DETAIL_PO_ID` FOREIGN KEY (`FK_PO_DETAIL_PO_ID`) REFERENCES `PO` (`ID`),
  CONSTRAINT `FK_PO_DETAIL_PRODUCT_ID` FOREIGN KEY (`FK_PO_DETAIL_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO_DETAIL`
--

LOCK TABLES `PO_DETAIL` WRITE;
/*!40000 ALTER TABLE `PO_DETAIL` DISABLE KEYS */;
INSERT INTO `PO_DETAIL` VALUES (1,1,960,3,1);
/*!40000 ALTER TABLE `PO_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `NAME` varchar(100) NOT NULL COMMENT '商品名稱',
  `PERIOD` varchar(35) NOT NULL COMMENT '銷售期間',
  `STATUS` tinyint(1) NOT NULL COMMENT '商品頁狀態',
  `HIDE` tinyint(1) NOT NULL COMMENT '隱藏賣場',
  `PRICE` mediumint NOT NULL COMMENT '商品單價',
  `DESC` mediumtext COMMENT '商品描述',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '商品主圖',
  `STOCK_QTY` smallint NOT NULL COMMENT '庫存數量',
  `MAX_QTY` tinyint NOT NULL COMMENT '最大下單數量',
  `CREATE_DATE` timestamp NOT NULL COMMENT '商品新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '商品編輯日期',
  `FK_PRODUCT_PAGE_ID` int NOT NULL COMMENT 'FK_頁面編號',
  `FK_SUPPLIER_ID` int DEFAULT NULL COMMENT 'FK_供應商編號',
  `FK_PRODUCT_TYPE_ID` int NOT NULL COMMENT 'FK_商品類型編號',
  `SPEC` mediumtext COMMENT '規格',
  `NOTE` mediumtext COMMENT '備註',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_PRODUCT_TYPE_ID`),
  KEY `FK_SUPPLIER_ID_idx` (`FK_SUPPLIER_ID`),
  KEY `FK_PAGE_ID_idx1` (`FK_PRODUCT_PAGE_ID`),
  CONSTRAINT `FK_PRODUCT_PAGE_ID` FOREIGN KEY (`FK_PRODUCT_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_PRODUCT_TYPE_ID` FOREIGN KEY (`FK_PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`ID`),
  CONSTRAINT `FK_SUPPLIER_ID` FOREIGN KEY (`FK_SUPPLIER_ID`) REFERENCES `SUPPLIER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (1,'蒙娜麗莎貓貓掛畫','2022/12/31 00:00 - 2046/12/31 00:00',0,0,960,'文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。','商品主圖.jpg',9999,10,'2022-12-25 09:13:20','2022-12-25 09:13:20',2,1,1,NULL,NULL);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_PIC`
--

DROP TABLE IF EXISTS `PRODUCT_PIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT_PIC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品圖編號',
  `PATH` varchar(128) NOT NULL COMMENT '商品圖路徑',
  `FK_PRODUCT_PIC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_PIC_PRODUCT_ID_idx` (`FK_PRODUCT_PIC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_PIC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_PIC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品圖';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_PIC`
--

LOCK TABLES `PRODUCT_PIC` WRITE;
/*!40000 ALTER TABLE `PRODUCT_PIC` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_PIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_TYPE`
--

DROP TABLE IF EXISTS `PRODUCT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品類型編號',
  `NAME` varchar(45) NOT NULL COMMENT '商品類型名稱',
  `DESC` varchar(100) DEFAULT NULL COMMENT '商品類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_TYPE`
--

LOCK TABLES `PRODUCT_TYPE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_TYPE` DISABLE KEYS */;
INSERT INTO `PRODUCT_TYPE` VALUES (1,'平面畫作','2D畫作不限大小');
/*!40000 ALTER TABLE `PRODUCT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESC` varchar(45) NOT NULL COMMENT '權限描述',
  `INDEX` varchar(45) NOT NULL COMMENT '後台首頁',
  `INDEX_LEVEL` tinyint NOT NULL COMMENT '首頁權限',
  `OVERVIEW` varchar(45) NOT NULL COMMENT '後台銷售狀況',
  `OVERVIEW_LEVEL` tinyint NOT NULL COMMENT '銷售概況權限',
  `PO` varchar(45) NOT NULL COMMENT '後台訂單頁',
  `PO_LEVEL` tinyint NOT NULL COMMENT '訂單頁權限',
  `PRODUCT` varchar(45) NOT NULL COMMENT '後台商品頁',
  `PRODUCT_LEVEL` tinyint NOT NULL COMMENT '商品頁權限',
  `INFO` varchar(45) NOT NULL COMMENT '後台消息頁',
  `INFO_LEVEL` tinyint NOT NULL COMMENT '消息頁權限',
  `RENTAL` varchar(45) NOT NULL COMMENT '後台場地頁',
  `RENTAL_LEVEL` tinyint NOT NULL COMMENT '埸地頁權限',
  `MEMBER` varchar(45) NOT NULL COMMENT '後台會員頁',
  `MEMBER_LEVEL` tinyint NOT NULL COMMENT '會員頁權限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'admin管理員','後台主頁權限',0,'後台銷售概況權限',0,'後台訂單權限',0,'後台商品頁權限',0,'後台消息頁',0,'後台場地頁',0,'後台會員頁',0),(2,'member一般會員','後台主頁權限',1,'後台銷售概況權限',1,'後台訂單權限',1,'後台商品頁權限',1,'後台消息頁',1,'後台場地頁',1,'後台會員頁',1);
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUPPLIER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '供應商編號',
  `NAME` varchar(45) NOT NULL COMMENT '供應商名稱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (1,'日本畫展');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-27 18:41:10
